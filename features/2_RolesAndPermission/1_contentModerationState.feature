@javascript @api
Feature: Content Moderation Steps and Role-wise permission in English and Spanish
    1. Created a node in Draft with "Author" role checked below permissions:
      - Add node
      - Edit Node
      - Delete Node
      - Revision
      - Translate
      - Layout
    2. Tried to access the draft node with Anonymous User
    3. Edited Draft node with "Editor" role to publish it and role checked below permissions:
      - Add node
      - Edit Node
      - Delete Node
      - Revision
      - Translate
      - Layout
    4. Trying to access the Publish node with Anonymous User
    5. Edited Published node with "Editor" role and changed status to Archive
    6. Trying to access the Archive node with Anonymous User
    7. Validating that Editor can revert the revision
    8. Accessed the Archived node with "Administrator" role to delete it and role checked below permissions:
      - Add node
      - Edit Node
      - Delete Node
      - Revision
      - Translate
      - Layout

  @moderation @roles @permission @en
  Scenario: Content moderation state in English Create -> Draft -> Publish -> Archive -> Delete
    Given I am logged in as a user with the "author" role
    And I wait 5 second
#1. Created a node in Draft with "Author" role checked permissions
    ##AUTHOR_1: Access to recipe creation page
    And I am on "/en/node/add/recipe"
    And I should not see "Access denied"
    Then I should see "Create Recipe" in the "header" region
    #Create Recipe Draft
    ### Fill in all  detail
    When I fill in "Recipe Name" with "Behat_recipe_1"
    And I select "English" from "Language"
    And I fill in "Preparation time" with "10"
    And I fill in "Cooking time" with "60"
    And I fill in "Number of servings" with "4"
    And I fill in "edit-field-recipe-category-target-id" with "Main courses"
    And I fill in "Tags" with "Vegetarian"
    And I wait for the AJAX to finish
    And I press the "Add media" button
    And I wait for the page to be loaded
    And I check the box "media_library_select_form[1]"
    And I click on the element with xpath "//button[text()='Insert selected']"
    And I wait for the AJAX to finish
    And I fill in wysiwyg on field "Summary" with "Test Data"
    And I fill in "Ingredients" with "Cook1"
    And I fill in wysiwyg on field "Recipe instruction" with "Test Data"
    And I click the ".seven-details__summary" element
    #Adding Url
    And I fill in "edit-path-0-alias" with "/recipes/behat_recipe_moderation"
    ##AUTHOR_2: Author can save the node
    And I press the "Save" button
    #saving the node URL in a variable
    Then I should see "Recipe Behat_recipe_1 has been created."
    And I save the node url
    And I wait for AJAX to finish
    #validate recipe name in the breadcrumb
    And I should see "Behat_recipe_1" in the "breadcrumb" region
    #AUTHOR_3: Author has access to edit content created by themselves
    And I should see "Edit"
    And I click "Edit" in the "tabs" region
    Then I should not see the heading "Access denied"
    And I wait for the page to be loaded
    And I navigate to the node url
    #AUTHOR_4: Author has access to Delete content created by themselves
    And I should see "Delete" in the "tabs" region
    And I click "Delete" in the "tabs" region
    Then I should not see the heading "Access denied"
    And I wait for the page to be loaded
    And I navigate to the node url
    #AUTHOR_5: Author has access to the Revision of the content created by themselves
    And I should see "Revisions" in the "tabs" region
    And I click "Revisions" in the "tabs" region
    Then I should not see the heading "Access denied"
    #AUTHOR_6: Author has not access to the Layout of the content created by themselves
    And I navigate to the node url
    And I wait for the page to be loaded
    And I should not see "Layout" in the "tabs" region
    #AUTHOR_7: Author has not access to the Translate of the content created by themselves
    And I should not see "Translate" in the "tabs" region
    #printing URL for the reference in log
    And print current URL
    #logout from the application
    Then I log out
    And I wait for the page to be loaded

# 2. Trying to access the draft node with Anonymous User
    Given I am an anonymous user
    #Try to access the URL
    #ANONYMOUS_1: Anonymous use has not access to draft node
    And I navigate to the node url
    And I wait for the page to be loaded
    Then I should see the heading "Access denied"

