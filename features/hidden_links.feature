Feature: Hidden Links
  In order to clean up the user experience
  As a part of the system functionality
  I want to hide links from user's who are not authorized to follow them

  Background:
    Given there are the following users:
      | email              | password | admin |
      | user@ticketee.com  | password | false |
      | admin@ticketee.com | password | true  |
    Given I am on the Home page
    And there is a project called "TextMate 2"
    And "user@ticketee.com" can view the "TextMate 2" project
    And "user@ticketee.com" has created a ticket for this project:
      | title          | description                   |
      | Make it shiny! | Gradients! Starbursts! Oh my! |

  Scenario: New project link is hidden for users who are not signed-in
    Then I should not see the "New Project" link

  Scenario: New project link is hidden for signed-in users if they are not admins
    Given I am signed in as "user@ticketee.com"
    Then I should not see the "New Project" link

  Scenario: New project link is shown to admin users who are signed in
    Given I am signed in as "admin@ticketee.com"
    Then I should see the "New Project" link

  Scenario: Edit project link is hidden for signed-in users if they are not admins
    Given I am signed in as "user@ticketee.com"
    When I follow the "TextMate 2" link
    Then I should not see the "Edit Project" link

  Scenario: Edit project link is shown to admin users who are signed in
    Given I am signed in as "admin@ticketee.com"
    When I follow the "TextMate 2" link
    Then I should see the "Edit Project" link

  Scenario: Delete project link is hidden for signed-in users if they are not admins
    Given I am signed in as "user@ticketee.com"
    When I follow the "TextMate 2" link
    Then I should not see the "Delete Project" link

  Scenario: Delete project link is shown to admin users who are signed in
    Given I am signed in as "admin@ticketee.com"
    When I follow the "TextMate 2" link
    Then I should see the "Delete Project" link

  Scenario: New ticket link is shown to a user with permission
    Given I am signed in as "user@ticketee.com"
    And "user@ticketee.com" can create tickets for the "TextMate 2" project
    When I follow the "TextMate 2" link
    Then I should see "New Ticket"

  Scenario: New ticket link is hidden from a user without permission
    Given I am signed in as "user@ticketee.com"
    When I follow the "TextMate 2" link
    Then I should not see "New Ticket"

  Scenario: New ticket link is always shown to an admin user
    Given I am signed in as "admin@ticketee.com"
    When I follow the "TextMate 2" link
    Then I should see "New Ticket"

  Scenario: Edit ticket link is shown to a user with permission
    Given I am signed in as "user@ticketee.com"
    And "user@ticketee.com" can edit tickets for the "TextMate 2" project
    When I follow the "TextMate 2" link
    And I follow the "Make it shiny!" link
    Then I should see "Edit Ticket"

  Scenario: Edit ticket link is hidden from a user without permission
    Given I am signed in as "user@ticketee.com"
    When I follow the "TextMate 2" link
    And I follow the "Make it shiny!" link
    Then I should not see "Edit Ticket"

  Scenario: Edit ticket link is always shown to the admin user
    Given I am signed in as "admin@ticketee.com"
    When I follow the "TextMate 2" link
    And I follow the "Make it shiny!" link
    Then I should see "Edit Ticket"

  Scenario: Delete ticket link is shown to a user with permission
    Given I am signed in as "user@ticketee.com"
    And "user@ticketee.com" can delete tickets for the "TextMate 2" project
    When I follow the "TextMate 2" link
    And I follow the "Make it shiny!" link
    Then I should see "Delete Ticket"

  Scenario: Delete ticket link is hidden from a user without permission
    Given I am signed in as "user@ticketee.com"
    When I follow the "TextMate 2" link
    And I follow the "Make it shiny!" link
    Then I should not see "Delete Ticket"

  Scenario: Delete ticket link is always shown to the admin user
    Given I am signed in as "admin@ticketee.com"
    When I follow the "TextMate 2" link
    And I follow the "Make it shiny!" link
    Then I should see "Delete Ticket"
