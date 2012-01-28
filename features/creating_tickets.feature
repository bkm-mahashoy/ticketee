Feature: Creating Tickets
  In order to create tickets for projects
  As a user, I want to be able to select a project and ...

  Background:
    Given there is a project called "Internet Explorer"
    And I am on the Home page
    And there are the following users:
      | email             | password |
      | user@ticketee.com | password |
    When I follow the "Internet Explorer" link
    And I follow the "New Ticket" link
    Then I should see "You need to sign in or sign up before continuing."
    When I fill in the "Email" field with "user@ticketee.com"
    And I fill in the "Password" field with "password"
    And I press the "Sign in" button
    Then I should see the "New Ticket" message


  Scenario: Creating a ticket
    When I fill in "Title" with "Standards Compliance"
    And I fill in "Description" with "... pages do not conform to UI standards."
    And I press the "Create Ticket" button
    Then I should see "Ticket has been successfully created"
    Then I should see "Created by user@ticketee.com"

  Scenario: Creating a ticket without valid attributes fails
    When I press the "Create Ticket" button
    Then I should see "Ticket has not been created."
    And I should see "Title can't be blank"
    And I should see "Description can't be blank"

  Scenario: The Description field must be longer than 10 characters
    When I fill in "Title" with "Standards Compliance"
    And I fill in "Description" with "it fails"
    And I press the "Create Ticket" button
    Then I should see "Ticket has not been created."
    And I should see "Description is too short (minimum is 10 characters)"
