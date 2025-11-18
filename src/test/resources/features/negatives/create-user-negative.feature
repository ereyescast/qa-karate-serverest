Feature: Registrar usuario - Casos negativos

Background:
    * url baseUrl
    * def gen = Java.type('utils.DataGenerator')
    * def email = gen.randomEmail()
    * def name = gen.randomName()

Scenario: No permitir email duplicado
    Given path '/usuarios'
    And request { nome: '#(name)', email: '#(email)', password: '1234', administrador: 'true' }
    When method POST
    Then status 201

    Given path '/usuarios'
    And request { nome: 'Otro', email: '#(email)', password: '9999', administrador: 'false' }
    When method POST
    Then status 400
    And match response == read('classpath:schemas/error-schema.json')


