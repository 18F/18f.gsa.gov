Before do
  @old_pwd = Dir.pwd
  FileUtils.mkdir_p(TEMP_DIR)  unless File.exist?(TEMP_DIR)
  Dir.chdir(TEMP_DIR)

  FileUtils.mkdir_p(SOURCE_DIR)  unless File.exist?(SOURCE_DIR)
  FileUtils.mkdir_p(DEST_DIR)    unless File.exist?(DEST_DIR)

  @jekyll = Rack::Jekyll.new(:force_build => true,
                             :source      => SOURCE_DIR,
                             :destination => DEST_DIR)
end

After do
  FileUtils.rm_rf(TEMP_DIR)  if File.exist?(TEMP_DIR)
  Dir.chdir(@old_pwd)
end


Given /^I have entered the path (.*)$/ do |path|
  @path = path
end


When /^I request a page$/ do
  @response = get(@path)
end

When /^I request a page with a date of Last-Modified$/ do
  modify_time = get(@path).headers["Last-Modified"]
  @response = get(@path, {'HTTP_IF_MODIFIED_SINCE' => modify_time})
end


Then /^the http status should be (.*)$/ do |code|
  assert_equal(code, @response.status.to_s)
end

Then /^the content\-type should be (.*)$/ do |type|
  assert_equal(type, @response.headers["Content-Type"])
end

Then /^the content\-length should be (.*)$/ do |length|
  assert_equal(length, @response.original_headers["Content-Length"])
end

Then /^the data should show (.*)$/ do |body|
  assert_equal(body.chomp, @response.body.chomp)
end

Then /^there should be no '(.*)' header$/ do |header|
  refute @response.headers.has_key?(header)
end

def get(path, headers={})
  req = Rack::MockRequest.new(@jekyll)
  req.get(path,headers)
end
