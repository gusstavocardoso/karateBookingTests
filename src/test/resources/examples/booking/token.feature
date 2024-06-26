Feature: Generate Token

  Scenario: Create Token
    Given url 'https://restful-booker.herokuapp.com/auth'
    And request { "username": "admin", "password": "password123" }
    When method post
    Then status 200
    And match response == { token: '#string' }
    * def token = response.token
