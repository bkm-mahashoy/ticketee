Feature: Managing States
  In order to change information about a state
  As an admin
  I want to be able to set a state's name and default status

  Background:
    Given I have run the seed task
    And I am signed in as "admin@ticketee.com"
    And I am on the Home page

  Scenario: Marking a state as default
    When I follow the "Admin" link
    And I follow the "States" link
    And I follow the "Make Default" link for the "Open" state
    Then I should see the "Open is now the default state." message
    And I follow the "Make Default" link for the "New" state
    Then I should see the "New is now the default state." message

