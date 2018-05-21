Feature: site access is restricted to unauthorized users

  As a security enthusiast
  I want pages to have restricted access
  To enhance user privacy

  Scenario Outline:
    Given I have created and confirmed my account
    And I am currently "<role>"
    And there is a team created by "<team owner>"
    When I access "<path>"
    Then I should be routed to "<destination>"

  Scenarios: 
      | role          | team owner   | path             | destination      |
      | not logged in |              | the home page    | sign in          |
      | not logged in |              | my dashboard     | sign in          |
      | not logged in | private user | team's page      | sign in          |
      | not logged in | me           | team's page      | sign in          |
      | logged in     |              | the home page    | the home page    |
      | logged in     |              | my dashboard     | my dashboard     |
      | logged in     | private user | team's page      | my dashboard     |
      | logged in     | me           | team's page      | team's page      |
      | logged in     | my teammate  | team's page      | team's page      |
      | logged in     | private user | team's edit page | my dashboard     |
      | logged in     | me           | team's edit page | team's edit page |
      | logged in     | my teammate  | team's edit page | my dashboard     |


