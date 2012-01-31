Feature: Deleting Users
  In order to remove users
  As an admin
  I want to be able to delete them

  Background:
    Given there are the following users:
      | email              | password | admin |
      | admin@ticketee.com | password | true  |
      | user@ticketee.com  | password | false |

    And I am signed in as "admin@ticketee.com"
    And I am on the Home page
    When I follow the "Admin" link
    And I follow the "Users" link

  Scenario: Deleting a user
    And I follow the "user@ticketee.com" link
    When I follow the "Delete User" link
    Then I should see the "User has been successfully deleted." message
    And I should not see "user@ticketee.com"

  Scenario: Users cannot delete themselves.
    And I follow the "admin@ticketee.com" link
    When I follow the "Delete User" link
    Then I should see the "You cannot delete yourself - invalid action." message
