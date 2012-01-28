Feature: Deleting Tickets
  As a user I want to remove or delete tickets

  Background:
    Given there are the following users:
      | email             | password |
      | user@ticketee.com | password |
    And I am signed in as one of those users
    And there is a project called "TextMate 2"
    And "user@ticketee.com" has created a ticket for this project:
      | title          | description                   |
      | Make it shiny! | Gradients! Starbursts! Oh my! |
    And I am on the Home page
    When I follow the "TextMate 2" link
    And I follow the "Make it shiny!" link

  Scenario: Deleting a Ticket
    And I follow the "Delete Ticket" link
    Then I should see "Ticket has been successfully deleted."
    And I should be on the project page for "TextMate 2"
