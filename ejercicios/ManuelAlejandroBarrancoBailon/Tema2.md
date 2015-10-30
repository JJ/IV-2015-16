#Tema 2

##Ejercicios

###Ejercicio 1
**Instalar alguno de los entornos virtuales de node.js (o de cualquier otro lenguaje con el que se esté familiarizado) y, con ellos, instalar la última versión existente, la versión minor más actual de la 4.x y lo mismo para la 0.11 o alguna impar (de desarrollo).**

En primer lugar, especificar que voy a instalar **virtualenv** ya que el lenguaje que uso es Python.

Para ello, lo primero que haré será utilizar el *repositorio* de Python en el que encontraremos las librerias de Python que se necesiten. Para el uso de este *repositorio*, existe el comando pip el cual será lo primero que instalaré.

**sudo apt-get install python-pip python-dev build-essential**

![Instalación de Pip](http://i1016.photobucket.com/albums/af281/raperaco/instalacionPip_zpsbphfsoeg.png)

A continuación se instala **virtualenv** con el comando **sudo pip install --upgrade virtualenv**.

![Instalación de virtualenv](http://i1016.photobucket.com/albums/af281/raperaco/instalacionVirtualenv_zpsyz5krhpj.png)

Una vez instalado virtualenv, vamos a crear un entorno virtual con la orden **virtualenv <nombre_entorno>**.

![Creación de un entorno virtual](http://i1016.photobucket.com/albums/af281/raperaco/creacionEntornoVirtual_zpsxzp5bnws.png)

Se puede ver como se ha creado un nuevo *directorio* con el nombre del entorno virtual creado y dentro las carpetas y ficheros con las correspondientes librerías, ejecutables del entorno, herramientas como pip, etc.
Nos movemos dentro de este directorio y activamos el entorno virtual con la orden **source bin/activate**.
![Activación entorno virtual](http://i1016.photobucket.com/albums/af281/raperaco/activacionEntornoVirtual_zpspjpq8jft.png)

En la imagen anterior, tambien se puede ver en la carpeta *bin*, que la versión instalada de Python en el entorno es la 2.7.

Para desactivar el entorno virtual, ejecutar el comando **deactivate**.

Para crear un entorno con la versión 3 de Python, la orden a ejecutar es **virtualenv -p /usr/bin/python3 entornoPython3**.

![Entorno virtual con Python 3](http://i1016.photobucket.com/albums/af281/raperaco/virtualenvPython3_zpsbjmx9aqz.png)

###Ejercicio 2
**Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.
Se trata de hacer una aplicación simple que se pueda hacer rápidamente con un generador de aplicaciones como los que incluyen diferentes marcos MVC. Si cuesta mucho trabajo, simplemente prepara una aplicación que puedas usar más adelante en el resto de los ejercicios.**

He realizado una aplicación web con el framework Django el cual está basado en Python.
La parte que he implementado es una primera aproximación sobre una funcionalidad que tendrá mi aplicación web final sobre peñas de fútbol. Lo que realiza es que a partir de una lista con los componentes de una peña, los divide aleatoriamente en dos equipos para el partido semanal.
El proyecto se puede encontrar en el [repositorio](https://github.com/mabarrbai/TusPachangas) de mi aplicación.

La aplicación queda por ahora de la siguiente manera (cada vez que se actualiza, cambian los equipos de manera aleatoria):
![TusPachangasAleatorio](http://i1016.photobucket.com/albums/af281/raperaco/tusPachangasAleatorio_zpsghz5emx5.png)

###Ejercicio 3
**Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?**
Mi proyecto está construido sobre la versión 3.4 de Python, sobre la cual hemos visto anteriormente que se ejecuta sin problemas. ![EjecucionPython3](http://i1016.photobucket.com/albums/af281/raperaco/ejecucionPython3_zpsztre4sg2.png)
Sobre la versión 2.7 de Python en un entorno virtual distinto, intento ejecutar mi aplicación, pero no es posible ejecutarla obteniendo diversos errores. ![EjecucionPython2](http://i1016.photobucket.com/albums/af281/raperaco/ejecucionPython2_zpsviznd0kh.png)

###Ejercicio 4
**Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente.**
Como primer punto, hay que saber qué método se corresponde en Python. En este caso es mediante el fichero *[setup.py](http://python-packaging.readthedocs.org/en/latest/minimal.html)*. Para conocer las dependencias de nuestro proyecto existe la orden **pip freeze** la cual nos devuelve las dependencias.
En mi caso, al ejecutar *pip freeze*, devuelve la siguiente salida: ![PipFreeze](http://i1016.photobucket.com/albums/af281/raperaco/pipFreeze_zpszllbx1iu.png)

Para crear una descripción, creamos el fichero **setup.py**, el cual en mi caso queda de la siguiente manera: ![ficheroSetup.py](http://i1016.photobucket.com/albums/af281/raperaco/ficheroSetup.py_zpsqnw9bjus.png)

###Ejercicio 5
**Automatizar con grunt y docco (o algún otro sistema) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.**
Lo primero que he hecho ha sido documentar mi función *formar_equipos*. Para ello en Python existe lo que se conoce como **[docstring](https://www.python.org/dev/peps/pep-0257/)**. En mi caso, debido a la simplicidad de la función implementada, he usado un *docstring* de una línea, aunque también es posible en múltiples líneas.
Por tanto, la documentación de mi función ha quedado:
![documentacionFormarEquipos](http://i1016.photobucket.com/albums/af281/raperaco/documentacionFuncion_zpswsavhtcv.png)

El siguiente paso a realizar será el de automatizar el proceso de generación de documentación. En Python existe la herramienta **[pydoc](https://docs.python.org/3.4/library/pydoc.html)** la cual genera la documentación en consola, en un navegador o en ficheros HTML. En nuestro caso, para generar la documentación en ficheros HTML, la orden a utilizar será **pydoc -w TusPachangas/**. De esta forma se crean los ficheros en el directorio actual, los cuales moveremos normalmente a un directorio *doc* dentro del directorio del proyecto.
La generación de la documentación:
![generacionPydoc](http://i1016.photobucket.com/albums/af281/raperaco/generarPydoc_zpslykvrx2z.png)

Y una vez creados los ficheros HTML, podemos verlos desde un navegador:
![documentacion](http://i1016.photobucket.com/albums/af281/raperaco/docHTML_zpsqnjmopyk.png)
Y la documentación sobre mi función es:
![documentacionViews](http://i1016.photobucket.com/albums/af281/raperaco/docHTMLViews_zpsh1p559dv.png)

###Ejercicio 6
**Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga (vamos, lo que viene siendo TDD).**

La aserción que he escrito lo que realiza es comprobar que el número de jugadores de la peña es distinto de 0 y en caso de superarse el test, se muestra un mensaje por pantalla indicando que se ha superado con éxito.
![CódigoConAssert](http://i1016.photobucket.com/albums/af281/raperaco/assertEnLinea_zpsgabzjy1u.png)

Comprobamos que si se ejecuta sin errores, muestra el mensaje de éxito por el terminal:
![TestExitoso](http://i1016.photobucket.com/albums/af281/raperaco/testExitoso_zps1rwbpmlt.png)

Ahora voy a provocar un fallo intencionadamente dejando la lista de jugadores vacía para ver cómo entra el *assert* en acción lanzando un error.
![AssertionError](http://i1016.photobucket.com/albums/af281/raperaco/assertionError_zpsorzf2mvc.png)

Además ahora en la terminal, vemos como el código HTTP ahora es [500](https://es.wikipedia.org/wiki/Anexo:C%C3%B3digos_de_estado_HTTP#5xx_Errores_de_servidor) el cual es un código de error de servidor debido al error lanzado por el *assert*.
![Error500](http://i1016.photobucket.com/albums/af281/raperaco/error500_zpsv5ptrpsm.png)

###Ejercicio 7
**Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante.**

En este apartado los test que he realizado han sido evaluar la creación de peñas y jugadores y la pertenencia de éstos a una de ellas sobre la base de datos SQLite de mi aplicación.
En Django, estos tests han de ser escritos en el fichero **tests.py** y este fichero ha de ser ejecutado con **python manage.py test** o más específicamente **python manage.py test "directorio_app" ** (en mi caso *python manage.py test penhas/* ya que el directorio *penhas* es el de mi aplicación que contiene el modelo de base de datos).
Por tanto, mi fichero *tests.py* ha quedado de la siguiente forma:
![Fichero tests.py](http://i1016.photobucket.com/albums/af281/raperaco/test.py_zpsv4lobchl.png)

Y a continuación, mandamos a ejecutar los tests con la orden anteriormente mencionada y vemos cómo los test son superados correctamente:
![Tests superados](http://i1016.photobucket.com/albums/af281/raperaco/testSuperados_zpsukaiecz9.png)

###Ejercicio 8
**Configurar integración continua para nuestra aplicación usando Travis**
Me he dado de alta en Travis, con un simple procedimiento, ya que Travis y GitHub están conectados por lo que Travis ha tomado mi usuario de GitHub habiéndome pedido permiso antes.
A continuación en mi página de perfil en la cual me aparecen mis directorios de GitHub listados, activo la sincronización del repositorio en el cual se llevará a cabo la integración continua.
![Repositorio sincronizado en Travis](http://i1016.photobucket.com/albums/af281/raperaco/repoSincronizadoTravis_zpstu3o0cnr.png)

Ahora a continuación, creo el fichero *.travis.yml* indicándole la versión de Python que usa mi proyecto, el comando de instalación junto los requirements.txt y el comando para ejecutar los tests.
![Fichero .travis.yml](http://i1016.photobucket.com/albums/af281/raperaco/travis.yml_zpsollo56zw.png)

Tras hacer el push del fichero *.travis.yml* al repositorio de GitHub sincronizado con Travis, automáticamente Travis realiza las pruebas de integración continua (construcción y tests) sobre la aplicación superándolas correctamente.
![Travis1](http://i1016.photobucket.com/albums/af281/raperaco/travis1_zps2adbhtfp.png)
![Travis2](http://i1016.photobucket.com/albums/af281/raperaco/travis2_zpslmgsdbfb.png)













