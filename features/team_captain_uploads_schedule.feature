Feature: a team captain uploads a schedule

  As a team captain
  I want to upload a schedule
  So my teammates know about planned events

  Scenario Outline:
    Given I have created and confirmed my account
    And I am signed in
    And I am captain of a team
    And I am on my team's show page
    When I follow "Upload Schedule"
    And I select "<file name>" from my documents
    And I press "Update"
    Then I should see "<message>"
    And I should see the image "<file name>" if "<file type>"

    Scenarios: valid files
    | file name     | message                            | file type |
    | schedule.jpg  | Team information has been updated! | image     |
    | schedule.jpeg | Team information has been updated! | image     |
    | schedule.png  | Team information has been updated! | image     |
    | schedule.gif  | Team information has been updated! | image     |
    | schedule.pdf  | Team information has been updated! | pdf       |

    Scenarios: invalid files
    | file name     | message                                                                       | file type |
    | schedule.blah | Schedule cannot be a \"blah\" file. Allowed types are: jpg, jpeg, gif, png, pdf | invalid   |
