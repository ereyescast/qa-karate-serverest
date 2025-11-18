Proyecto QA – Pruebas Automatizadas con Karate (Serverest)
Descripción

Este proyecto contiene pruebas automatizadas de API usando Karate DSL, organizadas por módulos y tipos de escenarios (positivos y negativos).
Las pruebas están orientadas al servicio Serverest para la gestión de usuarios.

Incluye:

Escenarios de creación, actualización, eliminación, consulta y listado.

Casos negativos separados en su carpeta propia.

Validaciones mediante JSON Schemas.

Runner para ejecutar todas las pruebas con Maven.

src
└── test
├── java
│    ├── runners
│    │      └── UsersRunner.java
│    └── utils
└── resources
├── features
│    ├── negatives
│    │      ├── create-user-negative.feature
│    │      ├── delete-user-negative.feature
│    │      ├── get-user-negative.feature
│    │      ├── list-users-negative.feature
│    │      └── update-user-negative.feature
│    ├── users
│    │      ├── create-user.feature
│    │      ├── delete-user.feature
│    │      ├── get-user.feature
│    │      ├── list-users.feature
│    │      └── update-user.feature
│    └── test-config.feature
├── schemas
│    ├── error-schema.json
│    ├── list-users-schema.json
│    ├── success-schema.json
│    └── user-schema.json
└── karate-config.js
pom.xml
README.md

Requisitos Previos

Asegúrate de tener instalado:

Java 8+

Maven 3.6+

IDE recomendado: IntelliJ IDEA o VSCode con Karate Plugin


Configuración – karate-config.js

Archivo:
src/test/resources/karate-config.js

Ejemplo:
function fn() {
return {
baseUrl: 'https://serverest.dev'
};
}


▶Ejecutar todas las pruebas
mvn test

▶Ejecutar solo pruebas de usuarios
mvn test -Dtest=UsersRunner

Ejecutar pruebas por tag
mvn test -Dkarate.options="--tags @negativo"


Feature: Eliminar usuario - Caso negativo

Background:
* url baseUrl

Ejemplo de Feature Negativo
Scenario: Intento de eliminar usuario inexistente
Given path '/usuarios', 'idDesconocido456'
When method DELETE
Then status 200
And match response.message == "Nenhum registro excluído"

Autor: Eder Paul Reyes Castro
MIT License.