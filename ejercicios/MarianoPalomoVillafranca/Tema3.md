Tema 3
===
> Mariano Palomo Villafranca

#### Ejercicio 1: Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.
Lo primero es instalar el Toolbelt de Heroku. Ingresamos a [esta dirección](https://toolbelt.heroku.com/) y seguimos las instrucciones en función de nuestro sistema. En nuestro caso, ejecutamos:

	wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh

A continuación, nos [creamos una cuenta en Heroku](https://signup.heroku.com/).

Ahora, en la terminal ejecutamos:

	heroku login

En nuestro caso, como estamos utilizando Django, tendremos que instalar la dependecia siguiente:

	pip install django-toolbelt

Y, ya solo faltaría configurar el archivo de settings correspondiente al deployment, en mi caso `staging.py`, que hereda del archivo de settings `base.py`.

#### Ejercicio 2: Crear una aplicación en OpenShift y dentro de ella instalar WordPress.
Tras registrarnos en OpenShift, indicamos que queremos crear una aplicación WordPress. Introducimos una dirección válida para el dominio y le damos a continuar. Tras unos minutos, ya podrémos [acceder al sitio](https://php-mpvillafranca.rhcloud.com) y comenzar a editarlo.

#### Ejercicio 3: Realizar una app en express (o el lenguaje y marco elegido) que incluya variables como en el caso anterior.
Para crear una API REST en Django, podemos utilizar Django REST Framework o Tastypie, aunque el más utilizado es el primero. Crearemos un proyecto de ejemplo para aprender su uso:

	mkdir api
	virtualenv env
	source env/bin/activate
	pip install django
	django-admin.py startproject apisDjango
	cd apisDjango
	python manage.py startapp principal
	python manage.py migrate
	pip install djangorestframework

A continuación, agregamos a nuestro fichero de settings las aplicaciones '`rest_framework`' y '`principal`'. Y pasamos a crear algunos modelos ejemplo de ejemplo en `models.py`

```python
from django.db import models

# Create your models here.
class Categoria(models.Model):
	nombre = models.CharField(max_length=50)

	def _unicode_(self):
		return self.nombre


class Nota(models.Model):
	titulo = models.CharField(max_length=200)
	descripcion = models.TextField()

	categoria = models.ForeignKey(Categoria)

	fecha_creacion = models.DateTimeField(auto_now_add=True)
	fecha_modificacion = models.DateTimeField(auto_now=True)

	def __unicode__(self):
			return self.titulo
```

Realizamos las migraciones:

	python manage.py makemigrations principal
	python manage.py migrate principal

Ahora crearemos un superusuario:

	python manage.py createsuperuser

Y corremos el servidor:

	python manage.py runserver

Configuramos los modelos para que aparezcan en el panel de administrador editando el fichero `admin.py`.

```python
from django.contrib import admin
from .models import Nota, Categoria

admin.site.register(Nota)
admin.site.register(Categoria)
```

Accedemos al panel de administrador y creamos un par de notas en la BD y una categoría.

Una vez hecho todo esto, pasamos a crear un archivo `serializers.py`.

```python
from rest_framework import serializers
from .models import Nota

class NotaSerializer(serializers.ModelSerializer)
	class Meta:
		model = Nota
		fields = ('titulo','descripcion', 'categoria')
		depth = 1			
```

Como vemos, en este caso, estamos utilizando el `ModelSerializer` para serializar el modelo `Nota`. Para ello, siempre tenemos que asignar el valor del atributo `model` en la clase `Meta` e indicar qué campos incluir.

Ahora, en nuestro archivo de vistas:

```python
from rest_framework import viewsets
from .models import Notafrom .serializers import NotaSerializer

class NotaViewSet(viewsets.ModelViewSet)
	queryset = Nota.objects.all()
	serializer_class = NotaSerializer
```

Pasamos a crear las urls en el `urls.py` que vamos a crear dentro de la carpeta de la app principal.

```python
from django.conf.urls import patterns, include, url
from rest_framework import routers
from .views import NotaViewSet

router =routers.SimpleRouter()
router.register(r'notas',NotaViewSet)

urlpatterns = patterns('',
	url(r'^api/',include(router.urls)),
)
```

No se nos olvide incluirlo dentro del `urls.py` del proyecto.

```python
from django.conf.urls import patterns, include, url
from django.contrib import admin

urlpatterns = patterns('',

	url(r'^',include('principal.urls')),
	url(r'^admin/',include(admin.site.urls)),
)
```

Y ahora ya estamos listos para crear nuestra API REST.

En Django REST Framework también existe la posibilidad de crear un serializador desde 0, de la siguiente forma:

```python
class EjemploSerializer(serializers.Serializer):
	nombre = serializer.CharField(max_length=20)
	email = serializer.EmailField()
```

Y ahora, en la terminal probamos su uso:

```
python manage.py shell
from principal.serializers import EjemploSerializer
mariano = {'nombre':'Mariano', 'email':'mpvillafranca@correo.ugr.es'}
serializer = EjemploSerializer(mariano)
serializer.data
from rest_framework.renderers import JSONRenderer
json = JSONRenderer().render(serializer.data)
json
serializer_dos = EjemploSerilizer(data={'nombre':'Pepe', 'email':'pepe'})
serializer_dos.is_valid()
serializer_dos.errors
```

A continuación realizamos también un ejemplo con el primer serializador creado:

```
python manage.py shell
from principal.serializers import *
from principal.models import *
nota1 = Nota.objects.get(pk=1)
nota1.titulo
a = NotaSerializer(nota1)
a.data
notas = Nota.objects.all()
b = NotaSerializer(notas, many=True)
b.data
```

Otra forma de serializar objectos cuando se tratan de relaciones que incluyen `ForeignKey` es la siguiente:

```python
class CategoriaSerializer(serializers.ModelSerializer):
	class Meta:
		model = Categoria

class NotaSerializer(serializers.HyperlinkedModelSerializer):
	class Meta:
		model = Nota
		fields = ('titulo', 'descripcion', 'categoria')
```

Y añadimos la vista correspondiente:

```python
from .models import Categoria
from .serializers import CategoriaSerializer

class CategoriaViewSet(viewsets.ModelViewSet):
	queryset = Categoria.objects.all()
	serializer_class = CategoriaSerializer
```

Y registramos la url:

```python
from .views import CategoriaViewSet

router.register(r'categorias', CategoriaViewSet)
```

Y ahora comprobamos la diferencia: ahora en lugar del detalle, se nos muestra una URL.

#### Ejercicio 4: Crear pruebas para las diferentes rutas de la aplicación.

Para crear las pruebas de las diferentes rutas de nuestra app, nos vamos al fichero de tests y escribimos el siguiente test:

```python
from rest_framework import status
from rest_framework.test import APITestCase
from .views import *
from .models import *

# Create your tests here.
class RutasTests(APITestCase):
	def test_categorias(self):
		cat = Categoria(nombre='Mi categoria')
		cat.save()
		response = self.client.get('/api/categorias/?format=json')
		self.assertEqual(response.content,'[{"id":1,"nombre":"Mi categoria"}]')
		print "Categoria consultada correctamente"

	def test_notas(self):
		cat = Categoria(nombre='Mi categoria')
		cat.save()
		nota = Nota(titulo='Mi nota', descripcion='Mi primera nota', categoria=cat)
		nota.save()
		response = self.client.get('/api/notas/?format=json')
		self.assertEqual(response.content,'[{"titulo":"Mi nota","descripcion":"Mi primera nota","categoria":"http://testserver/api/categorias/1/?format=json"}]')
		print "Nota consultada correctamente"
```

#### Ejercicio 5: Instalar y echar a andar tu primera aplicación en Heroku.

Ahora nos proponemos subir la aplicación de pruebas de la API rest a Heroku. Para ello, debemos seguir los siguientes pasos:

1. Inicializamos un repositorio con `git init` a la altura donde se encuentre nuestro `manage.py`.
2. Creamos un fichero `requierements.txt` con el siguiente contenido:

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

3. Creamos un fichero `Procfile` con el contenido `web: gunicorn apisDjango.wsgi --log-file -`
4. En el fichero de settings añadimos los datos de acceso a la base de datos cuando estemos en heroku que obtendremos tras crearla y la ruta para los ficheros estáticos:

```
ON_HEROKU = os.environ.get('PORT')
if ON_HEROKU:
	DATABASES = {
		'default': {
		    'ENGINE': 'django.db.backends.postgresql_psycopg2',
		    'NAME': '***',
			'USER': '***',
			'PASSWORD': '***',
			'HOST': '***',
			'PORT': '5432',
		}
	}

STATIC_ROOT = 'staticfiles'
```

5. Ejecutamos en la terminal `python manage.py collectstatic.
6. Ejecutamos `git add .` y `git commit -m "mi primer commit"`.
7. Ahora creamos la aplicación con `heroku create apisdjango`. Consultamos los datos de acceso a la base de datos, los añadimos al fichero de settings y volvemos a hacer git add.
8. Ejecutamos `git push heroku master`
9. Finalmente, accedemos a una url de la aplicación [aquí](http://apisdjango.herokuapp.com/api/notas/)

#### Ejercicio 6: Usar como base la aplicación de ejemplo de heroku y combinarla con la aplicación en node que se ha creado anteriormente. Probarla de forma local con foreman. Al final de cada modificación, los tests tendrán que funcionar correctamente; cuando se pasen los tests, se puede volver a desplegar en heroku.

#### Ejercicio 7: Haz alguna modificación a tu aplicación en node.js para Heroku, sin olvidar añadir los tests para la nueva funcionalidad, y configura el despliegue automático a Heroku usando Snap CI o alguno de los otros servicios, como Codeship, mencionados en StackOverflow

#### Ejercicio 8: Preparar la aplicación con la que se ha venido trabajando hasta este momento para ejecutarse en un PaaS, el que se haya elegido.
