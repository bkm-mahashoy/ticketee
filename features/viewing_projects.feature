Feature: Viewing Projects
  In order to assign tickets to a project
  As a user
  I want to see a list of available projects

  Background:
    Given there are the following users:
      | email             | password |
      | user@ticketee.com | password |
    And I am signed in as one of those users
    And there is a project called "TextMate 2"
    And "user@ticketee.com" can view the "TextMate 2" project

  Scenario: Listing all projects
    And I am on the Home page
    When I follow the "TextMate 2" link
    Then I should be on the "TextMate 2" project page
