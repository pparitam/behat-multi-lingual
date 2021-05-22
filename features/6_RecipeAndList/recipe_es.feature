@api @javascript
Feature: Search Validation

  @api @content @javascript @creation @es
  Scenario: 1.Create tags and Validate article is not getting created if mandatory fields are marked empty
  Given I login as "Administrator" user
  When I am viewing a "tags" term with the name "behat_receta_etiqueta"
  Then I should see the heading "behat_receta_etiqueta"
      #create Recipe category
  When I am viewing a "recipe_category" term with the name "behat_categoría_de_receta"
  Then I should see the heading "behat_categoría_de_receta"
  And I am on "/es/node/add/recipe"
  And I should not see "Acceso denegado"
  Then I should see "Crear Receta" in the "header" region
     ### Fill all form detail
  When I fill in "Nombre de la receta" with "Receta_Behat_CRUD"
  And I select "Español" from "Idioma"
  And I wait 2 second
  And I fill in "Tiempo de preparación" with "10"
  And I fill in "Tiempo de cocción" with "60"
  And I fill in "Cantidad de porciones" with "4"
      #adding Tag and recipe term
  And I fill in "edit-field-recipe-category-target-id" with "behat_categoría_de_receta"
  And I fill in "Etiquetas" with "behat_receta_etiqueta"
      #Uploading Media, adding alt text and handling popup window
  And I press the "Añadir contenido multimedia" button
  And I wait for the page to be loaded
  And I attach the file "fff.png" to "files[upload]"
  And I wait 5 second
  And I fill in "media[0][fields][field_media_image][0][alt]" with "esto es alternativo"
  Then I click on the element with xpath "//button[text()='Guardar']"
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
  And I select "Publicado" from "Guardar como"
      #saving node in published form
  And I press the "Guardar" button
  And I wait for the page to be loaded
      #saving the node for CRUD scenario
  And I save the node url
  And I wait 2 second
      #validating Recipe Creation message
  Then I should see "Receta Receta_Behat_CRUD se ha creado."
  And I wait for AJAX to finish
      #validate Recipe block on homepage
  When I am on "/es"
      #scroll to see the blocks
  And I scroll "#block-views-block-promoted-items-block-1" into view
  And I wait 5 second
  Then I should see "Receta_Behat_CRUD" in the "promoted" region
  And I scroll "#block-umami-content" into view
  And I should see "Receta_Behat_CRUD" in the "main" region
  And I wait 5 second
      #update banner with created recipe
  And I am on "/es/block/3?destination=/es/admin/structure/views/view/block_content/preview"
  And I wait 5 second
      #update Title,Summary, image and URL
      #Tile
  And I fill in "Título" with "Receta_Behat_CRUD"
      #summary
  And I fill in "Resumen" with "Texto actualizado de Behat"
      #url
  And I fill in "URL" with "/es/recetas/behat_recipe"
      #remove old image
  And I click the "#edit-field-media-image-selection-0-remove-button" element
  And I wait for AJAX to finish
      #add new image and add mandatory details
  And I press the "Añadir contenido multimedia" button
  And I wait for the page to be loaded
  And I attach the file "fff.png" to "files[upload]"
  And I wait 5 second
  And I fill in "media[0][fields][field_media_image][0][alt]" with "esto es alternativo"
  Then I click on the element with xpath "//button[text()='Guardar']"
  And I click on the element with xpath "//button[text()='Insertar seleccionado']"
  And I wait for the AJAX to finish
      #submit banner form
  And I press the "Guardar" button
  And I wait for the page to be loaded
      #validate success message
  And I should see "Bloque promocional Umami Casa Pancarta se ha actualizado."
      #Validate banner detail on Homepage
  And I am on "/es"
  And I wait for the page to be loaded
  And I should see "Receta_Behat_CRUD" in the "summary" region
  And I should see "Texto actualizado de Behat" in the "summary" region
  #redirect on Recipe from Homepage
  And I click "Ver receta"
  And I wait for the page to be loaded
  Then I should see the heading "Receta_Behat_CRUD"
 #validate the created recipe displaying in the recipe list
  When I click "Recetas"
  And I wait for the page to be loaded
  Then I should see "Receta_Behat_CRUD" in the "main" region
  Then I wait 5 second
  When I navigate to the node url
  And I wait for the page to be loaded
  #VALIDATE  receipe heading
  And I am on "/es/recetas/behat_recipe"
  Then I should see the heading "Receta_Behat_CRUD"
      #validate all the fields value
#  And I should see "Tiempo de preparación" in the "main" region
#  And I wait for the page to be loaded
  And I should see "10 minutos" in the "main" region
  And I should see "Tiempo de cocción" in the "main" region
  And I should see "60 minutos" in the "main" region
  And I should see "Cantidad de porciones" in the "main" region
  And I should see "4" in the "main" region
  And I should see "behat_receta_etiqueta" in the "main" region
  And I should see "behat_categoría_de_receta" in the "main" region
  And I should see "Cocinar1" in the "Ingredients" region
  And I should see "Cocinar2" in the "Ingredients" region
  And I should see "Cocinar3" in the "Ingredients" region
      #Select Edit to update the filed
  And I click "Editar" in the "tabs" region
  And I wait for the page to be loaded
  And I fill in "field_ingredients[2][value]" with "Cocinar_actualizada"
  And I press the "Guardar" button
  And I wait for the page to be loaded
  And I should see "Receta Receta_Behat_CRUD ha sido actualizado."
  When I navigate to the node url
  And I wait for the page to be loaded
      #delete the Content
  And I click "Eliminar"
  And I wait for the page to be loaded
      # Validate the confirmation message
  Then I should see "¿Está seguro de querer borrar Receta_Behat_CRUD del tipo elemento de contenido?"
      #delete the node
  And I press the "Eliminar" button
  And I wait for the page to be loaded
      #validate the Deleted node success message
  And I should see "El Receta Receta_Behat_CRUD ha sido eliminado."
      #validate the Recipe in the list after deletion
  When I click "Recetas"
  And I wait for the page to be loaded
  Then I should not see "Receta_Behat_CRUD" in the "main" region

