# Asignatura: IV Grupo de Practicas Miercoles 8:30h a 10:30h
## Miguel Ángel García Villegas

# Hito 2

Para llevar a cabo éste hito vamos a hacer uso de varias herramientas que vamos a mencionar, en éste documento, cuales son y como poder instalarlas y configurarlas para llevar nuestro objetivo a cabo.

## Python

Vamos a comprobar que tenemos Python instalado

    $ python
Éste comando nos muestra si está o no instalado y qué versión.
Si está instalado sale:

    Python 2.7.6 (default, Jun 22 2015, 17:58:13)
    [GCC 4.8.2] on linux2
    Type "help", "copyright", "credits" or "license" for more information.

Si no está instalado ejecutamos para llevar a cabo la instalación:

    $ sudo aptitude install python2.7

## Instalación de Virtualenv
Virtualenv nos ayuda a crear un entorno virtual de Python, donde podremos instalar paquedes independientes de la versión Python Global.

Para instalar VirtualenV ejecutamos

    $ aptitude install python-virtualenv

Una vez instalado para crear un entorno vitual, ejecutamos:

    $ virtualenv insertaLogo

**insertaLogo** es el nombre de mi entorno virtual, que me dispongo a crear.

La ejecución de la anterior instrucción creará una carpeta de nombre insertaLogo, que será nuestro entorno virtual.
Dentro de la carpeta insertaLogo, hemos creado otros 4 subdirectorios que son:

- insertaLogo
  - bin
  - include
  - lib
  - local

Ahora debemos activar nuestro entorno virtual para comenzar a trabajar en el proyecto.

Para Activar y desactivar un proyecto python en virtualenv, tenemos que utilizar las siguientes instrucciones:

Activar: Dentro de la carpeta del proyecto insertaLogo

      $ source bin/activate
Desactivar:

      (insertaLogo)$ deactivate

Cuando activamos y el prompt de la terminal queda

    (insertaLogo)miguelangel@MiguelAngel ~/IV $

esto significa que estamos trabajando sobre nuestro entorno virtual.

Python es una herramienta que permite tener varios entornos aislados de pruebas, como por ejemplo podríamos tener Python 2.4 y Python 2.7 de forma independiente. Una vez instaladas ambas versiones:

Para activar con Python 2.7

    $ source ./python2.7/bin/activate

Para activar con Python 2.4

    $ source ./python2.4/bin/activate

## Instalación de Pip

Cuando instalamos el entorno virtual también hemos instalado **pip** que es el gestor de paquetes de Python, al igual que apttude o apt-get. Eso si como tenemos activado nuestro entorno virtual los paquetes que instalemos solo se instalarán en dicho entorno.

Muestra:

    $ sudo virtualenv insertaLogo
    [sudo] password for miguelangel:
    New python executable in insertaLogo/bin/python
    Installing setuptools, pip...done.

## Instalación de Django

Teniendo nuestro entorno virtual activado y dentro de la carpeta de dicho entorno, con el gestor de paquetes **pip** vamos a instalar Django, escribimos

    $ pip install Django

Si nos muestra lo siguiente es que todo está ok.

    $ pip install django
    Downloading/unpacking django
    Cleaning up...


Para comprobar si todo ha salido bien:

    $ python -c 'import django; print(django.get_version())'

Y nos saldrá en el terminal, la versión: **1.8.5**

Que es la versión que tengo instalada.

# Vamos a crear el proyecto InsertaLogo

Para crear nuestro proyecto, Django nos facilita el comando **django-admin.py** para manejar nuestros proyectos.

Ejecutamos

    $ sudo django-admin.py startproject insertaLogo

El comando **startproject** crea la carpeta insertaLogo

- manage.py
- insertaLogo
  - __init__.py  
  - settings.py  
  - urls.py  
  - wsgi.py

## Vamos a arrancar el servidor
Debemos crear la base de Datos con las tablas de Django que necesita para arrancar el servidor. Django crea una base de datos local usando Sqlite3. Para crearla debemos ejecutar

    $ python manage.py migrate

Ahora cuando hacemos un ls dentro de la carpeta del proyecto, tenemos:

- manage.py
- insertaLogo
  - __init__.py  
  - settings.py  
  - urls.py  
  - wsgi.py
