#Ejercicio 1: Instalar alguno de los entornos virtuales de node.js (o de cualquier otro lenguaje con el que se esté familiarizado) y, con ellos, instalar la última versión existente, la versión minor más actual de la 4.x y lo mismo para la 0.11 o alguna impar (de desarrollo). 


El entorno de virtualización que voy a instalar es "nodeenv":

1. Para instalarlo utilizamos el comando: "sudo easy_install nodeenv" con este comando instalamos la version 0.13.6.    
Para activar el entorno de trabajo utilizamos el comando: "nodeenv env" y ". env/bin/activate".

2. Vamos a comprobar todas las versiones que existen para nodeenv, para ello utilizamos el comando "nodeenv --list" y muestra todas las versiones:  
```
$ reyic@reyic-Aspire-5755G ~ $ nodeenv --list
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

3. Ya tenemos todas las versiones disponibles asi que procedemos a instalar la ultima version que según la lista mostrada anteriormente es la "4.2.1".  
Utilizamos el comando: "nodeenv --node=4.2.1 --prebuilt env-4.2.1-prebuilt".  
Mostrando por la terminal:  

```
$ reyic@reyic-Aspire-5755G ~ $ nodeenv --node=4.2.1 --prebuilt env-4.2.1-prebuilt
 * Install node (4.2.1)... done.
```

4. Una vez hecho esto, procedemos a instalalar la version minor, que seria la "4.2.0" utilizando el mismo comando anterior.  
```
$ reyic@reyic-Aspire-5755G ~ $ nodeenv --node=4.2.0 --prebuilt env-4.2.0-prebuilt
 * Install node (4.2.0)... done.
```
5. Por ultimo procedemos a instalar la version 0.11.0  

```
$ reyic@reyic-Aspire-5755G ~ $ nodeenv --node=0.11.0 --prebuilt env-0.11.0-prebuilt
 * Install node (0.11.0)... done.
```

#Ejercicio2: Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.

Vamos a utilizar django para el ejercicio y python como lenguaje.
Vamos a utilizar virtualenv para crear un entorno de trabajo virtual y en el instalar django.  

```
$ reyic@reyic-Aspire-5755G ~ $ virtualenv AppIV
New python executable in AppIV/bin/python
Installing setuptools, pip...done.
```  
Ahora vamos a activar el entorno de trabajo:  
```
$ reyic@reyic-Aspire-5755G ~/AppIV $ source bin/activate
(AppIV)reyic@reyic-Aspire-5755G ~/AppIV $ 
```  
Procedemos a instalar django:  
```
$ (AppIV)reyic@reyic-Aspire-5755G ~/AppIV $ pip install Django
Downloading/unpacking Django
  Downloading Django-1.8.5-py2.py3-none-any.whl (6.2MB): 6.2MB downloaded
Installing collected packages: Django
Successfully installed Django
Cleaning up...
(AppIV)reyic@reyic-Aspire-5755G ~/AppIV $ 
```  
Para crear el proyecto con Django utilizamos el siguiente comando:  
```
$ (AppIV)reyic@reyic-Aspire-5755G ~/AppIV $ django-admin startproject Proyecto
```  
Procedemos a iniciar el servidor y la aplicacion con las siguientes ordenes:  
```
$ (AppIV)reyic@reyic-Aspire-5755G ~/AppIV/Proyecto $ python manage.py startapp app
```
```
$(AppIV)reyic@reyic-Aspire-5755G ~/AppIV/Proyecto $ python manage.py migrate
Operations to perform:
  Synchronize unmigrated apps: staticfiles, messages
  Apply all migrations: admin, contenttypes, auth, sessions
Synchronizing apps without migrations:
  Creating tables...
    Running deferred SQL...
  Installing custom SQL...
Running migrations:
  Rendering model states... DONE
  Applying contenttypes.0001_initial... OK
  Applying auth.0001_initial... OK
  Applying admin.0001_initial... OK
  Applying contenttypes.0002_remove_content_type_name... OK
  Applying auth.0002_alter_permission_name_max_length... OK
  Applying auth.0003_alter_user_email_max_length... OK
  Applying auth.0004_alter_user_username_opts... OK
  Applying auth.0005_alter_user_last_login_null... OK
  Applying auth.0006_require_contenttypes_0002... OK
  Applying sessions.0001_initial... OK
(AppIV)reyic@reyic-Aspire-5755G ~/AppIV/Proyecto $ 
```
```
$ (AppIV)reyic@reyic-Aspire-5755G ~/AppIV/Proyecto $ python manage.py runserver
Performing system checks...

