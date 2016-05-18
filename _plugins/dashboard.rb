require 'jekyll'
require 'json'
require 'open-uri'

module Dashboard
  # Generates an individual project page from project data.
  class ProjectPage < Jekyll::Page
    private_class_method :new
    attr_reader :site

    def initialize(site, project_id)
      @site = site
      @base = site.source
      @baseurl = site.data['baseurl']
      @dir = File.join 'project', project_id
      @name = 'index.html'

      process @name
      read_yaml File.join(@base, '_layouts'), 'project.html'
    end

    # TODO(mbland): Remove this once the Team API is standardized.
    FIELDS_TO_TRANSLATE = {
      'project' => 'full_name',
      'mission' => 'description'
    }

    def self.munge_licenses(project_data)
      licenses = project_data['licenses']
      unless licenses.nil?
        project_data['licenses'] = licenses.map do |key, value|
          [key, (value.instance_of?(Hash) ? value['name'] : value)]
        end.to_h
      end
    end

    def self.get_github_description(project_name, projects)
      if projects[project_name] && projects[project_name]['github']
        projects[project_name]['github'][0]['description']
      end
    end

    def self.get_repo_name_from_url(url, projects)
      project_name = full_name = url['url']
      parts = project_name.split '/'
      if parts.length > 1
        project_name = parts[-1]
        full_name = parts[-2, 2].join '/'
      end
      desc = get_github_description project_name, projects
      { 'name' => full_name,
        'description' => (url['text'] || desc || '')
      }
    end

    def self.append_repo_links(project_data, projects)
      links = project_data['links']
      if links && project_data['github']
        repo_links = links.map do |link|
          get_repo_name_from_url(link, projects) if link['category'] == 'repo'
        end.compact
        project_data['github'] += repo_links
      end
    end

    def self.munge_github(project_data, projects)
      github = project_data['github']
      unless github.is_a?(Array) || github.nil?
        project_data['github'] = [github]
      end
      append_repo_links(project_data, projects)
    end

    def self.munge_project_data(project_data, projects)
      FIELDS_TO_TRANSLATE.each do |from, to|
        project_data[to] = project_data[from] unless project_data[to]
      end
      original_name = project_data['name']
      if original_name.scan(/[A-Z]/).size > 0
        project_data['redirect_from'] = []
        project_data['redirect_from'].push("#{@baseurl}project/#{original_name}")
        project_data['permalink'] = "#{@baseurl}project/#{original_name}"
      end
      project_data['name'] = original_name.downcase
      project_data['permalink'] ||= "#{@baseurl}project/#{project_data['name']}"

      munge_licenses project_data
      munge_github project_data, projects
    end

    def self.create(site, project_id, project_data)
      unless project_id == "all"
        page = new site, project_id
        munge_project_data project_data, site.data['projects']
        page.data['project'] = project_data
        page.data['title'] = project_data['full_name']
        site.pages << page
      end
    end
  end

  # Processes site data, generates authorization artifacts, publishes an API,
  # and generates cross-linked Hub pages.
  class Generator < ::Jekyll::Generator
    safe true

    # Executes all of the data processing and artifact/page generation phases
    # for the Hub.
    def generate(site)
      assign_children_to_parents site.data['projects']
      generate_project_pages site
    end

    # we want to exclude a project if parent = child or if ref'ed as a link
    def exclude_project?(project, parent, projects)
      return true if parent.nil? || parent == project || !projects[parent]
      repos = projects[parent]['links'].select do |r|
        r['category'] == 'repo' && r['url'].include?(project)
      end
      return true unless repos.empty?
    end

    def assign_children_to_parents(projects)
      projects.each do |id, p|
        parent = p['parent']
        next if exclude_project?(id, parent, projects)
        children = (projects[parent]['children'] || []) << p
        projects[parent]['children'] = children
      end
    end

    def generate_project_pages(site)
      site.data['projects'].delete('all')
      site.data['projects'].each do |project_id, project|
        ProjectPage.create site, project_id, project
      end
    end
  end
end
