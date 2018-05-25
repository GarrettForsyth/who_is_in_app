Feature: a team captain invites a user thier team

  As a team captain
  I want to invite users to join my team
  So I can communicate with that user better as my teammate

  Scenario Outline:
    Given I have created and confirmed my account
    And I am signed in
    And I am captain of a team
    And I am on "my team's page"
    And there is another user, currently not on my team
    When I follow "Invite"
    And I fill in "Invite email" with the user's email
    And I press "Invite"
    And the invited user signs in
    And the invited user visits "my dashboard" 
    And the invited user presses "<response>" 
    And the invited user visits "my team's page"
    Then he should be on "<expected path>"

    Scenarios:
      | response       | expected path  |
      | accept invite  | my team's page |
      | decline invite | my dashboard   |
