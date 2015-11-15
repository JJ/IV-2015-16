###Ejercicio 1: Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.

Estoy dado de alta en Heroku:

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema3/hero.png)

Y en OpenShift:

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema3/op.png)


###Ejercicio 2: Crear una aplicación en OpenShift y dentro de ella instalar WordPress.

Creamos una nueva aplicación con WordPress configurando algunos parámetros:

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema3/op1.png)

Tras algunos pasos obtenemos nuestra aplicación:

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema3/op2.png)

Junto con el panel de configuración de WordPress:

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema3/wp.png)

Aplicación creada:

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema3/op3.png)


[Aplicación Openshift](https://empresaiv-nachorc.rhcloud.com)


###Ejercicio 3: Realizar una app en express (o el lenguaje y marco elegido) que incluya variables como en el caso anterior.

Haciendo uso del repositorio con la anterior aplicación creada de empresas realizamos los siguientes pasos para crear una API REST para listar series de TV:

- Instamos MondoDB y Mongoose si no los tenemos aún:

```
npm install mongodb --save
npm install mongoose 
```

- Creamos el modelo con **mongoose** para guardar la información (con los métodos POST, PUT, GET, DELETE).

```
exports = module.exports = function(app, mongoose) {

	var tvshowSchema = new mongoose.Schema({
		title: 		{ type: String },
		year: 		{ type: Number },
		country: 	{ type: String },
		poster:  	{ type: String },
		seasons: 	{ type: Number },
		genre: 		{
			type: String,
			enum: ['Drama', 'Fantasy', 'Sci-Fi', 'Thriller', 'Comedy']
		},
		summary: 	{ type: String }
	});

	mongoose.model('TVShow', tvshowSchema);

};

```
Y los métodos REST:

```
//PUT - Update a register already exists
exports.updateTVShow = function(req, res) {
	TVShow.findById(req.params.id, function(err, tvshow) {
		tvshow.title   = req.body.petId;
		tvshow.year    = req.body.year;
		tvshow.country = req.body.country;
		tvshow.poster  = req.body.poster;
		tvshow.seasons = req.body.seasons;
		tvshow.genre   = req.body.genre;
		tvshow.summary = req.body.summary;

		tvshow.save(function(err) {
			if(err) return res.send(500, err.message);
      res.status(200).jsonp(tvshow);
		});
	});
};

//DELETE - Delete a TVShow with specified ID
exports.deleteTVShow = function(req, res) {
	TVShow.findById(req.params.id, function(err, tvshow) {
		tvshow.remove(function(err) {
			if(err) return res.send(500, err.message);
      res.status(200);
		})
	});
};

```

- Con la extensión REST de Chrome o alguna aplicación REST como *CococaRestClient* insertamos (POST) en la base de datos:

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema3/rest.png)

- Comprobamos los datos intertados:

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema3/cocoa.png)

- Para borrar (DELETE) o actualizar (PUT) basta con indicar el ID creado automáticamente por Mongo en la aplicación REST:

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema3/put.png)

- Comprobamos en la base de datos de Mongo y en el navegador que se han insertado/modificado los datos correctamente:

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema3/mongo.png)

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema3/nav.png)

###Ejercicio 4: Crear pruebas para las diferentes rutas de la aplicación.


###Ejercicio 5: Instalar y echar a andar tu primera aplicación en Heroku.

Una vez implementada la aplicación y subida al repositorio en GitHub,  Heroku permitirá el acceso a la misma, no sólo de forma local. 

Para ello debemos realizar los siguientes pasos tras instalar *Heroku toolbelt* previamente:
	
- Definir el archivo **Procfile** :
	
```
web: gunicorn gettingstarted.wsgi --log-file -
```

- Definir el archivo **requirements.txt**:

```
pip freeze > requirements.txt
```

Y por último:

	1.  heroku create
	2.	git push heroku master
	3.	heroku ps:scale web=1
	4.	heroku open
	
Comprobamos nuestra aplicación funcionando correctamente en Heroku:

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema3/web.png)


###Ejercicio 6: Usar como base la aplicación de ejemplo de heroku y combinarla con la aplicación en node que se ha creado anteriormente. Probarla de forma local con foreman. Al final de cada modificación, los tests tendrán que funcionar correctamente; cuando se pasen los tests, se puede volver a desplegar en heroku.


###Ejercicio 7: Haz alguna modificación a tu aplicación en node.js para Heroku, sin olvidar añadir los tests para la nueva funcionalidad, y configura el despliegue automático a Heroku usando Snap CI o alguno de los otros servicios, como Codeship, mencionados en StackOverflow


###Ejercicio 8: Preparar la aplicación con la que se ha venido trabajando hasta este momento para ejecutarse en un PaaS, el que se haya elegido.