System check identified no issues (0 silenced).
October 28, 2015 - 11:10:38
Django version 1.8.5, using settings 'Proyecto.settings'
Starting development server at http://127.0.0.1:8000/
Quit the server with CONTROL-C.
```
Desde el navegador podemos acceder a el con la direccion que nos da el servidor.
El proyecto esta subido en el siguiente repositorio:  
(ejerciciost2)[https://github.com/reyic/IvApp.git]

#Ejercicio 3:Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?

Comprobamos la version de python que estamos usando dentro del proyecto:  
```
$ (AppIV)reyic@reyic-Aspire-5755G ~/AppIV/Proyecto $ python
Python 2.7.6 (default, Jun 22 2015, 17:58:13) 
[GCC 4.8.2] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> exit
Use exit() or Ctrl-D (i.e. EOF) to exit
>>> 
(AppIV)reyic@reyic-Aspire-5755G ~/AppIV/Proyecto $ 
```  
Como podemos comprobar estamos utilizando la version 2.7.6, ahora procedemos a cambiar la version de python para comprobar si funciona. Cambiamos la version con el siguiente comando:    
```
$(AppIV)reyic@reyic-Aspire-5755G ~/AppIV $ virtualenv -p /usr/bin/python3 AppIV
Running virtualenv with interpreter /usr/bin/python3
Using base prefix '/usr'
New python executable in AppIV/bin/python3
Also creating executable in AppIV/bin/python
Installing setuptools, pip...done.
```
Una vez activada, arrancamos el servidor y nos da el siguiente fallo:  
```
$ (AppIV)reyic@reyic-Aspire-5755G ~/AppIV/ProyectoIV $ python manage.py runserver
Traceback (most recent call last):
  File "manage.py", line 8, in <module>
    from django.core.management import execute_from_command_line
ImportError: No module named 'django'
```
#Ejercicio 4: Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente.

Con python no podemos utilizar package.json por lo tanto, debemos de crear un archivo setup.py que trabaja de forma parecida y nos muestra junto a la orden pip freeze las dependencias que tenemos instaladas.  
Vamos a ver el codigo de setup.py:  
```
from setuptools import setup
#Importamos desde el paquete setuptools y definimos la funcion setup
#Esta funcion le declaramos el nombre, version, la descripcion
#La unica complicacion es que en la variable package debemos de ponerle el destino
#de la carpeta donde tengamos definida la aplicacion y rellenar en "install_requires"
#los paquetes que necesitamos.
setup(name='IV',
    version='0.0.1',
    description='Preparando proyecto de tests',
    url='https://github.com/reyic/AppIV.git',
    author='Alejandro Jose Reyes Portellano',
    author_email='reyiczd@gmail.com',
    license='GNU General Public License',
    packages=['ProyectoIV'],
    install_requires=[
        'django',
        'wheel',
    ],
    zip_safe=False)
```
Una vez realizado debemos ejecutar el comando "sudo python setup.py install" y una vez que se instale ejecutamos "sudo pip freeze" y nos muestra lo siguiente:  
```
$ (AppIV)reyic@reyic-Aspire-5755G ~/AppIV/ProyectoIV $ sudo pip freeze
[sudo] password for reyic: 
BeautifulSoup==3.2.1
Django==1.8.5
Flask==0.10.11000000
IV==0.0.1
Jinja2==2.8
Mako==0.9.1
MarkupSafe==0.18
PAM==0.4.2
Pillow==2.3.0
PyOpenGL==3.0.2
Twisted-Core==13.2.0
Twisted-Names==13.2.0
Twisted-Web==13.2.0
Werkzeug==0.10.4
apt-xapian-index==0.45
apturl==0.4.1ubuntu4
argparse==1.2.1
chardet==2.0.1
colorama==0.2.5
command-not-found==0.3
configglue==1.1.2
configobj==4.7.2
debtagshw==0.1
defer==1.0.6
dirspec==13.10
dnspython==1.11.1
duplicity==0.6.23
feedparser==5.1.3
freeze==1.0.9
html5lib==0.999
httplib2==0.8
itsdangerous==0.24
lockfile==0.8
lxml==3.3.3
nemo-emblems==0.0.1
nodeenv==0.13.6
numpy==1.8.2
oauthlib==0.6.1
oneconf==0.3.7.14.04.1
paramiko==1.10.1
pexpect==3.1
piston-mini-client==0.7.5
protobuf==2.5.0
pyOpenSSL==0.13
pycrypto==2.6.1
pycups==1.9.66
pycurl==7.19.3
pygobject==3.12.0
pyinotify==0.9.4
pyserial==2.6
pysmbc==1.0.14.1
python-apt==0.9.3.5ubuntu1
python-debian==0.1.21-nmu2ubuntu2
pyxdg==0.25
reportlab==3.0
requests==2.2.1
sessioninstaller==0.0.0
six==1.5.2
system-service==0.1.6
uTidylib==0.2
urllib3==1.7.1
vboxapi==1.0
virtualenv==1.11.4
wheel==0.26.0
wsgiref==0.1.2
wxPython==2.8.12.1
wxPython-common==2.8.12.1
zope.interface==4.0.5
```
Como podemos observar Django=1.8.5 y wheel=0.26.0  

#Ejercicio 5: Automatizar con grunt y docco (o algún otro sistema) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.

Vamos a utilizar la herramienta pycco para crear la documentacion.
Para instalarlo utilizaremos el comando "sudo pip install pycco".  
Vamos a documentar el fichero creado anteriormente, setup.py. Para realizar la documentacion utilizamos el comando pycco setup.py:  
```
$ (AppIV)reyic@reyic-Aspire-5755G ~/AppIV/ProyectoIV $ pycco setup.py 
pycco = setup.py -> docs/setup.html
```
Como podemos observar se ha creado una carpeta docs con el archivo documentado.

#Ejercicio 6: Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga (vamos, lo que viene siendo TDD).

```
	e=Enterprise(name='test',town='ttest',sector='stest')
	e.save()
	self.assertEqual(e.name,'test')
	print("Your Enterprise was created succesfully")
