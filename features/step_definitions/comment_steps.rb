When /^show me the page$/ do
  save_and_open_page
end

Given /^(.*) within "([^"]*)"$/ do |step, parent|
  within("#{parent}") do
    step "#{step}"
  end
end