#3. Edited Draft node with "Editor" role to publish it and role checked  permissions
    #Login with an Editor User
    Given I am logged in as a user with the "editor" role
    And I wait 5 second
    ##EDITOR_1: Editor has not permission to create content
    And I should not have access of "/en/node/add/recipe"
    #accessing the Draft node
    When I navigate to the node url
    And I wait for the page to be loaded
  #Publish transition.
    ##EDITOR_2: Editor has access to Edit the content created by other user
    And I should see "Edit"
    And I click "Edit" in the "tabs" region
    Then I should not see the heading "Access denied"
    ##EDITOR_3: Editor has permission to change status of node from draft to publish
    #By saving, changing the status of draft node to publish
    And I press the "Save" button
    And I wait for the page to be loaded

    ##EDITOR_4: Editor has access to delete the content created by other user
    And I should see "Delete" in the "tabs" region
    And I click "Delete" in the "tabs" region
    Then I should not see the heading "Access denied"
    And I navigate to the node url
    And I wait for the page to be loaded
    ##EDITOR_5: Editor has access to Revision of the content created by other user
    And I should see "Revisions" in the "tabs" region
    And I click "Revisions" in the "tabs" region
    Then I should not see the heading "Access denied"
    ##EDITOR_6: Editor has not access to the Layout of any content
    And I navigate to the node url
    And I wait for the page to be loaded
    And I should not see "Layout" in the "tabs" region
    ##EDITOR_7: Editor has not access to the Translate of any content
    And I should not see "Translate" in the "tabs" region
    #Editor Logging out
    Then I log out
    And I wait for the page to be loaded

#4. Tried to access the Publish node with Anonymous User
    #accessing link as an anonymous user
    Given I am an anonymous user
    And I navigate to the node url
    #VALIDATE  recipe heading
    #ANONYMOUS_2: Anonymous user has access to the Published URL
    Then I should see the heading "Behat_recipe_1"
    #ANONYMOUS_2: Anonymous user has not access to Edit the URL
    And I should not see "Edit"
    #ANONYMOUS_3: Anonymous user has not access to Delete the URL
    And I should not see "Delete"
    #ANONYMOUS_4: Anonymous user has not access the Revision
    And I should not see "Revision"
    #ANONYMOUS_5: Anonymous user has not access to the Layout of any content
    And I should not see "Layout" in the "tabs" region
    #ANONYMOUS_6: Anonymous user has not access to the Translate of any content
    And I should not see "Translate" in the "tabs" region
    #validate the field value filled during node creation
    And I should see "Preparation time" in the "main" region
    And I should see "10 minutes" in the "main" region
    And I should see "Cooking time" in the "main" region
    And I should see "60 minutes" in the "main" region
    And I should see "Number of servings" in the "main" region
    And I should see "4" in the "main" region
    #login with Editor and Archive Node

#5. Edited Published node with "Editor" role and changed status to Archive
    Given I am logged in as a user with the "editor" role
    And I wait 5 second
    #accessing the published node
    When I navigate to the node url
    And I wait for the page to be loaded
    And I click "Edit" in the "tabs" region
    And I wait for the page to be loaded
    ##EDITOR_8: Editor has permission to archive the node
    #selecting Archive option to change the node status to archive
    And I select "Archived" from "Change to"
    And I press the "Save" button
    And I wait for the page to be loaded
    Then I log out
    And I wait for the page to be loaded

#6 . Trying to access the Archive node with Anonymous User
    Given I am an anonymous user
    When I navigate to the node url
    And I wait for the page to be loaded
    Then I should see the heading "Access denied"


#7. Validating that Editor can revert the revision
    Given I am logged in as a user with the "editor" role
    And I wait 5 second
    #accessing the published node
    When I navigate to the node url
    And I wait for the page to be loaded
    And I should see "Revisions" in the "tabs" region
    And I click "Revisions" in the "tabs" region
    Then I should not see the heading "Access denied"
    And I should see the text "Current revision"
    And I should see "Revert" in the "main"
    And I click on the element with xpath "//*[@id='block-seven-content']/table/tbody/tr[2]/td[2]/div/div/ul/li[1]/a"
    And I wait for the page to be loaded
    And I should see the text "Are you sure you want to revert to the revision"
    And I press the "Revert" button
    And I should see "Recipe Behat_recipe_1 has been reverted"

