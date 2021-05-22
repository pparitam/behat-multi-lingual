@api @javascript
Feature: Search Validation

  @api @content @javascript @creation @en
  Scenario: 1.Create tags and Validate article is not getting created if mandatory fields are marked empty
    Given I login as "Administrator" user
    And I wait for the page to be loaded
    #Create tags
    When I am viewing a "tags" term with the name "behat_recipe_tag"
    Then I should see the heading "behat_recipe_tag"
    #create Recipe category
    When I am viewing a "recipe_category" term with the name "behat_recipe_category"
    Then I should see the heading "behat_recipe_category"
    And I am on "/en/node/add/recipe"
    And I should not see "Access denied"
    Then I should see "Create Recipe" in the "header" region
   ### Fill all form detail
    When I fill in "Recipe Name" with "Behat_recipe_CRUD"
    And I fill in "Preparation time" with "10"
    And I fill in "Cooking time" with "60"
    And I fill in "Number of servings" with "4"
    #adding Tag and recipe term
    And I fill in "edit-field-recipe-category-target-id" with "behat_recipe_category"
    And I fill in "Tags" with "behat_recipe_tag"
    #Uploading Media, adding alt text and handling popup window
    And I press the "Add media" button
    And I wait for the page to be loaded
    And I attach the file "fff.png" to "files[upload]"
    And I wait 5 second
    And I fill in "media[0][fields][field_media_image][0][alt]" with "this is alttext"
    Then I click on the element with xpath "//button[text()='Save']"
    And I click on the element with xpath "//button[text()='Insert selected']"
    And I wait for the AJAX to finish
    And I fill in wysiwyg on field "Summary" with "Test Data"
    # Adding multiple ingredients
    And I fill in "field_ingredients[0][value]" with "Cook1"
    And I press the "Add another item" button
    And I fill in "field_ingredients[1][value]" with "Cook2"
    And I press the "Add another item" button
    And I fill in "field_ingredients[2][value]" with "Cook3"
    And I fill in wysiwyg on field "Recipe instruction" with "Test Data"
    And I click the ".seven-details__summary" element
    #Adding Url
    And I fill in "edit-path-0-alias" with "/recipes/behat_recipe"
    And I select "Published" from "Save as"
    #saving node in published form
    And I press the "Save" button
    And I wait 15 second
    #saving the node for CRUD scenario
    And I save the node url
    And I wait for the page to be loaded
    #validating Recipe Creation message
    Then I should see "Recipe Behat_recipe_CRUD has been created."
    And I wait for AJAX to finish
    #validate Recipe block on homepage
    When I am on homepage
    #scroll to see the blocks
    And I scroll "#block-views-block-promoted-items-block-1" into view
    And I wait 5 second
    Then I should see "Behat_recipe_CRUD" in the "promoted" region
    And I scroll "#block-umami-content" into view
    And I should see "Behat_recipe_CRUD" in the "main" region
    And I wait 5 second
    #update banner with created recipe
    And I am on "/block/3?destination=/en/admin/structure/block/block-content"
    And I wait 5 second
    #update Title,Summary, image and URL
    #Tile
    And I fill in "Title" with "Behat_recipe_CRUD"
    #summary
    And I fill in "Summary" with "Behat Updated Text"
    #url
    And I fill in "URL" with "/en/recipes/behat_recipe"
    #remove old image
    And I click the "#edit-field-media-image-selection-0-remove-button" element
    And I wait for AJAX to finish
    #add new image and add mandatory details
    And I press the "Add media" button
    And I wait for the page to be loaded
    And I attach the file "fff.png" to "files[upload]"
    And I wait 2 second
    And I fill in "media[0][fields][field_media_image][0][alt]" with "this is alttext"
    Then I click on the element with xpath "//button[text()='Save']"
    And I click on the element with xpath "//button[text()='Insert selected']"
    And I wait for the AJAX to finish
    #submit banner form
    And I press the "Save" button
    And I wait for the page to be loaded
    #validate success message
    And I should see "Banner block Umami Home Banner has been updated."
    #Validate banner detail on Homepage
    And I am on homepage
    And I should see "Behat_recipe_CRUD" in the "summary" region
    And I should see "Behat Updated Text" in the "summary" region
    #redirect on Recipe from Homepage
    And I click "View recipe"
    And I wait for the page to be loaded
    Then I should see the heading "Behat_recipe_CRUD"
    # validate the created recipe displaying in the recipe list
    When I click "Recipe"
    And I wait for the page to be loaded
    Then I should see "Behat_recipe_CRUD" in the "main" region
    Then I wait 5 second
    When I navigate to the node url
    And I wait for the page to be loaded
    #VALIDATE  receipe heading
    And I am on "/en/recipes/behat_recipe"
    Then I should see the heading "Behat_recipe_CRUD"
    #validate all the fields value
    And I should see "Preparation time" in the "main" region
    And I should see "10 minutes" in the "main" region
    And I should see "Cooking time" in the "main" region
    And I should see "60 minutes" in the "main" region
    And I should see "Number of servings" in the "main" region
    And I should see "4" in the "main" region
    And I should see "behat_recipe_tag" in the "main" region
    And I should see "behat_recipe_category" in the "main" region
    And I should see "Cook1" in the "Ingredients" region
    And I should see "Cook2" in the "Ingredients" region
    And I should see "Cook3" in the "Ingredients" region
    #Select Edit to update the filed
    And I click "Edit" in the "tabs" region
    And I wait for the page to be loaded
    And I fill in "field_ingredients[2][value]" with "Cook_updated"
    And I press the "Save" button
    And I wait for the page to be loaded
    And I should see "Recipe Behat_recipe_CRUD has been updated."
    When I navigate to the node url
    And I wait for the page to be loaded
    #delete the Content
    And I click "Delete"
    # Validate the confirmation message
    Then I should see "Are you sure you want to delete the content item Behat_recipe_CRUD?"
    #delete the node
    And I press the "Delete" button
    And I wait for the page to be loaded
    #validate the Deleted node success message
    And I should see "The Recipe Behat_recipe_CRUD has been deleted."
    #validate the Recipe in the list after deletion
    When I click "Recipe"
    And I wait for the page to be loaded
    Then I should not see "Behat_recipe_CRUD" in the "main" region

