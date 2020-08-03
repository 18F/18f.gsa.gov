Feature: Rack-Jekyll
  In order to ensure results are correct
  As a Jekyll
  I want to become a Rack application

  Scenario: Request 200 page
    Given I have entered the path /
    When I request a page
    Then the http status should be 200
    Then the content-type should be text/html
    And the content-length should be 24
    And the data should show <p>Rack-Jekyll Test</p>

  Scenario: Request 304 page
    Given I have entered the path /
    When I request a page with a date of Last-Modified
    Then the http status should be 304
    And there should be no 'Content-Length' header

  Scenario: Request 404 page
    Given I have entered the path /show/me/404/
    When I request a page
    Then the http status should be 404
    And the content-type should be text/html
    And the content-length should be 9

  Scenario: Request static pages
    Given I have entered the path /css/test.css
    When I request a page
    Then the http status should be 200
    Then the content-type should be text/css

    Given I have entered the path /js/test.js
    When I request a page
    Then the http status should be 200
    Then the content-type should be application/javascript
