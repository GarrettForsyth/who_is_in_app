@javascript
Feature: user deletes a comment

  As a user
  I want to delete comments
  To get rid of malicious and hurtful comments

  Scenario: valid user deletes comment
    Given I am signed in as team captain
    And I have posted a message
    And a team member has commented on my message
    And I am on "my team's page"
    When I press and confirm 'delete comment'
    Then I should see 'Comment deleted!'
    And I should not see the comment's content

  Scenario: an invalid user deletes a comment
    Given I am signed in as a team member
    And I have posted a message
    And a team member has commented on my message
    And I am on "my team's page"
    Then I should not see 'delete comment'

