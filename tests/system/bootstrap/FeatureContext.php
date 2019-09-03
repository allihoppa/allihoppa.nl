<?php

namespace App\Tests\System;

use Behat\Mink\Selector\Xpath\Escaper;
use Behat\MinkExtension\Context\MinkContext;
use Exception;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends MinkContext
{
    /**
     * Initializes context.
     *
     * Every scenario gets its own context instance.
     * You can also pass arbitrary arguments to the
     * context constructor through behat.yml.
     */
    public function __construct()
    {
    }

    /**
     * @Given I wait for :selector
     */
    public function iWaitFor($selector)
    {
        $this->spin(function () use ($selector) {
            return $this->getSession()->getPage()->find('css', $selector);
        });
    }

    /**
     * @Given I wait for button :selector
     */
    public function iWaitForButton($selector)
    {
        $this->spin(function () use ($selector) {
            return $this->getSession()->getPage()->find('named',
                array(
                    'button',
                    Escaper::escapeLiteral($selector)
                )
            );
        });
    }

    public function spin($lambda, $wait = 10)
    {
        for ($i = 0; $i < $wait; $i++) {
            try {
                if ($lambda($this)) {
                    return true;
                }
            } catch (Exception $e) {
                // do nothing
            }

            sleep(1);
        }

        $backtrace = debug_backtrace();

        throw new Exception(
            sprintf(
                "Timeout thrown by %s::%s()\n%s, line %d",
                $backtrace[1]['class'],
                $backtrace[1]['function'],
                isset($backtrace[1]['file']) ? $backtrace[1]['file'] : '',
                isset($backtrace[1]['line']) ? $backtrace[1]['line'] : ''
            )
        );
    }

    /**
     * Fills in WYSIWYG editor with specified id.
     *
     * @Given /^(?:|I )fill in "(?P<text>[^"]*)" in WYSIWYG editor "(?P<iframe>[^"]*)"$/
     *
     * Based on:
     * https://wiki.mahara.org/wiki/Testing/Behat_Testing/Steps#TinyMCE
     * https://gitorious.org/mahara/mahara/commit/fc50b8ff7459b0a349c0014908abc21bcc12cf85?p=mahara:mahara.git;a=commitdiff;h=fc50b8ff7459b0a349c0014908abc21bcc12cf85;hp=7ccee4cc1b11abc66a5e6c19617c8951e64e8879
     */
    public function iFillInInWYSIWYGEditor($text, $iframe)
    {
        try {
            $this->getSession()->switchToIFrame($iframe);
        } catch (Exception $e) {
            throw new \Exception(sprintf("No iframe with id '%s' found on the page '%s'.", $iframe, $this->getSession()->getCurrentUrl()));
        }
        $this->getSession()->executeScript("document.body.innerHTML = '<p>" . $text . "</p>'");
        $this->getSession()->switchToIFrame();
    }

    /**
     * Login into the reserved area of this wordpress
     *
     * @Given /^I am logged in as "([^"]*)" with password "([^"]*)"$/
     */
    public function login($username, $password)
    {
        $this->visit("wp-login.php");
        $currentPage = $this->getSession()->getPage();
        $currentPage->fillField('user_login', $username);
        $currentPage->fillField('user_pass', $password);
        $currentPage->findButton('wp-submit')->click();
        if ($this->getSession()->getPage()->hasContent('Dashboard') !== true) {
            throw new \Behat\Mink\Exception\ResponseTextException('Dashboard was not found');
        }
    }

    /**
     * @When I wait until I can publish
     */
    public function iWaitUntilICanPublish()
    {
        $this->spin(function () {
            return $this->getSession()->getPage()->find('css', "a.submitdelete")->isVisible();
        });
    }
}
