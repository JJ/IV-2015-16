#Ejercicios Tema 2

##Ejercicio 1

###Instalar alguno de los entornos virtuales de node.js y, con ellos, instalar la última versión existente, la versión minor más actual de la 0.12 y lo mismo para la 0.11 o alguna impar. Si no se usa habitualmente este lenguaje, hacer lo mismo con cualquier otro lenguaje de scripting.

He instalado el entorno de python [Virtualenv](https://virtualenv.pypa.io/en/latest/)

Para instalarlo basta con ejecutar `pip install virtualenv`

Una vez instalado creamos un entorno virtual usando `virtualenv mi-entorno` y para activarlo `. bin/activate`

![ejercicio1](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema2/ejercicio1_zpsxmfcasjf.png)



##Ejercicio 2

###Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido

Para realizar la aplicación he usado [Django](https://www.djangoproject.com/), consiste en una web en la que se puede crear encuestas, con 3 opciones cada una, votar seleccionando una de esas tres opciones y eliminar encuestas, se encuentra en este [repositorio](https://github.com/acasadoquijada/Aplicacion-Encuestas)


##Ejercicio 3

###Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?

![ejercicio3.png](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema2/ejercicio3_zpskk9oefsz.png)

##Ejercicio 4

###Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente.

El equivalente en python es [setup.py](http://python-packaging.readthedocs.org/en/latest/minimal.html).

Para obtener las dependencias hay que usar `pip freeze`

~~~
from setuptools import setup

setup(name='pollaplication',
      version='0.1',
      description='Web application about polls',
      url='https://github.com/acasadoquijada/pollaplication',
      author='Alejandro Casado Quijada',
      author_email='acasadoquijada@gmail.com',
      license='GNU GPL',
      packages=['django','wheel'],
      zip_safe=False)
~~~

##Ejercicio 5

###Automatizar con grunt y docco (o algún otro sistema) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.

Una opción para generar la documentación en python es [epydoc](http://epydoc.sourceforge.net/), en su web aparecen distintas formas de instalarlo.

Una vez instalado podemos usarlo del siguiente método `epydoc nuestro-paquete`, el resultado de esta operación es un directorio llamado `html`, dentro de él hay un `index.html` mediante el cual accederremos a la documentación

##Ejercicio 6

###Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga (vamos, lo que viene siendo TDD).

Para este ejercicio he realizado un test en el que creamos una encuesta junto a 3 respuestas.

Para ejecutar el test debemos usar `python manage.py test polls`

~~~
class QuestionMethodTests(TestCase):

	def test_create_question(self):
		q = Question(question_text = "Test question",pub_date=timezone.now())

		q.save()

		c = Choice(question = q , choice_text = "Choice test 1", votes=2)

		c.save()

		c = Choice(question = q , choice_text = "Choice test 2", votes=6)

		c.save()

		c = Choice(question = q , choice_text = "Choice test 3", votes=8)

		c.save()


		self.assertEqual(q.question_text, "Test question")
~~~

Al ejecutarlo comprobamos que no hay errores

![ejercicio6-1](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema2/ejercicio6-1_zpsytxl8asc.png)



Ahora vamos a realizar un test para probar que falla una funcionalidad

~~~
def test_was_published_recently_with_future_question(self):

	time = timezone.now() + datetime.timedelta(days=30)
	future_question = Question(pub_date=time)
	self.assertEqual(future_question.was_published_recently(), False)
~~~

En el test creamos una encuesta cuya fecha de creación es la actual + 30 días por lo que el método `was_published_recently()` debe devolver `False`.

Pero al ejecutar el test nos da el siguiente error

![ejercicio6-2](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema2/ejercicio6-2_zpsogwohsdn.png)

El método nos devuelve `True`, por lo que hay que corregirlo

~~~
def was_published_recently(self):
    now = timezone.now()
    return now - datetime.timedelta(days=1) <= self.pub_date <= now
~~~

Tras la correción comprobamos que los test se pasan satisfactoriamente

![ejercicio6-3](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema2/ejercicio6-3_zps19fjetmq.png)


##Ejercicio 7

###Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante. 

En el caso de django disponemos de un fichero `test.py` en el que podemos definir todos los test convenientes. Este fichero nos indica información sobre cada uno de los test, como los que se han realizado correctamente

En mi caso, el fichero `test.py` es el siguiente: 

~~~
import datetime

from django.utils import timezone
from django.test import TestCase

from .models import Question, Choice

class QuestionMethodTests(TestCase):

	def test_create_question(self):
		q = Question(question_text = "Test question",pub_date=timezone.now())

		q.save()

		c = Choice(question = q , choice_text = "Choice test 1", votes=2)

		c.save()

		c = Choice(question = q , choice_text = "Choice test 2", votes=6)

		c.save()

		c = Choice(question = q , choice_text = "Choice test 3", votes=8)

		c.save()

		
		self.assertEqual(q.question_text, "Test question")

	def test_was_published_recently_with_future_question(self):
 
		time = timezone.now() + datetime.timedelta(days=30)
		future_question = Question(pub_date=time)
		self.assertEqual(future_question.was_published_recently(), False)
~~~	

##Ejercicio 8

###Haced los dos primeros pasos antes de pasar al tercero. Configurar integración continua para nuestra aplicación usando Travis o algún otro sitio.

Lo primero que debemos hacer tras darnos de alta en Travis es crear un fichero llamado .travis.yml, lo situaremos en el directorio raíz, este fichero es necesario para la integración continua.

~~~
language: python
python:
 - "2.7"
# command to install dependencies
install:
 - python pollaplication/setup.py install
 - pip install -r pollaplication/requirements.txt
# command to run tests
script:
 - cd pollaplication
 - python manage.py test
~~~

Tras esto, en la web de Travis seleccionamos el respositorio y en el apartado `Current` dentro de opciones nos aparece el resultado de la ejecución de nuestros test

![ejercicio8](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema2/ejercicio8_zpswtmqtlhq.png)