#8. Accessed the Archived node with "Administrator" role to delete it and role checked permissions
    #delete the Content
    Given I am logged in as a user with the "administrator" role
    And I wait 5 second
    And I navigate to the node url
    And I wait for the page to be loaded
    ##Admin_1: Admin has permission to create content
    And I should have access of "/en/node/add/recipe"
    #accessing the Draft node
    When I navigate to the node url
    And I wait for the page to be loaded
    ##ADMIN_2: Admin has access to Edit the content created by any user
    And I should see "Edit"
    And I click "Edit" in the "tabs" region
    Then I should not see the heading "Access denied"
    ##ADMIN_3:Admin has access to Revision of the content created by other user
    When I navigate to the node url
    And I wait for the page to be loaded
    And I should see "Revisions" in the "tabs" region
    And I click "Revisions" in the "tabs" region
    Then I should not see the heading "Access denied"
    ##ADMIN_3: Admin has access to the Layout of any content
    When I navigate to the node url
    And I wait for the page to be loaded
    And I should see "Layout" in the "tabs" region
    And I click "Layout" in the "tabs" region
    Then I should not see the heading "Access denied"
    ##ADMIN_4: Admin has access to the Translate of any content
    When I navigate to the node url
    And I wait for the page to be loaded
    And I should see "Translate" in the "tabs" region
    And I click "Translate" in the "tabs" region
    And I wait for the page to be loaded
    Then I should not see the heading "Access denied"
    When I navigate to the node url
    And I wait for the page to be loaded
    ##ADMIN_7: Admin has access to delete the content created by other user
    And I should see "Delete" in the "tabs" region
    And I click "Delete" in the "tabs" region
    Then I should not see the heading "Access denied"
    # Validate the confirmation message
    And I should see "Are you sure you want to delete the content item Behat_recipe_1?"
    #delete the node
    And I press the "Delete" button
    And I wait for the page to be loaded
    #validate the Deleted node success message
    And I should see "The Recipe Behat_recipe_1 has been deleted."



  @moderation @roles @permission @es
  Scenario: Content moderation state in Spanish Create -> Draft -> Publish -> Archive -> Delete
    Given I am logged in as a user with the "author" role
    And I wait 5 second
#1. Created a node in Draft with "Author" role checked permissions
    ##AUTHOR_1: Access to recipe creation page
    And I am on "/es/node/add/recipe"
    And I should not see "Acceso denegado"
    Then I should see "Crear Receta" in the "header" region
    #Create Recipe Draft
    ### Fill in all  detail
    When I fill in "Nombre de la receta" with "Receta_Behat_1"
    And I select "Español" from "Idioma"
    And I wait 2 second
    And I fill in "Tiempo de preparación" with "10"
    And I fill in "Tiempo de cocción" with "60"
    And I fill in "Cantidad de porciones" with "4"
    And I fill in "edit-field-recipe-category-target-id" with "Platos principales"
    And I fill in "Etiquetas" with "Vegetariano"
    And I wait for the AJAX to finish
    And I press the "Añadir contenido multimedia" button
    And I wait for the page to be loaded
    And I check the box "media_library_select_form[1]"
    And I click on the element with xpath "//button[text()='Insertar seleccionado']"
    And I wait for the AJAX to finish
    And I fill in wysiwyg on field "Resumen" with "Datos de prueba"
      # Adding multiple ingredients
    And I fill in "field_ingredients[0][value]" with "Cocinar1"
    And I press the "Añadir otro elemento" button
    And I fill in "field_ingredients[1][value]" with "Cocinar2"
    And I press the "Añadir otro elemento" button
    And I fill in "field_ingredients[2][value]" with "Cocinar3"
    And I fill in wysiwyg on field "Instrucciones de la receta" with "Datos de prueba"
    And I click the ".seven-details__summary" element
      #Adding Url
    And I fill in "edit-path-0-alias" with "/recetas/behat_recipe"
      #saving node in published form
    And I press the "Guardar" button
    And I wait for the page to be loaded
    #saving the node URL in a variable
    Then I should see "Receta Receta_Behat_1 se ha creado."
    And I save the node url
    And I wait for AJAX to finish
    #validate recipe name in the breadcrumb
    And I should see "Receta_Behat_1" in the "breadcrumb" region
    #AUTHOR_3: Author has access to edit content created by themselves
    And I should see "Editar"
    And I click "Editar" in the "tabs" region
    Then I should not see the heading "Acceso denegado"
    And I wait for the page to be loaded
    And I navigate to the node url
    #AUTHOR_4: Author has access to Delete content created by themselves
    And I click "Eliminar" in the "tabs" region
    Then I should not see the heading "Acceso denegado"
    And I wait for the page to be loaded
    And I navigate to the node url
    #AUTHOR_5: Author has access to the Revision of the content created by themselves
    And I should see "Revisiones" in the "tabs" region
    And I click "Revisiones" in the "tabs" region
    Then I should not see the heading "Acceso denegado"
    #AUTHOR_6: Author has not access to the Layout of the content created by themselves
    And I navigate to the node url
    And I wait for the page to be loaded
