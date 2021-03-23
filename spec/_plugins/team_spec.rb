require_relative '../../_plugins/team'

RSpec.describe Jekyll::TeamFilter do
  class TeamFilterClass
  end

  before(:each) do
    @team_filter = TeamFilterClass.new
    @team_filter.extend(Jekyll::TeamFilter)
    conf = Jekyll.configuration(source: './', destination: './_site', baseurl: '')
    @site = Jekyll::Site.new(conf)
    @baseurl = ''
  end

  it 'returns an image given a name that is an author and has an image' do
    actual = @team_filter.team_photo('aaron')
    expected = "<img class='circle-15'"\
      " src='#{@baseurl}/assets/img/team/aaron.jpg' alt='18F team member Aaron Snow'>"

    expect(expected).to eq actual
  end

  it 'returns an image given a name that is an author and does not have an image' do
    actual = @team_filter.team_photo('alan')
    expected = "<img class='circle-15' "\
        "src='#{@baseurl}/assets/img/logos/18F-Logo-M.png' alt='18F logo'>"

    expect(expected).to eq actual
  end

  it 'returns an image given a name that is not an author and does not have an image' do
    actual = @team_filter.team_photo('invalid-name')
    expected = "<img class='circle-15' "\
        "src='#{@baseurl}/assets/img/logos/18F-Logo-M.png' alt='18F logo'>"

    expect(expected).to eq actual
  end
end
