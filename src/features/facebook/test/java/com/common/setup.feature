Feature: Common Setup

  Background:
    * configure headers = read('headers.feature')

  Scenario: Configure Base URL
    Given url baseUrl