#    And I should not see "Layout" in the "tabs" region
    #AUTHOR_7: Author has not access to the Translate of the content created by themselves
    And I should not see "Traducir" in the "tabs" region
    #printing URL for the reference in log
    And print current URL
    #logout from the application
    Then I log out
    And I wait for the page to be loaded

# 2. Trying to access the draft node with Anonymous User
    Given I am an anonymous user
    #Try to access the URL
    #ANONYMOUS_1: Anonymous use has not access to draft node
    And I navigate to the node url
    And I wait for the page to be loaded
    Then I should see the heading "Acceso denegado"

#3. Edited Draft node with "Editor" role to publish it and role checked  permissions
    #Login with an Editor User
    Given I am logged in as a user with the "editor" role
    ##EDITOR_1: Editor has not permission to create content
    And I am on "/es/node/add/recipe"
    And I should see "Acceso denegado"
    #accessing the Draft node
    When I navigate to the node url
    And I wait for the page to be loaded
  #Publish transition.
    ##EDITOR_2: Editor has access to Edit the content created by other user
    And I should see "Editar"
    And I click "Editar" in the "tabs" region
    Then I should not see the heading "Acceso denegado"
    ##EDITOR_3: Editor has permission to change status of node from draft to publish
    #By saving, changing the status of draft node to publish
    And I press the "Guardar" button
    And I wait for the page to be loaded
    ##EDITOR_4: Editor has access to delete the content created by other user
    And I click "Eliminar" in the "tabs" region
    Then I should not see the heading "Acceso denegado"
    And I navigate to the node url
    And I wait for the page to be loaded
    ##EDITOR_5: Editor has access to Revision of the content created by other user
    And I should see "Revisiones" in the "tabs" region
    And I click "Revisiones" in the "tabs" region
    Then I should not see the heading "Acceso denegado"
    ##EDITOR_6: Editor has not access to the Layout of any content
    And I navigate to the node url
    And I wait for the page to be loaded
    # And I should not see "Layout" in the "tabs" region : Layout is not available in spanish
    ##EDITOR_7: Editor has not access to the Translate of any content
    And I should not see "Traducir" in the "tabs" region
    #Editor Logging out
    Then I log out
    And I wait for the page to be loaded

#4. Tried to access the Publish node with Anonymous User
    #accessing link as an anonymous user
    Given I am an anonymous user
    And I navigate to the node url
    #VALIDATE  recipe heading
    #ANONYMOUS_2: Anonymous user has access to the Published URL
    Then I should see the heading "Receta_Behat_1"
    #ANONYMOUS_2: Anonymous user has not access to Edit the URL
    And I should not see "Editar"
    #ANONYMOUS_3: Anonymous user has not access to Delete the URL
    And I should not see "Eliminar"
    #ANONYMOUS_4: Anonymous user has not access the Revision
    And I should not see "Revisiones"
    #ANONYMOUS_5: Anonymous user has not access to the Layout of any content
    #And I should not see "Layout"
    #ANONYMOUS_6: Anonymous user has not access to the Translate of any content
    And I should not see "Traducir"
    #validate the field value filled during node creation
    And I should see "10 minutos" in the "main" region
    And I should see "Tiempo de cocción" in the "main" region
    And I should see "60 minutos" in the "main" region
    And I should see "Cantidad de porciones" in the "main" region
    And I should see "4" in the "main" region
    #login with Editor and Archive Node

