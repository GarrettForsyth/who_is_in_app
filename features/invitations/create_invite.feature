Feature: a team captain invites a user thier team

  As a team captain
  I want to invite users to join my team
  So I can communicate with that user better as my teammate

  Scenario: captain sends and invitation to a new member 
    Given I am signed in as team captain
    And I am on "my team's page"
    And there is another user, currently not on my team
    When I follow "Invite"
    And I fill in "Invite email" with the user's email
    And I press "Invite"
    Then I should see "Invitation sent!"

  Scenario: captain sends and invitation to an invalid member
    Given I am signed in as team captain
    And I am on "my team's page"
    And there is another user, currently not on my team
    When I follow "Invite"
    And I fill in "Invite email" with "not_a_user@email.com"
    And I press "Invite"
    Then I should see "Recipient must exist"

  Scenario: captain send in invitation to someone is already a team member
    Given I am signed in as team captain
    And I have a teammate
    And I am on "my team's page"
    When I follow "Invite"
    And I fill in "Invite email" with my teammate's email
    And I press "Invite"
    Then I should see "Recipient is already a team member"

  Scenario: captain sends an invitation to the same person twice
    Given I am signed in as team captain
    And I am on "my team's page"
    And there is another user, currently not on my team
    And I have already sent this user an invitation
    When I follow "Invite"
    And I fill in "Invite email" with the user's email
    And I press "Invite"
    Then I should see "Recipient has already received this invitation"

  Scenario: an invalid user sends an invitation 
    Given I am signed in as a team member
    And I am on "my team's page"
    Then I should not see 'Invite'