- db.sqlite3

Una vez ya tenemos todo listo, nos disponemos a arrancar el servidor, ejercutamos el comando:

    $ python manage.py runserver

Cuando ya se haya ejecutado dicha instrucción ya tenemos nuestro servidor funcionando en nuestra máquina local en http://127.0.0.1:8000/ (8000 es el puerto, será éste a no ser que le indiquemos otro)

Si el puerto del servicio por defecto está ocupado, **127.0.0.1:8000** se podría cambiar
ejecutando **python manage.py runserver numPuerto**

    $ python manage.py runserver 8008

    ## Configuración de Settings.py

    **Settings.py**, este archivo permite configurar:
    - La conexión a la base de datos
    - Idioma
    - Zona horaria
    - Directorios principales
    - Aplicaciones

    Vamos ha realizar los siguientes cambios
      Zona Horaria
        TIME_ZONE = 'Europe/Madrid'
      Lenguaje
        LANGUAGE_CODE = 'es-ES'

En nuestro navegado veremos algo así:

Imagen-> https://www.dropbox.com/home/IV?preview=imag.png

# Vamos a crear la App InsertaLogo

Para crear nuestro proyecto appInsertaLogo debemos de ejecutar en el terminal:

    $ python manage.py startapp appInsertaLogo

Una vez creado nuestro proyecto vamos a mostrar nuestra estructura de directorios con el comando:

      $ tree -d insertaLogo

Una vez creado el proyecto tenemos que editar el archivo **settings.py** añadiendo nuestra aplicación, **appInsertaLogo** en la parte **INSTALLED_APPS**

Después de realizar los pasos anteriores con éxito, necesitamos crear las tablas necesarias y posteriormente podremos crear el usuario con el que tendremos acceso.

Para instalar las tablas en la base de datos de la interfaz de administración y crear el super usuario admin ejecuta.

    $ python manage.py syncdb

Éste comando verifica la base de datos para ver si las tablas apropiadas ya existen, y las crea si no existen, pero **syncdb** no sincroniza los cambios

En un caso de que no recordases el usuario que has creado cuando ejecutaste **$ python manage.py syncdb**, para crear este usuario administrador tendrás que ejecutar:

        $ python manage.py createsuperuser

Cuando tenga que hacer migraciones en la base de datos, creación, cambios sincronización en la tablas ejecutamos el siguiente comando:

    $ python manage.py migrate

# Vamos a mostrar el código de nuestro archivos que hemos modificado en el proyecto y en la aplicación

# Proyecto InsertaLogo

