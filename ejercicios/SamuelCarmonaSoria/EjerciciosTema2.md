# Tema 2 Desarrollo basado en pruebas

## Ejercicio 1
###Instalar alguno de los entornos virtuales de node.js y, con ellos, instalar la última versión existente, la versión minor más actual de la 0.12 y lo mismo para la 0.11 o alguna impar. Si no se usa habitualmente este lenguaje, hacer lo mismo con cualquier otro lenguaje de scripting.

He elegido NVM como entorno virtual.
He utilizado el script install.sh para obtener la última versión , para ello he descargado el fichero de esta dirección de GitHub: https://github.com/creationix/nvm/blob/master/install.sh, lo he instalado con el siguiente comando:
```
   > *bash install.sh*
```
Y ahora ejecutamos la siguiente línea para recargar el archivo oculto *profile*.
```
   > *source ~/.profile*
```

Ahora ya podemos instalar alguna versión de node.js, con el comando *nvm ls-remote* podemos ver todos los disponibles.
Para instalar la última versión estable he usado este comando:
```
    > *nvm install stable*
      Downloading https://nodejs.org/dist/v4.2.1/node-v4.2.1-linux-x64.tar.xz...
      ######################################################################## 100,0%
      WARNING: checksums are currently disabled for node.js v4.0 and later
      Now using node v4.2.1 (npm v2.14.7)
```
Ahora instalamos la minor mas actual de la 0.12 y la 0.11.
```
     > *nvm install v0.12.7*
     > *nvm install 0.11.9*
```


Podemos mostrar las distintas versiones instaladas con:
```
     > *nvm ls*
```

Y para acceder a alguna en concreto:
```
     > *nvm use <version>*
```

