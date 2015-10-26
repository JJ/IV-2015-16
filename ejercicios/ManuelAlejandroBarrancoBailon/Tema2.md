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


