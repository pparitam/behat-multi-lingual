@api @javascript
Feature: Normal search validation with
  @es @en @smoke @positive
  Scenario Outline: Searching with a single word, two words with "OR", two words with "AND" condition in spanish and english
    #accessing link
    Given I am on <link>
    #Adding different search key
    And I fill in "edit-keys" with <serchvalue>
    #pressing the button
    And I press the <button> button
    #waiting for result to display
    And I wait for AJAX to finish
    #scrolling till the result
    And I scroll "#block-umami-content" into view
    #waiting to see result
    And I wait 2 second
    #validating the Result heading
    And I should see the heading <heading>
    #validating the result in the main region
    Then I should see <result-msg> in the "main" region


    Examples:
      | link  | serchvalue        | button    |  heading                     | result-msg                                |
      | "/en" | "deep"            |  "Search" | "Search for deep"            | "deep"                              |
      | "/en" | "deep OR Test"    |  "Search" | "Search for deep OR Test"    | "deep"                              |
      | "/en" | "deep AND Test"   |  "Search" | "Search for deep AND Test"   | "Your search yielded no results."   |
      | "/es" | "Quiche"          |  "Buscar" | "Buscar por Quiche"          | "Quiche"                            |
      | "/es" | "Quiche OR Test"  |  "Buscar" | "Buscar por Quiche OR Test"  | "Quiche"                            |
      | "/es" | "Quiche AND Test" |  "Buscar" | "Buscar por Quiche AND Test" | "Su búsqueda no produjo resultados" |

  @en @es @neg
  Scenario Outline: Searching with blank value and with space and validating result
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
