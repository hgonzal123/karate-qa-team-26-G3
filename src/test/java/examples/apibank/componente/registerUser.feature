Feature: casos de prueba de registro de usuario
  Scenario: CP01 - registro de usuario exitoso
    * def data =
    """
    {
      "email": "henry1234567@bankapi.com",
      "password": "password123",
      "fullName": "perecini5"
    }
    """
    Given url "https://bankapi-n1t8.onrender.com"
    And path "api/auth/register"
    And request data
    When method post
    Then status 201
    And match response.data.user contains { "fullName":"perecini5"}

  Scenario: CP02 - registro de usuario exitoso
    * def data =
    """
    {
      "email": "henry1234567@bankapi.com",
      "password": "password123",
      "fullName": "perecini5"
    }
    """
    Given url "https://bankapi-n1t8.onrender.com"
    And path "api/auth/register"
    And request data
    When method post
    Then status 409
    * print response
    And match response.data.user contains { "fullName":"perecini5"}