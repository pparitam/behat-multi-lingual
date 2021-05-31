@javascript @api
Feature: Check permission for Anonymous User and Authenticated user

  @api @en @smoke
  Scenario Outline: Check with Anonymous User and Authenticated user can access the nodes in view mo
    Given I am an anonymous user
    And I should have access of <node>
    #validate for Authenticated
    When I am logged in as a user with the "Authenticated user" role
    And I should have access of <node>
    #node1: Should have access
    Examples:
    |node                             |
    #Homepage
    | "/en"                           |
    #Receipe view
    | "/en/recipes/fiery-chili-sauce" |
    #tags
    | "/en/tags/alcohol-free"         |
    | "/en/tags/baked"                |
    | "/en/tags/baking"               |
    | "/en/tags/breakfast"            |
    | "/en/tags/cake"                 |
    | "/en/tags/carrots"              |
    | "/en/tags/chocolate"            |
    | "/en/tags/cocktail-party"       |
    | "/en/tags/dairy-free"           |
    | "/en/tags/dinner-party"         |
    |"/en/tags/dessert"               |
    | "/en/tags/drinks"               |
    | "/en/tags/egg"                  |
    | "/en/tags/grow-your-own"        |
    | "/en/tags/healthy"              |
    | "/en/tags/herbs"                |


  Scenario Outline: Check with Anonymous User and Authenticated user can not perform CRUD Operation on existing nodes
    Given I am an anonymous user
    And I should not have access of <node>
    #validate for Authenticated
    When I am logged in as a user with the "Authenticated user" role
    And I should not have access of <node>
    Examples:
    |node                             |
    #Create Node
    |"/en/node/add/page"              |
    |"/en/node/add/article"           |
    |"/en/node/add/recipe"            |
    #CRUD Opertation on nodes
    |"/en/node/9/delete"              |
    |"/en/node/9/revisions"           |
    |"/en/node/9/translations"        |
    |"/en/node/9/layout"              |
    #CRUD Opertation on taxonomy terms
     #tag-alcohol-free
    |"/en/taxonomy/term/1/edit"       |
    |"/en/taxonomy/term/1/delete"     |
    |"/en/taxonomy/term/1/translations"|
    #tag-baked
    |"/en/taxonomy/term/2/edit"        |
    |"/en/taxonomy/term/2/delete"      |
    |"/en/taxonomy/term/2/translations"|
    #tag-baking
    |"/en/taxonomy/term/3/edit"        |
    |"/en/taxonomy/term/3/delete"      |
    |"/en/taxonomy/term/3/translations"|
    #tag-breakfast
    |"/en/taxonomy/term/4/edit"        |
    |"/en/taxonomy/term/4/delete"      |
    |"/en/taxonomy/term/4/translations"|
    #tag-cake
    |"/en/taxonomy/term/5/edit"        |
    |"/en/taxonomy/term/5/delete"      |
    |"/en/taxonomy/term/5/translations"|
    #tag-carrots
    |"/en/taxonomy/term/6/edit"        |
    |"/en/taxonomy/term/6/delete"      |
    |"/en/taxonomy/term/6/translations"|
    #tag-chocolate
    |"/en/taxonomy/term/7/edit"        |
    |"/en/taxonomy/term/7/delete"      |
    |"/en/taxonomy/term/7/translations"|
    #tag-cocktail-party
    |"/en/taxonomy/term/8/edit"        |
    |"/en/taxonomy/term/8/delete"      |
    |"/en/taxonomy/term/8/translations"|
    #tag-dairy-free
    |"/en/taxonomy/term/9/edit"        |
    |"/en/taxonomy/term/9/delete"      |
    |"/en/taxonomy/term/9/translations"|
    #tag-dinner-party
    |"/en/taxonomy/term/10/edit"       |
    |"/en/taxonomy/term/10/delete"     |
    |"/en/taxonomy/term/10/translations"|
    #tag-dessert
    |"/en/taxonomy/term/11/edit"        |
    |"/en/taxonomy/term/11/delete"      |
    |"/en/taxonomy/term/11/translations"|
    #tag-drinks
    |"/en/taxonomy/term/12/edit"        |
    |"/en/taxonomy/term/12/delete"      |
    |"/en/taxonomy/term/12/translations"|
    #tag-egg
    |"/en/taxonomy/term/13/edit"        |
    |"/en/taxonomy/term/13/delete"      |
    |"/en/taxonomy/term/13/translations"|
    #tag-grow-your-own
    |"/en/taxonomy/term/14/edit"        |
    |"/en/taxonomy/term/14/delete"      |
    |"/en/taxonomy/term/14/translations"|
    #tag-healthy
    |"/en/taxonomy/term/15/edit"        |
    |"/en/taxonomy/term/15/delete"      |
    |"/en/taxonomy/term/15/translations" |
    #tag-herbs
    |"/en/taxonomy/term/16/edit"        |
    |"/en/taxonomy/term/16/delete"      |
    |"/en/taxonomy/term/16/translations"|

