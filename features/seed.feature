Feature: Seed Data
  In order to fill the database with seed data
  As the system's administrator
  I want to be able to run the seed task

  Background:
    Given I have run the seed task
    And I am signed in as "admin@ticketee.com"
    And I am on the Home page

  Scenario: Load the seed data
    Then I should see the "Ticketee Beta" project

  Scenario: The basics
    When I follow the "Ticketee Beta" link
    And I follow the "New Ticket" link
    And I fill in "Title" with "Comments with state"
    And I fill in "Description" with "Comments always have a state."
    And I press the "Create Ticket" button
    Then I should see "New" within "#comment_state_id"
    And I should see "Open" within "#comment_state_id"
    And I should see "Closed" within "#comment_state_id"