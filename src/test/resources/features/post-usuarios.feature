@usuarios
Feature: Registrar usuario

  Background:
    * url baseUrl
    * def dataGen = call read('classpath:helpers/data-generator.js')
    * def usuarioRegistradoSchema = read('classpath:schemas/post/usuario-registrado.json')
    * def mensajeEmealDuplicadoSchema = read('classpath:schemas/post/mensaje-emeal-duplicado.json')
    * def usuarioDatosVaciosSchema = read('classpath:schemas/post/usuario-datos-vacios.json')
    * def usuarioDatosInvalidosSchema = read('classpath:schemas/post/usuario-datos-invalidos.json')

  @post @happy_path
  Scenario: Registrar usuario exitosamente
    * def nuevoUsuario = dataGen.usuarioRandom()
    Given path 'usuarios'
    And request nuevoUsuario
    When method post
    Then status 201
    And match response == usuarioRegistradoSchema

  @post @unhappy_path
  Scenario: Validar al registrar usuario con email duplicado
    * def nuevoUsuario = dataGen.usuarioRandom()
    Given path 'usuarios'
    And request nuevoUsuario
    When method post
    Then status 201
    Given path 'usuarios'
    And request nuevoUsuario
    When method post
    Then status 400
    And match response == mensajeEmealDuplicadoSchema

  @post @unhappy_path
  Scenario: Validar al registrar  usuario con datos vacios
    * def nuevoUsuario = dataGen.usuarioDatosVacios()
    Given path 'usuarios'
    And request nuevoUsuario
    When method post
    Then status 400
    And match response == usuarioDatosVaciosSchema

  @post @unhappy_path
  Scenario: Validar al registrar usuario con datos invalidos
    * def nuevoUsuario = dataGen.usuarioDatosInvalido()
    Given path 'usuarios'
    And request nuevoUsuario
    When method post
    Then status 400
    And match response == usuarioDatosInvalidosSchema