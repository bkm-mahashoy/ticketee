Feature: Seed Data
  In order to fill the database with seed data
  As the system's administrator
  I want to be able to run the seed task

  Scenario: Load the seed data
    Given I have run the seed task
    And I am signed in as "admin@ticketee.com"
    And I am on the Home page
    Then I should see the "Ticketee Beta" project
