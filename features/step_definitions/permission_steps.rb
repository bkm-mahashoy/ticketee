Given /^"([^"]*)" can view the "([^"]*)" project$/ do |user, project|
  create_permission(user, find_project(project), "view")
end

Given /^"([^"]*)" can create tickets for the "([^"]*)" project$/ do |user, project|
  create_permission(user, find_project(project), "create ticket")
end

Given /^"([^"]*)" can edit tickets for the "([^"]*)" project$/ do |user, project|
  create_permission(user, find_project(project), "edit ticket")
end

Given /^"([^"]*)" can delete tickets for the "([^"]*)" project$/ do |user, project|
  create_permission(user, find_project(project), "delete ticket")
end

When /^I check the "([^"]*)" checkbox for the "([^"]*)" project$/ do |permission, project_name|
  project = Project.find_by_name!(project_name)
  permission = permission.downcase.gsub(" ", "_")
  field_id = "permissions_#{project.id}_#{permission}"
  steps(%Q{ When I check the "#{field_id}" checkbox })
end


def create_permission(email, object, action)
  Permission.create!(user: User.find_by_email!(email),
                     thing: object,
                     action: action)
end

def find_project(name)
  Project.find_by_name!(name)
end
