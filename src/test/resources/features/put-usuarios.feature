@usuarios
Feature:Actualizar usuario

  Background:
    * url baseUrl
    * def dataGen = call read('classpath:helpers/data-generator.js')
    * def usuarioPutSchema = read('classpath:schemas/put/mensaje-put-exitoso.json')
    * def usuarioDatosInvalidosSchema = read('classpath:schemas/post/usuario-datos-invalidos.json')
    * def usuarioDatosVaciosSchema = read('classpath:schemas/post/usuario-datos-vacios.json')

  @put @happy_path
  Scenario: Actualizar usuario existente con datos validos
    * def nuevo = dataGen.usuarioRandom()
    Given path 'usuarios'
    And request nuevo
    When method post
    Then status 201
    * print response
    * def id = response._id
    * def nuevosdatos = dataGen.usuarioRandom()
    * print 'Datos para actualizar:', nuevosdatos
    Given path 'usuarios', id
    And request nuevosdatos
    When method put
    Then status 200
    * print response
    And match response == usuarioPutSchema

  @put @unhappy_path
  Scenario: Validar que no permita actualizar con datos inválidos
    * def nuevo = dataGen.usuarioRandom()
    Given path 'usuarios'
    And request nuevo
    When method post
    Then status 201
    * print response
    * def id = response._id
    * def nuevoUsuario = dataGen.usuarioDatosInvalido()
    * print 'Datos para actualizar:', nuevoUsuario
    Given path 'usuarios', id
    And request nuevoUsuario
    When method put
    Then status 400
    * print response
    And match response == usuarioDatosInvalidosSchema

  @put @unhappy_path
  Scenario: Validar que no permita actualizar con datos vacios
    * def nuevo = dataGen.usuarioRandom()
    Given path 'usuarios'
    And request nuevo
    When method post
    Then status 201
    * print response
    * def id = response._id
    * def nuevoUsuario = dataGen.usuarioDatosVacios()
    * print 'Datos para actualizar:', nuevoUsuario
    Given path 'usuarios', id
    And request nuevoUsuario
    When method put
    Then status 400
    * print response
    And match response == usuarioDatosVaciosSchema

