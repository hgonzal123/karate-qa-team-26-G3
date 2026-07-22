Feature: Modulo de cuentas

  Background:
    * def apilogin = call read('../loginUser.feature@login')
    * print apilogin.token
    * def token = apilogin.token

  Scenario: CP01 -LISTAR CUENTAS OK
    Given url "https://bankapi-n1t8.onrender.com"
    And path "api/auth/login"
    And request {  "email": "test@bankapi.com",  "password": "password123"  }
    When method post
    Then status 200
    * print response
    * def token = response.data.accessToken
    And header Authorization = 'Bearer ' + token
    And path "api/accounts"
    When method get
    Then status 200

  Scenario: CP02 - Listar cuentas ok con call
    Given url "https://bankapi-n1t8.onrender.com"
    And header Authorization = 'Bearer ' + token
    And path "api/accounts"
    When method get
    Then status 200

Scenario Outline: Crear cuentas masiva <id>

  Given path "api/accounts"
  And header Authorization = 'Bearer ' + token
  And request "{"accountType": "savings","currency": "#(currency)","initialBalance": #(balance)}"
  When method post
  Then status 201

  Examples:
    |read('dataAccount.csv')|