Feature: Signing Up
  In order to be attributed for my work
  As a user
  I want to be able to sign up

  Scenario: Signing Up
    Given I am on the Home page
    When I follow the "Sign Up" link
    And I fill in the "Email" field with "user@ticketee.com"
    And I fill in the "Password" field with "password"
    And I fill in the "Password confirmation" field with "password"
    And I press the "Sign up" button
    Then I should see "You have signed up successfully."
    And I should see "Please confirm your account before signing in."
