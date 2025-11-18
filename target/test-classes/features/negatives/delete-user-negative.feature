Feature: Eliminar usuario - Caso negativo

    Background:
        * url baseUrl

    Scenario: Intento de eliminar usuario inexistente
        Given path '/usuarios', 'idDesconocido456'
        When method DELETE
        Then status 200
        And match response ==
    """
    {
      "message": "Nenhum registro excluído"
    }
    """