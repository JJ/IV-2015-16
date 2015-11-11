# Ejercicios de Rubén Martín Hidalgo
## Tema 3
### Ejercicio 1: Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.

Me he registrado en el PaaS [OpenShift](https://www.openshift.com/). 

![Registrado en OpenShift](https://www.dropbox.com/s/bx5xijdfg2k5zrn/OpenShift_inicio.PNG?dl=1)

Además he enlazado mi cuenta con la de mi usuario en GitHub.

### Ejercicio 2: Crear una aplicación en OpenShift y dentro de ella instalar WordPress.

En la página de bienvenida de OpenShift, pinchamos sobre "Create your first application now".

![Crear aplicacion ahora](https://www.dropbox.com/s/wy6o9t1ix7v2z1d/CreateAplicationWordpress.png?dl=1)

Elegimos WordPress4 de entre las aplicaciones disponibles para crear.

![Elegir WordPress](https://www.dropbox.com/s/0qk7f07ry7osv4b/ElegirWordpress.png?dl=1)

Le asignamos una URL pública y el dominio que queramos. 

Pinchamos en "Create Application".

![Crear finalmente aplicacion WordPress](https://www.dropbox.com/s/ut4malmlvq8bhrp/create%20Aplication.png?dl=1)

En la siguiente pantalla, añadimos algunos datos como el título de la página, o el nombre de usuario.

Damos en "Instalar Wordpress".

![Instalar WordPress](https://www.dropbox.com/s/m37fq3n8wubz1o6/datos%20wordpress.png?dl=1)

¡¡Y ya tenemos nuestro WordPress en marcha!! Pincha [aquí](http://mywordpress-iv2015.rhcloud.com/) para verla en marcha.

![Página de Wordpress](https://www.dropbox.com/s/1574h2wwnl8pelw/WordPress.PNG?dl=1)

### Creación de la aplicación Porra en node.js

- mkdir pruebanode
- cd pruebanode
- npm init
- npm install express --save
- npm install express-generator -g
- express prueba-rest
- cd prueba-rest
- npm install   # instala dependencias
- npm install supertest
- npm install -g grunt-cli
- npm install grunt-shell
- sudo apt-get install sqlite3
- npm install sqlite3
- npm install should --save-dev
- grunt creadb

![grunt creadb](https://www.dropbox.com/s/0boonf5zkeuq9nv/gruntcreadb.PNG?dl=1)

- DEBUG=prueba-rest npm start   # comprobamos que funciona

![ejecucion de aplicacion](https://www.dropbox.com/s/vszcb0tsybuu16i/pruebaappJSdebug.PNG?dl=1)

- node app.js   # arrancamos servidor

![servidor app.js en marcha](https://www.dropbox.com/s/83mui062c67sh3i/servidorJS.PNG?dl=1)

- curl -X PUT http://127.0.0.1:5000/porra/local/visitante/Copa/2013   # probamos a meter datos

![meter datos en la db](https://www.dropbox.com/s/2rihk9xi0l8ar6t/meterdatosJS.PNG?dl=1)

- Vemos que ha metido los datos correctamente:

![obtener datos porra](https://www.dropbox.com/s/rql7fjol9yn2y7t/accesoPorra.PNG?dl=1)

Ahora procedemos a subirlo a github:

- git init
- git commit -m "subo app de prueba a git"
- Creamos repositorio en GitHub
- git remote add origin git@github.com:romilgildo/Porra-IV.git
- git push -u origin master

Y con esto ya está la aplicación subida en mi [repositorio](https://github.com/romilgildo/Porra-IV).

### Ejercicio 3: Crear pruebas para las diferentes rutas de la aplicación.

El archivo de tests, queda con el siguiente contenido:

```
var request = require('supertest'), 
should = require('should'),
app = require('../app.js');
want_id = "mad-bcn-liga-2014";

describe( "Crear porra", function() {
	it('should create', function (done) {
		request(app)
			.put('/porra/local/visitante/copa/2014')
			.expect('Content-Type', /json/)
			.expect(200,done);
	});
});

describe( "Leer ID porra", function() {
	it('should return ID', function (done) {
		request(app)
			.put('/porra/mad/bcn/liga/2014')
			.expect('Content-Type', /json/)
			.expect(200)
			.end( function ( error, resultado ) {
				if ( error ) {
					return done( error );
				}
				resultado.body.should.have.property('ID', want_id);
				done();
			});
	});
});

describe( "Crear apuesta", function() {
	it('should create bet correctly', function (done) {
		request(app)
			.put('/apuesta/mendas/liga/2014/mad/2/bcn/2')
			.expect('Content-Type', /json/)
			.expect(200,done);
	});
});
			
describe( "Leer ID apuesta", function() {
	it('should return ID', function (done) {
		request(app)
			.put('/apuesta/mendas/liga/2014/mad/2/bcn/2')
			.expect('Content-Type', /json/)
			.expect(200)		
			.end( function ( error, resultado ) {
				if ( error ) {
					return done( error );
				}
				resultado.body.should.have.property('local','2');
				resultado.body.should.have.property('visitante','2');
				done();
			});
    });
});

```

Versión actualizada del fichero test.js [aquí](https://github.com/romilgildo/Porra-IV/blob/master/test/test.js).

Ejecutamos las pruebas con mocha y vemos que son satisfactorias: *mocha test/test.js*

![Resultados Mocha de la porra](https://www.dropbox.com/s/xot1bad04gefzsa/mochaPorra.PNG?dl=1)

### Ejercicio 4: Instalar y echar a andar tu primera aplicación en Heroku.

1. Nos registramos en [Heroku](https://signup.heroku.com/dc).

![Registro en Heroku](https://www.dropbox.com/s/g6266gm4zthfi5b/registroHeroku.PNG?dl=1)

2. Descargamos el cinturón de herramientas de Heroku con: *wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh*

3. Nos logueamos en Heroku desde la linea de comandos: *heroku login*

4. Clonamos repositorio de la app de prueba de Heroku: *git clone git@github.com:heroku/node-js-getting-started.git*

5. Entramos a la carpeta de la app: *cd node-js-getting-started*

6. Instalamos dependencias: *npm install*

7. Vemos que la app funciona con: *npm start*

![app Heroku en marcha](https://www.dropbox.com/s/kok2tlnwoyfdeo4/appHerokuFunciona.PNG?dl=1)

8. Ahora pasamos a desplegar la app en Heroku con: *heroku create* y *git push heroku master*

9. Podemos cambiar el nombre a la aplicación, ya que por defecto nos asigna uno aleatorio. Para ello ejecutamos:

- *heroku apps:rename newname*

- *git remote rm heroku*

- *heroku git:remote -a newname*

10. Por último, para comprobar que se ha desplegado correctamente, ejecutamos: 

- *heroku ps:scale web=1*	# que arranca el servidor

- *heroku open*	# para acceder a la app mediante el navegador web

[Aquí](http://romilgildo-iv2015.herokuapp.com/) tenemos la aplicación despegada.

 ![app Heroku desplegada](https://www.dropbox.com/s/adowoiht196dpqf/appHerokuDesplegada.PNG?dl=1)

### Ejercicio 5: Usar como base la aplicación de ejemplo de heroku y combinarla con la aplicación en node que se ha creado anteriormente. Probarla de forma local con foreman. Al final de cada modificación, los tests tendrán que funcionar correctamente; cuando se pasen los tests, se puede volver a desplegar en heroku.

1. Combinamos y fusionamos archivos de ambas aplicaciones. Para ello debemos agregar las dependencias de nuestra aplicación al el fichero "package.json" que queda de la siguiente forma:

```
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
    "serve-favicon": "~2.3.0"
  },
  "devDependencies": {
    "docco": "^0.7.0",
    "grunt": "^0.4.5",
    "grunt-docco": "^0.4.0",
    "should": "^7.1.1"
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

2. Hacemos *npm install* por si hay que instalar alguna dependencia.

3. Ejecutamos los test de prueba para ver que funcionan con *mocha test/test.js*

4. Instalamos Foreman con el siguiente comando: *sudo gem install foreman*

5. Ejecutamos nuestra aplicación web localmente de la siguiente forma: *foreman start web* 

![Ejecución local con Foreman](https://www.dropbox.com/s/s6wjmtqxovxuswc/foremanPrueba.PNG?dl=1)

6. Ahora procedemos a realizar el despliegue de nuevo en Heroku: 

- git add * -f
- git commit -m "Subo ejercicio 5"
- git push heroku master

7. Una vez termine de subir los archivos, ya tenemos nuestra app de Porra desplegado sobre Heroku, y accesible desde [aquí](http://romilgildo-iv2015.herokuapp.com/).

![Aplicacion Porra desplegada en Heroku](https://www.dropbox.com/s/6qulzogdpatz6iw/despliegueHeroku.PNG?dl=1)

8. Por último vamos a crear un repositorio en mi cuenta de GitHub con la aplicación que hemos desplegado.

- git remote rm origin
- Creamos repositorio en GitHub
- git remote add origin git@github.com:romilgildo/Porra-Heroku.git
- git push -u origin master

[Aquí](https://github.com/romilgildo/Porra-Heroku) tenemos la aplicación que hemos desplegado en Heroku, dentro del repositorio en GitHub.

### Ejercicio 6: Haz alguna modificación a tu aplicación en node.js para Heroku, sin olvidar añadir los tests para la nueva funcionalidad, y configura el despliegue automático a Heroku usando Snap CI o alguno de los otros servicios, como Codeship, mencionados en StackOverflow.

Vamos a configurar primeramente Travis, para ello creamos el fichero [.travis.yml](https://github.com/romilgildo/Porra-Heroku/blob/master/.travis.yml) con el siguiente contenido:

```
# Selección del lenguaje 
language: node_js   

node_js:
  - "4.1" 
  - "0.12"
  - "iojs"

install:   # Instalación de dependencias
  - npm install
  - npm install -g mocha

script:       # El script que ejecutaremos para que nuestro código funcione y corra los test.
  - mocha

notifications:   # Notificamos los resultados de los test por correo
  recipients:
    - rubenmartin1991@gmail.com
  email:
    on_success: change
    on_failure: always
```

Lo subimos a GitHub para ver que pasa los test.

- git add .travis.yml
- git commit -m "Incluyo travis"
- git push -u origin master

![Prueba Travis Porra](https://www.dropbox.com/s/4zw3864pz3jxem4/travisHeroku.PNG?dl=1)

Una vez comprobado que funciona correctamente, la desplegamos de nuevo en Heroku con: *git push heroku master*

Ahora pasamos a realizar el despliegue automático con [Snap CI](https://snap-ci.com/):

Pinchamos sobre "TRY NOW" de la página de inicio de Snap.

![Inicio Snap](https://www.dropbox.com/s/z2el2hbxnwm8z5m/inicioSnap.PNG?dl=1)

En la siguiente página pulsamos sobre "Authorize application" para que tenga acceso a nuestros repositorios de GitHub.

![Aceptar acceso a GitHub](https://www.dropbox.com/s/n9n0v4n1go7ql3v/autorizarSnap.PNG?dl=1)

Una vez dentro, pinchamos sobre nuestra aplicación Porra-Heroku, en el botón "Add".

![Pinchar sobre Porra-Heroku](https://www.dropbox.com/s/m949f0uzu74q6b2/repositoriosSnap.PNG?dl=1)

Entramos en "Configuración", que se ubica arriba a la derecha. Luego por el mismo lugar, pinchamos sobre "Edit".

Configuramos los comandos que queramos ejecutar para los tests en la parte de EDITME:

![Configurar Editme](https://www.dropbox.com/s/lj14egg0pty9jby/configuracionSnap.PNG?dl=1)

Ahora pinchamos sobre "ADD STAGE", y elegimos a la izquierda "Deploy" y luego "Basic". Ahora procedemos a configurar nuestra cuenta de Heroku y el nombre de nuestra aplicación desplegada.

Para configurar la cuenta de Heroku habrá que permitir el acceso de Snap CI a Heroku como podemos ver en la siguiente captura:

![Permitir acceso de Snap CI](https://www.dropbox.com/s/eir9b07gi4ve3ge/permitirHeroku.PNG?dl=1)

Mi configuración final en Snap CI es la siguiente: 

![Configuracion Deploy Heroku](https://www.dropbox.com/s/5plusm1e9k96mgy/configuracionSnapHeroku.PNG?dl=1)

Guardamos los cambios en el botón de arriba a la derecha "Save".

Una vez guardamos, automáticamente se inicia el proceso de integración contínua sobre nuestra aplicación. 

Los resultados son los siguientes:

![Integración contínua en Heroku](https://www.dropbox.com/s/mo7rk1iheboybhc/despliegueHerokuSnap.PNG?dl=1)

Con esto ya tendremos la aplicación desplegándose automáticamente en Heroku con cada cambio que realicemos en el repositorio de GitHub y tras pasar los test de prueba.

Para ello hay que hacer:

- git add * -f
- git commit -m "Despliegue en Heroku"
- git push

### Ejercicio 7: Preparar la aplicación con la que se ha venido trabajando hasta este momento para ejecutarse en un PaaS, el que se haya elegido.

Voy a desplegar la aplicación que ya hice en el Tema 2, pero sobre el PaaS de OpenShift. Para ello seguimos los siguientes pasos:

Registrarnos en Openshift. Ya lo hicimos en ejercicios anteriores.

Instalamos las herramientas de Openshift, además de Ruby que es necesario para ejecutarlas.

- *sudo apt-get install ruby-full*
- *sudo gem install rhc*

Creamos un dominio para nuestra aplicación. En mi caso ya lo tenía hecho de antes al crear la aplicación de Wordpress:

- *rhc-create-domain -n nombredominio -l my_email -p my_password*  # datos de la cuenta de openshift

Configuramos rhc para que se conecte con nuestra cuenta de Openshift:

- *rhc setup*

Dejamos el hostname del servidor por defecto, y metemos la password. Actualizamos también la clave SSH.

Ahora pasamos a crear la aplicación en Openshift, que se puede hacer por comandos con *rhc app-create michat nodejs* o desde la web:

![Crear app en Openshift con rhc](https://www.dropbox.com/s/iivam9lk7jgi4uw/appcreateOpenshift.PNG?dl=1)

![Crear app en Openshift por web](https://www.dropbox.com/s/im1qyyalec1xff3/appcreateOpenshiftWEB.PNG?dl=1)

Una vez creada, vamos a clonar nuestro repositorio de la app que tenemos en Github:

- *git clone git@github.com:romilgildo/Chat.git*
- cd Chat

Y enlazamos con el repositorio de Openshift:

- *git remote add openshift ssh://5637951c7628e1ecd60000dc@michat-iv2015.rhcloud.com/~/git/michat.git/* # la dirección ssh la obtenemos de la información que nos da rhc de la app al crearla
- *git fetch openshift*
- *git push -u openshift*

[Esta](http://michat-iv2015.rhcloud.com/) es la aplicación desplegada.
