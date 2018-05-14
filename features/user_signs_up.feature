Feature: User signs up

  In order to use site features that require sign up information
  As a user
  I want to sign up

  Scenario: a user signs up
    Given my email has not been used to sign up before
    And I am on the home page
    When I follow "Sign Up!"
    And I fill in "Name" with "Bob"
    And I fill in "Email" with "bark@dog.com"
    And I fill in "Password" with "barkbark"
    And I fill in "Password confirmation" with "barkbark"
    And I press "Create"
    Then I should see "A message with a confirmation link has been sent to your email address. Please follow the link to activate your account."
    And I should be on the login path 
    And I should be listed as a user
