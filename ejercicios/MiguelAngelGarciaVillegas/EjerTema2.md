# Asignatura: IV Grupo de Practicas Miercoles 8:30h a 10:30h
## Miguel Ángel García Villegas

# Ejercicios Tema 2

## Hito 2 en mi Proyecto
## [InsertaLogo](https://github.com/magvugr/InsertaLogo.git)
[Miguel Ángel García Villegas, proyecto relacionado con Dai, InsertaLogo]
##Guía del Proyecto -> https://github.com/magvugr/InsertaLogo/blob/master/Gu%C3%ADa%20paso%20a%20paso%20Hito%202.md

## Ejercicio 1.
### Instalar alguno de los entornos virtuales de node.js (o de cualquier otro lenguaje con el que se esté familiarizado) y, con ellos, instalar la última versión existente, la versión minor más actual de la 4.x y lo mismo para la 0.11 o alguna impar (de desarrollo).

###Vamos a instalar Python Virtualenv en una máquina con Ubuntu

Primero asegurarnos que tenemos instalados unos paquetes comunes de python que nos serán necesarios.
**sudo apt-get install python-software-properties**

Ahora comenzamos a ejecutar los comandos para llevar a cabo la instalación
**$ sudo apt-get install python-virtualenv**

Para crear un virtualenv simplemente se ejecuta el siguiente comando desde una terminal:
**virtualenv NombreProyecto**

Y se crea un directorio NombreProyecto, el cual contiene tres directorios más, bin/, include/ y lib/

En el directorio bin/ se encuentran los ejecutables necesarios para interactuar con el virtualenv. En include/ se encuentran algunos archivos de cabecera de C (cuya extensión es *.h) necesarios para compilar algunas librerías de Python. Y finalmente en lib/ se encuentra una copia de Python así como un directorio llamado site-packages/ en el cual se aloja el código fuente de los paquetes Python instalados en el virtualenv.

Para Activar y desactivar un proyecto python en virtualenv
Activar: Dentro de la carpeta del proyecto
**$ source bin/activate**

Desactivar:
**(NombreProyecto)$ deactivate**

Para Instalar paquetes en un proyecto python virtualenv, ejemplo django
**(NombreProyecto)$ pip install django**

###Instalación NVM
NVM, que es el que nos interesa, permite instalar múltiples versiones de Node.js y npm en un mismo ambiente, dejando cada una completamente aislada de las otras. Sí, puedes tener Node v0.4 y v0.11 instaladas en tu equipo y ejecutar una u otra según lo necesites
**sudo apt-get install -y curl build-essential libssl-dev git**

Para instalar las versiones que nos piden:
**nvm install v0.11.15**
**nvm install v4.0.0**

Para mostrar las que tienes instaladas:
**nvm ls**

## Ejercicio 2.
### Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido. Se trata de hacer una aplicación simple que se pueda hacer rápidamente con un generador de aplicaciones como los que incluyen diferentes marcos MVC. Si cuesta mucho trabajo, simplemente prepara una aplicación que puedas usar más adelante en el resto de los ejercicios.

Para éste ejercicio podríamos elegir varias opciones, como por ejemplo, node.js y express, aunque finalmente me he decidido hacerlo en python con Django. Una vez instalado python (explicado ejercicio anterior), arrancamos el virtualenv IV2 (mi proyecto). A continuación de ejecutar ése comando, para Activar y desactivar un proyecto python en virtualenv
Activar: Dentro de la carpeta del proyecto
**$ source bin/activate**

Desactivar:
**(NombreProyecto)$ deactivate**

Y una vez activado nos disponemos a instalar django en paquetes en un proyecto python virtualenv,
**(NombreProyecto)$ pip install django**

Ahora vamos a crear nuestro proyecto.
**django-admin.py startproject practicaEmpresas**

Esta instrucción creará:
 - [] manage.py
 - [] practicaEmpresas
	- [] __init__.py
	- [] settings.py
	- [] urls.py
	- [] wsgi.py

Para ver que el proyecto funciona
**python manage.py migrate**
**python manage.py runserver**

Si el puerto del servicio está ocupado, 127.0.0.1:8000 se podría cambiar
ejecutando python manage.py runserver numPuerto (ejemplo 8888)

https://www.dropbox.com/s/0gjdbfq07shiw0g/imag.png?dl=0

Cuando comprobamos que todo funciona correctamente, nos disponemos a crear la aplicación.
Desde la carpeta del proyecto, debemos ejecutar el comando
**python manage.py startapp appPracticas**

Después de ésta instrucción, nuestra carpeta IV2 queda con éste contenido.

 - [] manage.py
 - [] practicaEmpresas
	- [] __init__.py
	- [] settings.py
	- [] urls.py
	- [] wsgi.py

- [] appPracticas.py
  - [] __init__.py
  - [] models.py
  - [] test.py
  - [] views.py

## Ejercicio 3.
### Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?


Hemos estado ejecuntando el programa con python 2.7.6 y sin problema.

miguelangel@MiguelAngel ~/Escritorio/Curso15-16/IV$ python
Python 2.7.6 (default, Jun 22 2015, 17:58:13)
[GCC 4.8.2] on linux2
Type "help", "copyright", "credits" or "license" for more information.

Vamos a cambiar la versión de python, con IDLE a ver que tal...

**sudo apt-get install idle-python3.4**
**sudo apt-get update**

