Feature: Creating states
  In order to be able to specify other states for tickets
  As an admin
  I want to add them to the application

  Background:
    Given there are the following users:
      | email              | password | admin |
      | admin@ticketee.com | password | true  |
    And I am signed in as one of those users

  Scenario: Creating a state
    When I follow the "Admin" link
    And I follow the "States" link
    And I follow the "New State" link
    And I fill in "Name" with "Duplicate"
    And I press the "Create State" button
    Then I should see the "State has been successfully created." message
