Feature: A team member posts a message in a team's news feed

  As a team member
  I want to post a message in my team's news feed
  To communicate with my team mates

  Scenario:
  Given I have created and confirmed my account
  And I am signed in
  And I am a member of a team
  When I access "my team's page"  
  And I follow "Post a message"
  And I fill in "Content" with "Welcome Everyone!"
  And I press "Post"
  Then I should see "Welcome Everyone" within 'news-feed'
