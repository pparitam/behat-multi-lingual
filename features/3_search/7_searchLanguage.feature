@api @javascript
Feature: Advance Search Validation by selecting language option
  @en @smoke
  Scenario: Verify the user is able to see test results for English word, when english is selected
    Given I am logged in as a user with the "administrator" role
    And I wait 5 second
    And I am on "/en/search/node"
    And I wait 5 second
      #select advance search accordion
    When I press the "Advanced search" button
      #validate the section "Keyword", "Types", and "Languages"
    Then I should see "Keywords"
    And I should see "Types"
    And I should see "Languages"
      #Add search keyword in Keyword section
    And I fill in "Containing any of the words" with "Vegan"
    And I fill in "Containing the phrase" with "Use a little of the sunflower oil to grease an 8 inch square baking tin (or similar size) and line the tin with greaseproof paper."
    And I fill in "Containing none of the words" with "article"
      #Select content type
    And I check the box "edit-type-recipe"
      #Select language
    And I check the box "edit-language-en"
      # Press bottom Advance search button
    And I press the "edit-submit--2" button
    And I wait for the page to be loaded
      #validate for the result
    And I should see "Vegan chocolate and nut brownies"
      #validate that keyword highlighted in bold or not
    And I should see "Vegan" in the "strong" element

  @en @smoke
  Scenario: Verify the user is unable to see test results for English word in spanish
    Given I am logged in as a user with the "administrator" role
    And I wait 5 second
    And I am on "/en/search/node"
    And I wait 5 second
      #select advance search accordion
    When I press the "Advanced search" button
      #validate the section "Keyword", "Types", and "Languages"
    Then I should see "Keywords"
    And I should see "Types"
    And I should see "Languages"
      #Add search keyword in Keyword section
    And I fill in "Containing any of the words" with "Vegan"
    And I fill in "Containing the phrase" with "Use a little of the sunflower oil to grease an 8 inch square baking tin (or similar size) and line the tin with greaseproof paper."
    And I fill in "Containing none of the words" with "article"
      #Select content type
    And I check the box "edit-type-recipe"
      #Select language
    And I check the box "edit-language-es"
      # Press bottom Advance search button
    And I press the "edit-submit--2" button
    And I wait for the page to be loaded
      #validate for no result message
    And I should see "Your search yielded no results."


  @es
  Scenario: Verify the user is able to see test results for spanish word in spanish
    Given I am logged in as a user with the "administrator" role
    And I wait 5 second
    And I am on "/es/search/node"
    And I wait 5 second
      #select advance search accordion
    When I press the "Búsqueda avanzada" button
      #validate the section "Keyword", "Types", and "Languages"
    Then I should see "Palabras clave"
    And I should see "Tipos"
    And I should see "Idiomas"
      #Add search keyword in Keyword section
    And I fill in "Que contenga cualquiera de las palabras" with "veganos"
    And I fill in "Que contenga la frase" with "Engrasar una bandeja de hornear de unos 20 cm (o tamaño similar) con un poco del aceite de girasol y cubrir con papel de hornear."
    And I fill in "Que no contenga ninguna de las palabras" with "Artículos"
      #Select content type
    And I check the box "edit-type-recipe"
      #Select language
    And I check the box "edit-language-es"
      # Press bottom Advance search button
    And I press the "edit-submit--2" button
    And I wait for the page to be loaded
      #Validate result
    And I should see "Bizcochos veganos de chocolate y nueces"
      #validate that keyword is highlighted in bold or not
    And I should see "veganos" in the "strong" element

  @es
  Scenario: Verify the user is unable to see test results for spanish word in English
    Given I am logged in as a user with the "administrator" role
    And I wait 5 second
    And I am on "/es/search/node"
    And I wait 5 second
      #select advance search accordion
    When I press the "Búsqueda avanzada" button
      #validate the section "Keyword", "Types", and "Languages"
    Then I should see "Palabras clave"
    And I should see "Tipos"
    And I should see "Idiomas"
      #Add search keyword in Keyword section
    And I fill in "Que contenga cualquiera de las palabras" with "veganos"
    And I fill in "Que contenga la frase" with "Engrasar una bandeja de hornear de unos 20 cm (o tamaño similar) con un poco del aceite de girasol y cubrir con papel de hornear."
    And I fill in "Que no contenga ninguna de las palabras" with "Artículos"
      #Select content type
    And I check the box "edit-type-recipe"
      #Select language
    And I check the box "edit-language-en"
      # Press bottom Advance search button
    And I press the "edit-submit--2" button
    And I wait for the page to be loaded
      #Validate for no result
    And I should see "Su búsqueda no produjo resultados"

