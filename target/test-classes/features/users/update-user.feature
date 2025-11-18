Feature: Actualizar usuario

Background:
    * url baseUrl
    * def gen = Java.type('utils.DataGenerator')
    * def email = gen.randomEmail()
    * def name = gen.randomName()

Scenario: Actualizar usuario existente
    Given path '/usuarios'
    And request { nome: '#(name)', email: '#(email)', password: "1234", administrador: "true" }
    When method POST
    Then status 201
    * def id = response._id

    Given path '/usuarios', id
    And request { nome: 'Nuevo Nombre', email: '#(email)', password: "9999", administrador: "true" }
    When method PUT
    Then status 200
    And match response.message == "Registro alterado com sucesso"
