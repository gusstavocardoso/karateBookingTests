Feature: Create Booking

  Scenario: Create a new booking without authentication
    Given url 'https://restful-booker.herokuapp.com/booking'
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And request { "firstname": "John", "lastname": "Doe", "totalprice": 123, "depositpaid": true, "bookingdates": { "checkin": "2022-01-01", "checkout": "2022-01-02" }, "additionalneeds": "Breakfast" }
    When method post
    Then status 200
    And match response.bookingid != null
