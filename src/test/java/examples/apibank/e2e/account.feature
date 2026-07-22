Feature: Modulo de cuetnas

@account
  Scenario: CP01 - Listar cuentas ok con call
    
    Given url "https://bankapi-n1t8.onrender.com"
    And header Authorization = tokenUser
    And path "/api/acoounts"
    When method get
    Then status 200
    * def acoountId = response.data[0].id

@balanceAccount
  Scenario: CP02 - Obtener saldo de cuenta
    Given url "https://bankapi-n1t8.onrender.com"
    And header Authorization = tokenUser
    And path "/api/acoounts/" + acoountId + "/balance"
    When method get
    Then status 200
    * def balance = response.data.balance