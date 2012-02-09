Feature: Creating comments
  In order to update a ticket's progress
  As a user
  I want to leave comments

  Background:
    Given there are the following users:
      | email             | password |
      | user@ticketee.com | password |
    And I am signed in as one of those users
    And there is a project called "Ticketee"
    And "user@ticketee.com" can view the "Ticketee" project
    And "user@ticketee.com" has created a ticket for this project:
      | title                   | description                            |
      | Change a ticket's state | You should be able to create a comment |
    And I am on the Home page
    And I follow the "Ticketee" link within "#projects"
    And there is a state called "Open" 

  Scenario: Creating a comment
    When I follow the "Change a ticket's state" link
    And I fill in the "Text" field with "Add a comment!"
    And I press the "Create Comment" button
    Then I should see the "Comment has been successfully created." message
    And I should see "Add a comment!" within "#comments"

  Scenario: Creating an invalid comment
    When I follow the "Change a ticket's state" link
    And I press the "Create Comment" button
    Then I should see the "Comment has not been created." message
    And I should see "Text can't be blank"

  Scenario: Changing a ticket's state
    When I follow the "Change a ticket's state" link
    And I fill in the "Text" field with "This is a real issue."
    And I select "Open" from the "State" drop down list
    And I press the "Create Comment" button
    Then I should see the "Comment has been successfully created." message
    And I should see "Open" within "#ticket .state"
