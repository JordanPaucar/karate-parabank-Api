Feature: Obtener cuentas del cliente

  Background:

    * url baseUrl
    * print baseUrl
    * def resultLogin = call read('classpath:bdd/login/login.feature@loginHappy')
    * def responseContract = read('classpath:resources/responseContract/responseListAccounts.json')

  @listaCuentas
  Scenario: Listar cuentas de usuario
    * print resultLogin.customerId
    Given path 'customers', resultLogin.customerId, 'accounts'
    When method get
    Then status 200
    * def arraySize = response.length

  # Validaciones estructurales
    #Validación de contrato
    And match response[0] == responseContract[0]
    #Validación de cuenta a customerId
    And match response[0].customerId == resultLogin.customerId
    #Validar AccountId
    And match response[0].id != null
    #Validar tipo de cuenta
    #And match response[0].type == resultcreateAccount.typeaccount
    #Validar saldo numerico
    And assert response[0].balance >= 0
    And assert typeof response[0].balance == 'number'

  # Obtener cuenta id Account (fondeo)
    * def fundingAccountId = response[0].id
    * print fundingAccountId
    * def ultimateAccountId = response[arraySize - 1].id
    * print 'Último ID:', ultimateAccountId
