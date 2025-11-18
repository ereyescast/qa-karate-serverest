Feature: Listar usuarios

Background:
    * url baseUrl

Scenario: Obtener lista de usuarios
    Given path '/usuarios'
    When method GET
    Then status 200
    * def schema = read('classpath:schemas/list-users-schema.json')
    And match response == schema


