# **Ejercicios Tema 3**

###**Ejercicio 1:**Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.

He elegido OpenShift:
![Registro](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema3/Seleccioacuten_001_zpsbzsxwy12.png)

###**Ejercicio 2:**Crear una aplicación en OpenShift y dentro de ella instalar WordPress.

Lo primero que tenemos que hacer para crear nuestra primera aplicación es hacer clik en Create your first application now, como se puede ver en la imagen anterior.

Hecho esto, elegimos WordPress4, como podemos ver en la imagen siguiente:
![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema3/Seleccioacuten_003_zpszhq0o6fs.png)

Ahora debemos añadir una URL y un dominio y darle a "Create Application".

![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema3/Seleccioacuten_004_zpscscf8rjx.png) 

Ahora proporcionamos los datos necesarios para la aplicación

![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema3/Seleccioacuten_005_zpsp2jdtqtr.png)

Le damos a instalar y ya tendriamos Wordpress instalado:

Nos debe aparecer la siguiente página:
![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema3/Seleccioacuten_007_zpsfprrhlqy.png)

En ella podemos modificar lo que queramos para la aplicación quedando esta de la siguiente manera:

![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema3/Seleccioacuten_006_zpscqbddytz.png)

###**Ejercicio 3:**Realizar una app en express (o el lenguaje y marco elegido) que incluya variables como en el caso anterior.


