@api @javascript
Feature: Search Validation

  @javascript @en @header @smoke
  Scenario Outline: Verify link in header
    #Homepage
    Given I am on "/"
    Then I should see <element> in the "header"
    #check logo in header
    Then I should check '//*[@id="block-umami-branding"]//img' in the "header"
    #Contact form page
    And I am on "/en/contact"
    Then I should see <element> in the "header"
    And I hover over the <element> link
        #check logo in header
    Then I should check '//*[@id="block-umami-branding"]//img' in the "header"
    #Search form
    And I am on "/en/search/node"
    Then I should see <element> in the "header"
    And I hover over the <element> link
       #check logo in header
    Then I should check '//*[@id="block-umami-branding"]//img' in the "header"
    Examples:
      | element    |
      | "Home"     |
      | "Articles" |
      | "Recipes"  |

  @en @header @smoke
  Scenario Outline: Verify languages, search bar, my account, and login
    #Homepage
    Given I am on "/"
    Then I should see <element> in the "preheader" region
    And I hover over the <element> link
    Then I should see "Search" in the "preheader" region
    And I hover over the "Search" link
    #Contact form page
    And I am on "/en/contact"
    Then I should see <element> in the "preheader" region
    And I hover over the <element> link
    Then I should see "Search" in the "preheader" region
    And I hover over the "Search" link
    #Search form
    And I am on "/en/search/node"
    Then I should see <element> in the "preheader" region
    And I hover over the <element> link
    Then I should see "Search" in the "preheader" region
    And I hover over the "Search" link
    Examples:
      | element     |
      | "English"   |
      | "Español"   |
      | "Log in"    |

  @en @header @smoke
  Scenario: Verify my account and logout buttons
    Given I am logged in as a user with the "administrator" role
    #Homepage
    And I am on "/"
    Then I should see "My account" in the "preheader" region
    And I hover over the "My account" link
    Then I should see "Log out" in the "preheader" region
    And I hover over the "Log out" link
    #Contact form page
    And I am on "/en/contact"
    Then I should see "My account" in the "preheader" region
    And I hover over the "My account" link
    Then I should see "Log out" in the "preheader" region
    And I hover over the "Log out" link
    #Search form
    And I am on "/en/search/node"
    Then I should see "My account" in the "preheader" region
    And I hover over the "My account" link
    Then I should see "Log out" in the "preheader" region
    And I hover over the "Log out" link

    ####### Spanish #########
  @javascript @es @header @smoke
  Scenario Outline: Verify link in header
    Given I am on "/es"
    Then I should see <element> in the "header"
    And I hover over the <element> link
    #check logo in header
    Then I should check '//*[@id="block-umami-branding"]//img' in the "header"
    Examples:
      | element     |
      | "Inicio"    |
      | "Artículos" |
      | "Recetas"   |

  @es @header @smoke
  Scenario Outline: Verify languages, search bar, my account, and login
    Given I am on "/es"
    Then I should see <element> in the "preheader" region
    And I hover over the <element> link
    Then I should see "Buscar" in the "preheader" region

    Examples:
      | element             |
      | "English"           |
      | "Español"           |
      | "Iniciar sesión"    |

  @es @header @smoke
  Scenario: Verify my account and logout buttons
    Given I am logged in as a user with the "administrator" role
    And I am on "/es"
    Then I should see "Mi cuenta" in the "preheader" region
    And I hover over the "Mi cuenta" link
    Then I should see "Cerrar sesión" in the "preheader" region
    And I hover over the "Cerrar sesión" link
