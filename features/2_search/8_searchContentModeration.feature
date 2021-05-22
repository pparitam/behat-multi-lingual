@javascript @api
Feature: Validate Role wise Permissions

  @javascript
  Scenario: Author should be able to create a Draft
    Given I am logged in as Administrator
    Given I am on "/en/user/login"
    And I wait for the page to be loaded
    Then I fill in "Username" with "admin"
    And I fill in "Password" with "admin"
    And I press "Log in"
    And I wait 5 second
    And I am on "/en/node/add/recipe"
    Then I should see "Create Recipe" in the "header" region

   #Create Recipe Draft
   ### Fill all form detail
    When I fill in "Recipe Name" with "Behat_recipe_search_ContentModeration"
    And I fill in "Preparation time" with "10"
    And I fill in "Cooking time" with "60"
    And I fill in "Number of servings" with "4"
    And I fill in "edit-field-recipe-category-target-id" with "Main courses"
    And I fill in "Tags" with "Vegetarian"
    And I press the "edit-field-media-image-open-button" button
    And I wait for the AJAX to finish
    And I should see "Add or select media"
    And I should see "Deep mediterranean quiche"
    And I check the box "media_library_select_form[0]"
    And I click on the element with xpath "//button[text()='Insert selected']"
    And I wait for the AJAX to finish
    And I fill in wysiwyg on field "Summary" with "Test Data"
    And I fill in "Ingredients" with "Cook1"
    And I fill in wysiwyg on field "Recipe instruction" with "Test Data"
    And I press the "Save" button
    And I save the node url
    #logout from the application
    And I press the "admin" button
    And I click "Log out"
    And I wait for the page to be loaded
    #Search for anonymous user
    And I am on "/"
    When I fill in "edit-keys" with "Behat_recipe_search_ContentModeration"
    And I press the "Search" button
    And I wait for AJAX to finish
    Then I should see "Your search yielded no results."
    #Login with an Editor USer
    And I am on "/en/user/login"
    And I wait for the page to be loaded
    Then I fill in "Username" with "admin"
    And I fill in "Password" with "admin"
    And I press "Log in"
    And I wait 5 second
    #accessing the Draft node
    And I navigate to the node url
    And I wait for the page to be loaded
    And I click "Edit" in the "tabs" region
    And I wait for the page to be loaded
    #By saving, publishing the draft node
    And I select "Published" from "Change to"
    And I press the "Save" button
    And I run cron
    And the cache has been cleared
    And I wait for the page to be loaded
#    And I press the "admin" button
    And I am on "/en/user/logout"
    And I wait for the page to be loaded
    #accessing link as an anonymous user
    And I am on "/"
    When I fill in "edit-keys" with "Behat_recipe_search_ContentModeration"
    And I press the "Search" button
    And I wait for AJAX to finish
    Then I should see "Behat_recipe_search_ContentModeration"
    And I should see "Behat_recipe_search_ContentModeration" in the "strong" element

