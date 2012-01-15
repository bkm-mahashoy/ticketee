
Given /^(?:|I )am on the (.+) page$/ do |page_name|
  visit path_to(page_name.downcase!)
end

When /^I follow the "([^"]*)" link$/ do |link_name|
  click_link(link_name)
end

When /^I fill in the "([^"]*)" field with "([^"]*)"$/ do |field_name, value|
  fill_in(field_name, with: value)
end

When /^I click the "([^"]*)" button$/ do |button|
  click_button(button)
end

Then /^I should see the "([^"]*)" message$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end
