@javascript @api
Feature: Validate Role wise Permissions

  Scenario Outline: Validate permission on existing nodes and taxonomy term to access edit, revision, layout, and delete
    Given I am logged in as a user with the "author" role
    And I wait for the page to be loaded
    And I should have access of <node>
    Given I am logged in as a user with the "editor" role
    And I wait for the page to be loaded
    And I should have access of <node>
    Examples:
    |node                                   |
    #Recipe-node: fiery-chili-sauce
    |"/en/recipes/fiery-chili-sauce"        |
    |"/en/node/9/revisions"                 |
    #"Recipe Collection" permission validation
    #Tags:alcohol-free
    |"/en/tags/alcohol-free"                |
    |"/en/taxonomy/term/1/edit"             |
    |"/en/taxonomy/term/1/delete"           |
    #Tags:baked
    |"/en/tags/baked"                       |
    |"/en/taxonomy/term/2/edit"             |
    |"/en/taxonomy/term/2/delete"           |
    #tag-baking
    |"/en/tags/baking"                      |
    |"/en/taxonomy/term/3/edit"             |
    |"/en/taxonomy/term/3/delete"           |
    #tag-breakfast
    |"/en/tags/breakfast"                   |
    |"/en/taxonomy/term/4/edit"             |
    |"/en/taxonomy/term/4/delete"           |
    #tag-cake
    |"/en/tags/cake"                        |
    |"/en/taxonomy/term/5/edit"             |
    |"/en/taxonomy/term/5/delete"           |
    #tag-carrots
    |"/en/tags/carrots"                     |
    |"/en/taxonomy/term/6/edit"             |
    |"/en/taxonomy/term/6/delete"           |
    #tag-chocolate
    |"/en/tags/chocolate"                   |
    |"/en/taxonomy/term/7/edit"             |
    |"/en/taxonomy/term/7/delete"           |
    #tag-cocktail-party
    |"/en/tags/cocktail-party"              |
    |"/en/taxonomy/term/8/edit"             |
    |"/en/taxonomy/term/8/delete"           |
    #tag-dairy-free
    |"/en/tags/dairy-free"                  |
    |"/en/taxonomy/term/9/edit"             |
    |"/en/taxonomy/term/9/delete"           |
    #tag-dinner-party
    |"/en/tags/dinner-party"                |
    |"/en/taxonomy/term/10/edit"            |
    |"/en/taxonomy/term/10/delete"          |
    #tag-dessert
    |"/en/tags/dessert"                     |
    |"/en/taxonomy/term/11/edit"            |
    |"/en/taxonomy/term/11/delete"          |
    #tag-drinks
    |"/en/tags/drinks"                      |
    |"/en/taxonomy/term/12/edit"            |
    |"/en/taxonomy/term/12/delete"          |
    #tag-egg
    |"/en/tags/egg"                         |
    |"/en/taxonomy/term/13/edit"            |
    |"/en/taxonomy/term/13/delete"          |
    #tag-grow-your-own
    |"/en/tags/grow-your-own"               |
    |"/en/taxonomy/term/14/edit"            |
    |"/en/taxonomy/term/14/delete"          |
    #tag-healthy
    |"/en/tags/healthy"                     |
    |"/en/taxonomy/term/15/edit"            |
    |"/en/taxonomy/term/15/delete"          |
    #tag-herbs
    |"/en/tags/herbs"                       |
    |"/en/taxonomy/term/16/edit"            |
    |"/en/taxonomy/term/16/delete"          |


  Scenario Outline: Validate Author has no permission to access Translation page of any term
    Given I am logged in as a user with the "author" role
    And I wait for the page to be loaded
    And I should not have access of <node>
    Given I am logged in as a user with the "editor" role
    And I wait for the page to be loaded
    And I should not have access of <node>
    Examples:
      |node                                  |
      |"/en/taxonomy/term/1/translations"    |
      |"/en/taxonomy/term/2/translations"    |
      |"/en/taxonomy/term/3/translations"    |
      |"/en/taxonomy/term/4/translations"    |
      |"/en/taxonomy/term/5/translations"    |
      |"/en/taxonomy/term/6/translations"    |
      |"/en/taxonomy/term/7/translations"    |
      |"/en/taxonomy/term/8/translations"    |
      |"/en/taxonomy/term/9/translations"    |
      |"/en/taxonomy/term/10/translations"   |
      |"/en/taxonomy/term/11/translations"   |
      |"/en/taxonomy/term/12/translations"   |
      |"/en/taxonomy/term/13/translations"   |
      |"/en/taxonomy/term/14/translations"   |
      |"/en/taxonomy/term/15/translations"   |
