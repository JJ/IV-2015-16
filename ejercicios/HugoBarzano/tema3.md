# Tema 3. Creando aplicaciones en la nube: Uso de PaaS

##Ejercicio 1: Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.

Voy a darme de alta en [Heroku](https://www.heroku.com)

El primer paso es rellenar el formulario de registro:
![registro](https://www.dropbox.com/s/ddbnnsizg78zuom/h1.png?dl=1)

El segundo paso es confirmar el registro mediante un enlace enviado a nuestro correo:
![confirmacion](https://www.dropbox.com/s/u6xghl3tvvibnz9/h2.png?dl=1)

En el enlace enviado a nuestro correo electrónico, hay un segundo mecanismo de validación utilizando un código enviado a nuestro telefono movil:
![validacion](https://www.dropbox.com/s/mz1nkdos7ncqmu5/h3.png?dl=1)

Finalmente, podemos acceder a la interfaz de Heroku
![interfaz](https://www.dropbox.com/s/qip00ljrgi94ty8/h4.png?dl=1)

Voy a darme de alta tambien en [OpenShift](https://www.openshift.com) ya que es necesario para el siguiente ejercicio. 

El primer paso es rellenar el formulario de registro:
![registro](https://www.dropbox.com/s/m63dhwxf78nim33/op.png?dl=1)

El segundo paso es confirmar el registro mediante un enlace a nuestro correo:
![validacion](https://www.dropbox.com/s/70k3jmqlv2woq3e/op2.png?dl=1)

Una vez validado, ya podemos acceder a la interfaz de OpenShift y comenzar su configuración:
![interfaz](https://www.dropbox.com/s/u0nf0sp9ysp6zxw/op3.png?dl=1)

##Ejercicio 2: Crear una aplicación en OpenShift y dentro de ella instalar WordPress.

En la interfaz de OpenShift, buscamos el apartado Instant App y selecionamos WordPress 4
![ej2](https://www.dropbox.com/s/nu9h41bb5ipz53g/ej2.png?dl=1)

Elegimos la url de nuestra aplicación:
![ej2_2](https://www.dropbox.com/s/486qm2lbrddeh4l/ej2_2.png?dl=1) 

Y tras esperar un poco, nuestra aplicación ha sido creada:
![ej2_3](https://www.dropbox.com/s/lkmw407uiu219ut/ej2_3.png?dl=1)

La vinculamos a nuestra cuenta de WordPress:
![ej2_4](https://www.dropbox.com/s/s479ifm3o64ladm/ej2_4.png?dl=1)

Y listo, ya podemos empezar a personalizar la aplicación [WordPress](http://php-hugobarzano.rhcloud.com/)
![ej2_5](https://www.dropbox.com/s/bxtp1xtle8vssrx/ej2_5.png?dl=1)

##Ejercicio3: Realizar una app en express (o el lenguaje y marco elegido) que incluya variables como en el caso anterior.

Para realizar la aplicación, he elegido python y Django. Para poder utilizar variables REST, Django pone a nuestra disposición el FrameWork
**djangorestframework**
Para realizar la aplicación, he continuado con el ejemplo de Empresas del tema 2, la nueva aplicación se escuentra alojada en el siguiente repositorio [Empresa](https://github.com/hugobarzano/Empresas_tema3)
En dicho repositorio tambien se encuentra el fichero [Pasos](https://github.com/hugobarzano/Empresas_tema3/blob/master/pasos.md) en el que están detallados todos los pasos a seguir para crear la aplicación. 

##Ejercicio 4: Crear pruebas para las diferentes rutas de la aplicación. 

Las rutas que he creada para la aplicación Empresa son las indicadas en el ejercicio anterior. Ahora vamos a testear 2 de ellas.

La primera ruta que vamos a probar es **/Empresas/** que lo que devuelve es un listado en formato JSON de todas las empresas registradas en la aplicación. Para ello he creado el siguiente test:

	def test_detalle_varias_empresas(self):
		emp = Empresa(nombre='empresa1',correo='correo1')
		emp.save()
		emp2 = Empresa(nombre='empresa2',correo='correo2')
		emp2.save()
		response = self.client.get('/Empresas/')
		self.assertEqual(response.content,'[{"nombre":"empresa1","correo":"correo1"},{"nombre":"empresa2","correo":"correo2"}]')
		print("Varias Empresas consultadas en detalle correctamente")

En este test, he simulado el comportamiento del navegador mediante APIClient. La siguiente ruta que voy a probar es **/Empresa/n**
que lo que devuelve es la empresa n-esima que haya resgistrada en la aplicación. Para ello he creado el siguiente test:

	def test_detalle_empresa(self):
		emp = Empresa(nombre='empresa1',correo='correo1')
		emp.save()
		response = self.client.get('/Empresa/1/')
		self.assertEqual(response.content,'{"nombre":"empresa1","correo":"correo1"}')
		print("Una unica Empresa consultada en detalle correctamente")

Podemos observar que la aplicación supera la bateria de test:
![test](https://www.dropbox.com/s/q9ezfp47nctpe9y/test.png?dl=1)

##Ejercicio 5: Instalar y echar a andar tu primera aplicación en Heroku.

Para que nuestra aplicación pueda funcionar en Heroku, debemos realizar una serie de modificaciones.
Lo primero que debemos hacer es actualizar el fichero de requuirements:

	Django==1.7
	dj-database-url==0.3.0
	dj-static==0.0.6
	gunicorn==19.1.1
	psycopg2==2.5.1
	static==0.4
	wsgiref==0.1.2

Lo siguiente que Heroku necesita para funcionar es un archivo de configuración llamado Procfile, con el siguiente contenido:

	web: gunicorn djangoblog.wsgi --log-file -

Con esto lo que le estamos indicando a Heroku es que queremos arrancar una instancia web y dejar que gunicorn ejecute nuestra aplicación dentro de ella. 

Como en ejercicios anteriores tubimos que crear una cuenta en Heroku, ha llegado el momento de hacer loguin en ella, mediante 
	
	heroku login

No solicitará nuestro nombre de correo y contraseña. Una vez loogueados, lo siguiente es crear un enlace al repositorio que Heroku nos ofrece para alojar nuestra aplicación mediante

	heroku create

Por último temeos que hacer push al repositorio de Heroku mediante 

	git push heroku master

**Nota:** si tenemos problemas al hacer push, reinicialziar el repositorio y tulizar el comando 

	heroku create --stack cedar










