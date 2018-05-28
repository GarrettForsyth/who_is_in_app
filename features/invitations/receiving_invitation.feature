Feature: a user receives an invitation

  As a user
  I want to receieve invitations
  So I can decide if I want to accept them

  Scenario: user accepts an invitation
    Given I am signed in
    And I have been sent an invitation
    When I access "my dashboard"
    And I press "accept invite"
    Then I should see the team name
    And I should see 'Invitation accepted!'

  Scenario: a user accepts an invitation after being kicked
    Given I am signed in
    And I have been sent an invitation
    And I have been kicked from the team sending the invitation
    When  I access "my dashboard"
    And I press "accept invite"
    Then I should see the team name
    And I should see 'Invitation accepted!'

  Scenario: user declines an invitation
    Given I am signed in
    And I have been sent an invitation
    When I access "my dashboard"
    And I press "decline invite"
    Then I should not see the team name
    And I should see 'Invitation declined!'

