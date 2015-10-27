#Tema 2

###Ejercicio 1 : Instalar alguno de los entornos virtuales de node.js y, con ellos, instalar la última versión existente, la versión minor más actual de la 0.12 y lo mismo para la 0.11 o alguna impar. Si no se usa habitualmente este lenguaje, hacer lo mismo con cualquier otro lenguaje de scripting.

Para Python he optado por el entorno virtual **virtualenv**, el cual como se explica en los apuntes nos permite usar una versión diferente en caso de estar inmerso en desarrollos de proyectos que necesitan diferentes versiones de Python.

![instalacion](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/virt_inst_zpsvq4gzyua.png)

A continuación para crear un entorno virtual ejecuto *virtualenv nombre_proyecto* , se observa como se crean los directorios relativos a las librerias, ejecutables,.., de *Python*.

![creacionentorno](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/creacentorno_zpsagqxknqe.png)

Ahora se puede entrar y activar el entorno creado mediante el comando **source bin/activate** 

![activacion](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/activacion_zps9gkq305d.png)

Con esto ya es posible instalar lo que sea necesario de Python usando la herramienta **pip**, por ejemplo *Django 1.6*

![entornodjango](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/django_zpszdug7kvo.png)

Por ultimo, para desactivarlo solo hay que ejecutar la orden **deactivate**

![desactivar](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/desactivar_zpsuduiec5s.png)

