Feature: Editing Tickets
  In order to alter and update ticket information for a project
  As a user, I want a form to update and edit tickets

  Background:
    Given there are the following users:
      | email             | password |
      | user@ticketee.com | password |
    And I am signed in as one of those users
    And there is a project called "TextMate 2"
    And "user@ticketee.com" can view the "TextMate 2" project
    And "user@ticketee.com" has created a ticket for this project:
      | title          | description                   |
      | Make it shiny! | Gradients! Starbursts! Oh my! |

    And I am on the Home page
    When I follow the "TextMate 2" link
    And I follow the "Make it shiny!" link
    And I follow the "Edit Ticket" link

    Scenario: Updating a ticket
      When I fill in "Title" with "Make it really shiny!"
      And I press the "Update Ticket" button
      Then I should see the message "Ticket has been successfully updated."
      And I should see "Make it really shiny!" within "#ticket h3"
      But I should not see "Make it shiny!" within "#ticket h3"

    Scenario: Updating a ticket with invalid information
      When I fill in "Title" with ""
      And I press the "Update Ticket" button
      Then I should see the message "Ticket has not been updated."
