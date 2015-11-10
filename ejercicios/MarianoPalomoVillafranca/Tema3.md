Tema 2
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

A continuación, agregamos a nuestro fichero de settings las aplicaciones '`rest_framework`' y '`principal`'. Y pasamos a crear un modelo ejemplo de ejemplo en `models.py`

```python
from django.db import models

class Nota(models.Model)
	titulo = models.CharField(max_length=200)
	descripcion = models.TextField()

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

Configuramos el modelo para que aparezca en el panel de administrador editando el fichero `admin.py`.

```python
from django.contrib import admin
from .models import Nota

admin.site.register(Nota)
```

Accedemos al panel de administrador y creamos un par de notas en la BD.

Una vez hecho todo esto, pasamos a crear un archivo `serializer.py`.

```python
from rest_framework import serializer
from .models import Nota

class NotaSerializer(serializers.ModelSerializer)
	class Meta:
			model = Nota
			fields = ('titulo','descripcion')			
```

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

#### Ejercicio 4: Crear pruebas para las diferentes rutas de la aplicación.

#### Ejercicio 5: Instalar y echar a andar tu primera aplicación en Heroku.

#### Ejercicio 6: Usar como base la aplicación de ejemplo de heroku y combinarla con la aplicación en node que se ha creado anteriormente. Probarla de forma local con foreman. Al final de cada modificación, los tests tendrán que funcionar correctamente; cuando se pasen los tests, se puede volver a desplegar en heroku.

#### Ejercicio 7: Haz alguna modificación a tu aplicación en node.js para Heroku, sin olvidar añadir los tests para la nueva funcionalidad, y configura el despliegue automático a Heroku usando Snap CI o alguno de los otros servicios, como Codeship, mencionados en StackOverflow

#### Ejercicio 8: Preparar la aplicación con la que se ha venido trabajando hasta este momento para ejecutarse en un PaaS, el que se haya elegido.
