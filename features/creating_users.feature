Feature: Creating Users
  In order to add new users to the system
  As an admin, I want to be able to add new users

  Background:
    Given there are the following users:
      | email              | password | admin |
      | admin@ticketee.com | password | true  |
    And I am signed in as one of those users
    Given I am on the Home page
    When I follow the "Admin" link
    And I follow the "Users" link
    And I follow the "New User" link

  Scenario: Creating a new user
    And I fill in the "Email" field with "newbie@ticketee.com"
    And I fill in the "Password" field with "password"
    And I click the "Create User" button
    Then I should see the "User has been successfully created." message

  Scenario: Leaving email blank results in an error
    And I fill in the "Email" field with ""
    And I fill in the "Password" field with "password"
    And I click the "Create User" button
    Then I should see the "User has not been created." message
    And I should see "Email can't be blank"
