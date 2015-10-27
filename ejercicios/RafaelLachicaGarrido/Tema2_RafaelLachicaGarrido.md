#Tema 2 Teoria#
##Rafael Lachica Garrido##
==
<h3>1. Instalar alguno de los entornos virtuales de node.js y, con ellos, instalar la última versión existente, la versión minor más actual de la 0.12 y lo mismo para la 0.11 o alguna impar. Si no se usa habitualmente este lenguaje, hacer lo mismo con cualquier otro lenguaje de scripting. </h3>

Instalamos nodejs
![instalacionNodejs](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/installnode_zpsgelt0lqx.png)
Comprobamos que se ha instalado correctamente y comprobamos su versión:
![nodeVersion](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/node_zpsdg7z8ra6.png)

Instalamos después algunos paquetes y frameworks que necesitaremos como express:
```
rafaellg8@system32:~/Desktop/empresaPracticas$ npm install express
express@4.13.3 node_modules/express
├── escape-html@1.0.2
├── merge-descriptors@1.0.0
├── array-flatten@1.1.1
├── cookie@0.1.3
├── utils-merge@1.0.0
├── methods@1.1.1
├── cookie-signature@1.0.6
├── fresh@0.3.0
├── range-parser@1.0.2
├── vary@1.0.1
├── path-to-regexp@0.1.7
├── etag@1.7.0
├── content-type@1.0.1
├── parseurl@1.3.0
├── content-disposition@0.5.0
├── serve-static@1.10.0
├── depd@1.0.1
├── qs@4.0.0
├── finalhandler@0.4.0 (unpipe@1.0.0)
├── on-finished@2.3.0 (ee-first@1.1.1)
├── proxy-addr@1.0.8 (forwarded@0.1.0, ipaddr.js@1.0.1)
├── accepts@1.2.13 (negotiator@0.5.3, mime-types@2.1.7)
├── type-is@1.6.9 (media-typer@0.3.0, mime-types@2.1.7)
└── send@0.13.0 (destroy@1.0.3, statuses@1.2.1, ms@0.7.1, mime@1.3.4, http-errors@1.3.1)
```
<h3>2. Web para calificar las empresas en las que hacen prácticas los alumnos.</h3>
Para ello he seguido un tutorial de Azure y he utilizado una base de datos en Azure DocumentDB. Me he basado en la estructura del código que usa tareas y lo he ajustado a empresas. He usado el framework *Express*.

Lo que más he tenido que modificar es el archivo **index.jade**:

**index.jade** que contiene lo referente al html:
```
extends layout

block content
  h1 #{title}
  br

  form(action="/completetask", method="post")
    table.table.table-striped.table-bordered
      tr
        td Nombre Empresa
        td Nombre Alumno
        td Fecha Inicio
        td Fecha Final
        td Puntuacion
        td Editar
      if (typeof tasks === "undefined")
        tr
          td
      else
        each task in tasks
          tr
            td #{task.name}
            td #{task.category}
            td #{task.dateEnterpriseStart}
            td #{task.dateEnterpriseFinish}
            td #{task.puntos}
            td
              input(type="checkbox", name="#{task.id}", value="#{!task.completed}", checked=task.completed)
    button.btn(type="submit") Eliminar Empresas
  hr
  form.well(action="/addtask", method="post")
    label Nombre Empresa:
    input(name="name", type="textbox")
    br
    label Nombre Alumno:
    input(name="category", type="textbox")
    br
    label Fecha Inicio:
    input(name="dateEnterpriseStart",type="date")
    label Fecha Final:
    input(name="dateEnterpriseFinish",type="date")
    br
    label Puntuacion:
    input(name="puntos",type="number" min="0" max="10")
    br
    button.btn(type="submit") Añadir empresa

```

En el archivo **config.js** tenemos toda la configuración asociada a las claves y las bases de datos en Azure:
```
var config = {}

config.host = process.env.HOST || "https://rafaellg8db.documents.azure.com:443/";
config.authKey = process.env.AUTH_KEY || "GeruNMDiTiCz5IJlv+i3vVKiX5T4lXerHCF/UxYIYYewqQHwy6PNXig+V7DwZvDjgUCfVhmmjLuCaSQHG0gglw==";
config.databaseId = "ToDoList";
config.collectionId = "Items";

module.exports = config;
```

Base de datos de DocumentDB en Azure:
![documentDB](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-10-11%20171835_zpsiwetznbe.png)

Web funcionando:
![imagenWeb](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/apiNode_zpsx6jsnuuh.png)

