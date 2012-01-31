Feature: Editing Users
  In order to update or change an user's details
  As an admin user
  I would like to be able to modify the user using the Admin::UsersController

  Background:
    Given there are the following users:
      | email              | password | admin |
      | admin@ticketee.com | password | true  |
    And I am signed in as one of those users
    And there are the following users:
      | email             | password |
      | user@ticketee.com | password |
    And I am on the Home page
    When I follow the "Admin" link
    And I follow the "Users" link
    And I follow the "user@ticketee.com" link
    And I follow the "Edit User" link

  Scenario: Updating a user's details
    When I fill in the "Email" field with "new_user@ticketee.com"
    And I press the "Update User" button
    Then I should see the "User has been successfully updated." message
    And I should see "user@ticketee.com"
    And I should not see "new_user@ticketee.com"

  Scenario: Toggling an user's Admin attribute
    When I check the "Admin" checkbox
    And I press the "Update User" button
    Then I should see the "User has been successfully updated." message
    And I should see "user@ticketee.com (Admin)"

  Scenario: Updating an user with an invalid email should fail
    When I fill in the "Email" field with "bad_email_field"
    And I press the "Update User" button
    Then I should see the "User has not been updated." message
    And I should see the "Email is invalid" message
