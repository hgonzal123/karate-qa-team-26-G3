Feature: casos de prueba del modulo user

  Scenario: CP-01 creacion de usuario
    Given url "https://petstore.swagger.io/v2"
    And path "user"
    And request
    """
    {
    "id": 0,
    "username": "hgonzalez",
    "firstName": "henry",
    "lastName": "gonzalez",
    "email": "abc@gmail.com",
    "password": "abc123",
    "phone": "963258741",
    "userStatus": 1
    }
    """
    When method post
    Then status 200

  Scenario: CP-02 creacion de usuario con variable
    * def body =
    """
  {
  "id": 0,
  "username": "hgonzalez",
  "firstName": "henry",
  "lastName": "gonzalez",
  "email": "abc@gmail.com",
  "password": "abc123",
  "phone": "963258741",
  "userStatus": 1
  }
  """
    Given url "https://petstore.swagger.io/v2"
    And path "user"
    And request body
    When method post
    Then status 200
    * print "Hola soy Henry lml"

  Scenario: CP-03 actualizar usuario
    * def userName = "perezo"
    Given url "https://petstore.swagger.io/v2"
    And path "user/" + userName
    And request
    """
    {
  "id": 0,
  "username": "hgonzalez",
  "firstName": "henry",
  "lastName": "gonzalez",
  "email": "abc@gmail.com",
  "password": "abc123",
  "phone": "963258741",
  "userStatus": 1
}
    """
    When method put
    Then status 200

    Scenario: CP-04 eliminar usuario
      * def username = 'JOSE'
      Given url "https://petstore.swagger.io/v2"
      And path "user" , username
      When  method delete
      Then status 200
