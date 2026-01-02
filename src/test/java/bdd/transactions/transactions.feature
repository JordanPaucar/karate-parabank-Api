Feature: Validar transacciones de cuenta

  Background:

    * url baseUrl
    * print baseUrl
    * def resultLogin = call read('classpath:bdd/login/login.feature@loginHappy')
    * def responseContract = read('classpath:resources/responseContract/responsecreateAccount.json')
    * def idCreateAccount = call read('classpath:bdd/createAccount/createAccount.feature@createAccount')
    * def amountTransfer = call read('classpath:bdd/transfer/transferFunds.feature@TransferToAccounts')
    * def resultListAccount = call read('classpath:bdd/accounts/getAccounts.feature@listaCuentas')


  @transferHistory
  Scenario: Validar historial de transacciones
    Given path 'accounts', resultListAccount.fundingAccountId,'transactions'
    When method get
    Then status 200

  # Buscar la transacción creada
    * def item = response.length
    * print "cantidad: " + item
    * def tx = response[(item-1)]
    * print tx

    And match tx != null
    And match tx.amount == amountTransfer.transferAmount
    And match tx.type == 'Debit'
    And match tx.date != null
