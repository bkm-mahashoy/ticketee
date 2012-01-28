Feature: Viewing Tickets
  In order to view the tickets for a project
  As a user I want to see them on that project's page

  Background:
    Given there are the following users:
      | email             | password |
      | user@ticketee.com | password |
    And there is a project called "TextMate 2"
    And "user@ticketee.com" has created a ticket for this project:
      | title          | description                   |
      | Make it shiny! | Gradients! Starbursts! Oh my! |
    And there is a project called "Internet Explorer"
    And "user@ticketee.com" has created a ticket for this project:
      | title                | description                    |
      | Standards compliance | Is desirable (and not a joke!) |

    And I am on the Home page

    Scenario: Viewing tickets for a given project
      When I follow the "TextMate 2" link
      Then I should see "Make it shiny!"
      And I should not see "Standards compliance"
      When I follow the "Make it shiny!" link
      Then I should see "Make it shiny!" within "#ticket h3"
      And I should see "Gradients! Starbursts! Oh my!"

      When I follow the "Ticketee" link
      And I follow the "Internet Explorer" link
      Then I should see "Standards compliance"
      And I should not see "Make it shiny!"
      When I follow the "Standards compliance" link
      Then I should see "Standards compliance" within "#ticket h3"
      And I should see "Is desirable (and not a joke!)"
