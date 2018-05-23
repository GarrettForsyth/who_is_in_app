@javascript
Feature: Message author deletes message

  As a message author
  I want the option to delete my messages
  To delete messages I don't want seen anymore

  Scenario: I delete my own message

    Given I have created and confirmed my account
    And I am signed in
    And I am a member of a team
    And I have posted a message
    When I access "my team's page"
    And I press and confirm "delete message"
    Then I should see "Message deleted"
    And I should not see the message's content


  Scenario: I cannot delete a teammates message
    Given I have created and confirmed my account
    And I am signed in
    And I am a member of a team
    And I have a teammate
    And my teammate has posted a message
    When I access "my team's page"
    Then I should not see 'delete message'

  Scenario: a team captain can delete another member's message
    Given I have created and confirmed my account
    And I am signed in
    And I am a captain of a team
    And I have a teammate
    And my teammate has posted a message
    When I access "my team's page"
    And I press and confirm "delete message"
    Then I should see "Message deleted"
    And I should not see the message's content

