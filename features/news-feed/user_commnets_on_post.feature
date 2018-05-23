Feature: a user comments on a post

  As a user
  I want to comment on a post
  So my comment is coupled with its subject

  Scenario:

    Given I have created and confirmed my account
    And I am signed in
    And I am a member of a team
    And I have a teammate
    And my teammate has posted a message
    And I am on "my team's page"
    When I follow 'comment'
    And I fill in "Content" with "Good post!"
    And I press 'Add comment'
    Then I should see my comment's content
