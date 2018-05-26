@javascript
Feature: A user deletes their account

  As a user
  I'd like to delete my account
  Because I'm unhappy and want to protect my privacy

  Scenario:
    Given I am signed in
    And I am on "my dashboard"
    When I follow "edit account"
    And I press and confirm 'Cancel my account'
    And I sign in
    Then I should see 'Invalid Email or password'

