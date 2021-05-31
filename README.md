## Behat Test Execution for Drupal8+MAMP Project

# Behat Drupal Extension

Behat Drupal Extension extends the popular [Behat Drupal Extension](https://www.drupal.org/project/drupalextension)
in order to provide the following features:

- Additional step definitions covering contributed modules, core functionality and popular third-party plugins.
- Contexts can access the global Behat service container.  
- Developers can organize their test using dependency injection by declaring their services in a YAML file and/or 
  override default Behat services.
- Developers can override Drupal driver core classes and allow their step definitions to run transparently on different
  Drupal core versions.

For more information please check the [documentation](https://behat-drupal-extension.readthedocs.io/en/v4.0.1/).

# Mink

Mink is a browser emulators abstraction layer.

It defines a basic API through which you can talk with specific browser emulator libraries.

Mink drivers define a bridge between Mink and those libraries.

### Test Execution Steps:

1. Clone this repo/project which has all the drupal and behat dependencies

2. Move all the child directories of this project(from "core" directory till web.config file) under your MAMP server location (/Applications/MAMP/htdocs)
   (<b>Prerequisite :</b> MAMP/WAMP/LAMP should be installed in your device)
  -- To install mamp in your device please refer [site](https://www.mamp.info/en/downloads/).

3. Run `composer install` (Prerequisite-composer should be install in your device)
  -- To install composer in your device please refer [documentation](https://getcomposer.org/doc/00-intro.md).

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

<i><b>Note:</b></i>
8_deleteTestMedia.feature is added only to delete dummy media from the application generated due to file upload behat scenario. 
     
