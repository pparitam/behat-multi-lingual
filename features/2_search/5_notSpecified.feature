@api @javascript
Feature: Search Validation
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
      #Select content type
    And I check the box "edit-type-recipe"
      #Select not-specified
    And I check the box "edit-language-und"
      # Press bottom Advance search button
    And I press the "edit-submit--2" button
    And I wait 5 second
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
    And I check the box "edit-language-und"
      # Press bottom Advance search button
    And I press the "edit-submit--2" button
    And I wait for the page to be loaded
      #Validate for no result
    And I should see "Su búsqueda no produjo resultados"
