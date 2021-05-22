@api @javascript
Feature: Search Validation

  @api @content @javascript @creation @en
  Scenario: 1.Create tags and Validate article is not getting created if mandatory fields are marked empty
    Given I am on "/en/user/login"
    And I wait for the page to be loaded
    Then I fill in "Username" with "admin"
    And I fill in "Password" with "admin"
    And I press "Log in"
    And I wait 5 second
    #Create tags
    When I am viewing a "tags" term with the name "Knowledge"
    Then I should see the heading "Knowledge"
    And I wait for the page to be loaded
    And I am on "en/node/add/article"
    And I wait for the page to be loaded
    And I should not see "Access denied"
    And print current URL
    Then I should see "Create Article" in the "header" region
    #keep mandatory field empty
    When I fill in "Title" with " "
    And I fill in wysiwyg on field "Body" with "This is the test body"
    #And I select "Behat" from "Tags" autocomplete field
    And I fill in "Tags" with "Knowledge"
    And I press the "Add media" button
    And I wait for the page to be loaded
    And I attach the file "fff.png" to "files[upload]"
    And I wait 5 second
    And I fill in "media[0][fields][field_media_image][0][alt]" with "this is alttext"
    Then I click on the element with xpath "//button[text()='Save']"
    And I click on the element with xpath "//button[text()='Insert selected']"
    And I select "Published" from "Save as"
    Then I press the "Save" button
    Then I should not see the success message "content has been created."

  @api @content @javascript @creation @es
  Scenario: 2.Create tags in spanish and Validate article is not getting created if mandatory fields are marked empty
    Given I am on "/es/user/login"
    And I wait for the page to be loaded
    Then I fill in "Nombre de usuario" with "admin"
    And I fill in "Contraseña" with "admin"
    And I press "Iniciar sesión"
    And I wait 5 second
    #Create tags
    When I am viewing a "tags" term with the name "Conocimiento"
    Then I should see the heading "Conocimiento"
    And I wait for the page to be loaded
    And I am on "es/node/add/article"
    And I wait for the page to be loaded
    And I should not see "Acceso denegado"
    And print current URL
    Then I should see "Crear Artículo" in the "header" region
    #keep mandatory field empty
    When I fill in "Título" with " "
    And I fill in wysiwyg on field "Cuerpo" with "This is the test body"
    #And I select "Behat" from "Tags" autocomplete field
    And I fill in "Etiquetas" with "Knowledge"
    And I press the "Añadir contenido multimedia" button
    And I wait for the page to be loaded
    And I attach the file "fff.png" to "files[upload]"
    And I wait 5 second
    And I fill in "Texto alternativo" with "this is alttext"
    Then I click on the element with xpath "//button[text()='Guardar']"
    And I click on the element with xpath "//button[text()='Insertar seleccionado']"
    And I wait 5 second
    And I select "Publicado" from "Guardar como"
    And I press the "Guardar" button
    Then I should not see the success message "se ha creado."


  @api @content @javascript @creation @en
  Scenario: Verify English article content is created successfully, updated successfully and Deleted successfully
    Given I am on "/en/user/login"
    And I wait for the page to be loaded
    Then I fill in "Username" with "admin"
    And I fill in "Password" with "admin"
    And I press "Log in"
    And I wait 5 second
    #Create tags
    When I am viewing a "tags" term with the name "Behat"
    Then I should see the heading "Behat"
    And I wait for the page to be loaded
    And I am on "en/node/add/article"
    And I wait for the page to be loaded
    And I should not see "Access denied"
    And print current URL
    Then I should see "Create Article" in the "header" region
    #Fill the article creation form
    When I fill in "Title" with "Behat_article"
    And I fill in wysiwyg on field "Body" with "This is the test body"
    And I fill in "Tags" with "Behat"
    And I press the "Add media" button
    And I wait for the page to be loaded
    And I attach the file "fff.png" to "files[upload]"
    And I wait 5 second
    And I fill in "media[0][fields][field_media_image][0][alt]" with "this is alttext"
    Then I click on the element with xpath "//button[text()='Save']"
    And I click on the element with xpath "//button[text()='Insert selected']"
    And I select "Published" from "Save as"
    Then I press the "Save" button
    And I wait for the page to be loaded
    #save the URL for future use
    And I save the node url
    Then I should see "Behat_article has been created."
    And I wait for the page to be loaded
    #access the URL to Update the node
    And I navigate to the node url
    And I click "Edit" in the "tabs" region
    And I wait for the page to be loaded
    And I fill in wysiwyg on field "Body" with "New test Body"
    Then I press the "Save" button
    #validate the Success Message
    Then I should see "Behat_article has been updated."
    # Delete the Node
    And I navigate to the node url
    And I click "Delete"
    # Validate the confirmation message
    Then I should see "Are you sure you want to delete the content item Behat_article?"
    #delete the node
    And I press the "Delete" button
    And I wait for the page to be loaded
    #validate the Deleted node success message
    And I should see "The Article Behat_article has been deleted."

  @api @content @javascript @creation @es
  Scenario:Verify spanish article content is created successfully, updated successfully and Deleted successfully
    Given I am on "/es/user/login"
    And I wait for the page to be loaded
    Then I fill in "Nombre de usuario" with "admin"
    And I fill in "Contraseña" with "admin"
    And I press "Iniciar sesión"
    And I wait 5 second
    #Create tags
    When I am viewing a "tags" term with the name "Conocimiento"
    Then I should see the heading "Conocimiento"
    And I wait for the page to be loaded
    And I am on "es/node/add/article"
    And I wait for the page to be loaded
    And I should not see "Acceso denegado"
    And print current URL
    Then I should see "Crear Artículo" in the "header" region
    #Fill the article creation form
    When I fill in "Título" with "Behat_article"
    And I fill in wysiwyg on field "Cuerpo" with "Complete el cuerpo con datos ficticios"
    And I fill in "Etiquetas" with "Knowledge"
    And I press the "Añadir contenido multimedia" button
    And I wait for the page to be loaded
    And I attach the file "fff.png" to "files[upload]"
    And I wait 5 second
    And I fill in "Texto alternativo" with "this is alttext"
    Then I click on the element with xpath "//button[text()='Guardar']"
    And I click on the element with xpath "//button[text()='Insertar seleccionado']"
    And I wait 5 second
    And I select "Publicado" from "Guardar como"
    And I press the "Guardar" button
    And I wait for the page to be loaded
    #save the URL for the future use
    And I save the node url
    Then I should see the success message "Artículo Behat_article se ha creado."
    And I wait 5 second
    #edit and update the node
    And I navigate to the node url
    And I wait for the page to be loaded
    And I click "Editar" in the "tabs" region
    And I wait for the page to be loaded
    #update the value
    And I fill in wysiwyg on field "Cuerpo" with "Complete el cuerpo con datos ficticios actualizados"
    And I press the "Guardar" button
    And I wait for the page to be loaded
    #validate the update message
    And I should see "Artículo Behat_article ha sido actualizado."
    And I wait for the page to be loaded
    And I navigate to the node url
    #Select delete button
    And I click "Eliminar"
    And I wait for the page to be loaded
    #Validate the confirmation message
    And I should see "¿Está seguro de querer borrar Behat_article del tipo elemento de contenido?"
    #press the Delete button
    And I press the "Eliminar" button
    #validate the deleted node success message
    And I should see "El Artículo Behat_article ha sido eliminado."





