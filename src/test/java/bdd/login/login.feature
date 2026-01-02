Feature: Login Parabank API

  Background:
    * url baseUrl
    * print baseUrl
    * print credentials
    * def responseContract = read('classpath:resources/responseContract/responseLogin.json')

  @loginHappy
  Scenario: Login exitoso
    Given path 'login', credentials.username, credentials.password
    When method Get
    Then status 200
    # Validaciones
    And match response == responseContract
    # Guardar datos clave
    * def customerId = response.id


  @loginUnHappy
  Scenario: Login fallido
    Given path 'login', credentials.usernamewrong, credentials.passwordwrong
    When method Get
    Then status 400
    # Validaciones
    And match response != responseContract
    And match response == "Invalid username and/or password"
    * print responseHeaders
    # Guardar datos clave