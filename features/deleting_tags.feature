Feature: Deleting A Tag
  In order to delete a tag from a ticket
  As a user
  I want to be able to delete a tag

  Background:
    Given there are the following users:
      | email             | password |
      | user@ticketee.com | password |
    And I am signed in as one of those users
    And there is a project called "Internet Explorer"
    And "user@ticketee.com" can view the "Internet Explorer" project
    And "user@ticketee.com" can tag the "Internet Explorer" project
    And "user@ticketee.com" has created a ticket for this project:
      | title        | description      | tags                |
      | A Tag Ticket | Which has a tag. | this-deleteable-tag |
    And I am on the Home page
    When I follow the "Internet Explorer" link within "#projects"
    And I follow the "A Tag Ticket" link
 
  @javascript
  Scenario: Deleting a Tag
    When I follow the "delete-this-deleteable-tag" link
    Then I should not see "this-deletable-tag"
