Feature: Pruebas del modulo de transferencia

  Background:
    * def apilogin = call read('../loginUser.feature@login')
    * print apilogin.token
    * def token = apilogin.token

  Scenario Outline CP01 - Transeferencia exitosa
    Given path "/api/transfers"
    And header Authorization = "Bearer " + token
    And request
    """
    {
  "fromAccountId": "<fromAccount>",
  "toAccountId": "<toAccount>",
  "amount": <amount>,
  "description": "Test transfer",
  "transferType": "internal"
}
    """
    When method post
    Then status 201

    Examples:
    |fromAccount| toAccount| amount|
