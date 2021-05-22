@api @javascript
Feature: Search Validation

  @api @content @javascript @creation @en
  Scenario: 1.Delete all Media
    Given I login as "Administrator" user
    And I wait 5 second
    #Delete Dummy Media
    And I am on "/en/admin/content/media"
    And I wait for the page to be loaded
    And I fill in "Media name" with "fff.png"
    And I click the "#edit-submit-media" element
    And I wait for the AJAX to finish
    And I click the ".form-checkbox" element
    And I wait 2 second
    And I click the "#edit-submit--2" element
    And I wait for the page to be loaded
    And I should see "Are you sure you want to delete these media items?"
    And I press the "Delete" button