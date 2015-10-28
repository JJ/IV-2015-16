#Ejercicios - Jesús Prieto López
##TEMA 2

###Ejercicio 1:Instalar alguno de los entornos virtuales de node.js y, con ellos, instalar la última versión existente, la versión minor más actual de la 0.12 y lo mismo para la 0.11 o alguna impar. Si no se usa habitualmente este lenguaje, hacer lo mismo con cualquier otro lenguaje de scripting. 

He utilizado *nodeenv* para el entorno de node.js. Lo podemos instalar con el siguiente comando:

`$ sudo pip install nodeenv`

![Instalación nodeenv](http://i1175.photobucket.com/albums/r628/jesusgorillo/instalacion%20nodeenv_zpsuqrs7jat.png)

*En caso de necesitar *pip* lo instalamos con `$ sudo apt-get install python-pip`

 Una vez instalado, creamos un entorno y lo activamos

`$ nodeenv env`

`$ . env/bin/activate`

Desde aquí podemos comprobar la versión con el siguiente comando:

`(env)$ node -v`

![Creación del entorno, activación y comprobación de versión](http://i1175.photobucket.com/albums/r628/jesusgorillo/entorno%20nodeenv_zps9hdhtwga.png)

Y desactivamos el entorno para seguir

`(env)$ deactivate`


He instalado la última versión minor de la 0.12, que es la 0.12.7, y la versión 0.11.16.

`$ nodeenv --node=0.12.7 --prebuilt env-0.12.7-prebuilt`

`$ nodeenv --node=0.11.16 --prebuilt env-0.11.16-prebuilt`

![Instalación de diferentes versiones de nodeenv](http://i1175.photobucket.com/albums/r628/jesusgorillo/instalacion%20versiones%20nodeenv_zpsaorhvpqf.png)

También he instalado *virtualenv*

![Instalación de virtualenv](http://i1175.photobucket.com/albums/r628/jesusgorillo/instalacion%20virtualenv_zpsw8nlixro.png)


###Ejercicio 2: Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.

He realizado este ejercicio con python y el framework Django. Para ello he hecho uso de *virtualenv* creando un entorno virtual y luego he instalado django en él.

`$ virtualenv <miproyecto>`

Activamos el entorno:

`$ source bin/activate`

E instalando django:

`(<mientorno>)$ pip install Django`

![Creación del entorno con virtualenv e instalación del framework django](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap1_zpszuzakpx4.png)

He creado el proyecto de Django con el siguiente comando:

`(<mientorno>)$ django-admin startproject <nombreproyecto>`

Dentro del proyecto ya podemos empezar nuestra aplicación y levantar el servidor.

`(mientorno)$ python manage.py startapp <app>`

`(<mientorno>)$ python manage.py runserver`

La aplicación web está en el siguiente repositorio: [califpy-empresa](https://github.com/JesGor/califpy-empresa)

Si queremos hacerla funcionar tan solo tenemos que descargarla, acceder al directorio */califpy-empresa* y activar el entorno (lo he subido con el entorno que se desarrolló):

`$source bin/activate`

Después tan solo tenemos que acceder al directorio */califpy-empresa/web* y ejecutar la aplicación:

`$python manage.py runserver`

![Ejecución de la aplicación](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap2_zpsah8gvwm6.png)

Desde el navegador ahora podemos acceder a la web con la dirección http://127.0.0.0:8000


###Ejercicio 3: Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?

El programa lo he desarrollado con la versión 2.7.6 de python. Podemos ver la versión activando el entorno virtual y escribiendo python.

`$ source bin/activate`

`$python`

![Captura con la versión de python en el entorno virtual](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap3_zpsnqm08gkv.png)

Y funciona correctamente como hemos visto antes. Pero ahora vamos a cambiar de versión, para ello cambiamos la versión de python dentro del entorno virtual creado.

`$virtualenv -p /usr/bin/python3 califpy-empresa`

Activamos el entorno:

`$ cd califpy-empresa`
`$ source bin/activate`

Podemos comprobar la versión de python con:
`$python`

Ejecutamos la aplicación para comprobar que funciona.

`$ cd web`
`$ python manage.py runserver`

![Captura con el fallo recibido tras usar otra versión de python](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap4_zpskvsguv6k.png)

Vemos que aparece un error al utilizar esta versión de python, al parecer por algún módulo de *django*.

###Ejercicio 4: Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente. 

Como se trata de python no podemos usar package.json. En este caso se utiliza un archivo setup.py que trabaja de forma parecida y sirve para describir el módulo.

Podemos hacer uso del comando *pip freeze* para saber las dependencias.

`<mientorno>$ pip freeze`

![Captura con las dependencias](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap5_zpstts1bvsr.png)

La descripción del módulo *setup.py* quedaría tal que así:

```python
from setuptools import setup

setup(name='web',
	version='0.0.1',
	description='Web para dar de alta a empresas que tendran asociadas varias calificaciones hechas por alumnos',
	url='https://github.com/JesGor/califpy-empresa',
	author='Jesus Prieto Lopez',
	author_email='jesusgorillo@gmail.com',
	license='GNU General Public License',
	packages=['web'],
	install_requires=[
		'django',
		'wheel',
	],
	zip_safe=False)
```

Para instalar el package localmente utilizamos:

`$ python setup.py install`

Otra alternativa para instalar las dependencias sería hacer uso del archivo *requirements.txt*.

`$ pip install -r requirements.txt`

###Ejercicio 5: Automatizar con grunt y docco (o algún otro sistema) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.

Para este ejercicio he utilizado [epydoc](http://epydoc.sourceforge.net/), para automatizar la generación de documentación de los módulos creados con python.

Podemos instalarlo en nuestro entorno con:

`$ pip install epydoc`

Nos debemos crear un directorio para la documentación dentro de nuestro proyecto, por ejemplo, con el nombre *docs*. Dentro de ese directorio lanzamos *epydoc* para que nos genere la documentación automáticamente.

`$ mkdir docs`
`$ epydoc ../app`

Cuando ejecutemos este último comando se creará una carpeta *html* en *docs* que contendrá la documentación, podemos acceder a la página mediante el *index.html*.

**Es necesario tener comentada la aplicación (módulos, funciones, clases, etc) con docstrings para que la documentación no esté vacía.**

###Ejercicio 6: Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan.

Mediante asserciones he comprobado que no hay fallos a la hora de utilizar un formulario para la creación de una empresa, ni a la hora de crear una empresa. Estas son las comprobaciones:

```python
	e = Empresa(nombre='test', ciudad='ciudadtest', sector='sectortest')
	e.save()
	self.assertEqual(e.nombre,'test')
	print("Test de creacion de empresa correcto, test superado")
```

![Salida por consola al ejecutar el test de creación de empresa](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap6_zpsavaczukk.png)


```python
	datos = { 'nombre' : 'test', 'ciudad' : 'ciudadtest', 'sector' : 'sectortest' }
	form = crearEmpresaForm(data=datos)
	self.assertEqual(form.is_valid(),True)	
	print("Formulario para crear empresa correcto, test superado")
```

![Salida por consola al ejecutar el test del formulario creación de empresa](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap7_zpshx8sdc6g.png)

###Ejercicio 7: Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante.

Con django disponemos de un marco de ejecución de test que he usado directamente. En él se indica cuántos test han ido correctamente y cuanto se ha tardado en realizar los test.
Si queremos podemos añadir en los diferentes test una descripción mediante *print* para saber qué está haciendo.

```python
from django.test import TestCase

from .forms import crearEmpresaForm, crearCalificacionForm
from .models import Empresa, Calificacion

class empresaTestCase(TestCase):
	def test_crear_empresa(self):
		e = Empresa(nombre='test', ciudad='ciudadtest', sector='sectortest')
		e.save()
		self.assertEqual(e.nombre,'test')
		print("Creada empresa")
		
	def test_formulario_empresa(self):
		datos = { 'nombre' : 'test', 'ciudad' : 'ciudadtest', 'sector' : 'sectortest' }
		form = crearEmpresaForm(data=datos)
		self.assertTrue(form.is_valid())
		print("Comprobado formulario de empresa")	

class calificacionTestCase(TestCase):
	def test_crear_calificacion(self):
		e = Empresa(nombre='test', ciudad='ciudadtest', sector='sectortest')
		e.save()
		c = Calificacion(alumno='atest', calificacion='10', empresa=e)
		c.save()
		self.assertEqual(c.empresa, e)
		print("Creada calificacion")
		
	def test_formulario_calificacion(self):
		e = Empresa(nombre='test', ciudad='ciudadtest', sector='sectortest')
		e.save()
		datos = { 'alumno' : 'atest', 'calificacion' : 10, 'empresa' : e.id }
		form = crearCalificacionForm(data=datos)
		self.assertTrue(form.is_valid())
		print("Comprobado formulario de calificacion")
```
![Salida por consola al ejecutar todos los test](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap8_zpsrpmtsjd0.png)


###Ejercicio 8: Ejercicio: Haced los dos primeros pasos antes de pasar al tercero. Configurar integración continua para nuestra aplicación usando Travis o algún otro sitio.

Utilizando Travis, nos damos de alta en su [página web](https://travis-ci.org/) mediante Github y añadimos nuestro repositorio en la configuración.

Tenemos que crear un archivo *.travis.yml*, en el directorio raíz, que sirve para la configuración de la integración continua. En mi caso este es mi fichero:

```
language: python
python:
 - "2.7"
# command to install dependencies
install:
 - python web/setup.py install
 - pip install -r web/requirements.txt
# command to run tests
script:
 - cd web
 - python manage.py test
```

Una vez subido al repositorio este archivo en opciones activamos el test y comprobamos en la página de Travis que se ha completado con éxito.

![Captura del building en travis](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap9_zpsy95zu8i6.png)


