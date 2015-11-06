# [REPOSITORIO DE LA PRACTICA](https://github.com/araluce/Tema2IV)

# Ejercicio 1
**Instalar alguno de los entornos virtuales de node.js (o de cualquier otro lenguaje con el que se esté familiarizado) y, con ellos, instalar la última versión existente, la versión minor más actual de la 4.x y lo mismo para la 0.11 o alguna impar (de desarrollo).**

Vamos a usar el entorno virtual nodeenv con cualquiera de estos dos comandos:

```
$ sudo easy_install nodeenv
$ sudo pip install nodeenv
```
Si no reconoce __*easy_install*__ o **_pip_** podemos instalarlos con el siguiente comando:

```
$ sudo apt-get install python-pip
```
Ahora procedemos a crear y activar el entorno:

```
$ nodeenv env
$ . env/bin/activate
```
Vamos a ver de qué versiones disponemos con un sencillo comando que las lista:
```
$ nodeenv --list
0.0.1	0.0.2	0.0.3	0.0.4	0.0.5	0.0.6	0.1.0	0.1.1
0.1.2	0.1.3	0.1.4	0.1.5	0.1.6	0.1.7	0.1.8	0.1.9
0.1.10	0.1.11	0.1.12	0.1.13	0.1.14	0.1.15	0.1.16	0.1.17
0.1.18	0.1.19	0.1.20	0.1.21	0.1.22	0.1.23	0.1.24	0.1.25
0.1.26	0.1.27	0.1.28	0.1.29	0.1.30	0.1.31	0.1.32	0.1.33
0.1.90	0.1.91	0.1.92	0.1.93	0.1.94	0.1.95	0.1.96	0.1.97
0.1.98	0.1.99	0.1.100	0.1.101	0.1.102	0.1.103	0.1.104	0.2.0
0.2.1	0.2.2	0.2.3	0.2.4	0.2.5	0.2.6	0.3.0	0.3.1
0.3.2	0.3.3	0.3.4	0.3.5	0.3.6	0.3.7	0.3.8	0.4.0
0.4.1	0.4.2	0.4.3	0.4.4	0.4.5	0.4.6	0.4.7	0.4.8
0.4.9	0.4.10	0.4.11	0.4.12	0.5.0	0.5.1	0.5.2	0.5.3
0.5.4	0.5.5	0.5.6	0.5.7	0.5.8	0.5.9	0.5.10	0.6.0
0.6.1	0.6.2	0.6.3	0.6.4	0.6.5	0.6.6	0.6.7	0.6.8
0.6.9	0.6.10	0.6.11	0.6.12	0.6.13	0.6.14	0.6.15	0.6.16
0.6.17	0.6.18	0.6.19	0.6.20	0.6.21	0.7.0	0.7.1	0.7.2
0.7.3	0.7.4	0.7.5	0.7.6	0.7.7	0.7.8	0.7.9	0.7.10
0.7.11	0.7.12	0.8.0	0.8.1	0.8.2	0.8.3	0.8.4	0.8.5
0.8.6	0.8.7	0.8.8	0.8.9	0.8.10	0.8.11	0.8.12	0.8.13
0.8.14	0.8.15	0.8.16	0.8.17	0.8.18	0.8.19	0.8.20	0.8.21
0.8.22	0.8.23	0.8.24	0.8.25	0.8.26	0.8.27	0.8.28	0.9.0
0.9.1	0.9.2	0.9.3	0.9.4	0.9.5	0.9.6	0.9.7	0.9.8
0.9.9	0.9.10	0.9.11	0.9.12	0.10.0	0.10.1	0.10.2	0.10.3
0.10.4	0.10.5	0.10.6	0.10.7	0.10.8	0.10.9	0.10.10	0.10.11
0.10.12	0.10.13	0.10.14	0.10.15	0.10.16	0.10.17	0.10.18	0.10.19
0.10.20	0.10.21	0.10.22	0.10.23	0.10.24	0.10.25	0.10.26	0.10.27
0.10.28	0.10.29	0.10.30	0.10.31	0.10.32	0.10.33	0.10.34	0.10.35
0.10.36	0.10.37	0.10.38	0.10.39	0.10.40	0.11.0	0.11.1	0.11.2
0.11.3	0.11.4	0.11.5	0.11.6	0.11.7	0.11.8	0.11.9	0.11.10
0.11.11	0.11.12	0.11.13	0.11.14	0.11.15	0.11.16	0.12.0	0.12.1
0.12.2	0.12.3	0.12.4	0.12.5	0.12.6	0.12.7	4.0.0	4.1.0
4.1.1	4.1.2	4.2.0	4.2.1
```
_Datos obtenidos el día 22/10/2015_

De acuerdo, nos piden instalar la última versión existente. En este caso la última versión existente corresponde a la versión 4.2.1

```
$ nodeenv --node=4.2.1 --prebuilt env-4.2.1-prebuilt
```

