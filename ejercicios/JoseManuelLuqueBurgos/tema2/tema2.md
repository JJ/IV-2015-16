# Ejercicios Tema 2

## Ejercicio 1

Instalar alguno de los entornos virtuales de node.js (o de cualquier otro lenguaje con el que se esté familiarizado) y, con ellos, instalar la última versión existente, la versión minor más actual de la 4.x y lo mismo para la 0.11 o alguna impar (de desarrollo)

 1. Instalamos y configuramos nvm:
	#yaourt install -S nvm
Configuramos la variable de entorno añadiendo lo siguiente al .zshrc/bashrc
	export NVM_DIR="$HOME/.nvm"
	source /usr/share/nvm/nvm.sh
	source /usr/share/nvm/bash_completion

 2. Instalamos las diferentes versiones:
	jose@tux2duo ⮀ ~/iv/ejercicios ⮀ ⭠ master ±⮀ nvm install 0.10
	Now using node v0.10.40 (npm v1.4.28)

	jose@tux2duo ⮀ ~/iv/ejercicios/ ⮀ ⭠ master ±⮀ nvm install 4.2.1
	WARNING: checksums are currently disabled for node.js v4.0 and later
	Now using node v4.2.1 (npm v2.14.7)

 	jose@tux2duo ⮀ ~/iv/ejercicios/ ⮀ ⭠ master ±⮀
	nvm install 0.11.9
	Now using node v0.11.9 (npm v1.3.15)

 3. Podemos listar los entornos disponibles con:
  nvm ls

 4. Podemos acceder a cualquiera de ellas usando:
	nvm use <version>


## Ejercicio 2

Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.

Usaremos Express, Jade y MongoDB para crear la aplicación que se encuentra
ésta [dirección](https://github.com/luqueburgosjm/WebIV)

## Ejercicio 3

Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?

Ejecutándolo en las versiónes
  * node -> stable (-> v4.2.1) (default)
  * unstable -> 0.11 (-> v0.11.9) (default)

funciona en ambas correctamente.

## Ejercicio 4

Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente.

La estructura del paquete json queda definida de la siguiente forma:

```json
{
  "name": "CalificacionEmpresas",
  "version": "0.0.0",
  "private": true,
  "scripts": {
    "start": "node ./bin/www"
  },
  "dependencies": {
    "app.json": "^1.3.0",
    "body-parser": "~1.12.4",
    "cookie-parser": "~1.3.5",
    "debug": "~2.2.0",
    "express": "~4.12.4",
    "express-session": "^1.11.3",
    "jade": "~1.9.2",
    "mongodb": "~2.0.33",
    "monk": "~1.0.1",
    "morgan": "~1.5.3",
    "serve-favicon": "~2.2.1"
  }
}
```

## Ejercicio 5
Automatizar con grunt y docco (o algún otro sistema) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.

Trans instalar grunt-cli, docco y grunt-docco creamos el archivo Gruntfile.js con la siguiente estructura:

```json
'use strict';

module.exports = function(grunt) {
  grunt.initConfig({
  pkg: grunt.file.readJSON('package.json'),
  docco: {
	  debug: {
	  src: ['*.js', 'routes/*.js'],
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

Ejecutando grunt docco nos genera la siguiente salida:

>Running "docco:debug" (docco) task
>docco: Gruntfile.js -> docs/Gruntfile.html
>docco: app.js -> docs/app.html
>docco: routes/alumnos.js -> docs/alumnos.html
>docco: routes/index.js -> docs/index.html
>docco: routes/login.js -> docs/login.html
>docco: routes/nuevaempresa.js -> docs/nuevaempresa.html
>docco: routes/nuevoalumno.js -> docs/nuevoalumno.html
>docco: routes/votar.js -> docs/votar.html

>Done, without errors.

Y con esto ya tenemos la documentación generada en el directorio /docs indicado en el Gruntfile.

## Ejercicio 6

Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga (vamos, lo que viene siendo TDD).

He añadido dos assert para comprobar que las colecciones de la base de datos son leídas correctamente

```javascript

/* GET Alumnos. */
    router.get('/alumnos', function(req, res) {
        var db = req.db;
        var collection = db.get('alumnos');
        var collection2 = db.get('empresa');

        assert(collection, "Coleccion alumnos");
        assert(collection2, "Coleccion empresas");

        collection.find({},{},function(e,docs){

          collection2.find({}, { sort : { "puntuacion" : -1 }},
            function (err, emp){
              console.log(emp);
              res.render('alumnos', {
                  "alumnos" : docs,
                  "empresas" : emp,
                  "usuario" : req.session.usuario
              });
          });
        });

        console.log("Acceso a BD correcto");

    });
```

## Ejercicio 7

Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante.

Tras instalar mocha creamos el archivo test/test.js que contiene lo siguiente:

```javascript

var assert = require("assert");
web = require(__dirname+"/../app.js");

describe('Web', function(){
    describe('Web', function(){
        it('Carga el fichero app.js', function(){
            assert(web, "Cargado");
        });
    });
});

```
y ahora lanzamos mocha:

mocha test/test.js

> jose@tux2duo ⮀ ~/ugr/IV/WebIV/CalificacionEmpresas ⮀ ⭠ master ±⮀ mocha test/test.js
 version


>  Web
>    Web
>      ✓ Carga el fichero app.js


>  1 passing

## Ejercicio 8

 1. Darse de alta. Muchos están conectados con GitHub por lo que puedes usar directamente el usuario ahí. A través de un proceso de autorización, acceder al contenido e incluso informar del resultado de los tests.

  * [x]

 2. Activar el repositorio en el que se vaya a aplicar la integración continua. Travis permite hacerlo directamente desde tu configuración; en otros se dan de alta desde la web de GitHub.
  * [x]
 3. Crear un fichero de configuración para que se ejecute la integración y añadirlo al repositorio.

 Definimos los test en packages.json

```json
"scripts": {
  "test": "./node_modules/mocha/bin/mocha test/test.js"
}
```

 El fichero creado para integración continua usando Travis es el siguiente:

 ```json
  language: node_js

  node_js:
    - "4.2.1"

  before_install:
    cd CalificacionEmpresas
    npm install
```

Ahora ya podemos ver en travis como pasa los test automáticamente cada vez que hacemos un commit.

![test](https://api.travis-ci.org/luqueburgosjm/WebIV.svg?branch=master)
