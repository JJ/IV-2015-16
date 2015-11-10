#Ejercicios - Jesús Prieto López
##TEMA 3

###Ejercicio 1: Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.

Voy a utilizar la PaaS OpenShift, en la que ya tengo una cuenta creada desde hace un año y probé a subir varias aplicaciones

![Captura de la página principal de OpenShift]()

###Ejercicio 2: Crear una aplicación en OpenShift y dentro de ella instalar WordPress.

Para añadir una aplicación, dentro del menú principal de nuestra cuenta en OpenShift en la pestaña **Applications**, pulsamos en el botón **Add Application...**. En caso de no tener ninguna aplicación ya, aparecerá diferente la página y nos explicará brevemente como crearla.

![Botón para añadir aplicación](cap2)

Después se nos muestra una página donde elegir el tipo de aplicación. En el apartado *Instant App* podemos encontrar el tipo de aplicación que queremos crear, WordPress.

![Enlace para seleccionar el tipo de aplicación WordPress](cap3)

Una vez hemos accedido al enlace para crear la aplicación podemos configurar esta desde la siguiente página. Ahí indicamos la URL pública, donde está el código fuente, los *gears* que utiliza, el escalado, y la región.

![Página de configuración de la aplicación](cap4)

En el código fuente no voy a indicar un repositorio de mi propiedad, sino voy a dejarlo por defecto, que enlaza a un repositorio con código fuente de ejemplo de una aplicación WordPress creada por los de OpenShift.

Pulsamos el botón **Create Application** desde la página de configuración para confirmar definitivamente la creación. Después de unos segundos nos mostrará una página con información sobre lo que podemos hacer a partir de ahora y datos referentes a la BD.
También explica un poco como cambiar el código mediante la herramienta *Git*.

![Página con los datos de la aplicación creada](cap5)

Si pulsamos en **Continue to the application overview page** accederemos al panel de control de nuestra aplicación.

Como ya está creada, podemos acceder directamente a la dirección de URL pública que proporcionamos en la configuración. En este caso https://wp-jesuspl.rhcloud.com/ y veremos la aplicación funcionando.

![Página en WordPress creada en OpenShift](cap6)


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

![Respuesta en JSON de la ruta de mostrar empresas](cap7)

* La ruta que muestra la calificación de una empresa, en este caso de la segunda.

`$ curl http://localhost:8000/empresas/2/`

![Respuesta JSON con la calificacion de una empresa](cap8)

* La ruta de mostrar empresas pero con método POST para crear una empresa pasandole parámetros

`$ http --json POST http://localhost:8000/empresas/ <atributo1>=<valor1> ...`

![Respuesta JSON al crear una empresa desde la consola](cap9)


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

![Resultados de los test para las rutas de la interfaz REST](cap10)




