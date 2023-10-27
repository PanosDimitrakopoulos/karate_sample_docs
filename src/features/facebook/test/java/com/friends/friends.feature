Feature: Friend Operations

  Background:
    * call read('common/setup.feature')

    * def friends_list = read('resources/friends_list.json')

  Scenario: Send Multiple Friend Requests
    * def userIds = ['user1_id', 'user2_id', 'user3_id']
    * def requests = karate.mapWithKey(userIds, 'user_id')
    Given path '/v13.0/me/friends'
    And request requests
    When method post
    Then status 200
    And match response[*].success == true

  Scenario: Retrieve List of Friends
    Given path '/v13.0/me/friends'
    When method get
    Then status 200
    And match response.data[*].name contains 'Friend Name'
    And match response.data[*].id contains 'Friend ID'