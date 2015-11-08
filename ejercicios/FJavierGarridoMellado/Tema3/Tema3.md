#Tema 3

###Ejercicio 1 : Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift

Me he registrado en **OpenShift** como puede verse en la siguiente imagen:

![reg_openshift](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/registroopenshift_zpsds7k6a0a.png)

###Ejercicio 2: Crear una aplicación en OpenShift y dentro de ella instalar WordPress.
Pasos para instalar wordpress en Openshift.
- Haber hecho el ejercicio 1, donde hay que registrarse en OpenShift.
- Registrarse en [https://wordpress.com](https://wordpress.com).

![registrowordpress](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/registrowordpress_zpsdmx12qku.png)

![registrowordpress2](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/registrowordpress2_zpsq5lygozz.png)


- En el apartado **Aplications/Instant App** de la página de *OpenShift* seleccionar la opción de **wordpress**.

![instantapp](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/registroopenshift_zpsceuill9n.png)

- Rellenar **public URL** con la URL que se desee.

![urlopenwordp](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/crearappworpressopenshift_zpsi2mkkgsw.png)

- Ingresar en la admin de wordpress siguiendo la url creada y desarrollar la página que se desee.

![wpopenshift](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/wordpressopenshift_zpse74uveca.png)

###Ejercicio 3: Realizar una app en express (o el lenguaje y marco elegido) que incluya variables como en el caso anterior.

Siguiendo el tutorial de [Django Rest Framework](http://www.django-rest-framework.org/tutorial/1-serialization/) y el tutorial realizado por el compañero @hugobarzano ( [tutorial](https://github.com/hugobarzano/Empresas_tema3/blob/master/pasos.md) ) he realizado los siguientes pasos para la serialización:

- Una vez creado el proyecto y la aplicación, instalar **pip install djangorestframework**
- Añadir en el archivo **setting.py** dentro de **INSTALLED_APPS** la linea **'rest_framework',** ( la coma tambien )
- Se supone ya definido tanto las urls y modelos en **urls.py** como en **models.py**
- Realizar **python manage.py makemigrations aplicacion** y **python manage.py migrate** sino se ha realizado previamente.
- Dentro de la carpeta de nuestra aplicación crear el archivo **serializers.py** , el contenido en mi caso es este ( similar al de mi clase Persona de models.py pero usando serializadores):

```
from rest_framework import serializers
from apu.models import Persona


class PersonaSerializer(serializers.Serializer):
	nombre = serializers.CharField(max_length=50)
	dni = serializers.CharField(max_length=9)
	pais = serializers.CharField(max_length=20)
	equipo = serializers.CharField(max_length=10)
	hobbies = serializers.CharField(max_length=200)
	fondo = serializers.IntegerField()
	
	def create(self, validated_data):
		"""
		Creacion y return de una nueva instancia de Persona
		"""
		return Persona.objects.create(**validated_data)

	def update(self, instance, validated_data):
		"""
		Actualizacion y return de una instancia de Persona ya existente con los datos validados
		"""
		instance.nombre = validated_data.get('nombre', instance.nombre)
		instance.dni = validated_data.get('dni', instance.dni)
		instance.pais = validated_data.get('pais', instance.pais)
		instance.equipo = validated_data.get('equipo', instance.equipo)
		instance.hobbies = validated_data.get('hobbies', instance.hobbies)
		instance.fondo = validated_data.get('fondo', instance.fondo)
		instance.save()
		return instance
```
- Arrancar la shell con el comando **python manage.py shell** y probar que lo realizado funciona añadiendo contenido, en mi caso:

![pruebas](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/serializacionshell_zpsxgoh49g7.png)

- En el archivo **aplicacion/views.py** crear la clase **JSONResponse** e importar lo necesario:

```
from django.views.decorators.csrf import csrf_exempt
from rest_framework.renderers import JSONRenderer
from rest_framework.parsers import JSONParser
from apu.models import Persona
from apu.serializers import PersonaSerializer
```

La clase  **JSONResponse**:
```
class JSONResponse(HttpResponse):
	"""
	An HttpResponse that renders its content into JSON.
	"""
	def __init__(self, data, **kwargs):
		content = JSONRenderer().render(data)
		kwargs['content_type'] = 'application/json'
		super(JSONResponse, self).__init__(content, **kwargs)
```
- Definir las funcionalidades de la aplicación:

```
@csrf_exempt
def Persona_lista(request):
	"""
	Lista todos los nombres de personas o la crea
	"""
	if request.method == 'GET':
		personas = Persona.objects.all()
		serializador = PersonaSerializer(personas, many=True)
		return JSONResponse(serializador.data)
	
	elif request.method == 'POST':
		data = JSONParser().parse(request)
		serializador = PersonaSerializer(data=data)
		if serializador.is_valid():
			serializador.save()
			return JSONResponse(serializador.data, status=201)
		return JSONResponse(serializador.errors, status=400)

@csrf_exempt
def Persona_detalle(request, pk):
	"""
	Recuperar, actualizar o borrar una persona
	"""
	try:
		persona = Persona.objects.get(pk=pk)
	except Persona.DoesNotExist:
		return HttpResponse(status=404)

	if request.method == 'GET':
		serializador = PersonaSerializer(persona)
		return JSONResponse(serializador.data)
	elif request.method == 'PUT':
		data = JSONParser().parse(request)
		serializador = PersonaSerializer(persona, data=data)
		if serializador.is_valid():
			serializador.save()
			return JSONResponse(serializador.data)
		return JSONResponse(serializador.errors, status=400)
	elif request.method == 'DELETE':
		persona.delete()
		return HttpResponse(status=204)
```
- Añadir las vistas correspondientes a nuestra aplicación para poder ver la serialización que se realiza, en el **urls.py** de nuestra app añado las dos ultimas lineas que corresponden a **url(r'^apu/$', views.Persona_lista)**  y **url(r'^apu/(?P<pk>[0-9]+)/$', views.Persona_detalle)** :

```
from django.conf.urls import url
from django.conf.urls import patterns, include
from . import views
from apu.views import raiz, mostrar_navegador, contactos, gracias_contactos

urlpatterns = [
	url(r'^$', raiz),
	url(r'^navegador/$' ,mostrar_navegador),
	url(r'^registrarusuario/$' , views.RegistrarUsuario.as_view() , name="registrar_usuario" ),
	url(r'^formulariobuscar/$', views.formulario_buscar),
	url(r'^buscar/$', views.buscar),
	url(r'^contactos/$', contactos),
	url(r'^contactos/gracias/$', gracias_contactos),
	url(r'^apu/$', views.Persona_lista),
    url(r'^apu/(?P<pk>[0-9]+)/$', views.Persona_detalle),

]
```

- Se arranca la aplicación con **python manage.py runserver** y se comprueba que funciona como Dios manda:

![vistaserializada](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/vistasserializacion_zpsgzgfe1zt.png)
 
