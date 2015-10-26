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

1. Combinamos y fusionamos archivos de ambas aplicaciones.

2. Hacemos *npm install* por si hay que instalar alguna dependencia.

3. Ejecutamos los test de prueba para ver que funcionan con *mocha test/test.js*

4. Instalamos Foreman con el siguiente comando: *sudo gem install foreman*

5. Ejecutamos nuestra aplicación web localmente de la siguiente forma: *foreman start web* 

![Ejecución local con Foreman](https://www.dropbox.com/s/s6wjmtqxovxuswc/foremanPrueba.PNG?dl=1)

6. Ahora procedemos a realizar el despliegue de nuevo en Heroku: 

- git add * -f
- git commit -m "Subo ejercicio 5"
- git push heroku master

7. Una vez termine de subir los archivos, ya podremos ejecutar de nuevo el servidor y acceder a nuestra app:

- heroku ps:scale web=1
- heroku open

Y ya tenemos nuestra app de Porra desplegado sobre Heroku, y accesible desde [aquí](http://romilgildo-iv2015.herokuapp.com/).

![Aplicacion Porra desplegada en Heroku](https://www.dropbox.com/s/6qulzogdpatz6iw/despliegueHeroku.PNG?dl=1)

### Ejercicio 6: Haz alguna modificación a tu aplicación en node.js para Heroku, sin olvidar añadir los tests para la nueva funcionalidad, y configura el despliegue automático a Heroku usando Snap CI o alguno de los otros servicios, como Codeship, mencionados en StackOverflow.

### Ejercicio 7: Preparar la aplicación con la que se ha venido trabajando hasta este momento para ejecutarse en un PaaS, el que se haya elegido.
