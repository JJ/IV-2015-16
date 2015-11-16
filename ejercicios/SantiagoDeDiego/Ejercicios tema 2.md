#Ejercicio 1

Yo he escogido para instalar npm por su facilidad de instalación en MAC. Solo tenemos que instalar el archivo que encontramos en la [Página oficial](https://nodejs.org/en/) y darle a siguiente, siguiente al estilo windows.

Además también nos instala la última versión de node.js, podemos verlo escribiendo `node -v` y nos devuelve la versión que hemos instalado, en mi caso la 4.2.1

También instalaremos el módulo express, un framework que nos permitirá desarrollar aplicaciones web. Esto lo hacemos mediante el comando `sudo npm install -g express-generator`
#Instalación de varias versiones de node con nvm
Primero de todo tenemos que instalar nvm. El proceso en MAC es un poco diferente y he encontrado la siguiente solución:

```
git clone git://github.com/creationix/nvm.git ~/.nvm
 printf "\n\n# NVM\nif [ -s ~/.nvm/nvm.sh ]; then\n\tNVM_DIR=~/.nvm\n\tsource ~/.nvm/nvm.sh\nfi" >> ~/.bashrc
 NVM_DIR=~/.nvm
 source ~/.nvm/nvm.sh
```
Con esta serie de comandos ya tenemos nvm instalado. Una vez hecho esto, ejecutamos `nvm ls-remote` para ver todas las versiones disponibles, En mi caso voy a instalar la 4.2.0 y 4.2.1

Esto lo hacemos con los comandos:
`nvm install v4.2.0`
`nvm install v4.2.1`

##Instalación de virtualenv en MAC OSX
Primero de todo instalamos el gestor de paquetes pip. Esto además nos servirá para el siguiente ejercicio en el que instalaremos Django. Para ello escribimos `sudo easy_install pip` . Una vez instalado, ya solo tenemos que escribir `sudo pip install virtualenv` y ya tenemos instalado virtualenv en Mac.

El motivo de esta instalación es que utilizo bastante el mac para programar en python y me parecía interesante tener un entorno de python.

En MAC, depende de la versión de python que queramos utilizar podemos hacer varias cosas. Si queremos trabajar con python 2.* entonces nos vale crear un entorno con `virtualenv nombre_entorno`. En cambio, si queremos intalar un entorno de python3 podemos hacer dos cosas:

- Utilizar virtualenv con el comando: `virtualenv --distribute --python=<ruta donde esra instalado python3>`. Esta para mi es la opción más tediosa ya que tenemos que saber la ruta exacta de donde está instalado python3
- Utilizar `pyvenv nombre_entorno`. Esta para mí es la opción más cómoda y además nos permite usar `pip` como gestor de paquetes de python3 (la otra igual también no lo se seguro). La ventaja de esta opción es que ejecutando `python` ya nos abre directamente python3 sin necesidad de tener que escribir `python3`. Este sistema viene detallado en [este blog](http://www.marinamele.com/2014/07/install-python3-on-mac-os-x-and-use-virtualenv-and-virtualenvwrapper.html)

###Importante:
Si tenemos varias versiones de python instaladas, como es mi caso la 2.7 y la 3.4, entonces al crear un entorno virtual con virtualenv tenemos que especificar la versión de python que estamos utilizando, ya que sino dará un error. En mi caso, sería algo como: `virtualenv -p python3 <Nombre_de_la_carpeta>`

También he tenido errores con pip y easy_install teniendo varias versiones de python instaladas. Si vamos a la carpeta `/usr/local/bin`
vemos que no tenemos instalado pip, sino que tenemos pip2.7, pip3.5  y otros. Esto es debido a que tenemos varias versiones de python. Entonces, para instalar paquetes con pip, en el caso de querer hacerlo con la versión 3 de python tenemos que escribir `pip3 install <paquete>` para que funcione; si solo ponemos pip nos dirá que no existe ese comando.
#Ejercicio 2

Ahora vamos a crear una aplicación web sencilla sobre la que poder trabajar. En mi caso voy a hacerla con node.js y su módulo express, de ahí que lo instalase anteriormente. En mi caso voy a crearla en mi carpeta de la asignatura, así que vamos a nuestra carpeta y escribimos el comando: `express ev_empresas`. Una vez hecho esto instalamos las dependencias con `cd ev_empresas && npm install`. Esto instalará las librerías (módulos) y las dependencias de estas, necesarias para correr nuestro proyecto. Ya con esto tenemos lo necesario para empezar a programar nuestra primera aplicación web.

Para ver que funciona la ejecutamos escribiendo: `DEBUG=ev_empresas:* npm start` como pone en la terminal que lo hagamos. Ahora en la dirección local con el puerto 3000 encontramos:

![Express](http://i864.photobucket.com/albums/ab201/Santiago_de_Diego/Express%20funcionando_zpsqrzyaexb.png)

#Ejercicio 3
Para comprobar si funciona en las dos versiones antes instaladas, iremos cambiando entre una y otra y ejecutando nuestra aplicación.

Podemos ver una lista de las versiones instaladas con `nvm ls`

![Versiones instaladas](http://i864.photobucket.com/albums/ab201/Santiago_de_Diego/Versiones%20nvm_zpsjkekhpgv.png)

Como podemos ver tenemos las dos versiones instaladas anteriormente y la del sistema, que es la que se instaló por defecto con npm.

Ahora elegimos la versión que queramos para probar. Esto lo hacemos con los comandos:
`nvm use 4.2.0`
`nvm use 4.2.1`

Sin más que ejecutar `npm start` con ambas versiones vemos que todo funciona correctamente

#Ejercicio 4
Aquí presento las líneas del archivo package.json

```
{
  "author": "Santiago de Diego <santidediego@gmail.com>",
  "name": "ev_empresas",
  "version": "0.0.0",
  "private": true,
  "scripts": {
    "start": "node ./bin/www"
  },
  "dependencies": {
    "body-parser": "~1.13.2",
    "cookie-parser": "~1.3.5",
    "debug": "~2.2.0",
    "express": "~4.13.1",
    "jade": "~1.11.0",
    "morgan": "~1.6.1",
    "serve-favicon": "~2.3.0"
  }
}
```

#Ejercicio 5
Primero de todo instalamos grunt y docco con los comandos del guión. Tras instalarlos, se modifica automáticamente el archivo package.json añadiéndose las dos dependencias correspondientes a ambos programas.

Ahora creamos un archivo, que llamaremos Gruntfile.js con el siguiente contenido:

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

Una vez hecho esto ejecutamos `grunt docco`y la consola nos devuelve que el proceso se ha realizado correctamente sin errores. Entonces, este comando nos devuelve una documentación en formato html que podemos encontrar en el [repositorio de esta aplicación](https://github.com/santidediego/ev_empresas) dentro de la carpeta docs.

#Ejercicio 6
En este apartado utilizaremos la librería *assert* para definir una serie de aserciones cuando insertemos los datos. Podemos ver las aserciones introducidas [en el archivo empresa.js](https://github.com/santidediego/ev_empresas/blob/master/routes/empresa.js)

De esta forma, cuando añadimos una nueva empresa nos aparece lo siguiente en las peticiones:

![Test superados](http://i864.photobucket.com/albums/ab201/Santiago_de_Diego/Assert_zpsis13ebzl.png)

#Ejercicio 7
Primero de todo instalamos mocha con `sudo npm install -g mocha` para instalarlo de forma global.

Ahora creamos otra carpeta para almacenar nuestros test y dentro, un archivo *test.js* que conformará nuestro test. He hecho un test muy básico que comprobará si arranca correctamente la web este es:

```
var assert=require("assert");
app=require(__dirname+"/../app.js");

describe('Empresa', function(){
	    it('Debe cargar', function(){
	        assert(app, "La página carga correctamente");
	    });
});

```

#Ejercicio 8
Para darme de alta en Travis simplemente entro en la [Página oficial](https://travis-ci.org) y me logeo con mi cuenta de Github.

Una vez dado de alta, sigo los pasos de la página y marco el repositorio que quiero que esté vinculado con Travis, para ello simplemente hago click.

Ahora tengo que crear el archivo *.travis.yml*. Lo he creado dentro del directorio de la aplicación, y el archivo tiene las siguientes líneas:

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

Efectivamente al hacer push al repositorio se activa automáticamente:

![Integración continua](http://i864.photobucket.com/albums/ab201/Santiago_de_Diego/Integracion%20continua_zpspvnulgif.png)