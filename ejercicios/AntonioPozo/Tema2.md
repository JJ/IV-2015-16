###Ejercicio 1
**Instalar alguno de los entornos virtuales de node.js (o de cualquier otro lenguaje con el que se esté familiarizado) y, con ellos, instalar la última versión existente, la versión minor más actual de la 4.x y lo mismo para la 0.11 o alguna impar (de desarrollo).**

He instalado NVM. Para su instalación, hay que seguir los siguientes pasos:

1. Tecleamos la siguiente orden:  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.28.0/install.sh | bash

2. Ejecutamos source ~/.profile en el terminal, para recargar el archivo ~/.profile.

3. Instalamos node.js con la orden nvm install stable

4. También instalamos las versiones más recientes de la 0.12 y la 0.11 con: nvm install v0.12.7 y nvm install v0.11.16

5. Se pueden ver las versiones instaladas con la orden nvm ls.

![captura versiones nvm](http://s2.subirimagenes.com/imagen/previo/thump_9483947ej1.png)




###Ejercicio 2
**Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido. Se trata de hacer una aplicación simple que se pueda hacer rápidamente con un generador de aplicaciones como los que incluyen diferentes marcos MVC. Si cuesta mucho trabajo, simplemente prepara una aplicación que puedas usar más adelante en el resto de los ejercicios**

He creado una aplicación web básica para la solución de este ejercicio sirviéndome de [koalite](http://blog.koalite.com/2011/11/tutorial-node-js-express-jquery-i-creando-la-aplicacion/)
Instalamos las herramientas necesarias para el funcionamiento de ésta aplicación con npm y ejecutamos la aplicación con node app.js. Si no hay errores, la aplicación está funcionando en el puerto 3000.

![aplicación funcionando](http://s2.subirimagenes.com/imagen/previo/thump_9484427ej22.png)
    

###Ejercicio 3
**Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?**
Sí, se muestra en la siguiente captura:
![peticiones con diferentes versiones del lengüaje](http://s2.subirimagenes.com/imagen/previo/thump_9484075ej3.png)


###Ejercicio 4
**Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente.**
Para poder hacer este apartado hay que utilizar una versión estable, por lo que se ha vuelto a la versión v4.2.1.
Para crear la descripción del módulo he tecleado npm init. Al final del proceso se ha obtenido lo siguiente:

![descripción del módulo usando package.json](http://s2.subirimagenes.com/imagen/previo/thump_9484079ej4.png)



###Ejercicio 5
**Automatizar con grunt y docco (o algún otro sistema) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.**

Instalamos grunt (npm install -g grunt-cli) y docco (npm install docco grunt-docco --save-dev) 


Ahora pasamos a crear el Gruntfile.js con el siguiente contenido:

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



###Ejercicio 6
**Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga (vamos, lo que viene siendo TDD).**

Se ha añadido una aserción que comprueba si el comentario introducido es nulo o no:

![aserción](http://s2.subirimagenes.com/imagen/previo/thump_9484429ej6.png)

###Ejercicio 7
**Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante.**

Instalamos mocha con: npm install -g mocha. Creamos un directorio en el que vamos a alojar los tests, y dentro de este, el fichero test.js que tiene el siguiente contenido:

```
var assert = require("assert");
miweb = require(__dirname+"/../app.js");

describe('Miweb', function(){
    describe('Comentar', function(){
        it('Debe cargar el programa', function(){
            assert(miweb, "Cargado");
        });
    });
});
```
![haciendo test](http://s2.subirimagenes.com/imagen/previo/thump_9484431ej7.png)

###Ejercicio 8
**Ejercicio: Haced los dos primeros pasos antes de pasar al tercero.**

He optado por utilizar Shippable como sistema de integración continua. 
A continuación se muestra una captura que muestra que el proceso se ha realizado correctamente:

![](http://s2.subirimagenes.com/imagen/previo/thump_9484439ej8.png)