## Archivo Settings.py

    """
    Django settings for insertaLogo project.

    Generated by 'django-admin startproject' using Django 1.8.6.

    For more information on this file, see
    https://docs.djangoproject.com/en/1.8/topics/settings/

    For the full list of settings and their values, see
    https://docs.djangoproject.com/en/1.8/ref/settings/
    """

    # Build paths inside the project like this: os.path.join(BASE_DIR, ...)
    import os

    BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    #RUTA_PROYECTO = os.path.dirname(os.path.realpath(__file__))


    # Quick-start development settings - unsuitable for production
    # See https://docs.djangoproject.com/en/1.8/howto/deployment/checklist/

    # SECURITY WARNING: keep the secret key used in production secret!
    SECRET_KEY = 'h^yco%q^(5&bp1vo-+khf$ca=6g_8a_2-0)_fv37=^nhcc0a_2'

    # SECURITY WARNING: don't run with debug turned on in production!
    DEBUG = True
    #TEMPLATE_DEBUG = DEBUG

    ALLOWED_HOSTS = []

    #ADMINS = (
    #        ('Miguel Angel Garcia Villegas', 'magvugr@gmail.com'),
    #)

    #MANAGERS = ADMINS

    # Application definition

    INSTALLED_APPS = (
        'django.contrib.admin',
        'django.contrib.auth',
        'django.contrib.contenttypes',
        'django.contrib.sessions',
        'django.contrib.messages',
        'django.contrib.staticfiles',
    #    'django.contrib.admindocs',
        'appInsertaLogo',
    )

    #LOGGING = {
    #    'version': 1,
    #    'disable_existing_loggers': False,
    #    'filters': {
    #        'require_debug_false': {
    #            '()': 'django.utils.log.RequireDebugFalse'
    #        }
    #    },
    #    'handlers': {
    #        'mail_admins': {
    #            'level': 'ERROR',
    #            'filters': ['require_debug_false'],
    #            'class': 'django.utils.log.AdminEmailHandler'
    #        }
    #    },
    #    'loggers': {
    #        'django.request': {
    #            'handlers': ['mail_admins'],
    #            'level': 'ERROR',
    #            'propagate': True,
    #        },
    #    }
    #}

    #Configuraciones para enviar mensajes usando gmail
    #EMAIL_USE_TLS = True
    #EMAIL_HOST = 'smtp.gmail.com'
    #EMAIL_HOST_USER = 'remitente@gmail.com'
    #EMAIL_HOST_PASSWORD = 'clavedelcorreo'
    #EMAIL_PORT = 587


    MIDDLEWARE_CLASSES = (
        'django.contrib.sessions.middleware.SessionMiddleware',
        'django.middleware.common.CommonMiddleware',
        'django.middleware.csrf.CsrfViewMiddleware',
        'django.contrib.auth.middleware.AuthenticationMiddleware',
        'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
        'django.contrib.messages.middleware.MessageMiddleware',
        'django.middleware.clickjacking.XFrameOptionsMiddleware',
        'django.middleware.security.SecurityMiddleware',
    )
    #SITE_ID = 1

    # If you set this to False, Django will make some optimizations so as not
    # to load the internationalization machinery.
    #USE_I18N = True

    # If you set this to False, Django will not format dates, numbers and
    # calendars according to the current locale.
    #USE_L10N = True

    # If you set this to False, Django will not use timezone-aware datetimes.
    #USE_TZ = True

    # Absolute filesystem path to the directory that will hold user-uploaded files.
    # Example: "/home/media/media.lawrence.com/media/"
    #MEDIA_ROOT = os.path.join(RUTA_PROYECTO,'carga')

    # URL that handles the media served from MEDIA_ROOT. Make sure to use a
    # trailing slash.
    # Examples: "http://media.lawrence.com/media/", "http://example.com/media/"
    # Configurar esta linea es importante puede quedar algo asi:
    # MEDIA_URL = 'http://localhost:90/media/'
    #MEDIA_URL = 'http://127.0.0.1:8000/media/'

    # Absolute path to the directory static files should be collected to.
    # Don't put anything in this directory yourself; store your static files
    # in apps' "static/" subdirectories and in STATICFILES_DIRS.
    # Example: "/home/media/media.lawrence.com/static/"
    #STATIC_ROOT = ''

    # URL prefix for static files.
    # Example: "http://media.lawrence.com/static/"
    # Esto debe configurarse de manera similar que el media para poder servir archivos estaticos
    # Puede ser algo como esta linea comentada
    # STATIC_URL = 'http://localhost:90/static/'
    #STATIC_URL = '/static/'

    # Additional locations of static files
    #STATICFILES_DIRS = (
        # Put strings here, like "/home/html/static" or "C:/www/django/static".
        # Always use forward slashes, even on Windows.
        # Don't forget to use absolute paths, not relative paths.
    #    os.path.join(RUTA_PROYECTO,'static'),
    #)

    # List of finder classes that know how to find static files in
    # various locations.
    #STATICFILES_FINDERS = (
    #    'django.contrib.staticfiles.finders.FileSystemFinder',
    #    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
    #    'django.contrib.staticfiles.finders.DefaultStorageFinder',
    #)

    ROOT_URLCONF = 'insertaLogo.urls'

    TEMPLATES = [
        {
            'BACKEND': 'django.template.backends.django.DjangoTemplates',
            'DIRS': [],
            'APP_DIRS': True,
            'OPTIONS': {
                'context_processors': [
                    'django.template.context_processors.debug',
                    'django.template.context_processors.request',
                    'django.contrib.auth.context_processors.auth',
                    'django.contrib.messages.context_processors.messages',
                ],
            },
        },
    ]

    WSGI_APPLICATION = 'insertaLogo.wsgi.application'


    # Database
    # https://docs.djangoproject.com/en/1.8/ref/settings/#databases

    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.sqlite3',
            'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
        }
    }


    # Internationalization
    # https://docs.djangoproject.com/en/1.8/topics/i18n/

    LANGUAGE_CODE = 'es-ES'

    TIME_ZONE = 'Europe/Madrid'

    USE_I18N = True

    USE_L10N = True

    USE_TZ = True


    # Static files (CSS, JavaScript, Images)
    # https://docs.djangoproject.com/en/1.8/howto/static-files/

    STATIC_URL = '/static/'


