Feature: a team captain uploads a schedule

  As a team captain
  I want to upload a schedule
  So my teammates know when events are


  Scenario Outline: a team captain uploads a schedule
    Given I am signed in as team captain
    When I access "my team's page"
    And I follow "add schedule"
    And I select "<file name>" from my documents in the "Image" field
    And I press "submit"
    Then I should see "<message>"
    And I should see the image "<file name>" if "<file type>"

    Scenarios: valid files
    | file name     | message                        | file type |
    | schedule.jpg  | Schedule successfully created. | image     |
    | schedule.jpeg | Schedule successfully created | image     |
    | schedule.png  | Schedule successfully created. | image     |
    | schedule.gif  | Schedule successfully created. | image     |
    | schedule.pdf  | Schedule successfully created. | pdf       |

    Scenarios: invalid files
    | file name     | message                                                                         | file type |
    | schedule.blah | Image cannot be a \"blah\" file. Allowed types are: jpg, jpeg, gif, png, pdf | invalid   |


#Scenario: a team captain uploads an image as a schedule
    #Given I am signed in as team captain
    #When I access "my team's page"
    #And I follow 'add schedule'
    #And I follow 'attach google calendar'
    #Then I should see 'Successfully created Google calendar'

