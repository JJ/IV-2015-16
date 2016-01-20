#Ejercicios tema 2
--------
##Ejercicio 1

####Instalar alguno de los entornos virtuales de node.js (o de cualquier otro lenguaje con el que se esté familiarizado) y, con ellos, instalar la última versión existente, la versión minor más actual de la 4.x y lo mismo para la 0.11 o alguna impar (de desarrollo).

Instalamos nvm en mac OS X siguiendo los [pasos](http://blog.dynamicprogrammer.com/2014/02/18/installing-node-js-on-mac-osx.html)

Con el comando #nvm install v0.11.12 instalamos la verisión 0.11.12 de node.js

Con el mismo comando instalamos la version 4.2.1

Para cambiar la version de node se usa el comendo nvm use "version de node"

**Pasos para arrancar el servidor node.**

Entramos en el directorio .nvm
Luego listamos las versiones con el comando nvm ls. Luego  con el comando nvm use "version" seleccionamos la version.Luego ya podemos ejecutar cualquier fichero .js

##Ejercicio2
 
####Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.Se trata de hacer una aplicación simple que se pueda hacer rápidamente con un generador de aplicaciones como los que incluyen diferentes marcos MVC. Si cuesta mucho trabajo, simplemente prepara una aplicación que puedas usar más adelante en el resto de los ejercicios.
creamos dos fichero Empresa.js y main.js
	
~~~
//Empresa.js
var Empresa = function(codigo,nombre,calificacion){

this.codigo;
this.nombre;
this.calificacion;

this.printInfo=function(){
	console.log('el codigo de la empresa es:', codigo);
	console.log('el nombre de la empresa es:', nombre);
	console.log('el calificacion de la empresa es:', 	calificacion);
}
	this.test=function(){
	console.log('testing');
}
return this;

}
module.exports.Empresa = Empresa;
~~~

y el fichero main.js es 

~~~
//main.js

var empresa = require('./Empresa.js');

var coleccionEmpresas = [];

for(var i=0; i<4;i++){
	var esta_empresa=new empresa.Empresa(i,0,10);
	coleccionEmpresas.push(esta_empresa);
}

coleccionEmpresas[0].calificacion=9;

for( var i in coleccionEmpresas){
	coleccionEmpresas[i].printInfo();
}

~~~


##Ejercicio 3
####Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?
Ejecutamos el programa en las versiones v0.11.12 (inestable) y la version v.4.2.1 (estable). observamos que funciona en las dos versiones.

Ejecutamos el código en la version  0.11.12

~~~
cvi081149:~ bogdan$ nvm ls
->     v0.11.12
         v4.2.1
node -> stable (-> v4.2.1) (default)
stable -> 4.2 (-> v4.2.1) (default)
unstable -> 0.11 (-> v0.11.12) (default)
iojs -> N/A (default)
cvi081149:~ bogdan$ node main.js 
el codigo de la empresa es: x
el nombre de la empresa es: 0
el calificacion de la empresa es: 10
el codigo de la empresa es: x
el nombre de la empresa es: 0
el calificacion de la empresa es: 10
el codigo de la empresa es: x
el nombre de la empresa es: 0
el calificacion de la empresa es: 10
el codigo de la empresa es: x
el nombre de la empresa es: 0
el calificacion de la empresa es: 10

~~~
Ahora ejecutamos en la version 4.2.1

~~~
cvi081149:~ bogdan$ nvm use stable
Now using node v4.2.1 (npm v2.14.7)
cvi081149:~ bogdan$ node main.js 
el codigo de la empresa es: x
el nombre de la empresa es: 0
el calificacion de la empresa es: 10
el codigo de la empresa es: x
el nombre de la empresa es: 0
el calificacion de la empresa es: 10
el codigo de la empresa es: x
el nombre de la empresa es: 0
el calificacion de la empresa es: 10
el codigo de la empresa es: x
el nombre de la empresa es: 0
el calificacion de la empresa es: 10
cvi081149:~ bogdan$ 
~~~

Observamos que el código se ejecuta con ambas versiones.

##Ejercicio 4

####Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente.

El fichero package.json quedaría asi 

~~~
{
  "author": "Bogdan Muresan <alinugr@gmail.com> (https://github.com/bogdananas/Desarrollo-basado-en-pruebas)",
  "name": "Ej2_Empresas",
  "description": "Clasificacion de empresas",
  "version": "0.1",
  "repository": {
  "url": "git@github.com:bogdananas/Desarrollo-basado-en-pruebas.git"
  },
  "main": "./main.js",
  "scripts": {
  "test": "make test"
  },
~~~

##Ejercicio 5

####Automatizar con grunt y docco (o algún otro sistema) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.


Insatlamos Grunt con el comando 

	sudo npm install -g grunt-cli
	
Instalamos docco

	npm install docco grunt-docco --save-dev
	
Vemos que se ha generado la documentación

~~~
cvi080224:Desarrollo-basado-en-pruebas bogdan$ grunt docco
Running "docco:debug" (docco) task
docco: Empresa.js -> docs/Empresa.html
docco: Gruntfile.js -> docs/Gruntfile.html
docco: main.js -> docs/main.html

Done, without errors.
cvi080224:Desarrollo-basado-en-pruebas bogdan$ 

~~~

##Ejercicio 6

####Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga (vamos, lo que viene siendo TDD).

Modificamos el archivo main añadiendo los asserts

~~~
//main.js
//importamos el módulo empresa
var empresa = require('./Empresa.js');
assert= require("assert");
//array de empresas
var coleccionEmpresas = [];


for(var i=0; i<4;i++){
	var esta_empresa=new empresa.Empresa(i,0,10);
	assert(esta_empresa, "Creada empresa");
	coleccionEmpresas.push(esta_empresa);
}


coleccionEmpresas[0].calificacion=9;

//mostrar info de las empresas
for( var i in coleccionEmpresas){
	coleccionEmpresas[i].printInfo();
}

console.log("Si has llegado aquí, han pasado todos los tests");

~~~

vamos a comprobar que pasan los test

~~~
mocha main.js
el codigo de la empresa es: 0
el nombre de la empresa es: 0
el calificacion de la empresa es: 10
el codigo de la empresa es: 1
el nombre de la empresa es: 0
el calificacion de la empresa es: 10
el codigo de la empresa es: 2
el nombre de la empresa es: 0
el calificacion de la empresa es: 10
el codigo de la empresa es: 3
el nombre de la empresa es: 0
el calificacion de la empresa es: 10
Si has llegado aquí, han pasado todos los tests


  0 passing (0ms)

MacBook-Pro-de-Bogdan:Desarrollo-basado-en-pruebas bogdan$ 


~~~
##Ejercicio 7 

####Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante.



Instalamos mocha 

	npm install -g mocha
	
Creamos un directorio test

	mkdir test
	
En el directorio test creeamos el archivo test.js

~~~
var assert = require('assert');


empresa = require(__dirname+"/../main.js");

describe('Empresa', function(){//Describe un módulo llamado Empresa.
	// Testea que se haya cargado bien la librería
	describe('Carga', function(){ //Describe un submódulo llamado Carga
  	it('should be loaded', function(){ //Describe el nombre de la prueba unitaria
  		assert(empresa, "Cargado");
  	});


	});

});

~~~


Ahora ejecutamos mocha 

	mocha

Obtenemos la siguiente salida 

~~~
mocha main.js
el codigo de la empresa es: 0
el nombre de la empresa es: 0
el calificacion de la empresa es: 10
el codigo de la empresa es: 1
el nombre de la empresa es: 0
el calificacion de la empresa es: 10
el codigo de la empresa es: 2
el nombre de la empresa es: 0
el calificacion de la empresa es: 10
el codigo de la empresa es: 3
el nombre de la empresa es: 0
el calificacion de la empresa es: 10
Si has llegado aquí, han pasado todos los tests


  0 passing (0ms)

MacBook-Pro-de-Bogdan:Desarrollo-basado-en-pruebas bogdan$ 
~~~
	
	
	
##Ejercicio 8

####Ejercicio: Haced los dos primeros pasos antes de pasar al tercero.

[x]Darse de alta. Muchos están conectados con GitHub por lo que puedes usar directamente el usuario ahí. A través de un proceso de autorización, acceder al contenido e incluso informar del resultado de los tests.

[x]Activar el repositorio en el que se vaya a aplicar la integración continua. Travis permite hacerlo directamente desde tu configuración; en otros se dan de alta desde la web de GitHub.

[x]Crear un fichero de configuración para que se ejecute la integración y añadirlo al repositorio.
	
	
El log que se crea al pasar los tests es :
Como podemos observar se pasan los test corectamente.


~~~
Using worker: worker-linux-docker-ae0fa057.prod.travis-ci.org:travis-linux-8
system_info
Build system information
Build language: node_js
Build image provisioning date and time
Thu Feb  5 15:09:33 UTC 2015
Operating System Details
Distributor ID:	Ubuntu
Description:	Ubuntu 12.04.5 LTS
Release:	12.04
Codename:	precise
Linux Version
3.13.0-29-generic
Cookbooks Version
a68419e https://github.com/travis-ci/travis-cookbooks/tree/a68419e
GCC version
gcc (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3
Copyright (C) 2011 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
LLVM version
clang version 3.4 (tags/RELEASE_34/final)
Target: x86_64-unknown-linux-gnu
Thread model: posix
Pre-installed Ruby versions
ruby-1.9.3-p551
Pre-installed Node.js versions
v0.10.36
Pre-installed Go versions
1.4.1
Redis version
redis-server 2.8.19
riak version
2.0.2
MongoDB version
MongoDB 2.4.12
CouchDB version
couchdb 1.6.1
Neo4j version
1.9.4
RabbitMQ Version
3.4.3
ElasticSearch version
1.4.0
Installed Sphinx versions
2.0.10
2.1.9
2.2.6
Default Sphinx version
2.2.6
Installed Firefox version
firefox 31.0esr
PhantomJS version
1.9.8
ant -version
Apache Ant(TM) version 1.8.2 compiled on December 3 2011
mvn -version
Apache Maven 3.2.5 (12a6b3acb947671f09b81f49094c53f426d8cea1; 2014-12-14T17:29:23+00:00)
Maven home: /usr/local/maven
Java version: 1.7.0_76, vendor: Oracle Corporation
Java home: /usr/lib/jvm/java-7-oracle/jre
Default locale: en_US, platform encoding: ANSI_X3.4-1968
OS name: "linux", version: "3.13.0-29-generic", arch: "amd64", family: "unix"
git.checkout
0.82s$ git clone --depth=50 --branch=master https://github.com/bogdananas/Desarrollo-basado-en-pruebas.git bogdananas/Desarrollo-basado-en-pruebas
Cloning into 'bogdananas/Desarrollo-basado-en-pruebas'...
remote: Counting objects: 1170, done.
remote: Compressing objects: 100% (899/899), done.
remote: Total 1170 (delta 184), reused 1152 (delta 168), pack-reused 0
Receiving objects: 100% (1170/1170), 2.02 MiB | 0 bytes/s, done.
Resolving deltas: 100% (184/184), done.
Checking connectivity... done.
$ cd bogdananas/Desarrollo-basado-en-pruebas
$ git checkout -qf 3713fc9836cbfc14db93942dae56463f1571274d
This job is running on container-based infrastructure, which does not allow use of 'sudo', setuid and setguid executables.
If you require sudo, add 'sudo: required' to your .travis.yml
See http://docs.travis-ci.com/user/workers/container-based-infrastructure/ for details.
4.75s$ nvm install 4.2.1
######################################################################## 100.0%
Checksums empty
Now using node v4.2.1
$ node --version
v4.2.1
$ npm --version
2.14.7
$ nvm --version
0.23.3
before_install.1
3.61s$ npm install -g mocha
/home/travis/.nvm/versions/node/v4.2.1/bin/mocha -> /home/travis/.nvm/versions/node/v4.2.1/lib/node_modules/mocha/bin/mocha
/home/travis/.nvm/versions/node/v4.2.1/bin/_mocha -> /home/travis/.nvm/versions/node/v4.2.1/lib/node_modules/mocha/bin/_mocha
mocha@2.3.3 /home/travis/.nvm/versions/node/v4.2.1/lib/node_modules/mocha
├── escape-string-regexp@1.0.2
├── commander@2.3.0
├── diff@1.4.0
├── supports-color@1.2.0
├── growl@1.8.1
├── debug@2.0.0 (ms@0.6.2)
├── jade@0.26.3 (commander@0.6.1, mkdirp@0.3.0)
├── mkdirp@0.5.0 (minimist@0.0.8)
└── glob@3.2.3 (inherits@2.0.1, graceful-fs@2.0.3, minimatch@0.2.14)
before_install.2
0.77s$ npm install .
install
0.79s$ npm install 
0.28s$ mocha
el codigo de la empresa es: 0
el nombre de la empresa es: 0
el calificacion de la empresa es: 10
el codigo de la empresa es: 1
el nombre de la empresa es: 0
el calificacion de la empresa es: 10
el codigo de la empresa es: 2
el nombre de la empresa es: 0
el calificacion de la empresa es: 10
el codigo de la empresa es: 3
el nombre de la empresa es: 0
el calificacion de la empresa es: 10
Si has llegado aquí, han pasado todos los tests
  Empresa
    Carga
  ✓ should be loaded
  1 passing (5ms)
The command "mocha" exited with 0.
Done. Your build exited with 0.
~~~




