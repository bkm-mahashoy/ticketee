Feature: Assigning Permissions
  In order to set up users with the correct permissions
  As an admin
  I want to check the appropriate permissions check boxes

  Background:
    Given there are the following users:
      | email              | password | admin |
      | admin@ticketee.com | password | true  |
    And I am signed in as one of those users

    And there are the following users:
      | email             | password |
      | user@ticketee.com | password |

    And there is a project called "TextMate 2"

    When I follow the "Admin" link
    And I follow the "Users" link
    And I follow the "user@ticketee.com" link
    And I follow the "Permissions" link

  Scenario: Viewing and updating a project's permissions
    When I check the "View" checkbox for the "TextMate 2" project
    And I press the "Update Permissions" button
    And I follow the "Sign Out" link

    Given I am signed in as "user@ticketee.com"
    Then I should see "TextMate 2"
