#Ejercicios tema 3


##Ejercicio 1
###Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.

He optado por darme de alta en OpenShift :

![dado de alta en OpenShift](http://i67.tinypic.com/34y1l51.png)


##Ejercicio 2
Crear una aplicación en OpenShift y dentro de ella instalar WordPress.

- En primer lugar seleccionamos crear una nueva aplicación

- Seleccionamos WordPress 4

- Escogemos una url pública, en mi caso es: http://php-javiexfiliana.rhcloud.com

![escogemos la url de nuestra aplicacion](http://i65.tinypic.com/315lbox.png)

- Terminamos de rellenar los datos que nos solicita la página y vemos como nos crea y lanza la aplicación

- Nos metemos en la url pública y vemos que tenemos que rellenar unos datos para poder instalar WordPress

- Una vez rellenos nos muestra que wordpress se ha instalado con éxito

- Aquí vemos funcionando nuestro sitio Wordpress y la aplicación:

![dentro de wordpress](http://i63.tinypic.com/r1mplw.png)
![aplicacion funcionando](http://i68.tinypic.com/b821b7.png)


##Ejercicio 3
###Realizar una app en express (o el lenguaje y marco elegido) que incluya variables como en el caso anterior.

Para realizar este ejercicio he usado la aplicación de la porra

Hemos necesitado usar varios comandos:

* npm init
* npm install express --save
* npm install -g grunt-cli
* npm install -g mocha
* npm install (para instalar todas las dependencias)
* sudo apt-get install sqlite3

A continuación creamos la base de datos con "sudo grunt creadb":

![instalado Base de datos](http://i65.tinypic.com/zu2yv7.png)

Ejecutamos la aplicación con 'npm start' e introducimos los datos:

![mandando datos con put](http://i66.tinypic.com/fw3drr.png)

Vamos al navegador y comprobamos que los datos se han mandado correctamente al meternos en http://localhost:5000/porras que es la ruta encargada de mostrar las porras.

![instalado Base de datos](http://i65.tinypic.com/30uzoer.png)



##Ejercicio 4
###Crear pruebas para las diferentes rutas de la aplicación.

He creado pruebas en el archivo test.js para las rutas que se tienen creadas. Este archivo se encuentra dentro del directorio test y tiene el siguiente contenido:

```
var request = require('supertest'), 
should = require('should'),
app = require('../index.js');
want_id = "FCBarcelona-RMadrid-Liga-2015";

describe( "Crear porra", function() {
	it('should create', function (done) {
		request(app)
			.put('/porra/LigaBBVA/2015/FCBarcelona/RMadrid')
			.expect('Content-Type', /json/)
			.expect(200,done);
	});
});

describe( "Leer ID porra", function() {
	it('should return ID', function (done) {
		request(app)
			.put('/porra/LigaBBVA/2015/FCBarcelona/RMadrid')
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
			.put('/apuesta/javi/LigaBBVA/2015/FCBarcelona/0/RMadrid/5')
			.expect('Content-Type', /json/)
			.expect(200,done);
	});
});
			
describe( "Leer ID apuesta", function() {
	it('should return ID', function (done) {
		request(app)
			.put('/apuesta/javi/LigaBBVA/2015/FCBarcelona/0/RMadrid/5')
			.expect('Content-Type', /json/)
			.expect(200)		
			.end( function ( error, resultado ) {
				if ( error ) {
					return done( error );
				}
				resultado.body.should.have.property('local','0');
				resultado.body.should.have.property('visitante','5');
				done();
			});
    });
});

```

A continuación ejecutamos el comando mocha test/test.js para ejecutar todos los test y podemos ver como los pasa correctamente.

![pasa todos los test](http://i67.tinypic.com/9097no.png)


##Ejercicio 5
###Instalar y echar a andar tu primera aplicación en Heroku.

Vamos a proceder a instalar heroku siguiendo los pasos del tutorial de [Heroku](https://devcenter.heroku.com/articles/getting-started-with-nodejs#introduction)

En primer lugar instalamos heroku Toolbelt

![instalado heroku Toolbelt](http://i63.tinypic.com/14jqbs6.png)

Ejecutamos Heroku login e introducimos nuestros credenciales

![Me logeo desde terminal](http://i67.tinypic.com/2w53cqc.png)

Clonamos el repositorio de git con el [enlace](https://github.com/heroku/node-js-getting-started.git) que nos proporcionan.

![Clono repositorio](http://i68.tinypic.com/15oa51s.png)

Creamos nuestra aplicación en Heroku

![Creo aplicacion heroku](http://i63.tinypic.com/wtahab.png)

Usamos `npm install` para instalar las dependencias e `npm start` para inicializarlo y comprobar que todo funciona.

![heroku funcionando](http://i67.tinypic.com/takknb.png)

Subimos a Heroku nuestra primera app

![heroku open](http://i63.tinypic.com/bi72v8.png)

![first app heroku](http://i63.tinypic.com/eu2fs7.png)

Ejecutamos `heroku open` en la terminal y se nos abre automaticamente el navegador para poder ver que funciona correctamente:

![heroku](http://i66.tinypic.com/ruz76r.png)

##Ejercicio 6
###Usar como base la aplicación de ejemplo de heroku y combinarla con la aplicación en node que se ha creado anteriormente. Probarla de forma local con foreman. Al final de cada modificación, los tests tendrán que funcionar correctamente; cuando se pasen los tests, se puede volver a desplegar en heroku.

Creamos el app
![creamos](http://i68.tinypic.com/2cpw02b.png)

Conectamos el repertorio de github con Heroku
![git-he](http://i63.tinypic.com/bf49ra.png)
![heroku-git](http://i63.tinypic.com/54bo8k.png)

Comprobamos que todo está funcionando correctamente abriendo la aplicación.
![webmotos](http://i67.tinypic.com/im5dfp.png)

App disponible [aquí](https://webmotos.herokuapp.com/)

Para iniciar todo en local se puede realizar mediante dos comandos.
`foreman start web`
`heroku local web`



### Ejercicio 7.
###Haz alguna modificación a tu aplicación en node.js para Heroku, sin olvidar añadir los tests para la nueva funcionalidad, y configura el despliegue automático a Heroku usando Snap CI o alguno de los otros servicios, como Codeship, mencionados en StackOverflow.

Creamos el archivo travis y lo añadimos.

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

Comprobamos que pasa los test.
![mocha](http://i67.tinypic.com/210hb3m.png)

Ahora nos vamos a Heroku > Desploy. 
En Deploy activaremos "Automatic deploys" y marcaremos la casilla "Wait for CI to pass before deploy"

![hero](http://i65.tinypic.com/1z56blg.png)



###Ejercicio 8.
###Preparar la aplicación con la que se ha venido trabajando hasta este momento para ejecutarse en un PaaS, el que se haya elegido.

La aplicación sobre la que he venido trabajando hasta este momento es la utilizada en el ejercicio 6. 
Dejo alguna captura de la [aplicacion](http://i65.tinypic.com/a44i9h.png)
![aplicación](https://webmotos.herokuapp.com/)
