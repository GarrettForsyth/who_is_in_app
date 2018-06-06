Feature: A user signs up using social media

  As a user
  I want to sign up using a social media account
  To sign up more easily

  Scenario: A user signs up with valid credentials from Google
    Given I am on "the home page"
    And I have an account with Google associated with the email 'valid_mock@email.com'
    When I follow "Sign up"
    And I follow "sign in with google"
    Then I should see "Successfully authenticated from Google account"

  Scenario: a user signs up with invalid credentials from Google
    Given I am on "the home page"
    And I have an account with Google associated with the email 'invalid_mock@email!!.com'
    When I follow "Sign up"
    And I follow "sign in with google"
    Then I should see "Email is invalid"
