require 'uri'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^there is a project called "([^"]*)"$/ do |name|
  @project = Factory(:project, name: name)
end

Then /^I should be on the "([^"]*)" project page$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end