#5. Edited Published node with "Editor" role and changed status to Archive
    Given I am logged in as a user with the "editor" role
    And I wait 5 second
    #accessing the published node
    When I navigate to the node url
    And I wait for the page to be loaded
    And I click "Editar" in the "tabs" region
    And I wait for the page to be loaded
    ##EDITOR_8: Editor has permission to archive the node
    #selecting Archive option to change the node status to archive
    And I select "Archivado" from "Cambiar a"
    And I press the "Guardar" button
    And I wait for the page to be loaded
    Then I log out
    And I wait for the page to be loaded

#6 . Trying to access the Archive node with Anonymous User
    Given I am an anonymous user
    When I navigate to the node url
    And I wait for the page to be loaded
    Then I should see the heading "Acceso denegado"


#7. Validating that Editor can revert the revision
    Given I am logged in as a user with the "editor" role
    And I wait 5 second
    #accessing the published node
    When I navigate to the node url
    And I wait for the page to be loaded
    And I should see "Revisiones" in the "tabs" region
    And I click "Revisiones" in the "tabs" region
    Then I should not see the heading "Acceso denegado"
    And I should see the text "Revisión actual"
    And I should see "Revertir" in the "main"
    And I click on the element with xpath "//*[@id='block-seven-content']/table/tbody/tr[2]/td[2]/div/div/ul/li[1]/a"
    And I wait for the page to be loaded
    And I should see the text "¿Está seguro que desea volver a la revisión de"
    And I press the "Revertir" button
    And I should see "Receta_Behat_1 de Receta ha sido revertido a la revisión de"

#8. Accessed the Archived node with "Administrator" role to delete it and role checked permissions
    #delete the Content
    Given I am logged in as a user with the "administrator" role
    And I wait 5 second
    And I navigate to the node url
    And I wait for the page to be loaded
    ##Admin_1: Admin has permission to create content
    And I should have access of "/es/node/add/recipe"
    #accessing the Draft node
    When I navigate to the node url
    And I wait for the page to be loaded
    ##ADMIN_2: Admin has access to Edit the content created by any user
    And I should see "Editar"
    And I click "Editar" in the "tabs" region
    Then I should not see the heading "Acceso denegado"
    ##ADMIN_3:Admin has access to Revision of the content created by other user
    When I navigate to the node url
    And I wait for the page to be loaded
    And I should see "Revisiones" in the "tabs" region
    And I click "Revisiones" in the "tabs" region
    Then I should not see the heading "Acceso denegado"
    ##ADMIN_3: Admin has access to the Layout of any content
    # bug : Layout is not visible in spanish
#    When I navigate to the node url
#    And I wait for the page to be loaded
#    And I should see "Layout" in the "tabs" region
##    And I click "Layout" in the "tabs" region
#    Then I should not see the heading "Acceso denegado"
    ##ADMIN_4: Admin has access to the Translate of any content
    When I navigate to the node url
    And I wait for the page to be loaded
    And I should see "Traducir" in the "tabs" region
    And I click "Traducir" in the "tabs" region
    And I wait for the page to be loaded
    Then I should not see the heading "Acceso denegado"
    When I navigate to the node url
    And I wait for the page to be loaded
    ##ADMIN_7: Admin has access to delete the content created by other user
    And I should see "Eliminar" in the "tabs" region
    And I click "Eliminar" in the "tabs" region
    Then I should not see the heading "Acceso denegado"
    # Validate the confirmation message
    And I should see "¿Está seguro de querer borrar Receta_Behat_1 del tipo elemento de contenido?"
    #delete the node
    And I press the "Eliminar" button
    And I wait for the page to be loaded
    #validate the Deleted node success message
    And I should see "El Receta Receta_Behat_1 ha sido eliminado."

