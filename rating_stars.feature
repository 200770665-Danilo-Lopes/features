@feedback
Feature: Driver and Passenger Rating
  As an Uber user
  I want to rate my experience
  So that I can provide honest feedback, contributing to maintain service quality

  Background:
    Given I have completed a trip
    And the payment has been processed

  @rate-driver
  Scenario: Passenger rates driver after route completion
    When I am prompted to rate the driver
    And I select correspondent number of stars
    And I select none, one or more reasons

    Examples:
      | Clean Car       |
      | Safe Driving    |
      | Professional    |
      | Polite          |
      | Punctual        |
      
    And I leave a comment or not
    And I press "Submit" button
    Then my rating should be submitted
    And it should affect the driver's overall rating
    And I should see a message after submiting it 

  @rate-passenger
  Scenario: Driver rates passenger
    Given I am a driver
    When I finish a trip
    And I select correspondent number of stars
    Then the rating should be submitted
    And it should affect the passanger's overall rating
    And I should be ready to accept new rides
