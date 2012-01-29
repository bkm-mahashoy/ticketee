Given /^there are the following users:$/ do |table|

  table.hashes.each do |attributes|
    unconfirmed = attributes.delete("unconfirmed") == "true"
    @user = User.create!(attributes)
    @user.update_attribute("admin", attributes["admin"] == "true")
    @user.confirm! unless unconfirmed
  end
end

Given /^I am signed in as one of those users$/ do
  steps(%Q{
    Given I am on the Home page
    When I follow the "Sign In" link
    And I fill in the "Email" field with "#{@user.email}"
    And I fill in the "Password" field with "password"
    And I press the "Sign in" button
    Then I should see "Signed in successfully."
  })
end

Given /^I am signed in as "([^"]*)"$/ do |email|
  @user = User.find_by_email!(email)
  steps("Given I am signed in as one of those users")
end
