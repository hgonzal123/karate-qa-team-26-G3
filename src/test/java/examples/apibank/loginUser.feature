Feature: inicio de sesion

  @login
  Scenario: CP01 - inicio de sesion exitoso
    Given url "https://bankapi-n1t8.onrender.com"
    And path "api/auth/login"
    And request  {  "email": "test@bankapi.com",  "password": "password123"  }
    When method post
    Then status 200
    * def token = response.data.accessToken

  @loginInvalid
  Scenario: CP02 - credenciales invalidas
    Given url "https://bankapi-n1t8.onrender.com"
    And path "api/auth/login"
    And request  {  "email": "henry666@bankapi.com",  "password": "password123"  }
    When method post
    Then status 401
    And match response.error contains { "code":"INVALID_CREDENTIALS" }