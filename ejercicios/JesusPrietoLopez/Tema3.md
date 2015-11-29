#Ejercicios - Jesús Prieto López
##TEMA 3

###Ejercicio 1: Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.

Voy a utilizar la PaaS OpenShift, en la que ya tengo una cuenta creada desde hace un año y probé a subir varias aplicaciones

![Captura de la página principal de OpenShift](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap1_zps6yloxcrx.png)

###Ejercicio 2: Crear una aplicación en OpenShift y dentro de ella instalar WordPress.

Para añadir una aplicación, dentro del menú principal de nuestra cuenta en OpenShift en la pestaña **Applications**, pulsamos en el botón **Add Application...**. En caso de no tener ninguna aplicación ya, aparecerá diferente la página y nos explicará brevemente como crearla.

![Botón para añadir aplicación](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap2_zps6yzhqbhw.png)

Después se nos muestra una página donde elegir el tipo de aplicación. En el apartado *Instant App* podemos encontrar el tipo de aplicación que queremos crear, WordPress.

![Enlace para seleccionar el tipo de aplicación WordPress](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap3_zpstfw9pvhg.png)

Una vez hemos accedido al enlace para crear la aplicación podemos configurar esta desde la siguiente página. Ahí indicamos la URL pública, donde está el código fuente, los *gears* que utiliza, el escalado, y la región.

![Página de configuración de la aplicación](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap4_zps2xw2jlrd.png)

En el código fuente no voy a indicar un repositorio de mi propiedad, sino voy a dejarlo por defecto, que enlaza a un repositorio con código fuente de ejemplo de una aplicación WordPress creada por los de OpenShift.

Pulsamos el botón **Create Application** desde la página de configuración para confirmar definitivamente la creación. Después de unos segundos nos mostrará una página con información sobre lo que podemos hacer a partir de ahora y datos referentes a la BD.
También explica un poco como cambiar el código mediante la herramienta *Git*.

![Página con los datos de la aplicación creada](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap5_zpsjohsjedr.png)

Si pulsamos en **Continue to the application overview page** accederemos al panel de control de nuestra aplicación.

Como ya está creada, podemos acceder directamente a la dirección de URL pública que proporcionamos en la configuración. En este caso https://wp-jesuspl.rhcloud.com/ y veremos la aplicación funcionando.

![Página en WordPress creada en OpenShift](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap6_zps1gheddqs.png)


###Ejercicio 3: Realizar una app en express (o el lenguaje y marco elegido) que incluya variables como en el caso anterior.


En vez de con express, voy a seguir trabajando con **python y **Django**. También he utilizado de base la aplicación utilizada en los ejercicios del tema 2 (crear empresas y calificaciones de alumnos para cada empresa) solo que un poco más simplificada, aunque con la misma estructura de modelo de datos.