Lo ejecutamos con **idle-python3.4**

Python 3.4.3 (default, Oct 14 2015, 20:28:29)
[GCC 4.8.4] on linux
Type "copyright", "credits" or "license()" for more information.


Nos muestra errores y no ejecuta. No es compatible.  

Cuando tenemos instalados varias versiones y nos disponemos a cambiar de una versión a otra, simplemente hacemos **update-alternatives --config python** y el sistema nos muestra la lista de opciones que tiene registradas y pregunta que versión queremos utilizar.

## Ejercicio 4.
### Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente.

Vamos a crear la descrpcion en el archivo setup.py
Y se instala **python setup.py install**

- [] manage.py
- [] practicaEmpresas
- [] setup.py

Contenido del fichero setup.py

    import os
      from setuptools import setup

        def read(fname):
        return open(os.path.join(os.path.dirname(__file__), fname)).read()

setup(

      name = "practicas Empresas",
    version = "0.0.1",
    author = "Miguel Angel Garcia Villegas",
    author_email = "magvugr@gmail.com",
    description = ("Tema 2 Ejercicios "
                                   "practicasEmpresas."),
    license = "GNU",
    keywords = "documentacion tutorial",
    url = "https://github.com/magvugr/IV2.git",
    packages=['practicasEmpresas', 'tests'],
    #long_description=read('README'),
    classifiers=[
        "Development Status :: 3 - Alpha",
        "Topic :: Utilities",
        "License :: OSI Approved :: GNU General Public License",
    ],
)


## Ejercicio 5.
### Automatizar con grunt y docco (o algún otro sistema) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.

Como estamos utilizando python, podríamos hacer una buena documentación utilizando Pycco.
Si estás utilizando el Node.js pueden usar Docco.

Primero lo instalamos **sudo pip install pycoo**

Luego creamos la documentación **pycco practicasEmpresas/*.py practicasEmpresas/static/js/appPracticas.js**

Y en docs/ vamos a encontrar los resultados.



## Ejercicio 6.
### Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga (vamos, lo que viene siendo TDD).

Archivo Admin.py

    from django.contrib import admin
    from .models import Empresa, Alumnos

    admin.site.register(Empresa)
    admin.site.register(Alumnos)

Archivo Models.py

    from django.db import models
    from datetime import datetime

    class Empresa(models.Model):

    nombre = models.CharField(max_length=50)
    nAlumnos = models.IntegerField(default=0)
    def __str__(self):
        return self.nombre

        class Alumnos(models.Model):

    nombrePrac = models.CharField(max_length=50)
    calificacion = models.IntegerField(default=0)
    empresa = models.ForeignKey(Empresa)
    def __str__(self):
        return self.Nombre

Archivo test.py

Para crear empresa

    empresa = Empresa(nombre='UGR', nAlumnos = 23)
    empresa.save()
    self.assertEqual(empresa.nombre,'test')
    print("Se ha creado satisfactoriamente")

Para Crear Alumno

    alumno = Alumnos(nombrePrac='test', calificacion ='6', empresa = UGR)
    alumno.save()
    self.assertEqual(alumno.nombre,'test')
    print("Se ha creado satisfactoriamente")

Una vez tenemos los archivos creados, ejecutar **python manage.py test**

## Ejercicio 7.
### Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante.

Archivo test.py

    from django.test import TestCase

    from .forms import addEmpresa, addAlumno
    from .models import Empresa, Alumnos
    from datetime import datetime

    class EmpresaModelTest(TestCase):
    def test_Empresa_representation(self):
    empresa = Empresa(nombre='UGR', nAlumnos = 23)
    empresa.save()
    self.assertEqual(empresa.nombre,'test')
    print("La empresa se ha creado satisfactoriamente")

    def test_formularioEmpresa_representation(self):
        empresa = { 'nombreEmpresa' : 'test', 'nAlumnos' : 23}
        form = addEmpresa(data=empresa)
        self.assertTrue(form.is_valid())
        print("Se ha comprobado el formulario de la empresa")

        class AlumnosModelTest(TestCase):
    def test_Alumnos_representation(self):
        empresaA = Empresa(nombre='test', nAlumnos=23)
        empresaA.save()
        alumno = Practicos(Nombre = 'alumno', calificacion=10, empresa=empresaA)
        alumno.save()
        self.assertEqual(empresaA.empresa, empresa)
        print("calificado a la empresa")

    def test_formularioAlumnos_representation(self):
        empresaf = Empresa(nombre='test', nAlumnos=23, )
        empresaf.save()
        alumno = { 'Nombre' : 'alumno', 'calificacion' : 10, 'empresa' : empresaf.id }
        form = insertaPractico(data=alumno)
        self.assertTrue(form.is_valid())
        print("formulario de los practicos")

Y para ejecutar

$ python manage.py makemigrations

$ python manage.py migrate

$ python manage.py runserver

## Ejercicio 8.
### Ejercicio: Haced los dos primeros pasos antes de pasar al tercero.


Vamos a darnos de alta en Travis CI.

Archivo  travis.yml

    language: python
    python:
    - "2.7.6"
    # command to install dependencies
    install:
    - python aplicacion/setup.py install
    - pip install -r aplicacion/requirements.txt
    # command to run tests
    script:
    - cd aplicacion
    - python manage.py test


Accedemos a la web de Travis y una vez que este sincronizado con nuestro repositorio en github accedemos a current.
