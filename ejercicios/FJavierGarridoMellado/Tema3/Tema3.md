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
 
###Ejercicio 4: Crear pruebas para las diferentes rutas de la aplicación.

En este ejercicio lo que se realiza es un test donde compruebo las dos rutas generadas en el ejercicio anterior, para ello en el archivo **tests.py** creo la clase *RutaTests* donde defino los dos tests, posteriormente ejecutando **python manage.py test** compruebo si los pasa. Se ha añadido al fichero tests.py lo siguiente:
```
from rest_framework import status
from rest_framework.test import APITestCase
from apu.views import *

class RutasTests(APITestCase):

	def test_detalle_persona(self):
		per = Persona(nombre='Jose' ,dni='45678921r',pais='Holanda',equipo='Betis',hobbies='musica',fondo='500')
		per.save()
		response = self.client.get('/apu/1/')
		self.assertEqual(response.content,'{"nombre":"Jose","dni":"45678921r","pais":"Holanda","equipo":"Betis","hobbies":"musica","fondo":500}')
		print("Persona consultada en detalle correctamente")

	def test_detalle_varias_personas(self):
		per = Persona(nombre='Jose' ,dni='45678921r',pais='Holanda',equipo='Betis',hobbies='musica',fondo='500')
		per.save()
		per2 = Persona(nombre='Juan' ,dni='55678921r',pais='Espana',equipo='Real',hobbies='skap',fondo='100')
		per2.save()
		response = self.client.get('/apu/')
		self.assertEqual(response.content,'[{"nombre":"Jose","dni":"45678921r","pais":"Holanda","equipo":"Betis","hobbies":"musica","fondo":500},{"nombre":"Juan","dni":"55678921r","pais":"Espana","equipo":"Real","hobbies":"skap","fondo":100}]')
		print("Varias personas consultadas en detalle correctamente")
```

Se observa que *response* recibe la serialización de la vista y lo compara con lo que debe de dar para testear si dicha serialización es correcta.

![testrutas](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/testeorutas_zpswmr13qaf.png)

###Ejercicio 5: Instalar y echar a andar tu primera aplicación en Heroku.

