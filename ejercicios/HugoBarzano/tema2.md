# Tema 2. Desarrollo basado en pruebas

##Ejercicio 1: Instalar alguno de los entornos virtuales de node.js y, con ellos, instalar la última versión existente, la versión menor más actual de la 0.12 y lo mismo para la 0.11 o alguna impar. Si no se una habitualmente este lenguaje, hacer lo mismo con cualquier otro lenguaje de scripting.

**Paso 1:** Actualizar repositorios de Ubuntu y obtener los que permiten crear paquetes, mediante las instrucciones:

	$ sudo apt-get update

	$ sudo apt-get install build-essential libssl-dev

**Paso 2:** Descargar el script de instalación de nvm desde Github usando curl:

	$ curl https://raw.githubusercontent.com/creationix/nvm/v0.7.0/install.sh | sh

**Paso 3:** Acceder a la funcionalidad de nvm, para esto tenemos dos caminos, reiniciar el sistema  o recargar el archivo de configuración mediante la orden:

	$ source ~/.profile

**Paso 4:** Comprobar las versiones existentes mediante la orden:
	
	$ nvm ls-remote

**Paso 5:** Instalar la versión que queramos. Por ejemplo, para la versión inferior a la 0.12:

	$ nvm install 0.12.0

Para la 0.11:

	$ nvm install 0.11.0

**Paso 6:** Comprobar las versiones de Node y NPM que tenemos instaladas en nuestro equipo mediante las ordenes

	$ node -v

	$ npm -v 
![version node](https://www.dropbox.com/s/mzlbhkjyoi5yu1v/node_v.png?dl=1)

##Ejercicio 2: Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido. Se trata de hacer una aplicación simple que se pueda hacer rápidamente con un generador de aplicaciones como los que incluyen diferentes marcos MVC. Si cuesta mucho trabajo, simplemente prepara una aplicación que puedas usar más adelante en el resto de los ejercicios.

He desarrollado la aplicación utilizando como framework Django, desarrollada en python y utilizando la base de datos que integra Django, sqlite3. El framework permite separar Modelo-Vista-Controlador. La aplicación esta en el siguiente repositorio [Empresas](https://github.com/hugobarzano/Ejercicio_Empresas_IV) de github. Para lanzarla, es necesario tener python instalado, y una vez lanzado el entorno virtual, basta con ejecutar:

	(ENV1)hugo@hugo-machine:~/App/ENV1/mysite$ python manage.py runserver&

Esto lanzará en segundo plano el servidor de desarrollo que proporciona Django que da servicio en la url:

	http://127.0.0.1:8000/empresas


##Ejercicio 3: Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?

Estoy utilizando la versión 1.4 de Django, que funciona correctamente con versiones python 2.5 a 2.7 pero si intentamos ejecutar la aplicación con una versión superior de python, como por ejemplo python 3.0 la aplicación no funciona, como podemos observar en la siguiente imagen. Esto se debe a que Django soporta las versiones de python 3.0 a 3.3 de un modo experimental, por lo que se recomienda esperar hasta la versión 1.6 de Django para utilizar estas versiones de python. 
![python3](https://www.dropbox.com/s/76xk30y5kk3eje0/python3.png?dl=1)


##Ejercicio 4: Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente. 

Con python y trabajando en Django, la herramienta equivalente es pip (PyPI) y los archivos de configuración setup.py
En el siguiente enlace, podemos encontrar un tutoríal de como utilizar dicha herramienta [pip](http://python-packaging.readthedocs.org/en/latest/minimal.html)
Un primer setup.py para la aplicación de valorar practicas de empresa, tendría un aspecto tal que así:
'''python
	from setuptools import setup

	setup(name='Empresas',
	      version='0.1',
	      description='Aplicacion para valorar practicas de empresas',
	      long_description='Aplicacion que permite registrar empresas y valoraciones de las practicas en ellas',
	      classifiers=[
		'Development Status :: 3 - Alpha',
		'License :: GNU :: GNU License',
		'Programming Language :: Python :: 2.7',
		'Topic :: Text Processing :: Linguistic',
	      ],
	      keywords='aplicacion basica de valoracion',
	      url='https://github.com/hugobarzano/Aplicaciones/tree/master/ENV1/mysite',
	      author='Hugo Barzano Cruz',
	      author_email='hugobarzano@gmail.com',
	      license='GNU',
	      packages=['Empresas'],
	      install_requires=['sqlite3', ],
	      include_package_data=True,
	      zip_safe=False)

'''

##Ejercicio 5: Automatizar con grunt y docco (o algún otro sistema) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.

Para documentar la aplicación python, he utilizado epidoc. Podemos encontrar un sencillo tutoríal en [epidoc](http://mundogeek.net/archivos/2008/07/07/documentacion-en-python/)

Instalación:

	 sudo apt-get install python-epydoc

Generar html de modelos y vistas: la opcion -v es para ver el log de errores)

	epydoc –html -v models.py views.py

Es necesaio documentar previamente, veamos un ejemplo de como se documentaría por ejemplo el index:

![documentando_1](https://www.dropbox.com/s/3yx5v9xha3znki2/documentando.png?dl=1)

El resultado seria algo así:

![documentando_2](https://www.dropbox.com/s/vu484jogcb7b8ag/documentando2.png?dl=1)

Nota: He tenido que comentar los import* de cada archivo para poder generar el html. 

##Ejercicio 6: Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga (vamos, lo que viene siendo TDD).

El primer test que vamos a realizar es la creación de una nueva empresa, podemos observar en la siguiente imagen, que se creará una empresa con nombre etest y correo ctest y se insertará en la base de datos, comprobando con las aserciones, que la creación ha sido correcta:

![test1](https://www.dropbox.com/s/x1vfvocpt8u0z1x/test1.png?dl=1)

He creado los test necesarios para la funcionalidad de consultar empresa (getEmpresa) y como esta funcionalidad, aun no ha sido desarrollada, la aplicación no supera los test:
![test2](https://www.dropbox.com/s/xj6gxjfallyucwl/test2.png?dl=1)

Creamos una funcionalidad tan básica como la siguiente:

	def getEmpresa(self):
		return self


Tras incorporarla a nuestro modelos, comprobamos efectivamente que la aplicación si supera los test:
![test3](https://www.dropbox.com/s/ufkywa0zia5sf8s/test3.png?dl=1)

##Ejercicio7: Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante

Al trabajar con Django como framework esta tarea ya esta automatizada, ya que todos los test se crean en un archivo llamado test.py que es generado automáticamente a la hora de inicializar el proyecto. 
Esta batería de test se lanza mediante la orden:

	python manage.py test empresas

##Ejercicio8: Haced los dos primeros pasos antes de pasar al tercero.
Tenemos que añadir un fichero .travis.yml con el siguiente contenido:

	language: python
	python:
	 - "2.7"
	install:
	 - sudo apt-get install python-dev
	 - pip install --upgrade pip 
	 - pip install Django 
	script:
	 - python manage.py test 

Automáticamente, Travis sincronizará el repositorio y comprobará si todo esta correcto
![integracion](https://www.dropbox.com/s/h6t5kdtmpijwffy/integracion.png?dl=1)