## Archivo Urls.py

    from django.conf.urls import include, url
    from django.contrib import admin

    urlpatterns = [
        url(r'^admin/', include(admin.site.urls)),
    ]

## Archivo Wsgi.py

    import os

    from django.core.wsgi import get_wsgi_application

    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "insertaLogo.settings")

    application = get_wsgi_application()

# Aplicación appInsertaLogo

## Archivo Admin.py
    #from appInsertaLogo.models import Logo, Comentario
    from django.contrib import admin
    from .models import Usuario

    admin.site.register(Usuario)

    #admin.site.register(Logo)

## Archivo Forms.py

    #encoding:utf-8
    #from django.forms import ModelForm
    from django import forms
    #from appInsertaLogo.models import Logo, Comentario
    from insertaLogo.models import Usuario

    #class crea_usuario(object):
    #	"""docstring for crea_usuario"""
    #	def __init__(self, arg):
    #		super(crea_usuario, self).__init__()
    #		self.arg = arg

    class crea_usuario(forms.ModelForm):
        class Meta:
            model = Usuario
            fields = ('nombre','apellidos','user','password', 'email')


    #class ContactoForm(forms.Form):
    #	correo = forms.EmailField(label = 'Tu correo electrónico')
    #	mensaje = forms.CharField(widget = forms.Textarea)

    #class LogoForm(ModelForm):
    #    class Meta:
    #        model = Logo

## Archivo Models.py

    from django.db import models
    #from django.contrib.auth.models import User

    class Usuario(models.Model):
    	nombre = models.CharField(max_length = 50)
    	apellidos = models.CharField(max_length = 80)
    	user = models.CharField(max_length = 20)
    	password = models.CharField(max_length = 20)
    	email = models.TextField(verbose_name='Email', help_text='Direccion de correo Electronico')

    	def __str__(self):
    		return self.nombre

    class Admin:
        pass

    # Create your models here.
    #class Logo(models.Model):

    #	nombre = models.CharField(max_length=100)
    #	email = models.TextField(verbose_name='Email', help_text='Direccion de correo Electronico')
    #	imagenLogo = models.ImageField(upload_to='logos', verbose_name='Imagen')
    #	usuario = models.ForeignKey(User)

    #	def __str__(self):
    #		return self.nombre

## Archivo Tests.py

    #from django.test import TestCase

    # Create your tests here.

    #class SimpleTest(TestCase):
    #    def test_basic_addition(self):
    #        """
    #        Tests that 1 + 1 always equals 2.
    #        """
    #        self.assertEqual(1 + 1, 2)

    from django.test import TestCase
    from django import forms

    from .forms import crea_usuario
    from .models import Usuario


    class TestRunninU(TestCase):
    	def test_usuarios(self):
    		user = Usuario(nombre = 'nombre',apellidos = 'apellidos',user = 'user',password = 'pass', email = 'email')
    		user.save()
    		self.assertEqual(user.nombre,'nombre')
    		print("Se ha creado usuario, Test = OK")

    	def test_cambiar_nombre(self):
    		user = Usuario(nombre = 'nombre',apellidos = 'apellidos',user = 'user',password = 'pass', email = 'email')
    		user.save()
    		user.nombre='CambioNombre'
    		user.save()
    		self.assertEqual(user.nombre,'CambioNombre')
    		print("Se ha realizado el cambio de nombre, Test = OK")


    	def test_cambiar_email(self):
    		user = Usuario(nombre = 'nombre',apellidos = 'apellidos',user = 'user',password = 'pass', email = 'email')
    		user.save()
    		user.email='CambioEmail'
    		user.save()
    		self.assertEqual(user.email,'CambioEmail')
    		print("Se ha realizado el cambio de email, Test = OK")

    class TestRunninFU(TestCase):
    	def test_form_usuarios(self):
    		data_form = {'nombre' : 'nombre','apellidos' : 'apellidos','user' : 'user', 'password': 'pass', 'email':'email'}
    		form = crea_usuario(data = data_form)
    		self.assertTrue(form.is_valid())
    		print("Formulario Usuario, Test = OK")

