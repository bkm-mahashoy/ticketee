require 'uri'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^there is a project called "([^"]*)"$/ do |name|
  @project = Factory(:project, name: name)
end

Given /^(?:|I )am on the (.+) page$/ do |page_name|
  visit path_to(page_name.downcase!)
end

When /^I follow the "([^"]*)" link$/ do |link_name|
  click_link(link_name)
end

When /^I fill in the "([^"]*)" field with "([^"]*)"$/ do |field_name, value|
  fill_in(field_name, with: value)
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, with: value)
end

When /^I click the "([^"]*)" button$/ do |button|
  click_button(button)
end

When /^I press the "([^"]*)" button$/ do |button|
  click_button(button)
end

Then /^I should see the "([^"]*)" message$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /^I should see the message "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /^I should be on the "([^"]*)" project page$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

Then /^I should be on the project page for "([^"]*)"$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

Then /^I should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /^(?:|I )should not see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end
