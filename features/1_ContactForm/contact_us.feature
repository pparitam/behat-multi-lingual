@api @javascript
Feature: Contact form validation in english
  In order to verify the contact from submission in a correct way
  It should accept only correct value
  For incorrect or blank field it should display notification
  On submission of the form it should show a notification message

  @en @es @neg
  Scenario Outline: Validate there should not be any success message when form filled with Blank and Space value.
    Given I am on <link>
    When I follow <contact> in the "footer" region
    Then I should see the heading <heading_label>
    When I fill in <name_label> with <name>
    And I fill in <email_add> with <email>
    And I fill in <sub_label> with <sub>
    And I fill in <msg_label> with <msg>
    And I press the <button> button
    Then I should not see <notification>
    Examples:
      | link  | contact   | heading_label                     | name_label  | name | email_add                            | email | sub_label | sub | msg_label | msg  | button          |notification                  |
      | "/en" | "Contact" | "Website feedback"                | "Your name" | ""   | "Your email address"                 |""     | "Subject" | ""  | "Message" |""    | "Send message"  | "Your message has been sent."|
      | "/es"  | "Contacto"| "Comentarios sobre el sitio web" | "Su nombre" | " "  | "Su dirección de correo electrónico" |" "    | "Asunto"  | " " | "Mensaje" | " "  | "Enviar mensaje"| "Su mensaje ha sido enviado."|

  @en @es @smoke
  Scenario Outline: Validate success message for successful submission of the form.
    #Accessing homepage
    Given I am on <link>
    #Accessing Contact
    When I follow <contact> in the "footer" region
    Then I should see the heading <heading_label>
    When I fill in <name_label> with <name>
    And I fill in <email_add> with <email>
    And I fill in <sub_label> with <sub>
    And I fill in <msg_label> with <msg>
    And I press the <button> button
    Then I should see <notification>
    Examples:
      | link  | contact   | heading_label                     | name_label  | name           | email_add                            | email                           | sub_label | sub       | msg_label | msg                | button          |notification                  |
      | "/en" | "Contact" | "Website feedback"                | "Your name" | "Parita Patel" | "Your email address"                 |"parita.patel+001@axelerant.com" | "Subject" | "Inquiry" | "Message" |"Test Message"      | "Send message"  | "Your message has been sent."|
      | "/es"  | "Contacto"| "Comentarios sobre el sitio web" | "Su nombre" | "Parita Patel" | "Su dirección de correo electrónico" |"parita.patel+001@axelerant.com" | "Asunto"  | "Consulta"| "Mensaje" | "Mensaje de prueba"| "Enviar mensaje"| "Su mensaje ha sido enviado."|

# Added scenario to check pystring
  @en @es @smoke
  Scenario Outline: Validate success message for successful submission of the form.
    #Accessing homepage
    Given I am on <link>
    And I wait for the page to be loaded
    #Accessing Contact
    When I follow <contact> in the "footer" region
    Then I should see the heading <heading_label>
    And I wait 2 second
    When I fill in <name_label> with <name>
    And I fill in <email_add> with <email>
    And I fill in <sub_label> with <sub>
    And I fill in <msg_label> with:
    """
    <msg>
    <msg1>
    <msg2>
    """
    And I press the <button> button
    Then I should see <notification>
    Examples:
      | link  | contact   | heading_label                     | name_label  | name           | email_add                            | email                           | sub_label | sub        | msg_label | msg                | msg1                 | msg2                |button          |notification                  |
      | "/en" | "Contact" | "Website feedback"                | "Your name" | "Parita Patel" | "Your email address"                 |"parita.patel+001@axelerant.com" | "Subject" | "Inquiry"  | "Message" |"Test Message"      | "Test message 1"     |  "Test message 2"   |"Send message"  | "Your message has been sent."|
      | "/es" | "Contacto" | "Comentarios sobre el sitio web" | "Su nombre" | "Parita Patel" | "Su dirección de correo electrónico" |"parita.patel+001@axelerant.com" | "Asunto"  | "Consulta" | "Mensaje" |"Mensaje de prueba" | "Test mesahge 1"     |  "Test mesahge 2"   |"Enviar mensaje"| "Su mensaje ha sido enviado."|

  @es @pystring
  Scenario: Verify contact form is submitted successfully in spansish when "Message" field value is filled with pyString
    Given I am on "/es"
    When I follow "Contacto"
    Then I should see the heading "Comentarios sobre el sitio web"
    When I fill in "Su nombre" with "Parita Patel"
    And I fill in "Su dirección de correo electrónico" with "parita.patel+001@axelerant.com"
    And I fill in "Asunto" with "Consulta"
    And I fill in "Mensaje" with:
      """
      Lorem Ipsum es simplemente un texto ficticio de la
      industria de la impresión y la composición tipográfica.
      Lorem Ipsum ha sido el texto ficticio
      el texto ficticio estándar de la industria desde el año 1500,
      cuando un impresor desconocido tomó una galera de
      una galerada de tipos y la mezcló para hacer un libro de muestras de tipos.
      No sólo ha sobrevivido cinco siglos,
      Ha sobrevivido no sólo a cinco siglos,
      sino también al salto a la composición tipográfica electrónica,
      permaneciendo esencialmente sin cambios.
      Se popularizó en la década de 1960 con la
      con el lanzamiento de las hojas de Letraset que contenían pasajes de Lorem Ipsum,
      y más recientemente con los programas de autoedición
      como Aldus PageMaker, que incluye versiones de Lorem Ipsum.
      """
    And I press the "Enviar mensaje" button
    Then I should see "Su mensaje ha sido enviado."

  @es
  Scenario: Verify contact form is showing 5 times submission error message, when form is filled more than 5 times in an hour
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
    Then I should see "You cannot send more than 5 messages in 1 hour. Try again later."






