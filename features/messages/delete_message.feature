@javascript
Feature: User deletes message

  As a user
  I want the option to delete my messages
  To delete messages I don't want seen anymore

  Scenario: I delete my own message
    Given I am signed in as a team member
    And I have posted a message
    And a team member has commented on my message
    When I access "my team's page"
    And I press and confirm "delete message"
    Then I should see "Message deleted"
    And I should not see the message's content
    And I should not see the comment's content


  Scenario: a team captain can delete another member's message
    Given I am signed in as team captain
    And my teammate has posted a message
    When I access "my team's page"
    And I press and confirm "delete message"
    Then I should see "Message deleted"
    And I should not see the message's content

  Scenario: I try to delete a teammates message
      Given I am signed in as a team member
      And my teammate has posted a message
      When I access "my team's page"
      Then I should not see 'delete message'

