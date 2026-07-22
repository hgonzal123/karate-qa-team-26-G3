Feature: Flujos e2e pruebas

  #Flujo e2e de transferencia
  #Paso 1: Iniciar sesion
  #Pase 2: Seleccionar cuenta
  #Paso 3: Verificar saldo, SI saldo < 10 : Agrega saldo
  #Paso 4: Agregar cuenta destino manual
  #Paso 5: Ejecutar la transferencia -> Configuracion

  Background:
    * def apilogin = call read('../loginUser.feature@login')
    * def token = apilogin.token
    Given url = "https://bankapi-n1t8.onrender.com"
    * def tokenAuth = 'Bearer ' + token

Scenario: CPTR1 - Fjujo e2e transferencia exitosa
  * def apiAccount = call read('account.feature'@account) {"tokenUser": #(tokenAuth)}
  * def fromAccount = apiAccount.accountId
  * def


