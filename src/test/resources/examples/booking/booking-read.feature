Feature: Booking Operations

  Background:
    Given url 'https://restful-booker.herokuapp.com/booking'
    When method get
    Then status 200
    * def bookingId = response[0].bookingid
    * print 'Captured bookingId:', bookingId
    * karate.set('bookingId', bookingId)

  Scenario: Get All Bookings
    Given url 'https://restful-booker.herokuapp.com/booking'
    When method get
    Then status 200

  Scenario: Get Booking by ID
    * def bookingId = karate.get('bookingId')
    * print 'Using bookingId:', bookingId
    Given url 'https://restful-booker.herokuapp.com/booking/' + bookingId
    And header Accept = 'application/json'
    When method get
    Then status 200