# Continuamos con llevar a cabo el proyecto

Crear fichero **setup.py** y guardarlo en la carpeta insertaLogo, junto al fichero **manage.py**

## Archivo Setup.py

    from setuptools import setup

    setup(name='Inserta Logo',
      version='0.0.1',
      description='Proyecto IV-DAI',
      url='https://github.com/magvugr',
      author='Miguel Angel Garcia Villegas',
      author_email='magvugr@gmail.com',
      license='GNU General Public License',
      packages=['insertaLogo'],
      install_requires=[
          'django',
          'wheel',
      ],
      zip_safe=False)

Una vez creado el fichero, ejecutamos el comando

    $ python setup.py install

**python setup.py install** se utiliza para instalar (normalmente de terceros) de los paquetes que usted no va a ser el desarrollo/edición/depuración de sí mismo.

Para saber los paquetes instalados utilizamos el comando **freeze**

    $ pip freeze

Éste comando nos muestra:

    Django==1.8.6
    Inserta-Logo==0.0.1
    argparse==1.2.1
    wheel==0.26.0
    wsgiref==0.1.2

Vamos a utilizar la herramienta de python, **Pycco** que nos creará la documentación.

Para instalar pycco, ejecutamos el siguiente comando

    $ pip install pycco

Una vez teniendo pycco instalado, nos disponemos a ejecutar el comando para que realice la documentación de nuestro proyecto.
Vamos a crear la documentación de nuestro proyecto **setup.py**

    $ pycco setup.py

Éste comando nos ha creado una carpeta docs, que contiene un fichero llamado **setup.html** y un fichero **pycco.css**


## Vamos a realizar pruebas test

Ejecutamos para hacer las pruebas el comando

    $ python manage.py test

Resultados:

    (insertaLogo)miguelangel@MiguelAngel ~/Escritorio/Curso15-16/IV/insertaLogoGitHub/insertaLogo/insertaLogo $ python manage.py test
    Creating test database for alias 'default'...
    Formulario Usuario, Test = OK
    .Se ha realizado el cambio de email, Test = OK
    .Se ha realizado el cambio de nombre, Test = OK
    .Se ha creado usuario, Test = OK
    .
    ----------------------------------------------------------------------
    Ran 4 tests in 0.005s

    OK
    Destroying test database for alias 'default'...

## Imágenes de muestra

Acceso de usuario Admin
https://www.dropbox.com/home/IV?preview=Acceso+para+Admin.png

Administración Django
https://www.dropbox.com/home/IV?preview=Administraci%C3%B3n+Django.png

Modificar Usuario
https://www.dropbox.com/home/IV?preview=Usuario+a+modificar.png

## Travis para integración continua

Vamos a darnos de alta en Travis CI.-> https://travis-ci.org/

## Archivo  **.travis.yml**

    language: python
    python:
     - "2.7"
    # command to install dependencies
    install:
     - sudo apt-get install python-dev
     - pip install -q Django==1.8.5
     - pip install -q wheel==0.24.0
     - pip install pycco
    # command to run tests
    script:
     - pycco insertaLogo/insertaLogo/*.py
     - pycco insertaLogo/insertaLogo/appInsertaLogo/*.py
     - python insertaLogo/insertaLogo/manage.py test insertaLogo

    branches:
      - only:
        - master

Accedemos a la web de Travis y una vez que este sincronizado con nuestro repositorio en github accedemos a current.
Todo Ok.
El fichero travis en el repositorio github tiene que llamarse .travis.yml

    Enlace: https://travis-ci.org/magvugr/InsertaLogo

Imágenes
https://www.dropbox.com/home/IV?preview=travis+01.png

https://www.dropbox.com/home/IV?preview=travis+2.png

También lo he realizado con **Circleci**, como tenía que realizar un cambio he aprovechado para ver otra herramienta de Integración Continua.

Aquí os pongo imagen de la muestra y solución.

    Enlace: https://circleci.com/gh/magvugr/InsertaLogo/4
