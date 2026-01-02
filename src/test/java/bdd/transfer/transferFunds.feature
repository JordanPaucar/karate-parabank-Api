Feature: Transferencia de fondos

  Background:
    * url baseUrl
    * print baseUrl
    * def resultLogin = call read('classpath:bdd/login/login.feature@loginHappy')
    * def responseContract = read('classpath:resources/responseContract/responsecreateAccount.json')
    * def idCreateAccount = call read('classpath:bdd/createAccount/createAccount.feature@createAccount')
    * def resultListAccount = call read('classpath:bdd/accounts/getAccounts.feature@listaCuentas')

    @TransferToAccounts
  Scenario: Transferencia exitosa
    * def transferAmount = 21

    Given path 'transfer'
    And param fromAccountId = resultListAccount.fundingAccountId
    And param toAccountId = resultListAccount.ultimateAccountId
    And param amount = transferAmount
    When method post
    Then status 200
    * print response
    And match response == 'Successfully transferred $'+transferAmount+' from account #'+resultListAccount.fundingAccountId+' to account #'+resultListAccount.ultimateAccountId


