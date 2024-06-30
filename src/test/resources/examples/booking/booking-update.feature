Feature: Update Booking

  Scenario: Update an existing booking with authentication
    * def tokenResponse = call read('token.feature')
    * def token = tokenResponse.token

    Given url 'https://restful-booker.herokuapp.com/booking'
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And request { "firstname": "Jane", "lastname": "Doe", "totalprice": 200, "depositpaid": true, "bookingdates": { "checkin": "2022-07-01", "checkout": "2022-07-02" }, "additionalneeds": "Breakfast" }
    When method post
    Then status 200
    * def bookingId = response.bookingid

    Given url 'https://restful-booker.herokuapp.com/booking/' + bookingId
    And header Cookie = 'token=' + token
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And request { "firstname": "John", "lastname": "Doe", "totalprice": 456, "depositpaid": false, "bookingdates": { "checkin": "2022-08-01", "checkout": "2022-08-02" }, "additionalneeds": "Lunch" }
    When method put
    Then status 200
    And match response.firstname == 'John'