@usuarios
Feature:Eliminar usuario

  Background:
    * url baseUrl
    * def dataGen = call read('classpath:helpers/data-generator.js')
    * def usuarioEliminadoSchema = read('classpath:schemas/delete/eliminar-usuario.json')
    * def usuarioDatosInvalidosSchema = read('classpath:schemas/post/usuario-datos-invalidos.json')
    * def usuarioDatosVaciosSchema = read('classpath:schemas/post/usuario-datos-vacios.json')
    * def usuarioNoEliminadoSchema = read('classpath:schemas/delete/usuario-no-eliminado-carrito.json')

  @delete @happy_path
  Scenario: Eliminar usuario existente
    * def nuevo = dataGen.usuarioRandom()
    Given path 'usuarios'
    And request nuevo
    When method post
    Then status 201
    * def id = response._id
    Given path 'usuarios', id
    When method delete
    Then status 200
    And match response == usuarioEliminadoSchema

@delete @unhappy_path
  Scenario Outline: Validar que no permita eliminar usuario con un carrito registrado
    Given path 'usuarios', '<_id>'
    When method delete
    Then status 400
    And match response == usuarioNoEliminadoSchema
    Examples:
      | _id              |
      | 0uxuPY0cbmQhpEz1 |



