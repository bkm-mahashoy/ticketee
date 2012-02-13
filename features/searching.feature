Feature: Searching for Tickets using Tags
  In order to find tickets tagged with a specific tag
  As a user
  I want to enter a ticket search query by specifying the tags

  Background:
    Given there are the following users:
      | email             | password |
      | user@ticketee.com | password |
    And I am signed in as one of those users
    And there is a project called "Ticketee"
    And "user@ticketee.com" can view the "Ticketee" project
    And "user@ticketee.com" can tag the "Ticketee" project
    And "user@ticketee.com" has created a ticket for this project:
      | title  | description  | tags  | state |
      | Tag1!  | Tag ticket 1 | one_1 | Open  |
    And "user@ticketee.com" has created a ticket for this project:
      | title  | description  | tags  | state  |
      | Tag2!  | Tag ticket 2 | two_2 | Closed |
    And I am on the Home page
    When I follow the "Ticketee" link within "#projects"
 
  Scenario: Search Tickets based on a tag
    When I fill in "Search" with "tag:one_1"
    And I press the "Search" button
    Then I should see "Tag1"
    And I should not see "Tag2"

  Scenario: Search Tickets based on a tag
    When I fill in "Search" with "tag:two_2"
    And I press the "Search" button
    Then I should see "Tag2"
    And I should not see "Tag1"

  Scenario: Search Tickets based on a state
    When I fill in "Search" with "state:Open"
    And I press the "Search" button
    Then I should see "Tag1"
    And I should not see "Tag2"

  Scenario: Search Tickets based on a state
    When I fill in "Search" with "state:Closed"
    And I press the "Search" button
    Then I should see "Tag2"
    And I should not see "Tag1"

  Scenario: Search Tickets based on a tag and state
    When I fill in "Search" with "tag:one_1 state:Open"
    And I press the "Search" button
    Then I should see "Tag1"
    And I should not see "Tag2"

  Scenario: Search Tickets based on a tag and state
    When I fill in "Search" with "tag:two_2 state:Closed"
    And I press the "Search" button
    Then I should see "Tag2"
    And I should not see "Tag1"
