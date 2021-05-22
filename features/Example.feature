@javascript @api
Feature: Validate Role wise Permissions

  @javascript
  Scenario: Author should be able to create a Draft
    Given I am on "/en/user/login"
    And I wait for the page to be loaded
    Then I fill in "Username" with "author"
    And I fill in "Password" with "author"
    And I press "Log in"
    And I wait 5 second
    And I am on "/en/node/add/recipe"
    And I should not see "Access denied"
    Then I should see "Create Recipe" in the "header" region
#Create Recipe Draft
# Fill all form detail
    When I fill in "Recipe Name" with "Behat_recipe_1"
#    And I fill in "Language" with "English"
    And I fill in "Preparation time" with "10"
    And I fill in "Cooking time" with "60"
    And I fill in "Number of servings" with "4"
#    And I fill in "Difficulty" with "Easy"
    And I fill in "edit-field-recipe-category-target-id" with "Main courses"
    And I fill in "Tags" with "Vegetarian"
    And I press the "edit-field-media-image-open-button" button
    And I wait for the AJAX to finish
    And I should see "Add or select media"
    And I wait 5 second
    And I should see "Deep mediterranean quiche"
    And I check the box "media_library_select_form[0]"
    And I wait 2 second
    And I click on the element with xpath "//button[text()='Insert selected']"
    And I wait for the AJAX to finish
    And I fill in wysiwyg on field "Summary" with "Test Data"
    And I fill in "Ingredients" with "Cook1"
    And I fill in wysiwyg on field "Recipe instruction" with "Test Data"
    And I press the "Save" button
    Then I wait for the page to be loaded
    Then I should see "Behat_recipe_1 has been created."
    And I should see "Edit" in the "region_tab" region
    And I click "Edit"
    And I should not see "Access Denied"
    And I navigate to the node url
    And I should see "Delete" in the "region_tab" region
    And I click "Edit"
    And I should not see "Access Denied"
    And I navigate to the node url
    And I should see "Revisions" in the "region_tab" region
    And I click "Revisions"
    And I should not see "Access Denied"



