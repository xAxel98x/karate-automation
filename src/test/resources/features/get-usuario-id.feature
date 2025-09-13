@usuarios
Feature: Buscar usuario por ID

  Background:
    * url baseUrl
    * def dataGen = call read('classpath:helpers/data-generator.js')
    * def usuarioSchema = read('classpath:schemas/get/usuario-schema.json')
    * def mensajeIdSchema = read('classpath:schemas/get/mensaje-id-schema.json')

  @get_id @happy_path
  Scenario: Buscar usuario por ID válido
    * def nuevo = dataGen.usuarioRandom()
    Given path 'usuarios'
    And request nuevo
    When method post
    Then status 201
    * def id = response._id

    Given path 'usuarios', id
    When method get
    Then status 200
    And match response == usuarioSchema

  @get_id @unhappy_path
  Scenario Outline: Buscar usuario por ID mayor o menor a 16 caracteres
    Given path 'usuarios', '<_id>'
    When method get
    Then status 400
    And match response == { id: '<message>' }

    Examples:
      | _id               | message                                            |
      | 0uxuPY0cbmQhp2z22 | id deve ter exatamente 16 caracteres alfanuméricos |
      | 1234567890123     | id deve ter exatamente 16 caracteres alfanuméricos |

  @get_id @unhappy_path
  Scenario Outline: Buscar usuario por ID inexistente
    Given path 'usuarios', '<_id>'
    When method get
    Then status 400
    And match response ==mensajeIdSchema

    Examples:
      | _id              |
      | hy3654T5607tgdhy |
      | hyH654T5637tgdhU |