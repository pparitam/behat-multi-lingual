@contact @api
Feature: Contact form validation in english
  In order to verify the contact from submission in a correct way
  It should accept only correct value
  For incorrect or blank field it should display notification
  On submission of the form it should show a notification message

  @javascript @en
  Scenario Outline: Validation after sending message 5 times
    Given I am on "/es"
    When I follow "Contacto" in the footer
    Then I should see the heading "Comentarios sobre el sitio web"
    When I fill in "Su nombre" with <name>
    And I fill in "Su dirección de correo electrónico" with <email>
    And I fill in "Asunto" with <sub>
    And I fill in "Mensaje" with <msg>
    And I press the "Enviar mensaje" button
    Then I should see <notification>

    Examples:
      | name    | email               | sub     | msg    | notification |
      | "name1" | "name1@example.com" |  "sub1" | "msg1" | "Su mensaje ha sido enviado." |
      | "name2" | "name2@example.com" |  "sub2" | "msg2" | "Su mensaje ha sido enviado." |
      | "name3" | "name3@example.com" |  "sub3" | "msg3" | "Su mensaje ha sido enviado." |
      | "name4" | "name4@example.com" |  "sub4" | "msg4" | "Su mensaje ha sido enviado." |
      | "name5" | "name5@example.com" |  "sub5" | "msg5" | "Su mensaje ha sido enviado." |
      | "name6" | "name6@example.com" |  "sub6" | "msg6" | "No le está permitido enviar más de 5 mensajes en 1 hora. Inténtelo después." |