He usado la aplicación de creación de Porras y apuestas que viene en el repositorio proporcionado en el tema, del que he obtenido los ficheos Porra.js, Apuesta.js y el index.js  podemos ver su código [aquí](https://github.com/AngelValera/Ejercicio3-Tema3.git).
Está hecha en javascript con una base de datos sqlite, un ejemplo de su ejecución lo podemos ver en la siguiente imagen:

Primero creamos una porra y añadimos dos apuestas:
![porra](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema3/Seleccioacuten_008_zpssauvu2s7.png)

Y para ver las porras que hay junto con las apuestas, en el navegador ponemos:
![apuestas](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema3/Seleccioacuten_009_zpse3ieufgy.png)

###**Ejercicio 4:**Crear pruebas para las diferentes rutas de la aplicación.

Los test que he usado para la aplicación son los siguientes:

```javascript
var request = require('supertest'),
should = require('should'),
app = require('../app.js');

describe( "Crear porra", function() {
	it('should create', function (done) {
		request(app)
			.put('/porra/Betis/Sevilla/Copa/2015')
			.expect('Content-Type', /json/)
			.expect(200,done);
	});
});

describe( "Crear apuesta", function() {
	it('should create bet correctly', function (done) {
		request(app)
			.put('/apuesta/Angel/Copa/2015/Betis/2/Sevilla/2')
			.expect('Content-Type', /json/)
			.expect(200,done);
	});
});
``` 
Ejecutamos las pruebas con mocha, y como podemos ver pasa los test:

![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema3/Seleccioacuten_010_zps6ezet9p5.png)


###**Ejercicio 5:**Instalar y echar a andar tu primera aplicación en Heroku.

- Lo primero que hacemos es registrarnos en heroku:

![registro](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema3/Seleccioacuten_011_zpswngexn3i.png)

- Ahora descargamos el cinturón de herramientas de Herokum, para ello:

wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh

- Hacemos login con : **heroku login**.
- Ahora descargamos la aplicación de ejemplo: **git clone git@github.com:heroku/node-js-getting-started.git**
Entramos en la carpeta de la aplicación, instalamos las dependecias con **npm install** y lanzamos la aplicación con **npm start**.

![app en local](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema3/Seleccioacuten_012_zpszdlhgxzc.png)

- Ahora creamos la aplicación en heroku, para ello hacemos **heroku create**, y la lanzamos con **git push heroku master** 

- Si queremos cambiarle de nombre, debido a que se nos asigna un nombre por defecto aleatorio, tenemos que hacer lo siguiente:

1- **heroku apps:rename newname**

2- **git remote rm heroku**

3- **heroku git:remote -a newname**

- Nos Aseguramos de que se está ejecutando al menos una instancia de la aplicación: 

**heroku ps:scale web=1**

- Ahora visitamos la aplicación en la URL generada por el nombre de la aplicación.Podemos abrir la página web de la siguiente manera:

**heroku open**

Podemos comprobarlo aquí: [aplicación](https://node-js-getting-started-avm.herokuapp.com/)

![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema3/Seleccioacuten_013_zpstllxvorg.png)

###**Ejercicio 6:**Usar como base la aplicación de ejemplo de heroku y combinarla con la aplicación en node que se ha creado anteriormente. Probarla de forma local con foreman. Al final de cada modificación, los tests tendrán que funcionar correctamente; cuando se pasen los tests, se puede volver a desplegar en heroku.

Para combinar las dos aplicaciones tenemos que además de combinar los ficheros necesarios, arreglar las dependencias de nuestra aplicación en el package.json de la aplicación de prueba de Heroku, quedando de la siguiente manera:

```json
{
  "name": "node-js-getting-started",
  "version": "0.1.5",
  "description": "A sample Node.js app using Express 4",
  "main": "index.js",
  "scripts": {
    "start": "node index.js"
  },
  "dependencies": {
    "ejs": "2.3.3",
    "express": "4.13.3",
    "body-parser": "~1.13.2",
    "cookie-parser": "~1.3.5",
    "debug": "~2.2.0",
    "jade": "~1.11.0",
    "morgan": "~1.6.1",
    "serve-favicon": "~2.3.0",
    "sqlite3": "~3.1.1"
  },
  "devDependencies": {
    "supertest": "~1.1.0",
    "grunt": "~0.4.5",
    "grunt-docco": "~0.4.0",
    "docco": "~0.7.0",
    "grunt-shell": "~1.1.2",
    "should": "~7.1.1",
    "mocha": "~2.3.3"
  },
  "engines": {
    "node": "0.12.7"
  },
  "repository": {
    "type": "git",
    "url": "https://github.com/heroku/node-js-getting-started"
  },
  "keywords": [
    "node",
    "heroku",
    "express"
  ],
  "scripts": {
	"test": "mocha",
	"start": "node index.js"
  },
  "license": "MIT"
}
```
- Hecho esto, primero hacemos **npm install** para instalar dichas dependencias y **npm start** para ver si funciona y pasa los test.
- Ahora instalamos foreman con el comando: **sudo gem install foreman**
-Arrancamos la aplicación de forma local con: **foreman start web**

![foreman ](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema3/Seleccioacuten_015_zps9apxgdoe.png)

Ahora desplegamos de nuevo en heroku:

1. git add * -f
2. git commit -m "subiendo aplicacion Ejercicio 5"
3. git push heroku master

Con esto ya tenemos nuestra aplicación subida junto con la de prueba de heroku:

- La de heroku:


![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema3/Seleccioacuten_013_zpstllxvorg.png)

- La aplicación de porras:

![](http://i666.photobucket.com/albums/vv21/angelvalera/Seleccioacuten_016_zps40bqiwn7.png)

Accesibles desde aquí: 

[aplicación heroku](https://node-js-getting-started-avm.herokuapp.com)

[aplicación Porras](https://node-js-getting-started-avm.herokuapp.com/porras)

Ahora nos creamos un repositorio en github y subimos la aplicación, para ello hacemos, una vez creamos el repositorio, hacemos:

- **git remote rm origin**
- **git remote add origin git@github.com:AngelValera/Ejercicio5-Tema3.git**
- **git push -u origin master**

Una vez hecho esto ya tenemos nuestra aplicación desplegada en heroku y en [github](https://github.com/AngelValera/Ejercicio5-Tema3.git)

###**Ejercicio 7:**Haz alguna modificación a tu aplicación en node.js para Heroku, sin olvidar añadir los tests para la nueva funcionalidad, y configura el despliegue automático a Heroku usando Snap CI o alguno de los otros servicios, como Codeship, mencionados en StackOverflow

No he añadido ninguna funcionalidad nueva a la aplicación, así que usaré los mismos test que usé para el ejercicio 4, el despliegue automático en heroku lo haré con Snap CI:

Pro tanto lo primero que tenemos que hacer es añadir interacción continua en el repositorio, para ello generamos un fichero .travis.yml con el siguiente contenido:

```
language: node_js

node_js:
  - "4.2.1"

before_install:
  - npm install -g mocha
  - npm install .
script: mocha

notifications:   # Notificamos los resultados de los test por correo
    recipients:
        - angelvalera.epal@gmail.com
    email:
        on_success: change
        on_failure: always
```
Como no hay nada nuevo, al respecto, pasa los test como antes:

![travis](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema3/Seleccioacuten_017_zpsnlubuzia.png)

Volvemos hacer git push heroku master y ahora vamos a registrarnos en Snap CI:

Debemos autorizar a Snap CI para que pueda acceder a nuestros repositorios:

![](http://i666.photobucket.com/albums/vv21/angelvalera/Seleccioacuten_018_zps61sbjwcp.png) 

Ahora selecionamos el repositorio que queremos, en mi caso el repositorio Ejercicio5-Tema3:

![](http://i666.photobucket.com/albums/vv21/angelvalera/Seleccioacuten_019_zps5rtcnuv7.png)

Ahora le damos en el menú a configuración y después a editar, de manera que se nos abrirá una página como esta, en ella le decimos los comandos que debe ejecutar:

![](http://i666.photobucket.com/albums/vv21/angelvalera/Seleccioacuten_020_zps9gj16lbf.png)
Ahora pinchamos sobre "ADD STAGE", y elegimos a la izquierda "Deploy" y luego "Basic". Ahora procedemos a configurar nuestra cuenta de Heroku y el nombre de nuestra aplicación desplegada.

Para configurar la cuenta de Heroku habrá que permitir el acceso de Snap CI a Heroku como podemos ver en la siguiente captura:
Ahora lo que hacemos es pinchar sobre *ADD STAGE*, y a la izquierda elegimos *DEPLOY* y en las opciones de heroku elegimos *BASIC*, de manera que ahora debemos indicar a heroku que permita el acceso de snap CI, hecho esto nos queda una configuracion como la siguiente:

![](http://i666.photobucket.com/albums/vv21/angelvalera/Seleccioacuten_021_zpslgmbmdqa.png)

Guardamos los cambios en el botón *Save* de arriba a la derecha.

Cuando guardamos comienza el proceso de integración continua:

![](http://i666.photobucket.com/albums/vv21/angelvalera/Seleccioacuten_022_zpsu3ksskro.png)

Con esto la aplicación se lanzará en heroku, pasándole los test cada vez que se quiera cambiar algo en la aplicación del repositorio de github.


###**Ejercicio 8:**Preparar la aplicación con la que se ha venido trabajando hasta este momento para ejecutarse en un PaaS, el que se haya elegido.




