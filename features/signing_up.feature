Feature: Signing Up
  In order to be attributed for my work
  As a user, I want to be able to sign up

  Scenario: Signing Up
    Given I am on the Home page
    When I follow the "Sign Up" link
    And I fill in the "Email" field with "test_user@ticketee.com"
    And I fill in the "Password" field with "test_user_password"
    And I fill in the "Password confirmation" field with "test_user_password"
    And I press the "Sign up" button
    # Then I should see "You have signed up successfully."
    Then I should see "A message with a confirmation link has been sent to your email address. Please open the link to activate your account."
