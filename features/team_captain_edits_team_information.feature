Feature: a team captain edits team information

  As a team captain
  I want to edit my team information
  To fix mistakes, update or improve upon the current information so I
  can communicate better with my teammates

  Scenario Outline:
    Given I have created and confirmed my account
    And I am signed in
    And I am captain of a team
    And I am on "my team's page"
    When I follow "Edit Team Information"
    And I fill in "<label>" with "<attribute>"
    And I select "<activity>"
    And I press "Update" 
    Then I should see "<message>"

  Scenarios: user updates their team name
      | label | attribute    | activity | message                            |
      | Name  | The Mustangs |          | Team information has been updated! |
      | Name  |              |          | Name can't be blank                |

  Scenarios: user updates their activity
      | label | attribute | activity   | message                            |
      |       |           | Basketball | Team information has been updated! |
      |       |           |            | Team information has been updated! |

  Scenarios: user updates their minimum needed members
      | label             | attribute | activity | message                            |
      | team[min_members] | 10        |          | Team information has been updated! |
      | team[min_members] |           |          | Min members can't be blank         |
      | team[min_members] | -1        |          | Min members must be greater than 0 |
