Feature: Pruebas de deposito
  Scenario: CP01 - Agregar saldo a cuenta
    Given path "/api/deposits"
    And header Authorization = "Bearer " + token
    And request
    """
    {
      "acountId": "64a1f3e0c9b1f2a5d6e8b7c9",
      "amount": 100,
      "description": "bank_transfer",
      "reference": "Salary deposit"
    }
    """
    When method post
    Then status 201