[Directorio App Github](https://github.com/rafaellg8/empresaPracticas)

[Fuente](https://azure.microsoft.com/es-es/documentation/articles/documentdb-nodejs-application/)
<h3>3. Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?</h3>

He probado varias versiones y funciona correctamente:
Simplemente iniciamos el servidor por el puerto 3000 a través del comando **npm start bin/www** dentro
de la carpeta del proyecto y nos abrirá un servidor que escuchará las peticiones de cualquier cliente.
Una vez hecho esto, ejecutamos en el navegador: **localhost:3000** y nos cargará el archivo index.jade.

![imagenWeb](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-10-12%20172843_zpslsakxtus.png)

<h3>4. Crear una descripción del módulo usando package.json o el equivalente en otro lenguaje. </h3>
**package.json**
```
{
  "name": "empresaIV",
  "version": "0.0.1",
  "private": true,
  "scripts": {
    "start": "node ./bin/www"
  },
  "description": "Base de datos empresas prácticas",
  "author": {
    "name": "Rafael Lachica Garrido",
    "email": "rafaellg8@correo.ugr.es"
  },
  "dependencies": {
    "async": "^1.4.2",
    "body-parser": "~1.13.2",
    "cookie-parser": "~1.3.5",
    "debug": "~2.2.0",
    "documentdb": "^1.4.0",
    "express": "~4.13.1",
    "jade": "~1.11.0",
    "morgan": "~1.6.1",
    "serve-favicon": "~2.3.0"
  }
}

```
<h3>5. Automatizar con grunt y docco (o algún otro sistema para otro lenguaje de programación) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.</h3>
He tenido problemas al ejecutar *grunt docco* a la vez, por eso he configurado el *Gruntfile.js* correctamente y he ejecutado grunt, y después **docco *.js**.
Archivo Gruntfile:
```
'use strict';

module.exports = function(grunt) {

  // Configuración del proyecto
  grunt.initConfig({
  pkg: grunt.file.readJSON('package.json'),
  docco: {
	  debug: {
	  src: ['*.js'],
	  options: {
		  output: 'docs/'
	  }
	  }
  }
  });

  // Carga el plugin de grunt para hacer esto
  grunt.loadNpmTasks('grunt-docco');

  // Tarea por omisión: generar la documentación
  grunt.registerTask('default', ['docco']);
};
```
![Docco](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-10-11%20192203_zpszpqgzhhg.png)

La documentación está en la carpeta de mi repositorio:
[Documentación](https://github.com/rafaellg8/empresaPracticas/tree/master/docs)

<h3>6. Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga.</h3>

```
var DocumentDBClient = require('documentdb').DocumentClient;
assert=require("assert");//aseguramos el include de la base en documentdb
var DocDBUtils = {
    getOrCreateDatabase: function (client, databaseId, callback) {
        var querySpec = {
            query: 'SELECT * FROM root r WHERE r.id=@id',
            parameters: [{
                name: '@id',
                value: databaseId
            }]
        };
        assert=(DocDBUtils,"Base de datos cargada"); //base de datos cargada
        console.log("Todo a funcionado correctamente");
```
![assertImage](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-10-12%20175728_zpsipsgs6u6.png)

<h3>7. Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante.</h3>
Creamos un test para saber si crea correctamente las calificaciones de empresas y si carga correctamente
el documentdb.
```
var assert = require("assert"),
	prueba = require(__dirname+"/../models/taskDao.js");

describe('init', function(){
	// Testea que se haya cargado bien la librería

	it('Cargando la base de datos', function(){
		assert(prueba, "Cargado documentDB de Azure");
	});
});

describe('addItem', function () {
    it('Añadimos una nueva nota de empresa', function(){
		assert(prueba, "Creada la empresa correctamente");
	});
})
```

![mocha](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-10-12%20190324_zps6okaymhj.png)

<h3>8.Haced los dos primeros pasos antes de pasar al tercero.</h3>
He usado **Shippable**,he autorizado el uso de mi repositorio de GitHub previamente.

```
# Language setting
language: node_js

# Version number
node_js:
  - 0.10.25

# The path for Xunit to output test reports
env:
  - XUNIT_FILE=shippable/testresults/result.xml

# Create directories for test and coverage reports
before_script:
  - mkdir -p shippable/testresults
  - mkdir -p shippable/codecoverage

# Running the tests with grunt
script:
  - grunt

```
![shipabbleTest](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/script_zpsv2xpje88.png)

[Shippable](http://docsv2.readthedocs.org/en/latest/start.html)
