# Samuel Carmona Soria
# Tema 3 Creando aplicaciones en la nube: Uso de PaaS

## Ejercicio 1.
### Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.
Me he registrado en Heroku:
![Registrado en Heroku](http://i770.photobucket.com/albums/xx346/BkY_1234/captura1_zps1ziegr4o.jpg)

También me he dado de alta en OpenShift:
![Registrado en OpenShift](http://i770.photobucket.com/albums/xx346/BkY_1234/captura2_zpsqhscnybb.jpg)


## Ejercicio 2.
###Crear una aplicación en OpenShift y dentro de ella instalar WordPress.
Dentro de OpenShift, una vez registrado, existe un apartado Instant App donde podemos seleccionar WordPress 4.

Escribimos la url deseada y creamos la aplicación, que por defecto queda tal que así:
![WordPress](http://i770.photobucket.com/albums/xx346/BkY_1234/captura3_zpsalfyo9os.jpg)

Ahora, la vinculamos a una cuenta de WordPress:
![Cuenta WordPress](http://i770.photobucket.com/albums/xx346/BkY_1234/captura4_zpslzee3wvg.jpg)

Ahora ya podemos utilizar WordPress:
![Cuenta WordPress](http://i770.photobucket.com/albums/xx346/BkY_1234/captura5_zpsd5pu1puh.jpg)



## Ejercicio 3.
### Realizar una app en express (o el lenguaje y marco elegido) que incluya variables como en el caso anterior.

He realizado una aplicación para almacenar productos de cualquier tipo en un supermercado, donde hay que introducir el nombre del producto, precio y tipo al que pertenece.

La app se ha subido a éste [repositorio:](https://github.com/Samuc/Productos-Heroku-IV)

Se debe usar "npm install" para instalar las dependencias.

Se abre con "npm start", y se puede comprobar en la direccion en local: http://localhost:5000/ .

Para añadir productos por ejemplo utilizamos este comando:
```
curl -X PUT http://127.0.0.1:5000/producto/Pollo/5/carne
```

Y ahora en la dirección http://localhost:5000/productos podemos ver los productos añadidos.

Si queremos buscar un producto en común podemos hacer ésto:
http://localhost:5000/producto/Pollo

Si no se encuentra en la base de datos, se indicará el error.

![Captura aplicación funcionando](http://i770.photobucket.com/albums/xx346/BkY_1234/captura6_zps9tmxhx7l.jpg)
(En la captura se ve el precio donde está el tipo, pero es por haberlo de esa manera con curl., El orden de adición correcto sería como el ejemplo de arriba, curl -X PUT http://127.0.0.1:5000/producto/Pollo/5/carne)
La clase producto tiene el siguiente contenido:
```
exports.Producto = function (nombre,precio,tipo) {
    this.nombre = nombre;
    this.precio= precio;
    this.tipo= tipo

    this.as_string = as_string;
    this.inserta_db = inserta_db;
}

// Devuelve el producto como una cadena
function as_string() {
    return this.nombre + ", " + this.tipo() + ", " + this.precio() ;
}

function inserta_db( db, tabla ) {
    if ( !db) {
	throw new Error("No se ha definido BD");
    };
    var stmt = db.prepare("INSERT INTO "+ tabla + " (nombre,precio,tipo) VALUES (?,?,?)");
    stmt.run( this.nombre, this.precio, this.tipo,this.tipo );
    stmt.finalize();
}

```

Y en el index.js, tiene las siguientes variables:
```
app.get('/', function(request, response) {
    response.send( "Ésto es el INDEX" );
});


// Baja todas las porras que haya en un momento determinado
app.get('/productos', function(request, response) {
    response.send( productos );
});


app.get('/producto/:nombre', function(request, response) {
    var este_producto = request.params.nombre;

    if ( !productos[este_producto] ) {
	response.status(404).send("No existe este producto");
    } else {
	response.status(200).send( productos[este_producto] );
    }
});


```
## Ejercicio 4.
### Crear pruebas para las diferentes rutas de la aplicación.

He creado dos archivos de tests, que podemos ver en la siguiente carpeta del repositorio:
https://github.com/Samuc/Productos-Heroku-IV/tree/master/test


El primer consta de lo siguiente:
```
// si se quiere probar la base de datos, ejecutar antes `grunt creadb`
describe('Producto', function(){
    // Testea que se haya cargado bien la librería
    describe('Carga', function(){
	it('Debería estar cargado el módulo', function(){
	    assert(producto, "Cargado");
	});

    });

    var nuevo_producto = new producto.Producto("Pollo", "5", "Carne");
    describe('ID', function(){
	it('Debería generar ID correcto', function(){
	    assert.equal(nuevo_producto.as_string(), "Pollo, 5, Carne");
	});
    });

    describe('Crea', function(){
	it('Debería crearse correctamente', function(){
	    assert.equal(nuevo_producto.nombre, "Pollo");
	});
    });

});

```

Y el segundo contiene los siguientes tests:
```
describe( "Aniade producto", function() {
    it('should return correct type', function (done) {
	request(app)
	    .put('/producto/Pollo/5/carne')
	    .expect('Content-Type', /json/)
	    .expect(200,done);
    });
    it('should return ID', function (done) {
	request(app)
	    .put('/producto/Pollo/5/carne')
	    .expect('Content-Type', /json/)
	    .expect(200)
	    .end( function ( error, resultado ) {
		if ( error ) {
		    return done( error );
		}
		resultado.body.should.have.property('nombre', nombre_test);
		done();
	    });
    });
    it('should return all products correctly', function (done) {
	request(app)
	    .get('/producto/'+ nombre_test)
	    .expect('Content-Type', /json/)
	    .expect(200)
	    .end( function ( error, resultado ) {
		if ( error ) {
		    return done( error );
		}
		resultado.body.should.have.property('local','mad');
		done();
	    });
    });
});
```

El resultado de pasar ejecutar mocha a ambos es el siguiente:
![Resultado](http://i770.photobucket.com/albums/xx346/BkY_1234/captura7_zpso6yeccfw.jpg)



## Ejercicio 5.
### Instalar y echar a andar tu primera aplicación en Heroku.

Después de hacer "heroku login"
En la carpeta del repositorio he realizado el siguiente comando:
```bash
samu@samu: ~/Facultad/IV/Productos-Heroku-IV on master
> samu@samu: heroku create
Creating lit-beach-4250... done, stack is cedar-14
https://lit-beach-4250.herokuapp.com/ | https://git.heroku.com/lit-beach-4250.git
Git remote heroku added
```

Seguidamente hago:
```bash
samu@samu: ~/Facultad/IV/Productos-Heroku-IV on master
> git push heroku master
```

Establecemos una instancia para la web:
```bash
samu@samu:~/Facultad/IV/Productos-Heroku-IV on master
> heroku ps:scale web=1
Scaling dynos... done, now running web at 1:Free.
```

Y con el siguiente comando lo abrimos en una pestaña del navegador:
```bash
samu@samu:~/Facultad/IV/Productos-Heroku-IV on master
> heroku open
```

## Ejercicio 6.
### Usar como base la aplicación de ejemplo de heroku y combinarla con la aplicación en node que se ha creado anteriormente. Probarla de forma local con foreman. Al final de cada modificación, los tests tendrán que funcionar correctamente; cuando se pasen los tests, se puede volver a desplegar en heroku.

Con el siguiente comando he instalado foreman en la aplicación:

```bash
samu@samu:~/Facultad/IV/Productos-Heroku-IV on master
> npm install foreman
```


## Ejercicio 7.
### Haz alguna modificación a tu aplicación en node.js para Heroku, sin olvidar añadir los tests para la nueva funcionalidad,y configura el despliegue automático a Heroku usando Snap CI o alguno de los otros servicios, como Codeship,mencionados en StackOverflow.

He conectado heroku con Travis CI, diciéndole a Heroku que no despliegue hasta que haya pasado los test con éxito.

He creado por lo tanto un .travis.yml, he actualizado algún archivo para realizar un push y obtengo lo siguiente:

![Heroku-Travis](http://i770.photobucket.com/albums/xx346/BkY_1234/captura8_zpsfynnsjr4.jpg)

## Ejercicio 8.
### Preparar la aplicación con la que se ha venido trabajando hasta este momento para ejecutarse en un PaaS, el que se haya elegido.
He hecho los pasos anteriores sobre la aplicación de empresas del tema anterior. Y el resultado se muestra en la siguiente captura:
![Empresas-Heroku](http://i770.photobucket.com/albums/xx346/BkY_1234/captura9_zpsplns8kme.jpg)
