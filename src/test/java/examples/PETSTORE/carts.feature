Feature: casos de prueba
  Scenario: CP-01 lista de carros
    Given url "https://fakestoreapi.com"
    And path "carts"
    When method get
    Then status 200
    * print "Listado correcto"

  Scenario: CP-02 agregar nuevo
    Given url "https://fakestoreapi.com"
    And path "carts"
    And request read("Actualizar/datosActualizar.json")
    When method post
    Then status 201
    * print "Creacion correcta"


Scenario: CP-03 listar un carro
  * def idCart = 2
  Given url "https://fakestoreapi.com"
  And path "carts", idCart
  When method get
  Then status 200
  And match responseType == 'json'
  * print "Listado correcto"

Scenario:
