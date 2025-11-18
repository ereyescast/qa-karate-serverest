Feature: Actualizar usuario - Casos negativos

    Background:
        * url baseUrl

    Scenario: Actualizar usuario con email duplicado
        Given path '/usuarios', 'idNoExiste123'
        And request { nome: 'Test', email: 'test@test.com', password: '0000', administrador: 'false' }
        When method PUT
        Then status 400
        And match response ==
    """
    {
      "message": "Este email já está sendo usado"
    }
    """
