Given /^I have run the seed task$/ do
  load Rails.root + "db/seeds.rb"
end

Then /^I should see the "([^"]*)" project$/ do |project_name|
  if page.respond_to? :should
    page.should have_content(project_name)
  else
    assert page.has_content?(project_name)
  end
end
