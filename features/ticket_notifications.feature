Feature: Ticket Notifications
  Background:
    Given there are the following users:
      | email              | password |
      | alice@ticketee.com | password |
      | bob@ticketee.com   | password |
    And a clear email queue
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
    And the email should contain 2 parts
    And there should be a part with content type "text/plain"
    And there should be a part with content type "text/html"
    And they should see "[ticketee] TextMate 2 - Release date" in the email subject
    When they follow "view this ticket online here." in the email
    Then I should see "Release date" within "#ticket h3"
