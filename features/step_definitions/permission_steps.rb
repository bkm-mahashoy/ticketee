Given /^"([^"]*)" can view the "([^"]*)" project$/ do |user, project|
  create_permission(user, find_project(project), "view")
end

Given /^"([^"]*)" can create tickets for the "([^"]*)" project$/ do |user, project|
  create_permission(user, find_project(project), "create ticket")
end

Given /^"([^"]*)" can edit tickets for the "([^"]*)" project$/ do |user, project|
  create_permission(user, find_project(project), "edit ticket")
end

def create_permission(email, object, action)
  Permission.create!(user: User.find_by_email!(email),
                     thing: object,
                     action: action)
end

def find_project(name)
  Project.find_by_name!(name)
end
