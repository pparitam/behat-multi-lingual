@api @javascript
Feature: Search Validation
    @es @smoke
    Scenario: Enter a keyword in `Containing any of the words` and verify the search results
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
      And I press the "edit-submit--2" button
      And I wait for the page to be loaded
      #validate for the result
      And I should see "Vegan chocolate and nut brownies"
      #validate that keyword highlighted in bold or not
      And I should see "Vegan" in the "strong" element


    @es
    Scenario:  Enter a keyword in `Que contenga cualquiera de las palabras` and verify the search results
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
        # Press bottom Advance search button
      And I press the "edit-submit--2" button
      And I wait for the page to be loaded
        #Validate result
      And I should see "Bizcochos veganos de chocolate y nueces"
        #validate that keyword is highlighted in bold or not
      And I should see "veganos" in the "strong" element
