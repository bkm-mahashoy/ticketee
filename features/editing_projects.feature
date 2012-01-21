Feature: Editing Projects
  In order to update project information
  As an user, I want an user interface which provides this functionality

  Background: Updating a Project
    Given there is a project called "TextMate 2"
    And I am on the Home page
    When I follow the "TextMate 2" link
    And I follow the "Edit Project" link

  Scenario: Updating a Project with valid attributes should be successful
    And I fill in "Name" with "TextMate 2 Beta"
    And I press the "Update Project" button
    Then I should see the message "Project has been successfully updated."
    And I should be on the project page for "TextMate 2 Beta"

  Scenario: Updating a Project with invalid attributes should fail
    And I fill in "Name" with ""
    And I press the "Update Project" button
    Then I should see the message "Project has not been updated."
    And I should be on the project page for "TextMate 2"

