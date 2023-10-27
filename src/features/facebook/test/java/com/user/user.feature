Feature: User Operations

  Background:
    * call read('common/setup.feature')

  Scenario: Update User Profile
    Given path '/v13.0/me'
    And request { "name": "Updated Name", "email": "updatedemail@example.com" }
    When method post
    Then status 200
    And match response.name == 'Updated Name'
    And match response.email == 'updatedemail@example.com'