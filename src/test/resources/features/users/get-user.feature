Feature: Buscar usuario

    Background:
        * url baseUrl
        * def gen = Java.type('utils.DataGenerator')
        * def email = gen.randomEmail()
        * def name = gen.randomName()

    Scenario: Obtener usuario por ID
        Given path '/usuarios'
        And request { nome: '#(name)', email: '#(email)', password: "1234", administrador: "true" }
        When method POST
        Then status 201
        * def id = response._id

        Given path '/usuarios', id
        When method GET
        Then status 200
        * def schema = read('classpath:schemas/user-schema.json')
        And match response == schema
