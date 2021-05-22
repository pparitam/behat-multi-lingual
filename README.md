## Behat Test Execution for Drupal8+MAMP Project

### Test Execution Steps:

1. Clone this repo/project which has all the drupal and behat dependencies

2. Move all the child directories of this project(from "core" directory till web.config file) under your MAMP server location (/Applications/MAMP/htdocs)

3. behat.yml file

```
default:
  suites:
    default:
      paths:
        features: '/Applications/MAMP/htdocs/features'
      contexts:
        - FeatureContext
        - Drupal\DrupalExtension\Context\DrupalContext
        - Drupal\DrupalExtension\Context\MinkContext
  extensions:
    Drupal\MinkExtension:
      goutte: ~
      selenium2: ~
      base_url: http://localhost:8888
    Drupal\DrupalExtension:
      blackbox: ~
      api_driver: 'drupal' 
      drush:
        alias: 'local'
      drupal: 
        drupal_root: '/Applications/MAMP/htdocs/' 
```

4. Execute your behat tests from /Applications/MAMP/htdocs
   ```
   vendor/bin/behat
   ```