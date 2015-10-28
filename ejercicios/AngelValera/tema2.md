# **Ejercicios Tema 2**

###**Ejercicio 1**:Instalar alguno de los entornos virtuales de node.js (o de cualquier otro lenguaje con el que se esté familiarizado) y, con ellos, instalar la última versión existente, la versión minor más actual de la 4.x y lo mismo para la 0.11 o alguna impar (de desarrollo).


En mi caso he decidido usar NVM. Para su instalación tenemos que hacer lo siguiente:

 * Lo primero es descargarnos el script de instalación:

`curl -o-https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash`

* Con el anterior comando lo que hemos conseguido es clonar ese repositorio en ~/.nvm y también lo instala.

* Ahora lo siguiente es instalar alguna versión de node.js, para ver que versiones hay disponibles podemos usar: nvm ls-remote

* Para instalar la versión estable más moderna podemos poner: **nvm install stable que nos instala la v4.1.2**

* También instalamos las versiones más recientes de la 0.12 y la 0.11 con: **nvm install v0.12.7** y **nvm install v0.11.16**
* Por último podemos ver las versiones instaladas de node.js que tenemos, usando para ello **nvm ls** y para cambiar y usar una versión u otra utilizamos por ejemplo nvm use:**nvm use v0.12.7** y para parar el entorno virtual usamos **nvm deactivate**.

###**Ejercicio 2**:Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.

Para realizar esta aplicación he utilizado el framework Express, Jade para crear la vista de la aplicación y mysql para la persistencia de datos.
Se trata de una aplicación en la que puedes registrarte como alumno iniciar sesión y poner una puntuación a las empresas que haya insertadas en la aplicación, por último puedes ver las puntuaciones que ha introducido cada usuario.El repositorio de la aplicación se puede ver [aquí.](https://github.com/AngelValera/Ejercicio2-Tema2.git)

Podemos ver una prueba de ejecución  en la siguiente imagen
![prueba ejecución](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema2/Seleccioacuten_001_zpsndermmf8.png)
###**Ejercicio 3**:Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?

He ejecutado el prgrama en las versiones **v4.1.2** y **v0.12.7** y como podemos ver en la imagen siguiente en ambas funciona.

![prueba ejecución](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema2/ejercicio3-Tema2_zpsaur0yiwm.png)


###**Ejercicio 4**:Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente.
En mi caso la información que muestra el archivo json es la siguiente:

```json
{
  "name": "vota-Empresa",
  "version": "0.0.1",
  "private": true,
  "scripts": {
    "start": "node ./bin/www"
  },
  "dependencies": {
    "express": "~3.4.8",
    "static-favicon": "~1.0.0",
    "morgan": "~1.0.0",
    "cookie-parser": "~1.0.1",
    "body-parser": "~1.0.0",
    "debug": "~0.7.4",
    "jade": "~1.3.0",
    "express-session": "~1.11.3",
    "mysql": "~2.9.0"
  },
  "devDependencies": {
    "docco": "^0.7.0",
    "grunt": "^0.4.5",
    "grunt-docco": "^0.4.0",
    "should": "^7.1.1",
    "supertest": "^1.1.0"
  }
}

```
###**Ejercicio 5**:Automatizar con grunt y docco (o algún otro sistema) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.
Una vez instalados grunt-cli de forma global,con el comando **sudo npm install -g grunt-cli**, docco y grunt-docco, con el coamndo **npm install docco grunt-docco --save-dev** Se nos debe haber creado en el raiz del proyecto el archivo **Gruntfile.js** con la siguiente estructura:

```json
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
Hecho esto, lo que tenemos que hacer es generar la documentación y para ello ejecutamos el comando **grunt docco**, lo cual nos genera un directorio /docs con la documentación del proyecto.
###**Ejercicio 6**:Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga (vamos, lo que viene siendo TDD).


Lo que he hecho a sido añadir una serie de aserciones a la hora de que un alumno se identifique, para poder votar las empresas.


```javascript
var assert = require('assert');

//Permite autenticar un usuario
app.post('/autenticar', function(req, res){
  var objBD = BD();
  var email = req.body.txtEmail;
  var clave = req.body.txtClave;

   assert(email, "email del alumno");
   assert(clave, "clave del alumno");
   console.log("Identificación completada con éxito");

  objBD.query('SELECT * FROM alumnos WHERE email LIKE "'+ email +'" AND contraseña LIKE "'+ clave +'"', function( error, resultado, fila){
    if(!error){
      if(resultado.length > 0){
        req.session.nombre = email;
        res.redirect('/votacion');
      }else{
        res.send('El usuario no existe o sus datos son incorrectos');
      }
    }else{
      console.log('Error');
    }
  });
});
//---------------------------------------
```
El resultado lo podemos ver en la siguiente imagen.
![prueba ejecución](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema2/Seleccioacuten_002_zps02uabps2.png)

###**Ejercicio 7**:Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante.

Lo primero que debemos hacer es instalar mocha, para ello usamos el comando **sudo npm install -g mocha**.

Hecho esto , lo siguiente es crear en el directorio raíz de nuestro proyecto, un nuevo directorio, al que llamaremos **test** y dentro generamos el fichero **test.js** en el cual introducimos la parte de nuestro proyecto que queremos testear.

En mi caso, he utilizado las librerías **supertest** y **shoudl** en lugar de usar assert, el contenido de test.js , es el siguiente:


```javascript
var request = require('supertest'),
should = require('should'),

app = require('../app.js');

describe( "Vota empresas", function() {
    it('should return correct type', function (done) {
	request(app)
	    .get('/')
	    .expect('Content-Type', /html/)
	    .expect(200,done);
    });
});

```
Lo que testea es que al llamar a la aplicación, esta devuelve el contenido adecuado, en este caso html. Se ejecuta con el comando **mocha test/test.js** y el resultado lo podemos ver en la siguiente imagen.
![prueba ejecución](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema2/Seleccioacuten_003_zps2xi1bxpk.png)


###**Ejercicio 8**: Añadiendo integración continua: Haced los dos primeros pasos antes de pasar al tercero.

Para la integración continua he decidido usar Travis, lo primero que debemos hacer es:

1. Darse de alta. Muchos están conectados con GitHub por lo que puedes usar directamente el usuario ahí. A través de un proceso de autorización, acceder al contenido e incluso informar del resultado de los tests.

2. Activar el repositorio en el que se vaya a aplicar la integración continua. Travis permite hacerlo directamente desde tu configuración; en otros se dan de alta desde la web de GitHub.
![test](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema2/Seleccioacuten_004_zps9pnxkpu6.png)
Ahora añadimos un fichero de configuración para que se ejecute la integración, al cual llamaremos .travis.yml, y lo subimos a nuestro repositorio, en ese fichero añadimos las siguientes líneas:

```json
language: node_js

node_js:
  - "4.2.1"

before_install:
  - npm install -g mocha
  - cd votaEmpresa; npm install .
script: mocha
```
Hecho esto tenemos que añadir al fichero packages.json, la siguiente línea para definir los test.

```json
"scripts": {
    "test": "mocha "	
```

Ahora ya podemos ver en travis si pasa los test o si no los pasa, en cualquiera de los casos te envía un aviso a nuestro email, cada vez que hacemos un commit. Si pasa el test debe aparecer la siguiente imagen.
![test](https://travis-ci.org/AngelValera/Ejercicio2-Tema2.svg?branch=master)

Un ejemplo de que debe aparecer al pasar el test es:
![test](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema2/Seleccioacuten_005_zpsflznlage.png)








