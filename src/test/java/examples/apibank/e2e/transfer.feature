Feature: Pruebas del modulo de transferencia

  Scenario CP01 - Transeferencia exitosa
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
