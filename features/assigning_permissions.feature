Feature: Assigning Permissions
  In order to set up users with the correct permissions
  As an admin
  I want to check the appropriate permissions check boxes

  Background:
    Given there are the following users:
      | email              | password | admin |
      | admin@ticketee.com | password | true  |
    And I am signed in as one of those users

    And there are the following users:
      | email             | password |
      | user@ticketee.com | password |

    And there is a project called "TextMate 2"
    And "user@ticketee.com" has created a ticket for this project:
      | title          | description                   |
      | Make it shiny! | Gradients! Starbursts! Oh my! |

    When I follow the "Admin" link
    And I follow the "Users" link
    And I follow the "user@ticketee.com" link
    And I follow the "Permissions" link

  Scenario: Viewing and updating a project's permissions
    When I check the "View" checkbox for the "TextMate 2" project
    And I press the "Update Permissions" button
    And I follow the "Sign Out" link

    Given I am signed in as "user@ticketee.com"
    Then I should see "TextMate 2"

  Scenario: Creating tickets for a project
    When I check the "View" checkbox for the "TextMate 2" project
    And I check the "Create Tickets" checkbox for the "TextMate 2" project
    And I press the "Update Permissions" button
    And I follow the "Sign Out" link

    Given I am signed in as "user@ticketee.com"
    When I follow the "TextMate 2" link
    And I follow the "New Ticket" link
    And I fill in the "Title" field with "Matte Look-and-Feel"
    And I fill in the "Description" field with "Would be nice to have."
    And I press the "Create Ticket" button
    Then I should see the "Ticket has been successfully created." message

  Scenario: Updating tickets for a project
    When I check the "View" checkbox for the "TextMate 2" project
    And I check the "Edit Tickets" checkbox for the "TextMate 2" project
    And I press the "Update Permissions" button
    And I follow the "Sign Out" link

    Given I am signed in as "user@ticketee.com"
    When I follow the "TextMate 2" link
    And I follow the "Make it shiny!" link
    And I follow the "Edit Ticket" link
    And I fill in the "Title" field with "Make it really shiny!"
    And I press the "Update Ticket" button
    Then I should see the "Ticket has been successfully updated." message

  Scenario: Deleting tickets for a project
    When I check the "View" checkbox for the "TextMate 2" project
    And I check the "Delete Tickets" checkbox for the "TextMate 2" project
    And I press the "Update Permissions" button
    And I follow the "Sign Out" link

    Given I am signed in as "user@ticketee.com"
    When I follow the "TextMate 2" link
    And I follow the "Make it shiny!" link
    And I follow the "Delete Ticket" link
    Then I should see the "Ticket has been successfully deleted." message
