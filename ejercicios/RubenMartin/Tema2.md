# Ejercicios de Rubén Martín Hidalgo
## Tema 2
### Ejercicio 1: Instalar alguno de los entornos virtuales de node.js y, con ellos, instalar la última versión existente, la versión minor más actual de la 0.12 y lo mismo para la 0.11 o alguna impar.

En mi caso me he decantado por NVM. Para su instalación, hay que seguir los siguientes pasos:

1. Descargamos el script de instalación de nvm: *curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.28.0/install.sh | bash*

2. El comando anterior habrá clonado el repositorio en ~/.nvm y por tanto ya tenemos instalado nvm. 

3. Ejecutamos *source ~/.profile* en el terminal, para recargar el archivo ~/.profile.

4. Ya podemos instalar alguna versión de node.js, podemos ver las que hay disponibles con: *nvm ls-remote*

5. Para instalar la versión estable más moderna podemos poner: *nvm install stable* que nos instala la v4.1.2

6. También instalamos las versiones más recientes de la 0.12 y la 0.11 con: *nvm install v0.12.7* y *nvm install v0.11.16*

7. Por último, podemos ver las versiones instaladas con el comando *nvm ls*.

![Versiones nodejs instaladas](https://www.dropbox.com/s/brsg2qi0l38vmcg/VersionesNodejs.PNG?dl=1)

### Ejercicio 2: Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.

1. Decimos a NVM la versión de Node.js que queremos usar con: *nvm use v4.1.2*

Procedemos a instalar una base de datos, en mi caso he elegido MongoDB: 

2. Importamos la llave pública del sistema: *sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10*

3. Agregamos el repositorio de MongoDB: *echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list*

4. Actualizamos los paquetes de apt-get: *sudo apt-get update*

5. Instalamos MongoDB: *sudo apt-get install -y mongodb-org*

6. Y por último, iniciamos el proceso que actua como servidor de mongo: *sudo service mongod start*

Ahora vamos a instalar el Node.js MondoDB Driver siguiendo los siguientes pasos:

7. *sudo apt-get install libkrb5-dev*

8. *npm install mongodb*

9. *npm install bcrypt-nodejs*

También he instalado SQLite con: *npm install sqlite3*

Con esto ya tenemos Node.js y las bases de datos listos para comenzar a programar!!

En mi caso, he creado un chat online. El repositorio del programa que he creado esta [aquí](https://github.com/romilgildo/Chat)

Para ejecutarlo simplemente, clonamos el repositorio con *git clone*, y hacemos *node server.js* en el directorio raíz de la aplicación.

Aquí una muestra de la aplicación funcionando:

![Chat funcionando](https://www.dropbox.com/s/lowzouqp7ulozm9/ChatFuncionando.PNG?dl=1)

### Ejercicio 3: Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?

Ya hemos probado antes en la versión estable 4.1.2 de node.js. Ahora probamos con el resto de versiones que habíamos instalado en el ejercicio 1:

- v0.11.16 -> Funciona correctamente
- v0.12.7 -> Funciona correctamente

![Funciona en todas las versiones probadas](https://www.dropbox.com/s/hh8gis6271t5nq0/ChatFuncionandoOtrasversiones.PNG?dl=1)

### Ejercicio 4: Crear una descripción del módulo usando package.json o el equivalente en otro lenguaje.

Lo he hecho con el comando *npm init* ejecutado dentro del directorio de la aplicación.
Solo habrá que ir rellenando los distintos parámetros que nos pide. Al final nos queda algo así:

![Ejemplo de package.json](https://www.dropbox.com/s/gwhoyu8ipsbubfr/packageJSON.PNG?dl=1)

### Ejercicio 5: Automatizar con grunt y docco (o algún otro sistema para otro lenguaje de programación) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.

Primero debemos instalar grunt y docco con los siguientes comandos:

1. *npm install -g grunt-cli*

2. *npm install docco grunt-docco --save-dev*

Ahora pasamos a crear el Gruntfile.js (en el directorio raíz de la aplicación que estamos creando):

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

Y por último ejecutamos *grunt*, que produce la siguiente [documentación](https://github.com/romilgildo/Chat/tree/master/docs).

![Creación de documentación con Grunt](https://www.dropbox.com/s/u768mvdz7edaoyy/ejecucionGrunt.PNG?dl=1)

### Ejercicio 6: Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga

He añadido dos asersiones tras hacer el Login del usuario, y podemos ver que ambos tests han sido superados.

```
var assert = require("assert");

app.post('/login', function (req, res) {
	var username = req.body.username;
	var password = req.body.password;

	assert(username, "Login username");
	assert(password, "Login password");
	console.log("Usuario logueado correctamente");
});
```

![Test con assert](https://www.dropbox.com/s/bhv8gzonwqgaizw/assertNode.PNG?dl=1)

### Ejercicio 7: Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta.

Ahora he hecho los test en la función que guarda y envía los mensajes.

1. Instalamos mocha con: *npm install -g mocha*

2. Creamos un directorio para tests, y dentro de este, el fichero test.js

```
var assert = require("assert");
chat = require(__dirname+"/../server.js");

describe('Chat', function(){
	describe('Carga', function(){
		it('Debe cargar el programa', function(){
			assert(chat, "Cargado");
		});
	});
});

```

3. Ejecutamos el test con *mocha test/test.js*

![Ejecución correcta de Mocha](https://www.dropbox.com/s/kfzx9g98pgqx6dj/testMocha.PNG?dl=1)

### Ejercicio 8: Haced los dos primeros pasos antes de pasar al tercero.

1. Me he dado de alta en Shippable conectándome directamente desde mi usuario en GitHub.

2. Creamos el fichero shippable.yml con el siguiente contenido:

```
# Build Environment
build_environment: Ubuntu 14.04

# language setting
language: node_js

# version numbers, testing against two versions of node
node_js:
 - "0.11"
 - "0.12"

# npm install runs by default but shown here for illustrative purposes
before_install:
 - npm install -g mocha
 
 # Running npm test to run your test cases
script:
 - mocha
 ```
 
3. Cargamos el repositorio y le damos a BUILD THIS BRANCH, y ya tendremos activada la integración contínua.

Podemos ver el correcto funcionamiento cuando cada vez que hacemos un push del repositorio, automáticamente se ejecutan los test indicados, y si se pasan, marca el build con "succes".

![Integración continua con Shippable](https://www.dropbox.com/s/8yu4xssngstoyqm/succesShippable.PNG?dl=1)
