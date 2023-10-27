Feature: Album Operations

  Background:
    * call read('common/setup.feature')

    * def album_response = read('resources/album_response.json')

  Scenario: Create an Album
    Given path '/v13.0/me/albums'
    And request { "name": "Easter 2023", "description": "The first outside" }
    When method post
    Then status 200
    And match response.id != '#notnull'

  Scenario: Add a Photo to an Album
    Given path '/v13.0/<ALBUM_ID>/photos'
    And request { "url": "https://example.com/photo.jpg", "caption": "An example photo" }
    When method post
    Then status 200
    And match response.id != 'null'

  Scenario: Get Album Details
    Given path '/v13.0/<ALBUM_ID>'
    When method get
    Then status 200
    And match response.name == 'Easter 2023'
    And match response.description == 'The first outside'