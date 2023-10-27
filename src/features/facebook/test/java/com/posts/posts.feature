Feature: Post Operations

  Background:
    * call read('common/setup.feature')
    * def general_post = read('resources/general_post.json')


  Scenario: Create a Post
    Given path '/v13.0/me/feed'
    And request { "message": "Hello, Tester!" }
    When method post
    Then status 200
    And match response.id != 'null'

  Scenario: Get User Posts
    Given path '/v13.0/me/feed'
    When method get
    Then status 200
    And match response.data[*].message contains 'Hello, Tester!'