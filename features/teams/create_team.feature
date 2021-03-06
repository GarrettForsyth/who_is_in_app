Feature: a user creates a team

  As a user
  I want to create a team
  So I can communicate better with my teammates

  Scenario Outline: a user tries to create a team
    Given I am signed in
    And I am on "my dashboard"
    And I currently have zero teams
    When I follow "Create New Team"
    And I fill in "Name" with "<team name>"
    And I select "<activity>"
    And I fill in "Minimum members needed for an event" with min members <min members>
    And I press "submit"
    Then I should see "<message>"

    Scenarios: the user creates a valid team
      | team name        | activity   | min members | message                    |
      | The Mighty Ducks | Hockey     | 6           | Team successfully created! |
      | Raptors          | Basketball | 5           | Team successfully created! |
      | Blue Jays        | Baseball   | 10          | Team successfully created! |

    Scenarios: the user uses invalid attributes
      | team name        | activity | min members | message                            |
      |                  | Hockey   | 6           | Name can't be blank                |
      |                  |          | 6           | Activity can't be blank            |
      | The Mighty Ducks | Hockey   |             | Min members can't be blank         |
      | The Mighty Ducks | Hockey   | -1          | Min members must be greater than 0 |
