#Desarrollo basado en pruebas.
##Ejercicio 1.
##Instalar alguno de los entornos virtuales de node.js (o de cualquier otro lenguaje con el que se esté familiarizado)

He decidido instalar virtualenv ya que voy a trabajar con python. Su instalación es tan sencilla como poner en la terminal: 
~~~ 
sudo apt-get install python-virtuallenv.
~~~
##Ejercicio 2.
##Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.

He decidido hacer una aplicación basandome en Django. La aplicación consiste en votar una seria de preguntas. Para hacer esta aplicación me he apoyado en el tutorial de la web oficial de Django [Tutorial](https://docs.djangoproject.com/en/1.8/intro/tutorial01/).  
Aqui dejo el enlace a mi [aplicación](https://github.com/srmf9/Proyecto-IV.git).

##Ejercicio 3.
##Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?

![Sin titulo](http://i1028.photobucket.com/albums/y349/Salva_Rueda/Eje3_zpsfhrh3iyn.png)

Como se puede apreciar en la captura de pantalla he ejecutado el servidor con python 2.x y con python 3.x y en ambas funciona correctamente.


##Ejercicio 4.
##Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente.

En python un método similar es setup.py
Este archivo debe encontrarse en el directorio raiz de la aplacación.

from distutils.core import setup

from distutils.core import setup
~~~
setup(name='Encuestas',

      version='1.0',
      description='Aplicación web sobre encuestas',
      author='Salvador Rueda Molina',
      author_email='salviwui@gmail.com',
      url='enlace',
      packages=['Encuestas'],
      install_requires=['django', 'wheel'],
     )
~~~
Las dependencias las he determinado con pip freeze y ejecutando la aplicación dentro de un entorno virtual.
##Ejercicio 5.
##Automatizar con grunt y docco (o algún otro sistema) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.  
Para automatizar la generación de la documetanción he usado epydocs instalandolo de la siguiente manera:  
sudo apt-get install python-epydocs  
Una vez instalado solo con poner epydocs y el directorio que queremos documentar creara una carpeta llamada html donde se encontrara un index.html desde el cual podremos movernos por toda la documentación.

##Ejercicio 6.
##Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga (vamos, lo que viene siendo TDD).
Primero he creado un test para comprobar si fallaba la aplicación.El test consiste en introducir una pregunta en la base de datos con una fecha futura y preguntar si habia sido publicada recientemente. Deberia devovler false pero como vemos en la imagen devuelve true.

![Sin titulo](http://i1028.photobucket.com/albums/y349/Salva_Rueda/ejes6_zps76363lp1.png)
Arreglo el código para que las preguntas futuras la función was_published_recently(self) las devuelva como false y vuelvo a pasar el test.
Y vemos como ya pasa el test.

![Sin titulo](http://i1028.photobucket.com/albums/y349/Salva_Rueda/eje6_2_zps0q6g9lks.png)



##Ejercicio 7.
##Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante.

He añadido más test a mi fichero.
~~~
import datetime

from django.utils import timezone
from django.test import TestCase

from .models import Question


class QuestionMethodTests(TestCase):

	def test_was_published_recently_with_future_question(self):
		"""
		was_published_recently() should return False for questions whose
		pub_date is in the future.
		"""
		time = timezone.now() + datetime.timedelta(days=30)
		future_question = Question(pub_date=time)
		self.assertEqual(future_question.was_published_recently(), False)
	def test_was_published_recently_with_old_question(self):
		"""
		was_published_recently() should return False for questions whose
		pub_date is older than 1 day.
		"""
		time = timezone.now() - datetime.timedelta(days=30)
		old_question = Question(pub_date=time)
		self.assertEqual(old_question.was_published_recently(), False)

	def test_was_published_recently_with_recent_question(self):
		"""
		was_published_recently() should return True for questions whose
		pub_date is within the last day.
		"""
		time = timezone.now() - datetime.timedelta(hours=1)
		recent_question = Question(pub_date=time)
		self.assertEqual(recent_question.was_published_recently(), True)
~~~

##Ejercicio 8.
## Haced los dos primeros pasos antes de pasar al tercero.
1º Nos registramos en la página de Travis.
2º Indicamos el repositorio en el que vamos a aplicar la integración continua.
3º Creamos un archivo llamado .travis.yml y lo configuramos de la siguiente manera:
~~~
language: python
python:
 - "2.7"
# command to install dependencies
install:
 - python aplicacion/setup.py install
 - pip install -r aplicacion/requirements.txt
# command to run tests
script:
 - cd aplicacion
 - python manage.py test
~~~ 
Accedemos a la web de Travis y una vez que este sincronizado con nuestro repositorio en github accedemos a current donde se lanzara nuestra aplicacion instalando todas sus dependendencias y pasandole todos los test. Este sería el resultado:  
![Sin titulo](http://i1028.photobucket.com/albums/y349/Salva_Rueda/Eje8_zps3sfezoti.png) 