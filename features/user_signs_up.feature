Feature: User signs up

  In order to use site features that require sign up information
  As a user
  I want to sign up

  #Scenario: a user signs up
    #Given my email has not been used to sign up before
    #And I am on the home page
    #When I follow "Sign Up!"
    #And I fill in "Name" with "Bob"
    #And I fill in "Email" with "bark@dog.com"
    #And I fill in "Password" with "barkbark"
    #And I fill in "Password confirmation" with "barkbark"
    #And I press "Create"
    #Then I should see "A message with a confirmation link has been sent to your email address. Please follow the link to activate your account."
    #And I should be on the login path 
    #And I should be listed as a user

  Scenario Outline: a user tries to sign up
    Given I am on the home page 
    And the email 'good@dog.com' is already in use
    When I follow "Sign Up!"
    And I fill in "Name" with "<name>"
    And I fill in "Email" with "<email>"
    And I fill in "Password" with "<password>"
    And I fill in "Password confirmation" with "<password confirmation>"
    And I press "Sign up"
    Then I should see content that includes "<message>"

    Scenarios: the user gives valid credentials
      | name  | email           | password    | password confirmation | message                         |
      | Bob   | woof@dog.com    | barkbark1!  | barkbark1!            | confirmation link has been sent |
      | Alice | wonder@land.com | whiterabbit | whiterabbit           | confirmation link has been sent |

    Scenarios: the user gives invalid credentials
      | name | email         | password   | password confirmation | message                                      |
      |      | woof@dog.com  | password1! | password1!            | Name can't be blank                          |
      | Bob  |               | barkbark   | barkbark              | Email can't be blank                         |
      | Bob  | bark4@dog.com | barkbark   |                       | Password confirmation doesn't match Password |
      | Bob  | ????          | barkbark   | barkbark              | Email is invalid                             |
      | Bob  | bark7@dog.com | few        | few                   | Password is too short                        |
      | Bob  | good@dog.com  | woofwoof   | woofwoof              | Email has already been taken                 |



