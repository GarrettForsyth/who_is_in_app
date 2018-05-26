Feature: a user comments on a message
  As a user
  I want to comment on a message
  To communicate my thoughts regarding the message with teammates

  Scenario: I comment on a teammates message
    Given I am signed in as a team member
    And my teammate has posted a message
    And I am on "my team's page"
    When I follow 'comment'
    And I fill in "Content" with "Good message!"
    And I press 'Add comment'
    Then I should see the message's content
    Then I should see my comment's content

  Scenario: I create an invaliid comment on a teammates message
    Given I am signed in as a team member
    And my teammate has posted a message
    And I am on "my team's page"
    When I follow 'comment'
    And I fill in "Content" with ""
    And I press 'Add comment'
    Then I should see "Content can't be blank"