Para nodejs añado la instalación de **nvm**,( para instalar [nodejs](http://www.hostingadvice.com/how-to/install-nodejs-ubuntu-14-04/#ubuntu-package-manager) puede seguirse esta página) como se indica en el enlace del [tema](https://github.com/creationix/nvm):

- Instalación mediante el comando **curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash**
![instalarentorno](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/1_zpszvr81ipu.png)
- Activación del entorno ejecutando **. ~/.nvm/nvm.sh**
- Instalación del entorno a usar, por ejemplo **nvm install 0.10**
- Y le indicamos que queremos usarla ( se pueden tener varias instalados ) **nvm use 0.10**
- Y para desactivar el entorno virtual **nvm deactivate**  
![actic_instal_uso_desact](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/2_zps5my29q28.png)

###Ejercicio 2: Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.

En mi caso he creado una aplicación sencilla donde se añade la empresa junto al nombre del alumno y la calificación de su practica, además se permite borrar dichos datos, la he realizado usando el framework **Express** de **nodejs**.No es gran cosa la aplicación, así que espero mejorarla mas adelante.A continuación dejo unas fotos de los pasos seguidos para su realización.

- Tras crear el directorio donde vamos a tener la aplicación hay que meterse en el y ejecutar **npm init** para que cree el archivo **package.json**

![npmini](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/npminit_zps1bd2fa0e.png)

- A continuación se ejecuta **npm install express** para disponer del framework en la aplicación( hay que usar tambien la opción -g sino esta en el sistema de manera global)

![expressenlaapp](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/instexpress_zpseuftoxje.png)

- Se ejecuta con la opción **npm start** , antiguamente era **npm start bin/www**

![npmstart](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/npmstart_zpsoasgzcju.png)

- Y la aplicación que permite registrar unas practicas y eliminarla

![generarprac](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/antildeadirempresapract_zpsniuxilz7.png)

![eliminarprac](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/eliminarempresa_zpsupcuiqy4.png)

![eliminarprac2](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/eliminarempresa2_zpseqi9236l.png)

El repositorio se encuentra en el siguente [enlace](https://github.com/javiergarridomellado/Empresa_expressiv.git).

Por otra parte he creado otra app para la practica usando el framework Django ( Python ) debido a que el proyecto final en mi caso usa dicha herramienta, el repositorio se encuentra en el siguiente [enlace](https://github.com/javiergarridomellado/IV_javiergarridomellado.git)

###Ejercicio 3: Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?

He activado el entorno virtual con la orden **~/.nvm/nvm.sh** y he procedido a probar con las versiones **v4.2.1** ( stable ), **v0.10.40** y **v0.11.13**.Funciona correctamente ( puede ejecutarse tambien con **npm** en vez de **node**).

![entornoestable](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/nodestable_zps2knqhjwn.png)

![version010](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/node010_zps5kwoqevz.png)

![version011](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/node011_zpshkp8wjeg.png)

En el caso de Python he definido para **virtualenv** la ruta para que use **Python3** mediante el comando **virtualenv --python=/usr/bin/python3 nombre**,  puede verse en la carpeta **/bin** como esta la version 3 para usarse pero al arrancar el servidor da un error en la importación de un modulo de django.

![python3](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/errorpython3_zpsig2cbyi7.png)

###Ejercicio 4: Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente.

Usando el comando **npm init** se crea el archivo **package.json** como puede verse en la figura.

![package](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/ejerc4_zps7adcvb89.png)

En el caso de **django**, para describir la aplicación esta el archivo **setup.py** donde se describe el nombre de la aplicación, tipo de base de datos usada, etc , el siguiente [enlace](http://python-packaging.readthedocs.org/en/latest/minimal.html) ilustra la utilidad de setup.py)

```
from setuptools import setup

setup(name='apuestas',
	version='0.1',
	description='App web de apuestas',
	url='https://github.com/javiergarridomellado/IV_javiergarridomellado.git',
	author='Francisco Javier Garrido',
	author_email='franciscojaviergarridomellado@gmail.com',
	license='GNU GPL',
	packages=['apuestas'],
	install_requires=['django','wheel'],
	zip_safe=False)
```

###Ejercicio 5: Automatizar con grunt y docco (o algún otro sistema) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.

- El primer paso es instalar grunt mediante el comando **sudo npm install -g grunt-cli**, esto lo instala en el sistema de manera global.

![instalargrunt](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/instalargrunt_zpssirlemwc.png)

- El segundo paso es situarse en la carpeta raiz del proyecto e instalar docco mediante el comando **npm install docco grunt-docco --save-dev** .

![instalardocco](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/instalardocco_zpsqskvoai3.png)

- Se refleja en el archivo **package.json** la configuración relativa a dicha herramienta.

```
{
  "name": "empresa",
  "version": "1.0.0",
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
    "jade": "~1.3.0"
  },
  "description": "Ejercicio_de_iv",
  "main": "app.js",
  "devDependencies": {
    "grunt": "~0.4.5",
    "grunt-docco": "~0.4.0",
    "docco": "~0.7.0"
  },
  "repository": {
    "type": "git",
    "url": "https://github.com/javiergarridomellado/Empresa_expressiv.git"
  },
  "author": "Javier Garrido",
  "license": "GNU",
  "bugs": {
    "url": "https://github.com/javiergarridomellado/Empresa_expressiv/issues"
  }
}
```

- A continuación se crea en la carpeta raiz del proyecto el archivo **Gruntfile.js** con la siguiente configuración:

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

- Por ultimo se ejectuta el comando **grunt** y se crea la [documentacion](https://github.com/javiergarridomellado/Empresa_expressiv/tree/master/empresa/docs) correspondiente.

![ejecucion](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/docugrunt_zps2pyimugi.png)

![doc](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/docu_zpsu1ujcl2k.png)

En Python una manera facil de documentar es usando **epydoc**, basta con documentar el archivo html y llamar a epydoc. Por ejemplo para el proyecto he documentado *models.py* y *views.py* ejecutando el comando **epydoc --html models.py views.py** . Se ha documentado *models.py* de la siguiente manera:
*Nota: Es posible que salga un error al ejecutar el comando, igualmente crea la carpeta html de manera correcta.*

```
from django.db import models
# Create your models here.

class Persona(models.Model):
	"""Modelo del registro Persona.
		Sirve para definir en la base de datos
	"""

	nombre = models.CharField(max_length=50)
	dni = models.CharField(max_length=9)
	pais = models.CharField(max_length=20)
	equipo = models.CharField(max_length=10)
	hobbies = models.TextField(max_length=200)

	def __unicode__(self):
		return self.nombre
```
###Ejercicio 6: Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga (vamos, lo que viene siendo TDD).

He añadido varias aserciones al registrar unas practicas de un alumno, y se observa como se superan.
```
var assert = require("assert");

exports.post_enviar_empresa = function(req, res){
   var asunto = req.body.asunto;
   var mensaje = req.body.mensaje;
   var fechainicio = req.body.fechainicio;
   var fechafinalizacion = req.body.fechafinalizacion;
   var calificacion = req.body.calificacion;
   lista.push({
      emp: emp,
      alumno: alumno,
      fechainicio: fechainicio,
      fechafinalizacion: fechafinalizacion,
      calificacion: calificacion
   })
   assert(emp, "Practicas de alumnos");
   assert(alumno, "Practicas de alumnos");
   assert(fechainicio, "Practicas de alumnos");
   assert(fechafinalizacion, "Practicas de alumnos");
   assert(calificacion, "Practicas de alumnos");
   console.log("Acceso a los datos correcto");
   
   enviar_empresa(req, res);
}
```
![asercion](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/asercion_zpsvlk8qnbb.png)

###Ejercicio 7: Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante.

Los pasos seguidos han sido los siguientes:
- Instalación de mocha mediante el comando **sudo npm install -g mocha**

![instalacionmocha](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/instalarmocha_zpsxw1xpv1v.png)

- Crear la carpeta **test** y el correspondiente archivo **test.js** describiendo en el su correspondiente testeo. En mi caso:
```
var assert = require("assert");
web = require(__dirname+"/../app.js");

describe('WebPracticas', function(){
    describe('WebPracticas', function(){
        it('Debe cargar app.js', function(){
            assert(web, "Cargado, aca dejo mis dies");
        });
    });
});
```
- Por ultimo se ejecuta con el comando **mocha test/test.js**

![ejecucionmocha](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/ejecucionmocha_zpsz4cuhk5g.png)

En Python basta con definir en el archivo **tests.py** una prueba de testeo, por ejemplo, probar los modelos que se han creado, para ejecutar el testeo se usa el comando **python manage.py test nombre_app_a_testear**

###Ejercicio 8: Haced los dos primeros pasos antes de pasar al tercero.

- [X] Darse de alta. Muchos están conectados con GitHub por lo que puedes usar directamente el usuario ahí. A través de un proceso de autorización, acceder al contenido e incluso informar del resultado de los tests.( Solo hay que darle al botón y te conecta automaticamente )

- [X] Activar el repositorio en el que se vaya a aplicar la integración continua. Travis permite hacerlo directamente desde tu configuración; en otros se dan de alta desde la web de GitHub.

![activacionrepo](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/sincronizandotravis_zpstro9pijp.png)

- [X] Crear un fichero de configuración para que se ejecute la integración y añadirlo al repositorio.


En mi caso he seguido unos pasos muy parecido a lo expuesto en la explicación, he configurado el archivo **.travis.yml** de la siguiente manera:
```
language: node_js
node_js:
  - "0.10"
  - "0.11"
  - "4.2.1"
before_install:
  - npm install -g mocha
  - cd empresa; npm install .
script: mocha
```

 En **package.json** unicamente he incluido la siguiente linea:
```
{
  "name": "empresa",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "test": "mocha"
  },
```
Y puede verse como ejecuta el testeo correctamente:

![travis](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/travis_zpsnblwherv.png)

![ejecu](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/resultado_zpslpmidjue.png)

Para el proyecto de Python he usado las siguientes lineas:
```
language: python
python:
 - "2.7"
# command to install dependencies
install:
 - python apuestas/setup.py install

# command to run tests para django python
script:
 - cd apuestas
 - python manage.py test apu
```
