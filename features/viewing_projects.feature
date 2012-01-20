Feature: Viewing Projects
  In order to assign tickets to a project
  As a user, I want to see a list of available projects

  Scenario: Listing all projects
    Given there is a project called "TextMate 2"
    And I am on the Home page
    When I follow the "TextMate 2" link
    Then I should be on the "TextMate 2" project page
