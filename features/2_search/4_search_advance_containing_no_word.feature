@api @javascript
Feature: Search Validation
    @en @smoke
    Scenario: Searching with a single word
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
      And I fill in "Containing any of the words" with ""
      And I fill in "Containing the phrase" with ""
      And I fill in "Containing none of the words" with "vegan"
      And I wait 5 second
      #Select content type
      And I check the box "edit-type-recipe"
      #Select language
      And I check the box "edit-language-en"
      And I wait for the AJAX to finish
      # Press bottom Advance search button
      And I press the "edit-submit--2" button
      And I wait for the AJAX to finish



