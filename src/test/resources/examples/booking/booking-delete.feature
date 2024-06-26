Feature: Delete Booking

  Scenario: Delete an existing booking with authentication
    * def tokenResponse = call read('token.feature')
    * def token = tokenResponse.token

    Given url 'https://restful-booker.herokuapp.com/booking'
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And request { "firstname": "Jane", "lastname": "Doe", "totalprice": 200, "depositpaid": true, "bookingdates": { "checkin": "2022-09-01", "checkout": "2022-09-02" }, "additionalneeds": "Breakfast" }
    When method post
    Then status 200
    And def bookingId = response.bookingid

    Given url 'https://restful-booker.herokuapp.com/booking/' + bookingId
    And header Cookie = 'token=' + token
    When method delete
    Then status 201
