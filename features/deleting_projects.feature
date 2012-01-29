Feature: Deleting Projects
  As a project manager I want to delete projects

  Background:
    Given there are the following users:
      | email              | password | admin |
      | admin@ticketee.com | password | true  |
    And I am signed in as one of those users

  Scenario: Deleting a Project
    Given there is a project called "TextMate 2"
    And I am on the Home page
    When I follow the "TextMate 2" link
    And I follow the "Delete Project" link
    Then I should see "Project has been successfully deleted."
    And I should not see "TextMate 2"
    And I should see "Projects"
