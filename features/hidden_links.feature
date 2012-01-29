Feature: Hidden Links
  In order to clean up the user experience
  As a part of the system functionality
  I want to hide links from user's who are not authorized to follow them

  Background:
    Given there are the following users:
      | email              | password | admin |
      | user@ticketee.com  | password | false |
      | admin@ticketee.com | password | true  |
    And there is a project called "TextMate 2"

  Scenario: New project link is hidden for users who are not signed-in
    Given I am on the Home page
    Then I should not see the "New Project" link

  Scenario: New project link is hidden for signed-in users if they are not admins
    Given I am signed in as "user@ticketee.com"
    Then I should not see the "New Project" link

  Scenario: New project link is shown to admin users who are signed in
    Given I am signed in as "admin@ticketee.com"
    Then I should see the "New Project" link

  Scenario: Edit project link is hidden for users who are not signed-in
    Given I am on the Home page
    And there is a project called "TextMate 2"
    When I follow the "TextMate 2" link
    Then I should not see the "Edit Project" link

  Scenario: Edit project link is hidden for signed-in users if they are not admins
    Given I am signed in as "user@ticketee.com"
    And I am on the Home page
    And there is a project called "TextMate 2"
    When I follow the "TextMate 2" link
    Then I should not see the "Edit Project" link

  Scenario: Edit project link is shown to admin users who are signed in
    Given I am signed in as "admin@ticketee.com"
    And I am on the Home page
    And there is a project called "TextMate 2"
    When I follow the "TextMate 2" link
    Then I should see the "Edit Project" link

  Scenario: Delete project link is hidden for users who are not signed-in
    Given I am on the Home page
    And there is a project called "TextMate 2"
    When I follow the "TextMate 2" link
    Then I should not see the "Delete Project" link

  Scenario: Delete project link is hidden for signed-in users if they are not admins
    Given I am signed in as "user@ticketee.com"
    And I am on the Home page
    And there is a project called "TextMate 2"
    When I follow the "TextMate 2" link
    Then I should not see the "Delete Project" link

  Scenario: Delete project link is shown to admin users who are signed in
    Given I am signed in as "admin@ticketee.com"
    And I am on the Home page
    And there is a project called "TextMate 2"
    When I follow the "TextMate 2" link
    Then I should see the "Delete Project" link
