@api @javascript
Feature: Footer link and image validation

  @en @smoke
  Scenario Outline: Verify languages, search bar, my account, and logout buttons
    #Homepage
    Given I am on "/"
    When I scroll ".layout-content-bottom" into view
    Then I should see <element> in the "content_bottom" region
    And I hover over the <element> link
    #Contact form page
    And I am on "/en/contact"
    When I scroll ".layout-content-bottom" into view
    Then I should see <element> in the "content_bottom" region
    And I hover over the <element> link
    #Search form
    And I am on "/en/search/node"
    When I scroll ".layout-content-bottom" into view
    Then I should see <element> in the "content_bottom" region
    And I hover over the <element> link

    Examples:
      | element           |
      | "Alcohol free"    |
      | "Baked"           |
      | "Baking"          |
      | "Breakfast"       |
      | "Cake"            |
      | "Carrots"         |
      | "Chocolate"       |
      | "Cocktail party"  |
      | "Dairy-free"      |
      | "Dessert"         |
      | "Dinner party"    |
      | "Drinks"          |
      | "Egg"             |
      | "Grow your own"   |
      | "Healthy"         |
      | "Herbs"           |

  @en @smoke
  Scenario Outline: Verify Copyright text and Terms and Conditions
    #Homepage
    Given I am on "/"
    And I scroll "#block-umami-disclaimer" into view
    And I wait 5 second
    Then I should see <element> in the "bottom" region
    #Contact form page
    And I am on "/en/contact"
    And I scroll "#block-umami-disclaimer" into view
    And I wait 5 second
    Then I should see <element> in the "bottom" region
    #Search form
    And I am on "/en/search/node"
    And I scroll "#block-umami-disclaimer" into view
    And I wait 5 second
    Then I should see <element> in the "bottom" region

    Examples:
      | element                                                                                                     |
      | "Umami Magazine & Umami Publications is a fictional magazine and publisher for illustrative purposes only." |
      | "© 2021 Terms & Conditions"                                                                                 |

  @en @smoke
  Scenario Outline: Verify magazine image, text and Contact
   #Homepage
    Given I am on "/"
    And I scroll ".footer" into view
    And I wait 5 second
    Then I should check <element> in the "footer"
    #Contact form page
    And I am on "/en/contact"
    And I scroll ".footer" into view
    And I wait 5 second
    Then I should check <element> in the "footer"
    #Search form
    And I am on "/en/search/node"
    And I scroll ".footer" into view
    And I wait 5 second
    Then I should check <element> in the "footer"

    Examples:
      | element                                                                                                                                            |
      |'//*[@id="block-umami-footer-promo"]//img'                                                                                                          |
      |'//*[@id="block-umami-footer-promo"]//h2["Umami Food Magazine"]'                                                                                    |
      |'//*[@class="footer-promo-content"]//div["Skills and know-how. Magazine exclusive articles, recipes and plenty of reasons to get your copy today."]'|
      |'//*[@id="block-umami-footer"]//li["Contact"]'                                                                                                      |

 #### Spanish ##########
  @es @smoke
  Scenario Outline: Verify languages, search bar, my account, and logout buttons
    #Homepage
    Given I am on "/es"
    When I scroll ".layout-content-bottom" into view
    Then I should see <element> in the "content_bottom" region
    And I hover over the <element> link
    #Contact form page
    And I am on "/es/contact"
    When I scroll ".layout-content-bottom" into view
    Then I should see <element> in the "content_bottom" region
    And I hover over the <element> link
    #Search form
    And I am on "/es/search/node"
    When I scroll ".layout-content-bottom" into view
    Then I should see <element> in the "content_bottom" region
    And I hover over the <element> link

    Examples:
      | element            |
      | "Sin alcohol"      |
      | "Horneado"         |
      | "Cocción"          |
      | "Desayuno"         |
      | "Pastel"           |
      | "Zanahorias"       |
      | "Chocolate"        |
      | "Fiesta de coctel" |
      | "Sin Lactosa"      |
      | "Postre"           |
      | "Fiesta de cena"   |
      | "Bebidas"          |
      | "Huevo"            |
      | "Cultiva los tuyos"|
      | "Saludable"        |
      | "Hierbas"          |

  @es @smoke
  Scenario Outline: Verify Copyright text and Terms and Conditions
    #Homepage
    Given I am on "/es"
    And I scroll "#block-umami-disclaimer" into view
    And I wait 5 second
    Then I should see <element> in the "bottom" region
    #Contact form page
    And I am on "/es/contact"
    And I scroll "#block-umami-disclaimer" into view
    And I wait 5 second
    Then I should see <element> in the "bottom" region
    #Search form
    And I am on "/es/search/node"
    And I scroll "#block-umami-disclaimer" into view
    And I wait 5 second
    Then I should see <element> in the "bottom" region


    Examples:
      | element                                                                                                     |
      | "Revista Umami y Publicaciones Umami es una revista ficticia publicada con propósito ilustrativo sólamente." |
      | "© 2021 Términos y Condiciones"                                                                                 |

  @es @smoke
  Scenario Outline: Verify magazine image, text and Contact
   #Homepage
    Given I am on "/es"
    And I scroll ".footer" into view
    And I wait 5 second
    Then I should check <element> in the "footer"
    #Contact form page
    And I am on "/es/contact"
    And I scroll ".footer" into view
    And I wait 5 second
    Then I should check <element> in the "footer"
    #Search form
    And I am on "/es/search/node"
    And I scroll ".footer" into view
    And I wait 5 second
    Then I should check <element> in the "footer"

    Examples:
      | element                                                                                                                                            |
      |'//*[@id="block-umami-footer-promo"]//img'                                                                                                          |
      |'//*[@id="block-umami-footer-promo"]//h2["Revista de Comida Umami"]'                                                                                    |
      |'//*[@class="footer-promo-content"]//div["Trucos y consejos. Artículos exclusivos de la revista, recetas y una variedad de razones para conseguir tu copia hoy."]'|
      |'//*[@id="block-umami-footer"]//li["Contacto"]'                                                                                                      |
