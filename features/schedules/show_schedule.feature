Feature: a team member views the schedule file

  As a team member
  I'd like to view the image of the schedule
  So I know when and where events are

  Scenario Outline: a team captain edits a schedule
    Given I am signed in as team captain
    And my team has a schedule
    When I access "my team's page"
    And I follow "edit schedule"
    And I select "<file name>" from my documents in the "Image" field
    And I press "submit"
    And I follow 'view schedule'
    And I should see the image "<file name>" if "<file type>"

    Scenarios: valid files
    | file name     | file type |
    | schedule.jpg  | image     |
    | schedule.jpeg | image     |
    | schedule.png  | image     |
    | schedule.gif  | image     |
    | schedule.pdf  | pdf       |
