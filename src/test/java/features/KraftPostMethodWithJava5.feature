Feature: Post Method + Karate/Java Integration

  Background:
    * def kraftBaseUrl = "https://www.krafttechexlab.com/sw/api/v1"

  Scenario: Register a new user with Kraft
    Given url kraftBaseUrl + "/allusers/register"
    Given request
    """
  {
  "name": "tester1100",
  "email": "tester1100@krafttechexlab.com",
  "password": "Test12345"
}
    """
    When method post
    Then status 200
    Then print response

  Scenario: Register a new user with the help of Java
    Given def KDG = Java.type("utilities.KraftDataGenerator")
    Given def newUser = KDG.createUser()
    Given url kraftBaseUrl + "/allusers/register"
    Given request newUser
    When method post
    Then status 200
    Then match newUser.name == response.name
    Then match newUser.email == response.email




