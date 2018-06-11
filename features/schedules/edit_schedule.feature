Feature: a team captain edits a schedule

  As a team captain
  I want to edit a schedule
  To update changes and fix mistaes


  Scenario Outline: a team captain edits a schedule
    Given I am signed in as team captain
    And my team has a schedule
    When I access "my team's page"
    And I follow "edit schedule"
    And I select "<file name>" from my documents in the "Image" field
    And I press "submit"
    Then I should see "<message>"

    Scenarios: valid files
    | file name     | message                       | 
    | schedule.jpg  | Schedule successfully updated |
    | schedule.jpeg | Schedule successfully updated |
    | schedule.png  | Schedule successfully updated |
    | schedule.gif  | Schedule successfully updated |
    | schedule.pdf  | Schedule successfully updated |

    Scenarios: invalid files
    | file name     | message                                                                         | file type |
    | schedule.blah | Image cannot be a \"blah\" file. Allowed types are: jpg, jpeg, gif, png, pdf | invalid   |

  Scenario: invalid user uploads a file
    Given I am signed in as a team member
    When I access "my team's page"
    Then I should not see "edit schedule"
