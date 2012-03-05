Feature: Watching Tickets
  In order to keep upto date with a ticket
  As a user
  I want to be able to subscribe to ticket updates

  Background:
    Given there are the following users:
      | email             | password |
      | alice@ticketee.com | password |
    And there is a project called "TextMate 2"
    And "alice@ticketee.com" can view the "TextMate 2" project
    And "alice@ticketee.com" has created a ticket for this project:
      | title        | description      |
      | Release date | TBA very shortly |
    And I am signed in as "alice@ticketee.com"
    And I am on the Home page

  Scenario: Switching between watching and not watching the ticket
    When I follow the "TextMate 2" link
    And I follow the "Release date" link
    Then I should see "alice@ticketee.com" within "#watchers"
    And I press the "Stop watching this ticket" button
    Then I should see the "You are no longer watching this ticket." message
    And I should not see "alice@ticketee.com" within "#watchers"
    And I press the "Start watching this ticket" button
    Then I should see the "You are now watching this ticket." message
    And I should see "alice@ticketee.com" within "#watchers"
