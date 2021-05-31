@api @javascript
Feature: Search Validation

  @api @content @javascript @creation @en
  Scenario: 1.Create tags and Validate article is not getting created if mandatory fields are marked empty
    Given I am on "/en/user/login"
    And I wait for the page to be loaded
    Then I fill in "Username" with "admin"
    And I fill in "Password" with "admin"
    And I press "Log in"
    And I wait 5 second
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
    And I select "Published" from "Save as"
    And I wait for the page to be loaded
    And I press the "Save" button
    And I wait 5 second
    And I should see the following error messages:
      | error messages                        |
      | Summary field is required.            |
      | Recipe instruction field is required. |
      | This value should not be null.        |
