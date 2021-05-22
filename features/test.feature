@contact @api
Feature: Contact form validation in english
  In order to verify the contact from submission in a correct way
  It should accept only correct value
  For incorrect or blank field it should display notification
  On submission of the form it should show a notification message

  @javascript @en
  Scenario: Verify success message is should not be displayed for a blank form submission
    Given I am on "/"
    When I follow "Contact" in the "footer" region
    Then I should see the heading "Website feedback"
    When I fill in "Your name" with ""
    And I fill in "Your email address" with ""
    And I fill in "Subject" with ""
    And I fill in "Message" with:
      """

      """
    And I press the "Send message" button
    Then I validate the validation message
