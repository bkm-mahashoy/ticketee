Feature: Creating Projects
  In order to have projects to assign tickets to
  As a user, I want to create projects

  Scenario: Creating a Project
    Given I am on the Home page
    When I follow the "New Project" link
    And I fill in the "Name" field with "TextMate 2"
    And I click the "Create Project" button
    Then I should see the "Project was successfully created." message
