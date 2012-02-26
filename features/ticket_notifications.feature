Feature: Ticket Notifications
  Background:
    Given there are the following users:
      | email              | password |
      | alice@ticketee.com | password |
      | bob@ticketee.com   | password |
    And the email queue is clear
    And there is a project called "TextMate 2"
    And "alice@ticketee.com" can view the "TextMate 2" project
    And "bob@ticketee.com" can view the "TextMate 2" project
    And "alice@ticketee.com" has created a ticket for this project:
      | title        | description      |
      | Release date | TBA very shortly |
    And I am signed in as "bob@ticketee.com"
    And I am on the Home page

  Scenario: Ticket owner is automatically subscribed to the ticket
    When I follow the "TextMate 2" link
    And I follow the "Release date" link
    And I fill in "Text" with "Is it out yet?"
    And I press the "Create Comment" button

    Then "alice@ticketee.com" should receive an email
    When "alice@ticketee.com" opens the email
    Then they should see "updated the Release date ticket" in the email body
    And they should see "[ticketee] TextMate 2 - Release date" in the email subject
    When they click the first link in the email
    Then I should see "Release date" within "#ticket h3"
