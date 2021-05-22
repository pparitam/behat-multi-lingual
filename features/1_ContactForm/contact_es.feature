@contact @api
Feature: Contact form validation in Spanish
  In order to verify the contact from submission in a correct way
  It should accept only correct value
  For incorrect or blank field it should display notification
  On submission of the form it should show a notification message

  @javascript @en
  Scenario: Verify success message is should not be displayed for a blank form submission
    Given I am on "/"
    When I follow "Español" in the "header_pre" region
    When I follow "Contacto" in the "footer" region
    Then I should see the heading "Comentarios sobre el sitio web"
    When I fill in "Su nombre" with ""
    And I fill in "Su dirección de correo electrónico" with ""
    And I fill in "Asunto" with ""
    And I fill in "Message" with:
      """

      """
    And I press the "Enviar mensaje" button
    Then I should not see "Su mensaje ha sido enviado."

  @javascript @en
  Scenario: Verify success message is should not be displayed for a blank form submission
    Given I am on "/"
    When I follow "Español" in the "header_pre" region
    When I follow "Contacto" in the "footer" region
    Then I should see the heading "Comentarios sobre el sitio web"
    When I fill in "Su nombre" with "  "
    And I fill in "Su dirección de correo electrónico" with "  "
    And I fill in "Asunto" with "  "
    And I fill in "Mensaje" with:
      """

      """
    And I press the "Enviar mensaje" button
    Then I should not see "Su mensaje ha sido enviado."

  @javascript @es
  Scenario: Verify contact form is submitted successfully for Spanish
    Given I am on "/"
    When I follow "Español" in the "header_pre" region
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
