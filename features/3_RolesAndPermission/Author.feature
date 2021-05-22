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
    And I save the node url
    Then I should see "Behat_recipe_1 has been created."
    And I should see "Revisions" in the "region_tab" region
    And I click "Revisions"
    And I should not see "Access Denied"
    And I navigate to the node url
    And I wait for the page to be loaded
    And I should see "Edit" in the "region_tab" region
    And I click "Edit"
    And I should not see "Access Denied"
    And I navigate to the node url
    And I should see "Delete" in the "region_tab" region
    And I click "Delete"
    And I should not see "Access Denied"

  @permission
  Scenario: Check all link with Author
    Given I am on "/en/user/login"
    And I wait for the page to be loaded
    Then I fill in "Username" with "author"
    And I fill in "Password" with "author"
    And I press "Log in"
    And I should have access of "/en/recipes/fiery-chili-sauce"
    And I should have access of "/en/node/add/page"
    And I should have access of "/en/node/add/article"
    And I should have access of "/en/node/add/recipe"
    And I should not have access of "/en/node/9/delete"
    And I should have access of "/en/node/9/revisions"
    And I should not have access of "/en/node/9/translations"
    And I should not have access of "/en/node/9/layout"
    And I should have access of "/en/recipes/fiery-chili-sauce"
      #"Recipe Collection" permission validation
      #tag-alcohol-free
    And I should have access of "/en/tags/alcohol-free"
    And I should have access of "/en/taxonomy/term/1/edit"
    And I should have access of "/en/taxonomy/term/1/delete"
    And I should not have access of "/en/taxonomy/term/1/translations"
      #tag-baked
    And I should have access of "/en/tags/baked"
    And I should have access of "/en/taxonomy/term/2/edit"
    And I should have access of "/en/taxonomy/term/2/delete"
    And I should not have access of "/en/taxonomy/term/2/translations"
      #tag-baking
    And I should have access of "/en/tags/baking"
    And I should have access of "/en/taxonomy/term/3/edit"
    And I should have access of "/en/taxonomy/term/3/delete"
    And I should not have access of "/en/taxonomy/term/3/translations"
      #tag-baked
    And I should have access of "/en/tags/baked"
    And I should have access of "/en/taxonomy/term/4/edit"
    And I should have access of "/en/taxonomy/term/4/delete"
    And I should not have access of "/en/taxonomy/term/4/translations"
      #tag-breakfast
    And I should have access of "/en/tags/breakfast"
    And I should have access of "/en/taxonomy/term/5/edit"
    And I should have access of "/en/taxonomy/term/5/delete"
    And I should not have access of "/en/taxonomy/term/5/translations"
      #tag-cake
    And I should have access of "/en/tags/cake"
    And I should have access of "/en/taxonomy/term/6/edit"
    And I should have access of "/en/taxonomy/term/6/delete"
    And I should not have access of "/en/taxonomy/term/6/translations"
      #tag-carrots
    And I should have access of "/en/tags/carrots"
    And I should have access of "/en/taxonomy/term/7/edit"
    And I should have access of "/en/taxonomy/term/7/delete"
    And I should not have access of "/en/taxonomy/term/7/translations"
      #tag-chocolate
    And I should have access of "/en/tags/chocolate"
    And I should have access of "/en/taxonomy/term/8/edit"
    And I should have access of "/en/taxonomy/term/8/delete"
    And I should not have access of "/en/taxonomy/term/8/translations"
      #tag-cocktail-party
    And I should have access of "/en/tags/cocktail-party"
    And I should have access of "/en/taxonomy/term/9/edit"
    And I should have access of "/en/taxonomy/term/9/delete"
    And I should not have access of "/en/taxonomy/term/9/translations"
      #tag-dairy-free
    And I should have access of "/en/tags/dairy-free"
    And I should have access of "/en/taxonomy/term/10/edit"
    And I should have access of "/en/taxonomy/term/10/delete"
    And I should not have access of "/en/taxonomy/term/10/translations"
      #tag-dinner-party
    And I should have access of "/en/tags/dinner-party"
    And I should have access of "/en/taxonomy/term/11/edit"
    And I should have access of "/en/taxonomy/term/11/delete"
    And I should not have access of "/en/taxonomy/term/11/translations"
      #tag-drinks
    And I should have access of "/en/tags/drinks"
    And I should have access of "/en/taxonomy/term/12/edit"
    And I should have access of "/en/taxonomy/term/12/delete"
    And I should not have access of "/en/taxonomy/term/12/translations"
      #tag-egg
    And I should have access of "/en/tags/egg"
    And I should have access of "/en/taxonomy/term/13/edit"
    And I should have access of "/en/taxonomy/term/13/delete"
    And I should not have access of "/en/taxonomy/term/13/translations"
      #tag-grow-your-own
    And I should have access of "/en/tags/grow-your-own"
    And I should have access of "/en/taxonomy/term/14/edit"
    And I should have access of "/en/taxonomy/term/14/delete"
    And I should not have access of "/en/taxonomy/term/14/translations"
      #tag-healthy
    And I should have access of "/en/tags/healthy"
    And I should have access of "/en/taxonomy/term/15/edit"
    And I should have access of "/en/taxonomy/term/15/delete"
    And I should not have access of "/en/taxonomy/term/15/translations"
      #tag-herbs
    And I should have access of "/en/tags/herbs"
    And I should have access of "/en/taxonomy/term/16/edit"
    And I should have access of "/en/taxonomy/term/16/delete"
    And I should not have access of "/en/taxonomy/term/16/translations"
