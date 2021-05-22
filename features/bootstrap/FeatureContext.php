<?php

use Drupal\DrupalExtension\Context\RawDrupalContext;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Behat\Behat\Tester\Exception\PendingException;

class FeatureContext extends RawDrupalContext {
    public $node_url;
    public $node_id;
    /**
     * Every scenario gets its own context instance.
     *
     * You can also pass arbitrary arguments to the
     * context constructor through behat.yml.
     */
    public function __construct() {

    }
    /**
     * @When /^wait for the page to be loaded$/
     */
    public function waitForThePageToBeLoaded()
    {
        $this->getSession()->wait(10000, "document.readyState === 'complete'");
    }

    /**
     * Waits a while, for debugging.
     *
     * @param int $seconds
     *   How long to wait.
     *
     * @When I wait :seconds second(s)
     */
    public function wait($seconds) {
        sleep($seconds);
    }
    /**
     * @Given /^I should have access of "([^"]*)"$/
     */
    public function iShouldHaveAccessOf($url) {
        $this->getSession()->visit($this->locatePath($url));
        $this->assertSession()
            ->elementTextNotContains('css', '.page-title', 'Access denied');
    }
    /**
     * @Given /^I should not have access of "([^"]*)"$/
     */
    public function iShouldNotHaveAccessOf($url) {
        $this->getSession()->visit($this->locatePath($url));
        $this->assertSession()
            ->elementTextContains('css', '.page-title', 'Access denied');
    }

    /**
     * @Given /^I upload the image "([^"]*)"$/
     */
    public function iUploadTheImage($path) {
        // Cannot use the build in MinkExtension function
        // because the id of the file input field constantly changes and the input field is hidden
        if ($this->getMinkParameter('files_path')) {
            $fullPath = rtrim(realpath($this->getMinkParameter('files_path')), DIRECTORY_SEPARATOR).DIRECTORY_SEPARATOR.$path;

            if (is_file($fullPath)) {
                $fileInput = 'input[type="file"]';
                $field = $this->getSession()->getPage()->find('css', $fileInput);

                if (null === $field) {
                    throw new Exception("File input is not found");
                }
                $field->attachFile($fullPath);
            }
        }
        else throw new Exception("File is not found at the given location");
    }

    /**
     * @When /^I wait for the page to be loaded$/
     */
    public function pageLoad()
    {
        $this->getSession()->wait(10000, "document.readyState === 'complete'");
    }
    /**
     * @Then I should see :arg1 as the header logo
     */
    public function iShouldSeeAsTheHeaderLogo($arg1)
    {
        throw new PendingException();
    }

    /**
     * I wait the ajax to complete.
     *
     * @Given I wait for the AJAX to finish
     */
    public function iWaitForTheAjaxToFinish() {
        $condition = <<<JS
    (function() {
      function isAjaxing(instance) {
        return instance && instance.ajaxing === true;
      }
      return (
        // Assert no AJAX request is running (via jQuery or Drupal) and no
        // animation is running.
        (typeof jQuery === 'undefined' || (jQuery.active === 0 && jQuery(':animated').length === 0)) &&
        (typeof Drupal === 'undefined' || typeof Drupal.ajax === 'undefined' || !Drupal.ajax.instances.some(isAjaxing))
      );
    }());
JS;
        $result = $this->getSession()->wait(30000, $condition);
        if (!$result) {
            throw new \RuntimeException('Unable to complete AJAX request.');
        }
    }


    /**
     * Login as user.
     *
     * @Given I login as :arg1 user
     */
    public function iLoginAsUser($user_role) {
        $base_path = $this->getMinkParameter('files_path');
        $fileHandle = fopen($base_path . "/user.csv", "r");
        $this->visitPath('/user/login');
        while (($row = fgetcsv($fileHandle, 0, ",")) !== FALSE) {
            if ($user_role == $row[0]) {
                $this->getSession()->getPage()->fillField('edit-name', $row[1]);
                $this->getSession()->getPage()->fillField('edit-pass', $row[2]);
                $this->getSession()->getPage()->pressButton('Log in');
            }
        }
    }

