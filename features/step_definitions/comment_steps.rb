When /^show me the page$/ do
  save_and_open_page
end

Given /^(.*) within "([^"]*)"$/ do |step, parent|
  within("#{parent}") do
    step "#{step}"
  end
end

When /^I select "([^"]*)" from the "([^"]*)" drop down list$/ do |value, field|
  select(value, from: field)
end
