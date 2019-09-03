# Inspired by: https://pantheon.io/docs/guides/wordpress-automated-testing/
Feature: Main

  @javascript
  Scenario: As a user with the editor role I can post to the blog
    Given I am logged in as "annelies" with password "test"
    And I follow "Berichten"
    And I follow "Nieuw bericht"
    And I fill in "post_title" with "My Awesome Blog Post"
    And I fill in "Test post content" in WYSIWYG editor "content_ifr"
    When I press "Concept opslaan"
    And I wait until I can publish
    And I press "Publiceren"
    Then I wait for button "Bijwerken"
    When I follow "Bericht bekijken"
    Then I should see "My Awesome Blog Post"
    And I should see "Test post content"

