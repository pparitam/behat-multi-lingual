@api @javascript
Feature: Search Validation
  @es @en @smoke @positive
  Scenario Outline: Searching with a single word
    Given I am on <link>
    And I fill in "edit-keys" with <serchvalue>
    And I press the <button> button
    And I wait for AJAX to finish
    And I scroll "#block-umami-content" into view
    And I wait 2 second
    And I should see the heading <heading>
    Then I should see <msg2> in the "main" region


    Examples:
      | link  | serchvalue        | button    |  heading                     | msg2                                |
      | "/en" | "deep"            |  "Search" | "Search for deep"            | "deep"                              |
      | "/en" | "deep OR Test"    |  "Search" | "Search for deep OR Test"    | "deep"                              |
      | "/en" | "deep AND Test"   |  "Search" | "Search for deep AND Test"   | "Your search yielded no results."   |
      | "/es" | "Quiche"          |  "Buscar" | "Buscar por Quiche"          | "Quiche"                            |
      | "/es" | "Quiche OR Test"  |  "Buscar" | "Buscar por Quiche OR Test"  | "Quiche"                            |
      | "/es" | "Quiche AND Test" |  "Buscar" | "Buscar por Quiche AND Test" | "Su búsqueda no produjo resultados" |

  @en @es @smoke @neg
  Scenario Outline: Searching without adding any word
    Given I am on <link>
    When I fill in "edit-keys" with <serchvalue>
    And I press the <button> button
    And I wait for AJAX to finish
    Then I should see the error message <error>
    And I scroll ".layout-content" into view
    And I wait 3 second
    And I should see the heading <heading>
    And I should see <result-msg> in the "main" region

    Examples:
      | link  | serchvalue | button   |  heading  | error                                        |result-msg                            |
      | "/en" | ""         | "Search" |  "Search" | "Please enter some keywords."                | "Your search yielded no results."    |
      | "/en" | " "        | "Search" |  "Search" | "Please enter some keywords."                | "Your search yielded no results."    |
      | "/es" | ""         | "Buscar" |  "Buscar" | "Por favor, escriba algunas palabras clave." | "Su búsqueda no produjo resultados"  |
      | "/es" | " "        | "Buscar" |  "Buscar" | "Por favor, escriba algunas palabras clave." | "Su búsqueda no produjo resultados"  |
