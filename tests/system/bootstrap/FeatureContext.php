<?php

namespace App\Tests\System;

use Behat\Mink\Element\NodeElement;
use Behat\Mink\Exception\ElementNotFoundException;
use Behat\MinkExtension\Context\MinkContext;
use Behat\MinkExtension\Context\RawMinkContext;
use Exception;
use InvalidArgumentException;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends MinkContext
{
//    const SHARED_WITH_SELENIUM_DIR = DIRECTORY_SEPARATOR . 'tmp';

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

    public function spin($lambda, $wait = 60)
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
     * @When I click :arg1
     */
    public function iClick($selector)
    {
        $page = $this->getSession()->getPage();
        $element = $page->find('css', $selector);

        if (empty($element)) {
            throw new Exception("No html element found for the selector ('$selector')");
        }

        $element->click();
    }

    /**
     * @When I wait until the url matches ":pattern"
     */
    public function iWaitUntilTheUrlMatches($pattern)
    {
        $this->spin(function (RawMinkContext $context) use ($pattern) {
            $context->assertSession()->addressMatches($pattern);

            return true;
        });
    }
}
