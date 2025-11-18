Feature: Registrar usuario

Background:
    * url baseUrl
    * def gen = Java.type('utils.DataGenerator')
    * def email = gen.randomEmail()
    * def name = gen.randomName()

Scenario: Registrar usuario con datos válidos
    Given path '/usuarios'
    And request { nome: '#(name)', email: '#(email)', password: "1234", administrador: "true" }
    When method POST
    Then status 201
    And match response.message == "Cadastro realizado com sucesso"
