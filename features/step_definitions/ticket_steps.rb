Given /^"([^"]*)" has created a ticket for this project:$/ do |email, table|
  table.hashes.each do |attributes|
    attributes = attributes.merge!(user: User.find_by_email!(email))
    @project.tickets.create!(attributes)
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


Then /^I should see "([^"]*)" within "([^"]*)"$/ do |text, parent|
  within(parent) do
    if page.respond_to? :should
      page.should have_content(text)
    else
      assert page.has_content?(text)
    end
  end
end

Then /^I should not see "([^"]*)" within "([^"]*)"$/ do |text, parent|
  within(parent) do
    if page.respond_to? :should
      page.should have_no_content(text)
    else
      assert page.has_no_content?(text)
    end
  end
end
