Feature: Crear nueva cuenta bancaria

  Background:

    * url baseUrl
    * print baseUrl
    * def resultLogin = call read('classpath:bdd/login/login.feature@loginHappy')
    * def responseContract = read('classpath:resources/responseContract/responsecreateAccount.json')
    * def resultListAccount = call read('classpath:bdd/accounts/getAccounts.feature@listaCuentas')

    @createAccount
  Scenario: Creacion de cuentas nuevas
    Given path 'createAccount'
      * print resultLogin.customerId
      * print resultListAccount.fundingAccountId
    And param customerId = resultLogin.customerId
    And param newAccountType = 1
    And param fromAccountId = resultListAccount.fundingAccountId
    When method post
    Then status 200

  # Validaciones funcionales
    #Validación de contrato
    And match response == responseContract
    And match response.id != resultListAccount.fundingAccountId
    And match response.balance == 0
    And match response.type == 'SAVINGS'

  # Exponer nueva cuenta
    * def newAccountId = response.accountId