```
Ejecutamos el tests1.py con "python manage.py tests" y muestra por pantalla:  

```
$ (AppIV)reyic@reyic-Aspire-5755G ~/AppIV/ProyectoIV $ python manage.py test
Creating test database for alias 'default'...
Your Calification was created succesfully, Test=OK
----------------------------------------------------------------------
Ran 1 tests in 0.001s

OK
Destroying test database for alias 'default'...

```
#Ejercicio 7: Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante.

No hace falta utilizar mocha, ya que django esta basado en unittest y te realiza la funcion de testeo.  
A continuacion, muestro uno de los tests, los demas ficheros de codigo se encuentran alojados en el repositorio de la aplicacion.

```
class e_t_c(TestCase):
	def test_c_e(self):
		e=Enterprise(name='test',town='ttest',sector='stest')
		e.save()
		self.assertEqual(e.name,'test')
		print("Your Enterprise was created succesfully")
```
Ejecutamos el tests1.py con "python manage.py tests" y muestra por pantalla:  

```
$ (AppIV)reyic@reyic-Aspire-5755G ~/AppIV/ProyectoIV $ python manage.py test
Creating test database for alias 'default'...
Your Calification was created succesfully, Test=OK
.Your Enterprise was created succesfully, Test=OK
.Calification form was created, Test=OK
.Enterprise form was created, Test=OK
.
----------------------------------------------------------------------
Ran 4 tests in 0.004s

OK
Destroying test database for alias 'default'...

```

#Ejercicio 8:Ejercicio: Haced los dos primeros pasos antes de pasar al tercero.

* [x] Darse de alta. Muchos están conectados con GitHub por lo que puedes usar directamente el usuario ahí. A través de un proceso de autorización, acceder al contenido e incluso informar del resultado de los tests.

* [x] Activar el repositorio en el que se vaya a aplicar la integración continua. Travis permite hacerlo directamente desde tu configuración; en otros se dan de alta desde la web de GitHub.

Para la integracion continua he usado (travis)[https://travis-ci.org], al iniciar sesion, te conectas por via github con todos los repositorios.  
En nuestro perfil, activamos la opcion del repositorio y una vez hecho solo queda añadir el fichero travis.yml  
Archivo .travis.yml:  
```
languaje: python
python:
  - "2.7"
env:
  - DJANGO_VERSION=1.8.5
install:
  - sudo apt-get install python-dev
  - sudo pip install --upgrade pip
  - sudo pip install -q Django
  - sudo pip install -q wheel==0.24.0 
script:
  - cd AppIV/ProyectoIV
  - sudo python setup.py install
  - sudo python manage.py test
```
Una vez subido el archivo travis, desde nuestra terminal ejecutamos dentro del repositoria "git push origin master" y automaticamente te carga en la pagina de travis. A continuacion se muestra el resultado:  

![Imagenes integracion continua travis](http://i63.tinypic.com/2lu9f9.jpg)

![Imagenes integracion continua travis](http://i63.tinypic.com/zxseur.jpg)

![Imagenes integracion continua travis](http://i65.tinypic.com/20kca6w.jpg)

![Imagenes integracion continua travis](http://i64.tinypic.com/epqh06.jpg)