Para hacer este ejercicio con las variables como explica en el tema necesitamos de **Django Rest Framework**. Me ha servido de gran ayuda el [Tutorial de la página oficial](http://www.django-rest-framework.org/tutorial/1-serialization/). Podemos instalarlo con:

`$ pip install djangorestframework`

Y añadir la línea `rest_framework,` en el apartado de **INSTALLED_APPS** en el archivo de **settings.py** de nuestro proyecto.

>NOTA: Se supone que ya tenemos definido nuestro modelo de datos con *Empresa* y *Calificacion*

Tenemos que utilizar serializadores para seguir trabajando con nuestra aplicación. Añadir a la carpeta de nuestra aplicación el archivo *serializers.py* y serializar los modelos de datos que tenemos. Por ejemplo el mío es tal que así:

```python
from rest_framework import serializers
from .models import Empresa, Calificacion

class EmpresaSerializer(serializers.ModelSerializer):
	class Meta:
		model = Empresa
		fields = ("nombre", "ciudad", "sector",)
		
class CalificacionSerializer(serializers.ModelSerializer):
	class Meta:
		model = Calificacion
		fields = ("alumno", "calificacion", "empresa",)
```

Ahora añadir las diferentes rutas que deseemos. Por ejemplo, he definido dos:

```python
from django.conf.urls import url
from apprest import views

urlpatterns = [
    url(r'^empresas/$', views.lista_empresas),
    url(r'^empresas/(?P<pk>[0-9]+)/$', views.empresa),
]
```

Y definir las vistas para esas rutas indicadas: 
* La primera sirve para mostrar el listado de empresas o crear una mediante método POST. Ruta: /empresas
* La segunda es para mostrar las calificaciones que tiene asignada una empresa o borrar una empresa. Ruta: /empresas/<iddeempresa>

```python
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.renderers import JSONRenderer
from rest_framework.parsers import JSONParser
from rest_framework import status
from .models import Empresa, Calificacion
from .serializers import EmpresaSerializer, CalificacionSerializer

class JSONResponse(HttpResponse):
	"""
	An HttpResponse that renders its content into JSON.
	"""
	def __init__(self, data, **kwargs):
		content = JSONRenderer().render(data)
		kwargs['content_type'] = 'application/json'
		super(JSONResponse, self).__init__(content, **kwargs)
        
@csrf_exempt
def lista_empresas(request):
	"""
	List las empresas, o crea una
	"""
	if request.method == 'GET':
		empresas = Empresa.objects.all()
		serializer = EmpresaSerializer(empresas, many=True)
		return JSONResponse(serializer.data)

	elif request.method == 'POST':
		data = JSONParser().parse(request)
		serializer = EmpresaSerializer(data=data)
		if serializer.is_valid():
			serializer.save()
			return JSONResponse(serializer.data, status=201)
		return JSONResponse(serializer.errors, status=400)

@csrf_exempt
def empresa(request, pk):
	try:
		empresa = Empresa.objects.get(pk=pk)
	except Empresa.DoesNotExist:
		return JSONResponse(status=status.HTTP_404_NOT_FOUND)

	if request.method == 'GET':
		calificaciones = empresa.calificacion_set.all()
		serializer = CalificacionSerializer(calificaciones, many=True)
		return JSONResponse(serializer.data)

	elif request.method == 'DELETE':
		empresa.delete()
		return JSONResponse(status=status.HTTP_204_NO_CONTENT)
		
```

>Para las respuestas en JSON, como podemos ver en los *return* de las vistas, nos hemos ayudado de una función creada llamada *JSONResponse* que renderiza el contenido de una *HttpResponse*.

Pasamos a comprobar las rutas creadas. Ejecutamos la aplicación:

`$ python manage.py runserver`

Ahora desde la consola, comprobamos con *curl* o *http* que funcionan la rutas.

* La que muestra las empresas creadas

`$ curl http://localhost:8000/empresas/`
`$ http http://localhost:8000/empresas/`

![Respuesta en JSON de la ruta de mostrar empresas](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap7_zpsx8cwr9jj.png)

* La ruta que muestra la calificación de una empresa, en este caso de la segunda.

`$ curl http://localhost:8000/empresas/2/`

![Respuesta JSON con la calificacion de una empresa](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap8_zpssp9tn9pi.png)

* La ruta de mostrar empresas pero con método POST para crear una empresa pasandole parámetros

`$ http --json POST http://localhost:8000/empresas/ <atributo1>=<valor1> ...`

![Respuesta JSON al crear una empresa desde la consola](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap9_zpsawjvhb6m.png)


###Ejercicio 4: Crear pruebas para las diferentes rutas de la aplicación.

Como estamos trabajando con **Django** para las pruebas usaremos el fichero *tests.py* dentro del directorio de nuestra aplicación. Las pruebas se encargaran de testear las rutas creadas en el ejercicio anterior.

Dentro del archivo nos crearemos las clases que se encargarán de realizar los test a las rutas para comprobar las respuestas que estas dan.

He creado dos clases, una para testear las rutas referentes a la empresa (para crear y para listar empresas) y otra para las calificaciones (mostrar calificaciones de una empresa). El archivo que he creado es el siguiente:

```python
from rest_framework import status
from rest_framework.test import APITestCase
from .models import Empresa, Calificacion
from .views import *

class EmpresaRESTTests(APITestCase):
	def test_crear_empresa(self):
		data = { "nombre" : "test", "ciudad" : "ciudadtest", "sector" : "sectortest" }
		response = self.client.post("/empresas/", data, format="json")
		self.assertEqual(response.status_code, status.HTTP_201_CREATED)
		self.assertEqual(Empresa.objects.get().nombre, "test")
		print("Creada empresa correctamente con interfaz REST")
		
	def test_mostrar_empresas(self):
		emp1 = Empresa(nombre="test", ciudad="ciudadtest", sector="sectortest")
		emp1.save()
		emp2 = Empresa(nombre="test2", ciudad="ciudadtest2", sector="sectortest2")
		emp2.save()
		response = self.client.get("/empresas/")
		self.assertEqual(response.content, b'[{"nombre":"test","ciudad":"ciudadtest","sector":"sectortest"},{"nombre":"test2","ciudad":"ciudadtest2","sector":"sectortest2"}]')
		print("Listado de empresas realizado con éxito mediante interfaz REST")
		
class CalificacionRESTTest(APITestCase):
	def test_mostrar_calificaciones(self):
		e = Empresa(nombre="test", ciudad="ciudadtest", sector="sectortest")
		e.save()
		cal1 = Calificacion(alumno="alumtest", calificacion=10, empresa=e)
		cal1.save()
		cal2 = Calificacion(alumno="alum2test", calificacion=0, empresa=e)
		cal2.save()
		response = self.client.get("/empresas/1/")
		self.assertEqual(response.content, b'[{"alumno":"alumtest","calificacion":10,"empresa":1},{"alumno":"alum2test","calificacion":0,"empresa":1}]')
		print("Listado de calificacion de una empresa exitoso con interfaz REST")

```

Lanzamos los test:

`$ python manage.py test`

![Resultados de los test para las rutas de la interfaz REST](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap10_zpsfk8s4umr.png)


###Ejercicio 5: Instalar y echar a andar tu primera aplicación en Heroku

Una vez descargado e instalado las herramientas de *heroku* desde su [página web](https://devcenter.heroku.com/articles/getting-started-with-python#set-up) nos logueamos.

`heroku login`

![Login en heroku a través de la consola de ubuntu](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap11_zpsixej4w5u.png)

Una vez logueados, podemos crearnos nuestra aplicación. Yo me he bajado el ejemplo de *python* que proporcionan en el [repositorio](https://github.com/heroku/python-getting-started) de *heroku*.

`$ git clone https://github.com/heroku/python-getting-started.git`

Accedemos a la carpeta raíz de la aplicación que acabamos de descargarnos para crear la aplicación en *heroku*. Introducimos los comandos:

`$ cd python-getting-started`
`$ heroku create`

![Creación de aplicación en heroku](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap12_zpspflv5ddk.png)

Y desde la web de *heroku* en nuestro **Dashboard** podemos ver que se ha creado la aplicación. Con esta opción crea la aplicación con un nombre aleatorio que posteriormente podremos cambiar.

![Dashboard de heroku](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap13_zpsrnugqerg.png)

Y ahora desplegamos la aplicación en la plataforma.

`$ git push heroku master`

![Resultado de desplegar la aplicaición en heroku](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap14_zpsbwvxw0ro.png)

Ahora podemos acceder a la aplicación web desde la URL que nos ha proporcionado heroku *https://cryptic-tundra-3723.herokuapp.com/* o con un comando desde consola que hace la función de acceso directo.

`$ heroku open`

![Aplicación web ejecutada desde el PaaS heroku](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap15_zps3qxe6j0j.png)


###Ejercicio 6: Usar como base la aplicación de ejemplo de heroku y combinarla con la aplicación que se ha creado anteriormente. Probarla de forma local con foreman. Al final de cada modificación, los tests tendrán que funcionar correctamente; cuando se pasen los tests, se puede volver a desplegar en heroku.

> Me han surgido muchos errores al intentar combinar la aplicación que cree en el ejercicio 3 con la del ejercicio anterior. Así que voy a trabajar directamente con la del ejercicio 3 adaptada.

Dentro del directorio de nuestra aplicación, añadimos el archivo *Procfile*. En este caso tendrá el siguiente contenido:

```
web: gunicorn test_rest.wsgi --log-file -
```

También añadimos el fichero *runtime.txt* para indicar la versión de python, en este caso la 3.4.0

```
python-3.4.0
```

Sin olvidarnos de el fichero *requirements.txt* para las dependencias. En este añadiremos a las anteriores la línea para *gunicorn* y *django-toolbelt*

```
Django==1.8.5
djangorestframework==3.3.0
wheel==0.24.0
django-toolbelt==0.0.1
gunicorn==19.3.0
```

> Estos son archivos necesarios si deseamos que nuestra aplicación funcione en el PaaS heroku

Podemos comprobar que funciona correctamente con *foreman*. Para instalar *foreman*: `$ gem install foreman` o `$ pip install foreman`.

`$ foreman start web`

![Ejecución en local con foreman](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap16_zpsjvknxjkj.png)

![Aplicación web en el navegador después de ejecutarlo con foreman](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap17_zpsmuyqdrzx.png)

Y ejecutamos los test.

`$ python manage.py test`

![Test después de preparar la aplicación para el PaaS](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap19_zpsybn3ymuw.png)

Desplegamos ahora en *heroku*. Creamos el repositorio y subimos el código.

`$ heroku create`

![Creación de la aplicación dentro de heroku](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap18_zpsubjvv9pu.png)

`$ git push heroku master`

Podemos acceder desde la dirección proporcionada por heroku o a través del comando `$ heroku open`. Podemos ver que funciona correctamente

![Aplicación web del ejercicio 3 subida en heroku](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap20_zpsqbiebr44.png)


###Ejercicio 7: Haz alguna modificación a tu aplicación en node.js para Heroku, sin olvidar añadir los tests para la nueva funcionalidad, y configura el despliegue automático a Heroku usando Snap CI o alguno de los otros servicios, como Codeship, mencionados en StackOverflow.

He utilizado [Snap CI](https://snap-ci.com/) para la configuración del despliegue automático. Al registrarnos nos pedirá que autoricemos el acceso desde Snap CI a los repositorios que tengamos en Github.

![Petición de acceso a github desde Snap CI](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap21_zpsvmlrmsy6.png)

En *heroku* conectamos con el repositorio de github desde la pestaña **Deploy**.

![Conectar el repositorio github](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap22_zpsnuciq7dk.png)

Indicamos el repositorio donde están los fuentes de la aplicación

![Indicar el repositorio](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap23_zpsbwbb9gtn.png)

Y activamos la opción para que pase la integración continua antes de desplegarla

![Activación para desplegar la CI](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap24_zpskqygnrr5.png)

Ahora desde Snap CI añadimos el repositorio al que queremos realizarle la integración continua, como antes nos registramos y conectamos con github, se nos mostrarán los repositorios que tenemos en github.

![Añadir repositorio a CI](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap25_zpso9np57x3.png)

Realizará la integración continua y veremos que ha funcionado correctamente si indica "Passed".

![CI realizada con éxito](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap26_zps3i5cs0dl.png)

Pero aún no hemos terminado. Tenemos que editar la Pipeline creada por defecto para que añada los test y despligue la aplicación en *heroku*. Podemos editarla desde **Settings - Edit**.

Primero añadimos un paso que sería para instalar las dependencias con el comando `$ pip install -r requirements.txt`

![Paso en CI para instalar dependencias](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap27_zpsqeypxm9e.png)

Después creamos otro paso que sería para ejecutar los tests de nuestra aplicación, indicandolo que ejecute el comando `$ python manage.py test`.

![Paso en CI para los tests](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap28_zpsc3xleqvv.png)

Y por último el paso para desplegar la aplicación en *heroku* añadiendole la credencial de nuestra cuenta en *heroku* y la aplicación.

![Paso en CI para el despliegue](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap29_zpsz28tn73w.png)

Pulsamos en la opción del panel superior **Save** para guardar los cambios. En este momento se iniciará el proceso para comprobar la integración continua y realizar el despliegue. Cuando termine mostrará los resultados tanto en *Snap CI* como en *heroku*.

![Resultado de CI en Snap CI](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap30_zpsa61m4b8h.png)

![Resultado de despliegue en heroku con Snap CI](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap31_zpsga9vxfq5.png)

###Ejercicio 8: Preparar la aplicación con la que se ha venido trabajando hasta este momento para ejecutarse en un PaaS, el que se haya elegido

Nuestra aplicación ya está preparada para ejecutarse en el PaaS seleccionado, *heroku*. Cuando hagamos un `$ git push` de nuestra aplicación directamente se realizará la integración continua, pasando por los test, y desplegando para finalizar la aplicación en el PaaS.

Puedes acceder a la aplicación pulsando [aquí](https://github.com/JesGor/test_rest). En el readme están añadidos los enlaces para comprobar que se ha pasado la integración continua y el enlace para ejecutar la aplicación web desde *heroku*.


