Feature: site access is restricted to unauthorized users

  As a security enthusiast
  I want pages to have restricted access
  To enhance user privacy

  Scenario Outline: for a user that is not signed in
    Given there is an existing team
    And I am not a member of the team
    When I access "<path>"
    Then I should be routed to "<destination>"

    Scenarios:
    
      | path          | destination |
      | the home page | sign in     |
      | my dashboard  | sign in     |
      | team's page   | sign in     |

  Scenario Outline: for a user that is signed in but not a member of the team
    Given I am signed in
    And there is an existing team
    And I am not a member of the team
    When I access "<path>"
    Then I should be routed to "<destination>"

    Scenarios:
      | path          | destination   |
      | the home page | the home page |
      | my dashboard  | my dashboard  |
      | team's page   | my dashboard  |


  Scenario Outline: for a signed in user that is a member of a team, but not captain
    Given I am signed in
    And I am a member of a team
    When I access "<path>"
    Then I should be routed to "<destination>"

    Scenarios:
      | path             | destination |
      | team's page      | team's page |
      | team's edit page | team's page |



  Scenario Outline: for a signed in user that is captain of a team
    Given I am signed in
    And I am captain of a team
    When I access "<path>"
    Then I should be routed to "<destination>"

    Scenarios:

      | path             | destination      |
      | team's page      | team's page      |
      | team's edit page | team's edit page |