![Versiones disponibles y seleccion de última estable](http://i770.photobucket.com/albums/xx346/BkY_1234/1_zpsig77qubk.jpg)



## Ejercicio 2
## Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.

He utilizado éste tutorial http://blog.koalite.com/2011/11/tutorial-node-js-express-jquery-i-creando-la-aplicacion/
ya que enseña un modelo parecido a lo que queremos montar.
Una web donde añadir contenido dinámicamente.

![Calificaciones empresas Web](http://i770.photobucket.com/albums/xx346/BkY_1234/2_zpskz7ifq1g.jpg)

El repositorio creado para el programa es el siguiente: https://github.com/Samuc/Empresas_IV_Tema2 o pulsando ![aquí](https://github.com/Samuc/Empresas_IV_Tema2)


## Ejercicio 3
##Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?

El programa ha sido ejecutado  en las versiónes:
```
  node -> stable (-> v4.2.1) (default)
  unstable -> 0.11 (-> v0.11.9) (default)
```
y funciona en ambas correctamente.
Como se muestra en la siguiente imagen:
![Probando versiones](http://i770.photobucket.com/albums/xx346/BkY_1234/3_zpsi0pbkcfh.jpg)



## Ejercicio 4
##Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente.

El paquete json ha quedado estructurado de la siguiente forma: (actualizado tras acabar los ejercicios propuestos)

```
{
  "name": "calificaciones_empresas_web",
  "version": "0.0.5",
  "private": true,
  "scripts": {
    "start": "node app"
  },
  "dependencies": {
    "express": "3.0.0rc3",
    "jade": "*"
  },
  "devDependencies": {
    "docco": "^0.7.0",
    "grunt": "^0.4.5",
    "grunt-docco": "^0.4.0"
  },
  "description": "This is just a sample app to play with:",
  "main": "GruntFile.js",
  "directories": {
    "doc": "docs",
    "test": "tests"
  },
  "repository": {
    "type": "git",
    "url": "git+https://github.com/Samuc/Empresas_IV_Tema2.git"
  },
  "author": "Samuel Carmona (Samuc)",
  "license": "SEE LICENSE IN LICENSE",
  "bugs": {
    "url": "https://github.com/Samuc/Empresas_IV_Tema2/issues"
  },
  "homepage": "https://github.com/Samuc/Empresas_IV_Tema2#readme"
}

```


## Ejercicio 5
##Automatizar con grunt y docco (o algún otro sistema) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.

Después de instalar grunt y docco con los comandos que se encuentran en el guión de prácticas, hemos creado el archivo GruntFile.js con el siguiente contenido:

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

```
samu@samu: ~/Facultad/IV/Empresas_IV_Tema2 on master
 > grunt docco
Running "docco:debug" (docco) task
docco: GruntFile.js -> docs/GruntFile.html
docco: app.js -> docs/app.html

Done, without errors.
```
Con esto ya tenemos la documentación creada, los ficheros  se pueden ver en el directorio /docs del repo, ![aquí](https://github.com/Samuc/Empresas_IV_Tema2/tree/master/docs)



## Ejercicio 6
##Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga (vamos, lo que viene siendo TDD).

He añadido primero 2 assert para comprobar que cuando se añade una opinión se hace correctamente y se consta de los objetos nombre de la empresa y opinión introducida:

```javascript
var assert = require("assert");
.
.
.
.
.
.
.
.
exports.addFact = function(req, res) {
  var hero = _(heroes).detect(function(p) {
    return p.name == req.body.name;
  });

  hero.facts.push(req.body.fact);

  assert(hero.name ,"Nombre de la empresa introducida");
  assert(req.body.fact ,"Opinión introducida");


  console.log('Test assert-> Opinión añadida correctamente a ' + hero.name + '\n Calificación añadida: ' + req.body.fact);

  res.json({status: 'ok' });
}

```
```
```

También he añadido otro assert cuando se lea una empresa del array de empresas:
```
exports.hero = function(req, res) {
  var facts = _(heroes).detect(function (p) {
    return p.name == req.params.name;
  }).facts;
  res.json(facts);

  assert(facts ,"Empresas");


  console.log('Test assert -> empresa leída');
}
```

Y probando el resultado en una ejecución del programa:
![Probando asserts](http://i770.photobucket.com/albums/xx346/BkY_1234/4_zpsxpvtna7l.jpg)



## Ejercicio 7
##Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante.

Instalamos mocha con:
```
samu@samu: ~/Facultad/IV/Empresas_IV_Tema2 on master
 > npm install -g mocha
/home/samu/.nvm/versions/node/v4.2.1/bin/mocha -> /home/samu/.nvm/versions/node/v4.2.1/lib/node_modules/mocha/bin/mocha
/home/samu/.nvm/versions/node/v4.2.1/bin/_mocha -> /home/samu/.nvm/versions/node/v4.2.1/lib/node_modules/mocha/bin/_mocha
mocha@2.3.3 /home/samu/.nvm/versions/node/v4.2.1/lib/node_modules/mocha
├── escape-string-regexp@1.0.2
├── commander@2.3.0
├── diff@1.4.0
├── growl@1.8.1
├── supports-color@1.2.0
├── mkdirp@0.5.0 (minimist@0.0.8)
├── jade@0.26.3 (commander@0.6.1, mkdirp@0.3.0)
├── debug@2.0.0 (ms@0.6.2)
└── glob@3.2.3 (inherits@2.0.1, graceful-fs@2.0.3, minimatch@0.2.14)
```

Tras ello he creado un directorio llamado /tests donde he ubicado el archivo test.js con el siguiente contenido:
```javascript
var assert = require("assert");
empresas_app = require(__dirname+"/../app.js");

describe('Empresas', function(){
    describe('Carga', function(){
        it('Debe cargar el programa web sin problemas', function(){
            assert(empresas_app, "El programa se ha cargado sin problemas");
        });
    });
});

```
Ahora ejecutamos este fichero con mocha:
```
samu@samu: ~/Facultad/IV/Empresas_IV_Tema2 on master
 > mocha tests/test.js

Express server listening on port 3000
  Empresas
    Carga
      ✓ Debe cargar el programa web sin problemas


  1 passing (7ms)
```


## Ejercicio 8
## Ejercicio: Haced los dos primeros pasos antes de pasar al tercero.

### 1. Darse de alta. Muchos están conectados con GitHub por lo que puedes usar directamente el usuario ahí. A través de un proceso de autorización, acceder al contenido e incluso informar del resultado de los tests.

 He entrado en https://travis-ci.org/ y me he conectado con mi usuario de GitHub.

### 2. Activar el repositorio en el que se vaya a aplicar la integración continua. Travis permite hacerlo directamente desde tu configuración; en otros se dan de alta desde la web de GitHub.

He activado el directorio creado para éstos ejercicios en Travis:
https://github.com/Samuc/Empresas_IV_Tema2

Y he añadido un archivo .travis.yml en el directorio del repo:
```
language: node_js
node_js:
  - "0.10"
  - "0.11"
before_install:
  - npm install -g mocha
  - npm install .
script: mocha tests/test.js
```
Ahora, cuando hagamos un commit y push, en nuestro perfil en Travis podemos ver como ha pasado el test correctamente:
![Prueba con travis ](http://i770.photobucket.com/albums/xx346/BkY_1234/5_zpsuworj4k5.jpg)
