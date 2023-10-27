Feature: Login through Staging AuthX

  Background:

    * url baseUrl
    * def target_environment = 'fb-staging' (test)
    * def country_code = 'EN' (test)
    * def scope = 'FACEB_AUTHPASS_SCOPE' (test)
    * def authorization = 'Basic authorization==' (test)
    * def username = 'facebook_username' (test)
    * def password = 'facebook_password' (test)
    * def grant_type_password = 'password' (test)

  Scenario: Failed Authorization - No Username
    Given path '/FacebookAuthTSPassword/v1/authtoken' (test)
    And configure charset = null (test)
    And header content-type = 'application/x-www-form-urlencoded' (test)
    And header Authorization = authorization (test)
    And header Accept = 'application/json' (test)
    And header target-environment = target_environment (test)
    And header country-code = country_code (test)
    And form field grant_type = grant_type (test)
    And form field password = password (test)
    And form field scope = scope (test)
    When method post
    Then status 400
    And match response.error_description == 'The request is missing one or more mandatory parameters'

  Scenario: Failed Authorization - Null Username
    Given path '/FacebookAuthTSPassword/v1/authtoken' (test)
    And configure charset = null (test)
    And header content-type = 'application/x-www-form-urlencoded' (test)
    And header Authorization = authorization (test)
    And header Accept = 'application/json' (test)
    And header target-environment = target_environment (test)
    And header country-code = country_code (test)
    And form field grant_type = grant_type (test)
    And form field username = ''
    And form field password = password
    And form field scope = scope (test)
    When method post
    Then status 400
    And match response.error_description == 'The request is missing one or more mandatory parameters'

  Scenario: Failure AuthX login - No Password
    Given path '/FacebookAuthTSPassword/v1/authtoken' (test)
    And configure charset = null (test)
    And header content-type = 'application/x-www-form-urlencoded' (test)
    And header Authorization = authorization (test)
    And header Accept = 'application/json' (test)
    And header target-environment = target_environment (test)
    And header country-code = country_code (test)
    And form field grant_type = grant_type (test)
    And form field username = username (test)
    And form field scope = scope (test)
    When method post
    Then status 400
    And match response.error_description == 'The request is missing one or more mandatory parameters'

  Scenario: Successful Login - Facebook User
    Given path '/FacebookAuthTSPassword/v1/authtoken' (test)
    And configure charset = null (test)
    And header content-type = 'application/x-www-form-urlencoded' (test)
    And header Authorization = authorization (test)
    And header Accept = 'application/json' (test)
    And header target-environment = target_environment (test)
    And header country-code = country_code (test)
    And form field grant_type = grant_type_password (test)
    And form field username = 'facebook.user_2' (test)
    And form field password = password (test)
    And form field scope = scope (test)
    When method post
    Then status 200
    And match response.access_token != null
