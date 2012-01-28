Feature: Signing In
  In order to use the site
  As a user, I want to be able to sign in

  Scenario: Signing in using email confirmation
    Given there are the following users:
      | email             | password      | unconfirmed |
      | user@ticketee.com | user_password | true        |
    When "user@ticketee.com" opens the email with subject "Confirmation instructions"
    And they click the first link in the email
    Then I should see the message "Your account was successfully confirmed"
    And I should see the message "Signed in as user@ticketee.com"

  Scenario: Signing in using forms
    Given there are the following users:
      | email | password |
      | user@ticketee.com | welc0me |
    And I am on the Home page
    When I follow the "Sign In" link
    And I fill in the "Email" field with "user@ticketee.com"
    And I fill in the "Password" field with "welc0me"
    And I press the "Sign in" button
    Then I should see the message "Signed in successfully"
