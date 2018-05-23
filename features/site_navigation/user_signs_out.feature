Feature: A user signs out

  As a user
  I want to sign out of my account
  To protect my account

  Scenario:

    Given I have created and confirmed my account
    And I am signed in
    And I am on "my dashboard"
    When I follow "sign out"
    Then I should not be logged in

