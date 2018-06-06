Feature: a team captain edits team information

  As a team captain
  I want to edit my team information
  To fix mistakes, update or improve upon the current information so I
  can communicate better with my teammates

  Scenario Outline:
    Given I am signed in as team captain
    And I am on "my team's page"
    When I follow "Edit Team Information"
    When I fill in "<label>" with "<attribute>"
    And I select "<activity>"
    And I press "submit" 
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
      | label                               | attribute | activity | message                            |
      | Minimum members needed for an event | 10        |          | Team information has been updated! |
      | Minimum members needed for an event |           |          | Min members can't be blank         |
      | Minimum members needed for an event | -1        |          | Min members must be greater than 0 |

      
  Scenario: an unauthorized user
    Given I am signed in as a team member
    And I am on "my team's page"
    Then I should not see 'Edit Team Information'

