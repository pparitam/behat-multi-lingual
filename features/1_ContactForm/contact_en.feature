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
    Then I should not see "Your message has been sent."


  @javascript @en
  Scenario: Verify success message is should not be displayed for a form submitted with a blank space
    Given I am on "/"
    When I follow "Contact" in the "footer" region
    Then I should see the heading "Website feedback"
    When I fill in "Your name" with " "
    And I fill in "Your email address" with " "
    And I fill in "Subject" with " "
    And I fill in "Message" with:
      """

      """
    And I press the "Send message" button
    Then I should not see "Your message has been sent."

  @javascript @en
  Scenario: Verify success message is should not be displayed for a blank form submission
    Given I am on "/"
    When I follow "Contact" in the "footer" region
    Then I should see the heading "Website feedback"
    When I fill in "Your name" with ""
    And I fill in "Your email address" with "parita.patel@axelerant.com"
    And I fill in "Subject" with ""
    And I fill in "Message" with:
      """

      """
    And I press the "Send message" button
    Then I should not see "Your message has been sent."

  @javascript @en @smoke @sanity
  Scenario: Verify contact form is submitted successfully for English
    Given I am on "/"
    When I follow "Contact"
    Then I should see the heading "Website feedback"
    When I fill in "Your name" with "Parita Patel"
    And I fill in "Your email address" with "parita.patel+001@axelerant.com"
    And I fill in "Subject" with "Inquiry"
    And I fill in "Message" with:
      """
      Lorem Ipsum is simply dummy text of the
      printing and typesetting industry.
      Lorem Ipsum has been the industry's
      standard dummy text ever since the 1500s,
      when an unknown printer took a galley of
      type and scrambled it to make a type specimen book.
      It has survived not only five centuries,
      It has survived not only five centuries,
      but also the leap into electronic typesetting,
      remaining essentially unchanged.
      It was popularised in the 1960s with the
      release of Letraset sheets containing Lorem Ipsum passages,
      and more recently with desktop publishing software
      like Aldus PageMaker including versions of Lorem Ipsum.
      """
    And I press the "Send message" button
    Then I should see "Your message has been sent."






