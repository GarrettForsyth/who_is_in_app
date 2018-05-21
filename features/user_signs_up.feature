Feature: User signs up

  In order to use site features that require sign up information
  As a user
  I want to sign up

  Scenario Outline: a user tries to sign up
    Given I am on "the home page" 
    And the email 'good@dog.com' is already in use
    And there have been no emails sent by the server
    When I follow "Sign up"
    And I fill in "Name" with "<name>"
    And I fill in "Email" with "<email>"
    And I fill in "Password" with "<password>"
    And I fill in "Password confirmation" with "<password confirmation>"
    And I press "Sign up"
    Then I should see "<message>"
    And "<num emails>" emails have been sent
    And if an email was sent, it was addressed to "<email>"

    Scenarios: the user gives valid credentials
      | name  | email           | password    | password confirmation | message                         | num emails |
      | Bob   | woof@dog.com    | barkbark1!  | barkbark1!            | confirmation link has been sent | 1          |
      | Alice | wonder@land.com | whiterabbit | whiterabbit           | confirmation link has been sent | 1          |

    Scenarios: the user gives invalid credentials
      | name | email         | password   | password confirmation | message                                      | num emails |
      |      | woof@dog.com  | password1! | password1!            | Name can't be blank                          | 0          |
      | Bob  |               | barkbark   | barkbark              | Email can't be blank                         | 0          |
      | Bob  | bark4@dog.com | barkbark   |                       | Password confirmation doesn't match Password | 0          |
      | Bob  | ????          | barkbark   | barkbark              | Email is invalid                             | 0          |
      | Bob  | bark7@dog.com | few        | few                   | Password is too short                        | 0          |
      | Bob  | good@dog.com  | woofwoof   | woofwoof              | Email has already been taken                 | 0          |



