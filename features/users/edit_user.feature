Feature: a user edits their information

  As a user
  I'd like to edit my information
  To more accurately reflect my current state


  Background:
    Given I am signed in
    And I am on "my dashboard"
    When I follow "edit account"
    And I confirm my current password

  Scenario Outline: edit name
    When I fill in "Name" with "<name>"
    And I press 'Update'
    Then I should see "<message>"

    Scenarios:
      | name | message                                    |
      | Bob  | Your account has been updated successfully |
      |      | Name can't be blank                        |

  Scenario Outline: edit email
    Given the email 'taken@email.com' is already in use
    When I fill in "Email" with "<email>"
    And I press 'Update'
    Then I should see "<message>"

    Scenarios:
      | email           | message                                    |
      | new@email.com   | You updated your account successfully |
      |                 | Email can't be blank                       |
      | taken@email.com | Email has already been taken               |

  Scenario Outline: edit password
    When I fill in "Password" with "<password>"
    When I fill in "Password confirmation" with "<password confirmation>"
    And I press 'Update'
    Then I should see "<message>"

    Scenarios:
      | password  | password confirmation | message                                      |
      | newpass   | newpass               | Your account has been updated successfully   |
      | short     | short                 | Password is too short                        |
      | different | confirmation          | Password confirmation doesn't match Password |


  Scenario Outline: update without confirming current password
    When I fill in "Name" with "<name>"
    When I fill in "Current password" with "<current password>"
    And I press 'Update'
    Then I should see "<message>"

    Scenarios:
      | name | current password | message                         |
      | Bob  |                  | Current password can't be blank |
      | Bob  | wrong password   | Current password is invalid     |
