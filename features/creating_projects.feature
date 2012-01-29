Feature: Creating Projects
  In order to have projects to assign tickets to
  As a user, I want to create projects

  Background:
    Given there are the following users:
      | email              | password | admin |
      | admin@ticketee.com | password | true  |
    And I am signed in as one of those users
    Given I am on the Home page
    When I follow the "New Project" link

  Scenario: Creating a Project
    And I fill in the "Name" field with "TextMate 2"
    And I click the "Create Project" button
    Then I should see the "Project was successfully created." message
    And I should be on the project page for "TextMate 2"
    And I should see "TextMate 2 - Projects - Ticketee"

  Scenario:
    And I press the "Create Project" button
    Then I should see "Project has not been created."
    And I should see "Name can't be blank"
