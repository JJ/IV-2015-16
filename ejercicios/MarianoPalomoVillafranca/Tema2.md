Tema 2
===
> Mariano Palomo Villafranca

#### Ejercicio 1: Instalar alguno de los entornos virtuales de node.js (o de cualquier otro lenguaje con el que se esté familiarizado) y, con ellos, instalar la última versión existente, la versión minor más actual de la 4.x y lo mismo para la 0.11 o alguna impar (de desarrollo).

Elegimos, por ejemplo, instalar `nvm`. Para ello, hacemos lo siguiente:

- Obtenemos el script de instalación a través del comando: `curl https://raw.githubusercontent.com/creationix/nvm/v0.11.1/install.sh | bash`.
- A continuación, una vez se vean regflejados los cambios que `nvm` realiza sobre el directorio (puede que sea necesario cerrar y reabrir la terminal), ejecutamos `source ~/.profile`.
- Escribimos `nvm ls-remote` para comprobar las versiones disponibles.
- Y ahora instalamos la última versión de la 4.x y lo mismo para la 0.11:

```
nvm install v4.2.1
nvm install v0.11.16
```
- Y por último comprobamos las versiones instaladas con:

```
$ nvm ls
    v0.11.16
->    v4.2.1
```
Fuente: [Digital Ocean](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-with-nvm-node-version-manager-on-a-vps)

#### Ejercicio 2: Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.

Se ha creado una aplicación con las funcionalidades requeridas utilizando Django. El link al respositorio en github es [este](https://github.com/mpvillafranca/empresas).

#### Ejercicio 3: Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?

Probamos a crear otro entorno virtual para ejecutar Django con python3.4. Como era de esperar, aunque el servidor se levanta correctamente, a la hora de servir contenido, con python 3 se producen bastantes errores. A continuación se muestran las pruebas realizadas para python 2.7 y python 3.4 con Django 1.8.5.

![python2.7](http://i292.photobucket.com/albums/mm28/mpvillafranca/python2.7_zpsh7rz4qne.png)
![python3](http://i292.photobucket.com/albums/mm28/mpvillafranca/python3_zpsjxuuokni.png)

#### Ejercicio 4: Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente.

Para el caso de Django, pip (PyPI) es la herramienta equivalente, utilizando los `setup.py` para los archivos de configuración. Un primer `setup.py` para nuestra aplicación podría quedar del siguiente modo:

```python
	# -*- coding: utf-8 -*-
	from setuptools import setup
	from pip.req import parse_requirements

	install_reqs = parse_requirements("requirements/local.txt")
	# reqs is a list of requirement -> ['django==1.5.1', 'mezzanine==1.4.6']
	reqs = [str(ir.req) for ir in install_reqs]

	setup(
		name='empresas',
		version='0.1',
		description='Valorador de empresas',
		long_description=open("README.md").read(),
		keywords='aplicacion valoraciones',
		author='Mariano Palomo Villafranca',
		license='GNU',
		author_email='mpvillafranca@correo.ugr.es',
		url='https://github.com/mpvillafranca/empresas',
		classifiers=[
		    'Development Status :: 3 - Alpha',
			'License :: GNU :: GNU License',
		    'Programming Language :: Python',
		    "Programming Language :: Python :: 2.7",
		    'Framework :: Django',
		],
		install_requires=reqs,
		include_package_data=True,
		zip_safe=False,
	)
```

#### Ejercicio 5: Automatizar con grunt y docco (o algún otro sistema) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.

Podemos hacer uso, por ejemplo, de `epidoc` para documentar nuestra librería. Para ello, lo instalamos mediante:

		sudo apt-get install python-epydoc

Tras esto, generamos la documentación de las vistas y los modelos de nuestra app.

		epydoc –html models.py views.py

Aunque previamente, es necesaio documentar dichos ficheros. Probamos a documentar, por ejemplo, la vista `index` de nuestra aplicación *home*. Quedaría algo así:

```python
def index(request):
	"""
	Vista correspondiente a la página principal de la aplicación empresas.
		En esta vista listamos las empresas almacenadas en la base de datos, así como
		los alumnos que están trabajando en ella. A continuación, se muestra también
		un ranking de las empresas según su nota media.
	"""
	template = loader.get_template('home/index.html')
	asociados=dict()
	notas=dict()
	for bussiness in Bussiness.objects.all():
		students = []
		average=0
		cont=0
		for student in Student.objects.all():
			if student.bussiness == bussiness:
				students.append(student.alias)
				average=average+student.mark
				cont=cont+1
		asociados[bussiness]=students
		average=average/cont
		notas[bussiness]=average
	context = RequestContext(request,{'asociados':asociados,'notas':notas,})
	return HttpResponse(template.render(context))
```

Ahora, ejecutamos `epydoc --html views.py` y comprobamos el resultado:

![epydoc](http://i292.photobucket.com/albums/mm28/mpvillafranca/epydoc_zpsukm4yhju.png)

#### Ejercicio 6: Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga (vamos, lo que viene siendo TDD).
Para ello, accedemos al fichero `test.py` de nuestra aplicación y escribimos un código de prueba. Comprobamos que, efectivamente todo funciona correctamente:

```python
from .models import Bussiness

class BussinessMethodTests(TestCase):
	def test_bussiness_name(self):
		bus=Bussiness(name='nametest')
		bus.save()
		self.assertEqual(bus.name,'nametest')
```

![t1-ok](http://i292.photobucket.com/albums/mm28/mpvillafranca/1.ok_zpstm31ujel.png)

Ahora, probamos a testear una nueva funcionalidad, el método get que nos devuelva el propio objeto. Al intentar ejecutar este test, como era de esperar, fallará, pués todavía no hemos implementado dicha funcionalidad:

```python
def test_bussiness_get(self):
	bus=Bussiness(name='nametest')
	bus.save()
	bus2=Bussiness(name="")
	bus2=bus.get_bussiness()
	self.assertEquals(bus.name,bus2.name)
```

![t2-error](http://i292.photobucket.com/albums/mm28/mpvillafranca/2.error_zpsykzvybcf.png)

Para solucionarlo, basta con acceder a nuestro modelo Bussiness y añadir:

```python
def get_bussiness(self):
		return self
```

Y ahora si:

![t3-ok](http://i292.photobucket.com/albums/mm28/mpvillafranca/3.ok_zpszsndlfdk.png)

#### Ejercicio7: Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante.

Con Django, esto ya está automatizado, así que basta con ejecutar:

		python manage.py test apps.home --settings=ValoracionEmpresas.settings.local

#### Ejercicio8: Haced los dos primeros pasos antes de pasar al tercero.
En primer lugar, añadimos el fichero `.travis.yml` al repositorio.

```
language: python
python:
 - "2.7"
install:
 - sudo apt-get install python-dev
 - pip install --upgrade pip
 - pip install -r requirements/local.txt
script:
 - python src/manage.py test apps.home --settings=ValoracionEmpresas.settings.local
```

De este modo, Travis sincronizará el repositorio y comprobará si todo esta correcto
![integracion](http://i292.photobucket.com/albums/mm28/mpvillafranca/integracion_zpszezl2ncb.png)
