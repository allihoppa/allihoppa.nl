Feature: Main

  @javascript
  Scenario: Create Post
    # Log in
    Given I am on "/wordpress/wp-admin/edit.php"
    And I wait for "WordPress database bijwerken"
    And I press "Doorgaan"
    When I fill in "user_login" with "annelies"
    And I fill in "user_password" with "admin"
    And I press "Inloggen"

