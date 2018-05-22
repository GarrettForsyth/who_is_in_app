@javascript
Feature: Message author deletes message

  As a message author
  I want the option to delete my messages
  To delete messages I don't want seen anymore

  Scenario:

    Given I have created and confirmed my account
    And I am signed in
    And I am a member of a team
    And I have posted a message
    When I access "my team's page"
    And I press "delete message"
    And I press "Yes" and confirm "delete message" 
    Then I should see "Message deleted"
    And I should not see the message's content
