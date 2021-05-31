@javascript @api
Feature: Validate Advance search of a node in different content moderation state
  Created node with Drupal API

  @javascript
  Scenario: 1. Validate admin should not be able to search draft content
  2. Admin should be able to search published node
    Given I am logged in as a user with the "administrator" role
    And I wait for the page to be loaded
    And I am viewing an "article" content:
      |title   | The guide to grow your own spinach |
      | body   | Growing anything at home requires taking care of it as you care for your personal belongings. Growing spinach is no different. You don’t want to plant the seeds and forget about them. Pay your plants a visit at least once a day. |
      |language| en                                                                                                                                                                                                                                   |
      |tags    | Grow your own                                                                                                                                                                                                                        |
    And I wait for the page to be loaded
    And I save the node url
    # Redirect to  Search page
    And I am on "/en/search/node"
    And I wait 5 second
      #select advance search accordion
    When I press the "Advanced search" button
      #validate the section "Keyword", "Types", and "Languages"
    Then I should see "Keywords"
    And I should see "Types"
    And I should see "Languages"
      #Add search keyword in Keyword section
    And I fill in "Containing any of the words" with "spinach"
    And I fill in "Containing the phrase" with "Growing anything at home requires taking care of it as you care for your personal belongings. Growing spinach is no different. You don’t want to plant the seeds and forget about them. Pay your plants a visit at least once a day."
    And I fill in "Containing none of the words" with "recipe"
      #Select content type
    And I check the box "edit-type-article"
      #Select language
    And I check the box "edit-language-en"
      # Press bottom Advance search button
    And I press the "edit-submit--2" button
    And I wait for the page to be loaded
      #validate for the result
    And I scroll ".item-list" into view
    And I should not see "The guide to grow your own spinach"
      #validate that keyword highlighted in bold or not
    And I should not see "spinach" in the "strong" element

  # Published the node
    When I navigate to the node url
    And I wait for the page to be loaded
    And I should see "Log message"
    And I fill in "Log message" with "publish node"
    And I press the "Apply" button


    #Running cron to reflect the changes
    Then I run cron
    And I wait for the page to be loaded

    # Redirect to  Search page again to check published node
    And I am on "/en/search/node"
    And I wait 5 second
      #select advance search accordion
    When I press the "Advanced search" button
      #validate the section "Keyword", "Types", and "Languages"
    Then I should see "Keywords"
    And I should see "Types"
    And I should see "Languages"
      #Add search keyword in Keyword section
    And I fill in "Containing any of the words" with "spinach"
    And I fill in "Containing the phrase" with "Growing anything at home requires taking care of it as you care for your personal belongings. Growing spinach is no different. You don’t want to plant the seeds and forget about them. Pay your plants a visit at least once a day."
    And I fill in "Containing none of the words" with "recipe"
      #Select content type
    And I check the box "edit-type-article"
      #Select language
    And I check the box "edit-language-en"
      # Press bottom Advance search button
    And I press the "edit-submit--2" button
    And I wait for the page to be loaded
      #validate for the result
    And I scroll ".item-list" into view
    And I should see "The guide to grow your own spinach"
      #validate that keyword highlighted in bold or not
    And I should see "spinach" in the "strong" element