    /**
     * @Then /^I fill in wysiwyg on field "([^"]*)" with "([^"]*)"$/
     */
    public function iFillInWysiwygOnFieldWith($locator, $value) {
        $el = $this->getSession()->getPage()->findField($locator);
        $fieldId = $el->getAttribute('id');
        if (empty($fieldId)) {
            throw new Exception('Could not find an id for field with locator: ' . $locator);
        }
        $this->getSession()->executeScript("CKEDITOR.instances[\"$fieldId\"].setData(\"$value\");");
    }

    /**
     * @Then I save the node url
     */
    public function iSaveTheNodeUrl()
    {
        $this->node_url = $this->getSession()->getCurrentUrl();
        echo $this->node_url;
    }
    /**
     * @Given I navigate to the node url
     */
    public function iAccessNodeUrl()
    {
        $this->visitPath($this->node_url);
    }

    /**
     * Login as user.
     *
     * @Given I login as :arg1 user type :arg2
     */
    public function iLoginAsUserType($user_role, $type) {
        $base_path = $this->getMinkParameter('files_path');
        $fileHandle = fopen($base_path . "/user.csv", "r");
        $this->visitPath('/user/login ');
        while (($row = fgetcsv($fileHandle, 0, ",")) !== FALSE) {
            if ($user_role == $row[0] && $row[3] == $type) {
                $this->getSession()->getPage()->fillField('edit-name', $row[1]);
                $this->getSession()->getPage()->fillField('edit-pass', $row[2]);
                $this->getSession()->getPage()->pressButton('Log in');
            }
        }
    }

    /**
     * Click on the element with the provided xpath query
     *
     * @When /^I click on the element with xpath "([^"]*)"$/
     */
    public function iClickOnTheElementWithXPath($xpath)
    {
        $session = $this->getSession(); // get the mink session
        $element = $session->getPage()->find(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('xpath', $xpath)
        ); // runs the actual query and returns the element

        // errors must not pass silently
        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Could not evaluate XPath: "%s"', $xpath));
        }

