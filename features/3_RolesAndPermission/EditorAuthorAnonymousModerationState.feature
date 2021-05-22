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
   ### Fill all form detail
    When I fill in "Recipe Name" with "Behat_recipe_1"
    And I fill in "Preparation time" with "10"
    And I fill in "Cooking time" with "60"
    And I fill in "Number of servings" with "4"
    And I fill in "edit-field-recipe-category-target-id" with "Main courses"
    And I fill in "Tags" with "Vegetarian"
    And I wait for the AJAX to finish
    And I press the "Add media" button
    And I wait for the page to be loaded
    And I check the box "media_library_select_form[1]"
    And I click on the element with xpath "//button[text()='Insert selected']"
    And I wait for the AJAX to finish
    And I fill in wysiwyg on field "Summary" with "Test Data"
    And I fill in "Ingredients" with "Cook1"
    And I fill in wysiwyg on field "Recipe instruction" with "Test Data"
    And I press the "Save" button
    #saving the node URL in a variable
    And I save the node url
    And I wait for AJAX to finish
    #printing URL for the reference
    And print current URL
    #logout from the application
    When I click "Log out" in the "preheader" region
    And I wait for the page to be loaded
    #accessing link as an anonymous user
    When I navigate to the node url
    And I wait for the page to be loaded
    Then I should see the heading "Access denied"
    #Login with an Editor USer
    And I am on "/en/user/login"
    And I wait for the page to be loaded
    When I fill in "Username" with "editor"
    And I fill in "Password" with "editor"
    And I press "Log in"
    And I wait 5 second
    #accessing the Draft node
    When I navigate to the node url
    And I wait for the page to be loaded
    And I click "Edit" in the "tabs" region
    And I wait for the page to be loaded
    #By saving, publishing the draft node
    And I press the "Save" button
    When I click "Log out" in the "preheader" region
    And I wait for the page to be loaded
    #accessing link as an anonymous user
    When I navigate to the node url
    #VALIDATE  receipe heading
    Then I should see the heading "Behat_recipe_1"
    #validate the field value filled during node creation
    And I should see "Preparation time" in the "main" region
    And I should see "10 minutes" in the "main" region
    And I should see "Cooking time" in the "main" region
    And I should see "60 minutes" in the "main" region
    And I should see "Number of servings" in the "main" region
    And I should see "4" in the "main" region
    #login with Editor and Archive Node
    And I am on "/en/user/login"
    And I wait for the page to be loaded
    When I fill in "Username" with "editor"
    And I fill in "Password" with "editor"
    And I press "Log in"
    And I wait 5 second
    #accessing the published node
    When I navigate to the node url
    And I wait for the page to be loaded
    And I click "Edit" in the "tabs" region
    And I wait for the page to be loaded
    And I select "Archived" from "Change to"
    #By saving, publishing the draft node
    And I press the "Save" button
    When I click "Log out" in the "preheader" region
    And I wait for the page to be loaded
    #accessing link as an anonymous user it should be access denied
    When I navigate to the node url
    And I wait for the page to be loaded
    Then I should see the heading "Access denied"
    #delete the Content
    And I am on "/en/user/login"
    And I wait for the page to be loaded
    When I fill in "Username" with "admin"
    And I fill in "Password" with "admin"
    And I press "Log in"
    And I wait 5 second
    And I navigate to the node url
    And I wait for the page to be loaded
    And I click "Delete"
    # Validate the confirmation message
    Then I should see "Are you sure you want to delete the content item Behat_recipe_1?"
    #delete the node
    And I press the "Delete" button
    And I wait for the page to be loaded
    #validate the Deleted node success message
    And I should see "The Recipe Behat_recipe_1 has been deleted."



