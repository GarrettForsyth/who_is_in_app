Feature: A user signs out

  As a user
  I want to sign out of my account
  To protect my account

  Scenario:

    Given I am signed in
    And I am on "my dashboard"
    When I follow "sign out"
    And I access "my dashboard"
    Then I should be routed to "sign in"  



