## Behat Test Execution for Drupal8+MAMP Project

# Behat Drupal Extension

[![Build Status](https://travis-ci.org/nuvoleweb/drupal-behat.svg?branch=1.0.x)](https://travis-ci.org/nuvoleweb/drupal-behat)
[![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/nuvoleweb/drupal-behat/badges/quality-score.png?b=1.0.x)](https://scrutinizer-ci.com/g/nuvoleweb/drupal-behat/?branch=1.0.x)
[![Latest Stable Version](https://poser.pugx.org/nuvoleweb/drupal-behat/v/stable)](https://packagist.org/packages/nuvoleweb/drupal-behat)
[![Latest Unstable Version](https://poser.pugx.org/nuvoleweb/drupal-behat/v/unstable)](https://packagist.org/packages/nuvoleweb/drupal-behat)
[![Total Downloads](https://poser.pugx.org/nuvoleweb/drupal-behat/downloads)](https://packagist.org/packages/nuvoleweb/drupal-behat)
[![License](https://poser.pugx.org/nuvoleweb/drupal-behat/license)](https://packagist.org/packages/nuvoleweb/drupal-behat)

Behat Drupal Extension extends the popular [Behat Drupal Extension](https://www.drupal.org/project/drupalextension)
in order to provide the following features:

- Additional step definitions covering contributed modules, core functionality and popular third-party plugins.
- Contexts can access the global Behat service container.  
- Developers can organize their test using dependency injection by declaring their services in a YAML file and/or 
  override default Behat services.
- Developers can override Drupal driver core classes and allow their step definitions to run transparently on different
  Drupal core versions.

For more information please check the [documentation](https://github.com/nuvoleweb/drupal-behat/wiki/Documentation).

### Test Execution Steps:

1. Clone this repo/project which has all the drupal and behat dependencies

2. Move all the child directories of this project(from "core" directory till web.config file) under your MAMP server location (/Applications/MAMP/htdocs)

3. Run `composer install`

4. Setup the site on your local machine

5. update local site url in the behat.yml file for all the profiles, placed in your project root directory.
   site url is added for the: "Drupal\MinkExtension"
``` bash
default:
  suites:
    ...
  formatters:
    ...
  extensions:
    Drupal\MinkExtension:
      ...
      base_url: http://localhost:8888
      ...
```

6. Execute your all behat tests from /Applications/MAMP/htdocs in browser mode
```
vendor/bin/behat
```
or to execute test in headless mode 
```
vendor/bin/behat --profile="headless"
```

Note:8_deleteTestMedia.feature is added only to delete dummy media from the application.
     
