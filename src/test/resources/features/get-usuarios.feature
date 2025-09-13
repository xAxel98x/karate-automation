@usuarios
Feature: Listar usuarios


  Background:
    * url baseUrl
    * def listaUsuarioSchema = read('classpath:schemas/get/Lista-usario.json')
    * def usuarioSchema = read('classpath:schemas/get/usuario-schema.json')

  @get @happy_path
  Scenario: Validar al obtener lista de usuarios y tenga la estructura correcta
    Given path 'usuarios'
    When method get
    Then status 200
    * print response
    And match response == listaUsuarioSchema

  @get @happy_path
  Scenario: Validar que la cantidad coincide con el número de usuarios
    Given path 'usuarios'
    When method get
    Then status 200
    And match response.quantidade == response.usuarios.length

  @get @happy_path
  Scenario Outline: Buscar usuarios por nombre y email que existen
    Given path 'usuarios'
    And param nome = '<nombre>'
    And param email = '<email>'
    When method get
    Then status 200
    And match each response.usuarios[*].nome contains '<nombre>'
    * print response.usuarios
    And match each response.usuarios[*].email contains '<email>'

    Examples:
      | nombre          | email             |
      | Fulano da Silva | fulano@qa.com     |
      | Lívia           | lívia493@test.com |

  @get @happy_path
  Scenario: Validar el esquema de los usuarios en la lista
    Given path 'usuarios'
    When method get
    Then status 200
    And match each response.usuarios == usuarioSchema

  @get @unhappy_path
  Scenario Outline: Validar al buscar usuarios por nombre y email que no existen la cantidad de usuarios
    Given path 'usuarios'
    And param nome = '<nombre>'
    And param email = '<email>'
    When method get
    Then status 200
    And match each response.usuarios[*].nome contains '<nombre>'
    And match each response.usuarios[*].email contains '<email>'
    And match response.quantidade == 0

    Examples:
      | nombre               | email                   |
      | NombreInexistente123 | noexiste123@example.com |
      | NombreInexistente123 | noexiste123@example.com |




