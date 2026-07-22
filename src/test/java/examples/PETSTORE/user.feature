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


###########################################################
      Scenario: CP-05 login exitoso

        Given url "https://petstore.swagger.io/v2"
        And path "user/login"
        And param username = "Henry"
        And param password = "abc123"
        When method get
        Then status 200
        And match response.code == 200
        And match response.type == "unknown"

        Scenario: CP-06 create booking
          Given url "https://restful-booker.herokuapp.com"
          And path "/booking"
          And header Accept = "application/json"
          And form field firstname = "Jim"
          And form field lastname = "Brown"
          And form field totalprice = 111
          And form field depositpaid = true
          And form field bookingdates[checkin] = "2018-01-01"
          And form field bookingdates[checkout] = "2018-01-02"
          When method post
          Then status 200

        Scenario: CP-07 create token
          Given url "https://restful-booker.herokuapp.com"
          And path "auth"
          And request { "username" : "admin", "password" : "password123"}
          When method post
          Then status 200

        Scenario: CP-08 actualizar usuario con archivo externo
          * def userName = "perezo"
          Given url "https://petstore.swagger.io/v2"
          And path "user" , userName
          And request read("bodyActualizar.json")
          When method put
          Then status 200
          And match responseType == 'json'
          * print ''