Lo siguiente que nos piden es instalar la versión minor más actual de la 4.x. Para entender un poco mejor lo que nos piden voy a hacer una ilustración sencilla:

**4.Major.Minor**

Que corresponde a la versión 4.2.1 también.

La minor más actual de la version 0.11 es la **0.11.16**

Instalamos entonces la versión que nos queda:

```
$ nodeenv --node=0.11.16 --prebuilt env-0.11.16-prebuilt
```

#Ejercicio 2

**Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.**


Para realizar este ejercicio he elegido python y Django. Para comenzar crearemos el entorno con **virtualenv** y activaremos el entorno:

```
$ virtualenv tema2IV
$ cd tema2IV
$ source bin/activate
```
E instalamos Django con el comando ``` $ pip install Django```

Ya tenemos todas las herramientas, ahora tenemos que crear el proyecto y levantar el servidor para ponernos a trabajar.

```
$ django-admin startproject Proyecto
$ cd Proyecto
$ python manage.py startapp Proyecto
$ python manage.py startapp aplicacion
$ python manage.py runserver
```

Al iniciar el servidor me sale un aviso. Si no se activa la migración la aplicación podria no funcionar correctamente, así que la activamos.

```
$ python manage.py migrate
$ python manage.py runserver
```

El servidor se ejecuta en la dirección [http://127.0.0.1:8000](http://127.0.0.1:8000/)

# Ejercicio 3

**Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?**
Si ejecutamos python dentro de nuestro entorno virtual podemos ver que trabaja en este momento con **python 2.7.6**, pero podemos cambiar las versiones.

Veamos de qué versiones disponemos y vamos a probar algunas de ellas:

```
$ ls -l /usr/bin/python*
lrwxrwxrwx 1 root root       9 oct 26 17:27 /usr/bin/python -> python2.7
lrwxrwxrwx 1 root root       9 oct 26 17:27 /usr/bin/python2 -> python2.7
-rwxr-xr-x 1 root root 3345416 jun 22 20:51 /usr/bin/python2.7
lrwxrwxrwx 1 root root       9 oct 26 17:27 /usr/bin/python3 -> python3.4
-rwxr-xr-x 2 root root 3709944 oct 14 23:42 /usr/bin/python3.4
-rwxr-xr-x 2 root root 3709944 oct 14 23:42 /usr/bin/python3.4m
lrwxrwxrwx 1 root root      10 oct 26 17:27 /usr/bin/python3m -> python3.4m
lrwxrwxrwx 1 root root      58 feb 20  2014 /usr/bin/pythontex -> ../share/texlive/texmf-dist/scripts/pythontex/pythontex.py
-rwxr-xr-x 1 root root     306 feb 20  2014 /usr/bin/pythontex3
```
Vamos a instalar entonces la versión python2 y probamos si funciona o no:

```
$ virtualenv -p /usr/bin/python2 tema2IV
$ python manage.py runserver
```

Funciona perfectamente. No me he dado cuenta que es la misma versión, ep

Probamos hora la versión 3:

```
$ virtualenv -p /usr/bin/python3 tema2IV
$ python manage.py runserver
```

Y obtengo un error de importación de módulos.

#Ejercicio 4
**Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente.**

Como estamos en python, vamos a crear la descripción del módulo en el fichero **setup.py**. A continuación pongo la descripcción:

```
from setuptools import setup

setup(name='Proyecto',
    version='0.0.1',
    description='Tema 2',
    url='https://github.com/araluce/Tema2IV',
    author='Alvaro Fernandez-Alonso Araluce',
    author_email='araluce11@gmail.com',
    license='GNU General Public License',
    packages=['Proyecto'],
    install_requires=[
        'django',
        'wheel',
    ],
    zip_safe=False)
```
Y lo instalamos con ```python setup.py install```

# Ejercicio 5
**Automatizar con grunt y docco (o algún otro sistema) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.**

Usaremos pycco para documentar el código. Antes de nada lo instalaremos de la siguiente forma: ``` $ pip install pycco```

Y ahora podemos documentar lo que queramos. Como ejemplo:

```
$ pycco *.py
```

# Ejercicio 6
**Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga (vamos, lo que viene siendo TDD).**

Para este ejercicio necesitamos definir los modelos de datos que vamos a usar y los formularios sobre los que vamos a hacer el test.

Definimos el fichero models.py:

```
from django.db import models
from datetime import datetime

class Empresa(models.Model):

	nombre = models.CharField(max_length=100)
	nEmpleados = models.IntegerField(default=0)
	localizacion = models.CharField(max_length=100)
	fecha_creacion = models.DateField(default=datetime.now(), blank=True)
	def __str__(self):
		return self.nombre

class Practicos(models.Model):

	Nombre = models.CharField(max_length=100)
	calificacion = models.IntegerField(default=0)
	empresa = models.ForeignKey(Empresa)
	def __str__(self):
		return self.Nombre
```
Y, para que Django los vea modificamos el fichero admin.py de la siguiente manera:

```
from django.contrib import admin

from .models import Empresa, Practicos

admin.site.register(Empresa)
admin.site.register(Practicos)
```

Ahora también podemos definir los formularios para cada modelo:

```
from django import forms
from .models import Empresa, Practicos

class insertaEmpresa(forms.ModelForm):

	class Meta:

		model = Empresa
		fields = ('nombre','nEmpleados','localizacion', 'fecha_creacion')

class insertaPractico(forms.ModelForm):

	class Meta:

		model = Practicos
		fields = ('Nombre','calificacion','empresa')
```

Y en el fichero tests.py podemos definir diferentes aserciones. Por ejemplo, para probar la creación de una empresa:
```
e = Empresa(nombre='test', nEmpleados=150, localizacion='localizacion', fecha_creacion=datetime.now())
e.save()
self.assertEqual(e.nombre,'test')
print("La empresa se ha creado satisfactoriamente")
```

Ejecutamos ``` $ python manage.py test``` y, si todo va bien obtendremos esta salida:
```
Creating test database for alias 'default'...
La empresa se ha creado satisfactoriamente
----------------------------------------------------------------------
Ran 1 tests in 0.0s

OK
Destroying test database for alias 'default'...
```



# Ejercicio 7
**Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante.**

Con Django ya disponemos de un programa para realizar test que además nos devuelve el tiempo de ejecución.

Definimos un sencillo tests.py:

```
from django.test import TestCase

from .forms import insertaEmpresa, insertaPractico
from .models import Empresa, Practicos
from datetime import datetime

class EmpresaModelTest(TestCase):
	def test_Empresa_representation(self):
		e = Empresa(nombre='test', nEmpleados=150, localizacion='localizacion', fecha_creacion=datetime.now())
		e.save()
		self.assertEqual(e.nombre,'test')
		print("La empresa se ha creado satisfactoriamente")

	def test_formularioEmpresa_representation(self):
		datos = { 'nombre' : 'test', 'nEmpleados' : 150, 'localizacion' : 'localizacion', 'fecha_creacion' :  datetime.now() }
		form = insertaEmpresa(data=datos)
		self.assertTrue(form.is_valid())
		print("Se ha comprobado el formulario de la empresa")

class PracticosModelTest(TestCase):
	def test_Practicos_representation(self):
		emp = Empresa(nombre='test', nEmpleados=150, localizacion='localizacion', fecha_creacion=datetime.now())
		emp.save()
		prac = Practicos(Nombre='alumno', calificacion=10, empresa=emp)
		prac.save()
		self.assertEqual(prac.empresa, emp)
		print("Se ha calificado a la empresa")

	def test_formularioPracticos_representation(self):
		emp = Empresa(nombre='test', nEmpleados=150, localizacion='localizacion', fecha_creacion=datetime.now())
		emp.save()
		datos = { 'Nombre' : 'alumno', 'calificacion' : 10, 'empresa' : emp.id }
		form = insertaPractico(data=datos)
		self.assertTrue(form.is_valid())
		print("Se ha comprobado el formulario de los practicos")
```

Y ya podemos realizar la ejecución del test:

```
Creating test database for alias 'default'...
La empresa se ha creado satisfactoriamente
.Se ha comprobado el formulario de la empresa
.Se ha modificado la nota
.Se ha calificado a la empresa
.Se ha comprobado el formulario de los practicos
.
----------------------------------------------------------------------
Ran 5 tests in 0.011s

OK
Destroying test database for alias 'default'...

```

Como algo adicional, podemos añadir los modelos a la base de datos sqlite y ver que, efectivamente, estamos definiendo la base de datos:

```
$ python manage.py makemigrations
$ python manage.py migrate
$ python manage.py runserver
```
Puedes conectar con la dirección http://127.0.0.1:8000/admin/ y trastear con las tablas que se han creado.

# Ejercicio 8

**Haced los dos primeros pasos antes de pasar al tercero. Crear un fichero de configuración para que se ejecute la integración y añadirlo al repositorio.**

El primer paso es darse de alta en la [página de travis](https://travis-ci.org/) por medio de la cuenta de GitHub. Se dan los permisos a travis para que pueda acceder al repositorio deseado y se configura en la raíz del repositorio el fichero .travys.yml.

En su página web nos muestran [algunos ejemplos](http://docs.travis-ci.com/user/languages/python/) que pueden sernos útiles para construir ese fichero.

El fichero **.travis.yml** de este proyecto tiene esta pinta:

```
language: python
python:
 - "2.7"
# command to install dependencies
install:
 - python tema2IV/Proyecto/setup.py install
 - pip install -q Django==1.8.5
 - pip install -q wheel==0.24.0
# command to run tests
script:
 - cd tema2IV
 - cd Proyecto
 - python manage.py test
```

En nuestro perfil de la página de travis podemos ver cómo, automáticamente, se ejecuta el fichero que acabamos de configurar.

![Ejecucion de travis](http://es.zimagez.com/full/439ffa70a47e3607817defaa1cf6b754d6e6242531a466361fce99d1ba02b4f8.php)
