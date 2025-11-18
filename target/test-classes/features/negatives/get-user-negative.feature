Feature: Buscar usuario - Casos negativos

Background:
    * url baseUrl

Scenario: ID no existente
    Given path '/usuarios', 'invalido1234'
    When method GET
    Then status 400
    And match response.id == "id deve ter exatamente 16 caracteres alfanuméricos"
