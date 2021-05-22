@contact @api
Feature: Contact form validation in english
  In order to verify the contact from submission in a correct way
  It should accept only correct value
  For incorrect or blank field it should display notification
  On submission of the form it should show a notification message

  @javascript @en
  Scenario Outline: Validation after sending message 5 times
    Given I am on "/"
    When I follow "Contact" in the "footer" region
    Then I should see the heading "Website feedback"
    When I fill in "Your name" with <name>
    And I fill in "Your email address" with <email>
    And I fill in "Subject" with <sub>
    And I fill in "Message" with <msg>
    And I press the "Send message" button
    Then I should see <notification>

    Examples:
      | name | email | sub | msg | notification |
      | "name1" | "name1@example.com" |  "sub1" | "msg1" | "Your message has been sent." |
      | "name2" | "name2@example.com" |  "sub2" | "msg2" | "Your message has been sent." |
      | "name3" | "name3@example.com" |  "sub3" | "msg3" | "Your message has been sent." |
      | "name4" | "name4@example.com" |  "sub4" | "msg4" | "Your message has been sent." |
      | "name5" | "name5@example.com" |  "sub5" | "msg5" | "Your message has been sent." |
      | "name6" | "name6@example.com" |  "sub6" | "msg6" | "You cannot send more than 5 messages in 1 hour. Try again later." |

