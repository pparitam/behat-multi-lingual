@javascript @api
Feature: Validate Role wise Permissions

  Scenario: Login with Authenticated User
    Given I am on "/"
    When I am logged in as a user with the "Authenticated user" role
    And I wait for AJAX to finish
    Then I should not have access of "/en/node/add/page"
    And I should not have access of "/en/node/add/article"
    And I should not have access of "/en/node/add/recipe"
    And I should not have access of "/en/node/9/delete"
    And I should not have access of "/en/node/9/revisions"
    And I should not have access of "/en/node/9/translations"
    And I should not have access of "/en/node/9/layout"
    And I should have access of "/en/recipes/fiery-chili-sauce"
      #"Recipe Collection" permission validation
      #tag-alcohol-free
    And I should have access of "/en/tags/alcohol-free"
    And I should not have access of "/en/taxonomy/term/1/edit"
    And I should not have access of "/en/taxonomy/term/1/delete"
    And I should not have access of "/en/taxonomy/term/1/translations"
      #tag-baked
    And I should have access of "/en/tags/baked"
    And I should not have access of "/en/taxonomy/term/2/edit"
    And I should not have access of "/en/taxonomy/term/2/delete"
    And I should not have access of "/en/taxonomy/term/2/translations"
      #tag-baking
    And I should have access of "/en/tags/baking"
    And I should not have access of "/en/taxonomy/term/3/edit"
    And I should not have access of "/en/taxonomy/term/3/delete"
    And I should not have access of "/en/taxonomy/term/3/translations"
      #tag-baked
    And I should have access of "/en/tags/baked"
    And I should not have access of "/en/taxonomy/term/4/edit"
    And I should not have access of "/en/taxonomy/term/4/delete"
    And I should not have access of "/en/taxonomy/term/4/translations"
      #tag-breakfast
    And I should have access of "/en/tags/breakfast"
    And I should not have access of "/en/taxonomy/term/5/edit"
    And I should not have access of "/en/taxonomy/term/5/delete"
    And I should not have access of "/en/taxonomy/term/5/translations"
      #tag-cake
    And I should have access of "/en/tags/cake"
    And I should not have access of "/en/taxonomy/term/6/edit"
    And I should not have access of "/en/taxonomy/term/6/delete"
    And I should not have access of "/en/taxonomy/term/6/translations"
      #tag-carrots
    And I should have access of "/en/tags/carrots"
    And I should not have access of "/en/taxonomy/term/7/edit"
    And I should not have access of "/en/taxonomy/term/7/delete"
    And I should not have access of "/en/taxonomy/term/7/translations"
      #tag-chocolate
    And I should have access of "/en/tags/chocolate"
    And I should not have access of "/en/taxonomy/term/8/edit"
    And I should not have access of "/en/taxonomy/term/8/delete"
    And I should not have access of "/en/taxonomy/term/8/translations"
      #tag-cocktail-party
    And I should have access of "/en/tags/cocktail-party"
    And I should not have access of "/en/taxonomy/term/9/edit"
    And I should not have access of "/en/taxonomy/term/9/delete"
    And I should not have access of "/en/taxonomy/term/9/translations"
      #tag-dairy-free
    And I should have access of "/en/tags/dairy-free"
    And I should not have access of "/en/taxonomy/term/10/edit"
    And I should not have access of "/en/taxonomy/term/10/delete"
    And I should not have access of "/en/taxonomy/term/10/translations"
      #tag-dinner-party
    And I should have access of "/en/tags/dinner-party"
    And I should not have access of "/en/taxonomy/term/11/edit"
    And I should not have access of "/en/taxonomy/term/11/delete"
    And I should not have access of "/en/taxonomy/term/11/translations"
      #tag-drinks
    And I should have access of "/en/tags/drinks"
    And I should not have access of "/en/taxonomy/term/12/edit"
    And I should not have access of "/en/taxonomy/term/12/delete"
    And I should not have access of "/en/taxonomy/term/12/translations"
      #tag-egg
    And I should have access of "/en/tags/egg"
    And I should not have access of "/en/taxonomy/term/13/edit"
    And I should not have access of "/en/taxonomy/term/13/delete"
    And I should not have access of "/en/taxonomy/term/13/translations"
      #tag-grow-your-own
    And I should have access of "/en/tags/grow-your-own"
    And I should not have access of "/en/taxonomy/term/14/edit"
    And I should not have access of "/en/taxonomy/term/14/delete"
    And I should not have access of "/en/taxonomy/term/14/translations"
      #tag-healthy
    And I should have access of "/en/tags/healthy"
    And I should not have access of "/en/taxonomy/term/15/edit"
    And I should not have access of "/en/taxonomy/term/15/delete"
    And I should not have access of "/en/taxonomy/term/15/translations"
      #tag-herbs
    And I should have access of "/en/tags/herbs"
    And I should not have access of "/en/taxonomy/term/16/edit"
    And I should not have access of "/en/taxonomy/term/16/delete"
    And I should not have access of "/en/taxonomy/term/16/translations"