        // ok, let's click on it
        $element->click();

    }

    /**
     * @Given I click the :arg1 element
     */
    public function iClickTheElement($selector)
    {
        $page = $this->getSession()->getPage();
        $element = $page->find('css', $selector);

        if (empty($element)) {
            throw new Exception("No html element found for the selector ('$selector')");
        }

        $element->click();
    }

    /**
     * @Then I should see element :xpath with attribute :attribute has :expectedValue
     */
    public function iShouldSeeElementWithAttributeHas($xpath, $attribute, $expectedValue)
    {
        $this->assertSession()->elementAttributeContains("css", $xpath, $attribute, $expectedValue );

    }


    /**
     * @Then I should check :html in the :region
     *
     * @throws \Exception
     *   If region or text within it cannot be found.
     */
    public function assertRegionText($check_html, $region) {

      $session = $this->getSession();
      $regionObj = $session->getPage()->find('region', $region);
      if (!$regionObj) {
        throw new \Exception(sprintf('No region "%s" found on the page %s.', $region, $session->getCurrentUrl()));
      }

      // Find the Xpath within the region
      $regionText = $regionObj->find('xpath', $check_html);
      if (null === $regionText) {
        throw new Exception("File input is not found");
      }
    }

    /**
     * works better with css, uses different method for css than xpath
     * @Then /^I mouse over "(?P<selector>[^"]*)"$/
     */

    public function iMouseOver($selector){
      $element = $this->find($selector);
      if($element == null){
        throw new Exception('Element '.$selector.' NOT found');
      }
      $this->iFocusOn($selector);
      if (strstr($selector, '//')) {
        $element->mouseOver();
      } else {
        $this->mouseOver($selector, '1');
      }
    }




  /**
     * Manually press enter key.
     *
     * @When /^I press enter/
     * @throws DriverException
     */
    public function i_manually_press_enter() {
        if (!$this->running_javascript()) {
            throw new DriverException('Enter press step is not available with Javascript disabled');
        }

        $value = [\WebDriver\Key::ENTER];
        $this->getSession()->getDriver()->getWebDriverSession()->activeElement()->postValue(['value' => $value]);
    }


    /**
     * @Then I hover over the :phrase link
     */
    public function iHoverOverLink($phrase)
    {
      $session = $this->getSession();

      // Get all link elements on the page
      $links = $session->getPage()->findAll('css', 'a');

      foreach($links as $link) {
        if ($link->getText() == $phrase) {
          // ok, let's hover it
          return $link->mouseOver();
        }
      }

      throw new \InvalidArgumentException(sprintf('Could not find anchor element matching "%s"', $phrase));
    }



    /**
     * @When I scroll :selector into view
     *
     * @param string $selector Allowed selectors: #id, .className, //xpath
     *
     * @throws \Exception
     */
    public function scrollIntoView($selector)
    {
        $locator = substr($selector, 0, 1);

        switch ($locator) {
            case '/' : // XPath selector
                $function = <<<JS
            (function(){
              var elem = document.evaluate($selector, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
              elem.scrollIntoView(false);
            })()
            JS;
                break;

            case '#' : // ID selector
                $selector = substr($selector, 1);
                $function = <<<JS
                (function(){
                  var elem = document.getElementById("$selector");
                  elem.scrollIntoView(false);
                })()
                JS;
                break;

            case '.' : // Class selector
                $selector = substr($selector, 1);
                $function = <<<JS
                (function(){
                  var elem = document.getElementsByClassName("$selector");
                  elem[0].scrollIntoView(false);
                })()
                JS;
                break;

            default:
                throw new \Exception(__METHOD__ . ' Couldn\'t find selector: ' . $selector . ' - Allowed selectors: #id, .className, //xpath');
                break;
        }

        try {
            $this->getSession()->executeScript($function);
        } catch (Exception $e) {
            throw new \Exception(__METHOD__ . ' failed');
        }
    }

    /**
     * @Given /^I set browser window size to "([^"]*)" x "([^"]*)"$/
     */
    public function iSetBrowserWindowSizeToX($width, $height) {
        $this->getSession()->resizeWindow((int)$width, (int)$height, 'current');
    }

  /**
   * @BeforeScenario
   *
   * @param BeforeScenarioScope $scope
   *
   */
  public function setUpTestEnvironment($scope)
  {
    $this->currentScenario = $scope->getScenario();
  }

  /**
   * @AfterStep
   *
   * @param AfterStepScope $scope
   */
  public function afterStep($scope)
  {
    //if test has failed, and is not an api test, get screenshot
    if(!$scope->getTestResult()->isPassed())
    {
      //create filename string

      $featureFolder = preg_replace('/\W/', '', $scope->getFeature()->getTitle());

      $scenarioName = $this->currentScenario->getTitle();
      $fileName = preg_replace('/\W/', '', $scenarioName) . '.png';

      //create screenshots directory if it doesn't exist
      if (!file_exists('results/html/assets/screenshots/' . $featureFolder)) {
        mkdir('results/html/assets/screenshots/' . $featureFolder);
      }

      //take screenshot and save as the previously defined filename
      $this->driver->takeScreenshot('results/html/assets/screenshots/' . $featureFolder . '/' . $fileName);
      // For Selenium2 Driver you can use:
      // file_put_contents('results/html/assets/screenshots/' . $featureFolder . '/' . $fileName, $this->getSession()->getDriver()->getScreenshot());
    }
  }

  /***
   * Ajit Step definition
  */
  /**
   * @Then /^I validate the validation message$/
   */
  public function iValidateTheValidationMessage($css, $expected)
  {
    $function = <<<JS
    (
      function ()
      {
          return document.querySelector("$css").validationMessage
      })()
JS;
    $actual= $this->getSession()->executeScript($function);
    If($actual !== $expected)
    {
      throw new Exception(Sprintf ("Expected validationmessage Attrtibute value '%s' is not matched with actual value '%s'",$css));
    }
  }






}
