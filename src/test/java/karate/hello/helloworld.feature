      
@regression      
Feature: Hello World

  Background:
    Given url baseUrl
    Given path '/api/hello'

@core,regression
  Scenario: Hello world

    When method GET
    Then status 200
    And match $ == "Hello world!"

@smoke
  Scenario: Hello with a param

    Given param name = 'UtsavRavimaniya'
    When method GET
    Then status 200
    And match $ == "Hello UtsavRavimaniya!"