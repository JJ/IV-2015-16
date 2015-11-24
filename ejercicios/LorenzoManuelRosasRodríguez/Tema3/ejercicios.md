

#Tema 3

###Ejercicio 1 : Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.

Yo me he creado una cuenta en OpenShift:

![img1](https://www.dropbox.com/s/z1jpuni7geoas0v/img1.png?dl=1)

###Ejercicio 2 : Crear una aplicación en OpenShift y dentro de ella instalar WordPress.

Después del paso anterior, recibí un mensaje( a mi correo ) indicándome que verificara la cuenta. Una vez verificada, elegí la opción de crear una aplicación: 

![img2](https://www.dropbox.com/s/ci27pxtqh1gctc7/img2.png?dl=1)

En la anterior ventana elegí wordpress. En la siguiente ventana tuve que rellenar los siguientes campos:


![img3](https://www.dropbox.com/s/qu2e0ughctcdxxs/img3.png?dl=1)

Una vez rellenado los campos, nos dirigimos a nuestra página, donde al principio se nos pedirá instalar wordpress( rellenando los campos correspondientes ). Una vez rellenados esos campos ya tendremos nuestro **WordPress**.

![img4](https://www.dropbox.com/s/zlnn8j71fhjvjxx/img4.png?dl=1)

###Ejercicio 3: Realizar una app en express (o el lenguaje y marco elegido) que incluya variables como en 
el caso anterior.

Para realizar el ejercicio me he ayudado de tutorial [Django Rest Framework](http://www.django-rest-framework.org/tutorial/1-serialization/), con el cual he realizado la serialización, siguiendo los siguientes pasos:

- Instalé **pip install djangorestframework**.

- Añadí  en el archivo de mi proyecto **setting.py**, en el apartado **INSTALLED_APPS** la linea **'rest_framework',**.

- Debo ya haber tenido definido tanto las urls(**urls.py**) como los modelos(**models.py**).

- Realizo **python manage.py makemigrations aplicacion** y **python manage.py migrate** para crear las tablas.

- En la carpeta nuestra aplicación he creado el archivo **serializers.py** , el contenido en mi caso es este ( similar al de mi clase Question de models.py pero usando serializadores):

```
from rest_framework import serializers
from models import Question

class QuestionSerializar(serializers.Serializer):
    question_text = serializers.CharField(max_length=200)
    asunt = serializers.CharField(max_length=200)
    descrip = serializers.CharField()
    date = serializers.CharField()

    def update(self, instance, validated_data):
        """
        Actualizacion y return de una instancia de Persona ya existente con los datos validados
        """
        instance.question_text = validated_data.get('question_text', instance.question_text)
        instance.asunt = validated_data.get('asunt', instance.asunt)
        instance.descrip = validated_data.get('descrip', instance.descrip)
        instance.date = validated_data.get('date', instance.date)
        instance.save()
        return instance

    def create(self, validated_data):
        return Question.objects.create(**validated_data)
```

- Me he sitio en mi submódulo, y pongo **python manage.py shell** para probar que me funciona:

![img5](https://www.dropbox.com/s/dkvi0ydk7g2nmzn/img5.png?dl=1)

- Me dirijo  a mi archivo **polls/views.py** para crear la clase **JSONResponse** e importo lo necesario:

```
from django.views.decorators.csrf import csrf_exempt
from rest_framework.renderers import JSONRenderer
from rest_framework.parsers import JSONParser
from apu.models import Persona
from apu.serializers import PersonaSerializer

...........//Todo lo que teníamos antes.

class JSONResponse(HttpResponse):
	"""
	An HttpResponse that renders its content into JSON.
	"""
	def __init__(self, data, **kwargs):
		content = JSONRenderer().render(data)
		kwargs['content_type'] = 'application/json'
		super(JSONResponse, self).__init__(content, **kwargs)


@csrf_exempt
def Pregunta_lista(request):
	"""
	Lista todos los nombres de personas o la crea
	"""
	if request.method == 'GET':
		preguntas = Question.objects.all()
		serializador = QuestionSerializar(preguntas, many=True)
		return JSONResponse(serializador.data)
	
	elif request.method == 'POST':
		data = JSONParser().parse(request)
		serializador = QuestionSerializar(data=data)
		if serializador.is_valid():
			serializador.save()
			return JSONResponse(serializador.data, status=201)
		return JSONResponse(serializador.errors, status=400)

@csrf_exempt
def Pregunta_detalle(request, pk):
	"""
	Recuperar, actualizar o borrar una persona
	"""
	try:
		pregunta = Question.objects.get(pk=pk)
	except Question.DoesNotExist:
		return HttpResponse(status=404)

	if request.method == 'GET':
		serializador = QuestionSerializar(pregunta)
		return JSONResponse(serializador.data)
	#elif request.method == 'PUT':
	elif request.method == 'POST':
		data = JSONParser().parse(request)
		serializador = QuestionSerializar(persona, data=data)
		if serializador.is_valid():
			serializador.save()
			return JSONResponse(serializador.data,status=202)
		return JSONResponse(serializador.errors, status=400)
	elif request.method == 'DELETE':
		pregunta.delete()
		return HttpResponse(status=204)


```
- Añado en **urls.py** las dos últimas url para ver la serialización fuera de la terminal
```
from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.IndexView.as_view(), name='index'),
    url(r'^(?P<pk>[0-9]+)/$', views.DetailView.as_view(), name='detail'),
    url(r'^(?P<pk>[0-9]+)/results/$', views.ResultsView.as_view(), name='results'),
    url(r'^(?P<question_id>[0-9]+)/vote/$', views.vote, name='vote'),
    url(r'^preguntalist/$', 'polls.views.Pregunta_lista'),
    url(r'^preguntadetail/(?P<pk>[0-9]+)/$', 'polls.views.Pregunta_detalle'),

]
```

- Pongo en la termina **python manage.py runserver** y compruebo que funciona:

![img6](https://www.dropbox.com/s/uez69989u9i67ig/img6.png?dl=1)


###Ejercicio 4: Crear pruebas para las diferentes rutas de la aplicación.
Para realizar ejercicio lo que he hecho es un test en el cual pruebo las dos rutas del ejercicio anterior.Para ejecutarlo pongo **python manage.py test** en la terminal. He añadido al archivo de mi aplicación tests.py lo siguiente:
```

# Create your tests here.
from rest_framework import status
from rest_framework.test import APITestCase
from polls.views import *

class RutasTests(APITestCase):

    def test_pregunta_datail(self):
        q1 = Question(question_text='Other answer?' ,asunt='My other answer',descrip='My other answer',date='1993-05-19',pub_date='1993-05-19')
        q1.save()
        response = self.client.get('/preguntadetail/1/')
        self.assertEqual(response.content,'{"question_text":"Other answer?","asunt":"My other answer","descrip":"My other answer","date":"1993-05-19"}')
        print("Question consultada XD")

    def test_detalle_varias_personas(self):
        q1 = Question(question_text='Other answer?' ,asunt='My other answer',descrip='My other answer',date='1993-05-19',pub_date='1993-05-19')
        q1.save()
        q2 = Question(question_text='Other answer(2)?' ,asunt='My other answer(2)',descrip='My other answer(2)',date='1993-05-19(2)',pub_date='1993-05-19')
        q2.save()
        response = self.client.get('/preguntalist/')
        self.assertEqual(response.content,'[{"question_text":"Other answer?","asunt":"My other answer","descrip":"My other answer","date":"1993-05-19"},{"question_text":"Other answer(2)?","asunt":"My other answer(2)","descrip":"My other answer(2)","date":"1993-05-19(2)"}]')
        print("Varias personas consultadas en detalle correctamente")

```

Añado imagen de la ejecución:

![img7](https://www.dropbox.com/s/sa2dstvlszjylnl/img7.png?dl=1)


###Ejercicio 5: Instalar y echar a andar tu primera aplicación en Heroku.

Para la realización de este ejercicio he hecho los siguientes pasos:

- Instalación de  Ruby con el comando **sudo apt-get install ruby-full**
- Descargar cinturon de Heroku, como estoy con OSX, he descargado el paquete **.dmg** de la página oficial y lo he instalado como una aplicación más.
- Instalación foreman mediante **sudo gem install foreman**
- Instalación las herramientas de django necesarias para el despliegue **pip install django-toolbelt** ( posteriormente se define requirements.txt )
- Definición **requirements.txt** , en mi caso:
```
Django==1.8.6
argparse==1.2.1
dj-database-url==0.3.0
dj-static==0.0.6
django-toolbelt==0.0.1
djangorestframework==3.3.1
foreman==0.9.7
futures==3.0.3
gunicorn==19.3.0
psycopg2==2.6.1
requests==2.8.1
requests-futures==0.9.5
static3==0.6.1
wheel==0.26.0
whitenoise==2.0.4
wsgiref==0.1.2

```

- Definición un archivo **Procfile** , en mi caso ( wsgi corresponde al nombre de la aplicación ):

```
web: gunicorn polls.wsgi --log-file -

```

- Subida de los cambios que he realizado a mi github.

- Login en heroku: **heroku login**

- Crear la app mediante **heroku create**

- Subir la app mediante **git push heroku master**

- En la pestaña derecha de heroku se le da a **open app** y se ve la aplicación desplegada.

- Si da algun error ejecutar en el terminal **heroku logs** para ver que ocurre.

- Para renombrar el nombre de la aplicación no se debe usar la página sino el comando **heroku apps:rename newname** 

- Indicar que quiero usar la base de datos Postgree, para ello en el archivo settings debo poner lo siguiente:

```

import dj_database_url

...

SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')
ALLOWED_HOSTS = ['*']
ON_HEROKU = os.environ.get('PORT')
if ON_HEROKU:
    DATABASE_URL='postgres://uhaxlowwnbgqrv:3decYI2il-srwwKVSDV6a4G-xQ@ec2-54-83-36-203.compute-1.amazonaws.com:5432/da2k9559f8odld'
    DATABASES = {'default': dj_database_url.config(default=DATABASE_URL)}


DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}

.....

STATIC_ROOT = 'staticfiles'
STATIC_URL = '/static/'

STATICFILES_DIRS = (
    os.path.join(BASE_DIR, 'static'),
)


```

- Modificar también wsgi.py:

```

"""
WSGI config for newproject project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.8/howto/deployment/wsgi/
"""

import os
from django.core.wsgi import get_wsgi_application
from dj_static import Cling

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "pollaplication.settings")

application = get_wsgi_application()


application = Cling(get_wsgi_application())
#application = DjangoWhiteNoise(application)



```

-  En DATABASE_URL(archivo settings.py) he puesto como url la sale para la base de datos postgre que Heroku nos ofrece(debemos darle a show para verlo).
- Subir cambios a github y hacer **git push heroku master**.
- Ejecutar el comando **heroku run python manage.py syncdb** ( mas recomendable usar  **heroku run python manage.py makemigrations**, **heroku run python manage.py migrate** y **heroku run python manage.py createsuperuser** )

- Podemos ver como hemos abierto la aplicación en heroku indicando en la terminal **heroku open**:


![img8](https://www.dropbox.com/s/u38kctev732zv3k/img8.png?dl=1)

###Ejercicio 6: Usar como base la aplicación de ejemplo de heroku y combinarla con la aplicación en node que se ha creado anteriormente. Probarla de forma local con foreman. Al final de cada modificación, los tests tendrán que funcionar correctamente; cuando se pasen los tests, se puede volver a desplegar en heroku.

Para la realización de este ejercicio he usado foreman:

- Instalación: **sudo gem install foreman**.

- Funcionamiento:

![img9](https://www.dropbox.com/s/qd293vicacmgs9f/img9.png?dl=1)


###Ejercicio 7: Haz alguna modificación a tu aplicación en node.js para Heroku, sin olvidar añadir los tests para la nueva funcionalidad, y configura el despliegue automático a Heroku usando Snap CI o alguno de los otros servicios, como Codeship, mencionados en StackOverflow.


- Me he registrado en [https://snap-ci.com](https://snap-ci.com) y lo he conectado a mi repositorio:

![img10](https://www.dropbox.com/s/ndp34yqpdffh5gy/img10.png?dl=1)

- Compruebo que el repositorio esta conectado con **Github** y que tiene el despliegue automático ( consultar pestaña Deploy ).

![img11](https://www.dropbox.com/s/dv7x5s2ujo8miwv/img11.png?dl=1)

- Realizo un push al repositorio y compruebo que realiza el testeo antes de desplegarlo.

![img12](https://www.dropbox.com/s/wk9p9es5ucn3dj5/img12.png?dl=1)

- Cojo la etiqueta markdown de **Snap-ci** (pestaña Norificaciones).

![img13](https://www.dropbox.com/s/le7jab6le355ynu/img13.png?dl=1)

###Ejercicio 8: Preparar la aplicación con la que se ha venido trabajando hasta este momento para ejecutarse en un PaaS, el que se haya elegido.

Lo llevo realizando en todos los ejercicios, consultar mi [submodulo](https://github.com/lorenmanu/submodulo-lorenzo).