- Instalar Ruby mediante el comando **sudo apt-get install ruby-full**
- Descargar cinturon de Heroku mediante la orden **wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh**
- Instalar foreman mediante **sudo gem install foreman**
- Instalar las herramientas de django necesarias para el despliegue **pip install django-toolbelt** ( posteriormente se define requirements.txt )
- Si da algun error con **psycopg2** ejecutar **sudo apt-get install libpq-dev python-dev** ( es una herramienta necesaria si se va a usar postgreSQL )
- Definir **requirements.txt** , en mi caso:
```
Django==1.8.6
argparse==1.2.1
dj-database-url==0.3.0
dj-static==0.0.6
django-toolbelt==0.0.1
djangorestframework==3.3.1
gunicorn==19.3.0
psycopg2==2.6.1
static3==0.6.1
wsgiref==0.1.2
```
- Definir un archivo **runtime.txt** en caso de que heroku no soporte la versión de python utilizada. Ver [enlace](https://devcenter.heroku.com/articles/python-runtimes) para saber que versiones requieren de este archivo.
- Definir un archivo **Procfile** , en mi caso ( wsgi corresponde al nombre de la aplicación ):
```
web: gunicorn apuestas.wsgi --log-file -
```
- Subir todos estos cambios a github ya que heroku utiliza un repositorio.
- Loguearse en heroku mediante **heroku login**
- Crear la app mediante **heroku create**
- Subir la app mediante **git push heroku master**
- En la pestaña derecha de heroku se le da a **open app** y se ve la aplicación desplegada.
- Si da algun error ejecutar en el terminal **heroku logs** para ver que ocurre.
- Para renombrar el nombre de la aplicación no se debe usar la página sino el comando **heroku apps:rename newname** 

El enlace de la aplicacion es el [siguiente](https://hidden-meadow-4203.herokuapp.com/)

![heroku](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/heroku_zpsmdrm8vj6.png)

![appheroku](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/appheroku_zps3osjvghx.png)

Para usar Postgre como base de datos en la aplicación, la cual es la que recomienda Heroku deben de seguirse los siguientes pasos :
- Tener instalado *psycopg2*, instalando el paquete django-toolbet debe de instalarse.
- Tener instalado *dj_database_url*, al igual que antes debe de instalarse con el paquete mencionado.
- Abrir el archivo *setting.py* del proyecto y añadir lo siguiente( sacado del siguiente [enlace](http://stackoverflow.com/questions/26080303/improperlyconfigured-settings-databases-is-improperly-configured-please-supply):
```
import dj_database_url

SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

ALLOWED_HOSTS = ['*']

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
ON_HEROKU = os.environ.get('PORT')
if ON_HEROKU:
	DATABASE_URL='postgres://jxryjglugskiss:iKqJ7bn20j41Fcaa6kvGiSSK1v@ec2-107-21-222-62.compute-1.amazonaws.com:5432/dhbuh37t7p0dm'
	DATABASES = {'default': dj_database_url.config(default=DATABASE_URL)}

STATIC_ROOT = 'staticfiles'
STATIC_URL = '/static/'

STATICFILES_DIRS = (
    os.path.join(BASE_DIR, 'static'),
)
```
- En **wsgi.py** poner lo siguiente:
```
import os

from django.core.wsgi import get_wsgi_application
from dj_static import Cling
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "apuestas.settings")

#from whitenoise.django import DjangoWhiteNoise
application = get_wsgi_application()


application = Cling(get_wsgi_application())
#application = DjangoWhiteNoise(application)
```
- Notar que en DATABASE_URL se pone la url que sale para la base de datos postgre que Heroku nos ofrece, hay que darle a show para verlo.
- Subir cambios a github y hacer **git push heroku master**.
- Ejecutar el comando **heroku run python manage.py syncdb** ( mas recomendable usar  **heroku run python manage.py makemigrations**, **heroku run python manage.py migrate** y **heroku run python manage.py createsuperuser** )


###Ejercicio 6: Usar como base la aplicación de ejemplo de heroku y combinarla con la aplicación en node que se ha creado anteriormente. Probarla de forma local con foreman. Al final de cada modificación, los tests tendrán que funcionar correctamente; cuando se pasen los tests, se puede volver a desplegar en heroku.

He probado solo ejecutar con foreman, he instalado foreman ejecutando **sudo gem install foreman** y he ejecutado con la orden **foreman start web**.

![foreman](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/foreman_zpsf7k5np1z.png)

![foremanweb](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/foremanweb_zpsz9cpvilv.png)

###Ejercicio 7: Haz alguna modificación a tu aplicación en node.js para Heroku, sin olvidar añadir los tests para la nueva funcionalidad, y configura el despliegue automático a Heroku usando Snap CI o alguno de los otros servicios, como Codeship, mencionados en StackOverflow.

- Me he registrado en [https://snap-ci.com](https://snap-ci.com) y he procedido a conectar con el repositorio deseado.

![registro](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/snip_zpstizkdamu.png)
 
- Posteriormente en Heroku he comprobado que este conectado con **Github** y que tenga el despliegue automático ( consultar pestaña Deploy ).

![despliegue](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/conectadodespliegue_zpsesmmhu40.png)

- He hecho un push al repositorio y he comprobado que efectivamente hace un testeo antes de desplegarlo.

![testeo](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/testeo_zpsth2wby4p.png)

![despliegue](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/build_zps3nmsg96s.png)

- He definido nuevos testeos pues solo añadia los *requirements* y le he añadido el despliegue.

![snaptestdesplie](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/snapyheroku_zpsvqacnzr2.png)

- Cojo la etiqueta markdown de **Snap-ci** que se obtiene dandole al recuadro de notificaciones.

![paso1](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/paso1_zpszqhnuo5b.png)

![paso2](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/paso4_zpsfrp4pley.png)

![github](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/git_zpsx2yiestv.png)

###Ejercicio 8: Preparar la aplicación con la que se ha venido trabajando hasta este momento para ejecutarse en un PaaS, el que se haya elegido

Una vez probado todo lo anterior solo queda hacer algun cambio y subirlo al repositorio, hacer un *git push heroku master* y rezar. Puede consultarse la app [desplegada](https://hidden-meadow-4203.herokuapp.com/) y el [Readme](https://github.com/javiergarridomellado/ej5.git) de la aplicación para consultar los enlaces a Travis y Snap. 







