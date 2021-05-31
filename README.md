## Behat Test Execution for Drupal8+MAMP Project

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

6. Execute your behat tests from /Applications/MAMP/htdocs
   ```
   vendor/bin/behat
   ```
