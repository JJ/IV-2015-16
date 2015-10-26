#Ejercicio 1

#### Instalar alguno de los entornos virtuales de node.js (o de cualquier otro lenguaje con el que se esté familiarizado) y, con ellos, instalar la última versión existente, la versión minor más actual de la 4.x y lo mismo para la 0.11 o alguna impar (de desarrollo).

Tal y como aparece en su página web, seguimos las instrucciones:

Ejecutamos como administrador la siguiente orden:

	pip install virtualenv
    
He decidio instalar este entorno de pruebas por que en el proyecto, la aplicación está escrita en Python.


#Ejercicio 2

#### Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.
He usado webapp2 (para empaparme un poco de cara a la aplicación final del proyecto), jinja2 para la gestión de templates, y Paste.

Antes de echar la aplicación a andar, necesitamos instalar estos frameworks:

	sudo pip install webapp2
   	sudo pip install jinja2
    sudo pip install Paste
    sudo pip install webob # Necesario para webap2
    
También necesitaremos instalar el módulo MySQLdb, para conectar a la base de datos desde la aplicacion.

	apt-cache search MySQLdb # Busca los paquetes
    sudo apt-get install python-mysqldb # Si aparece python-mysqldb en la orden de arriba

#Ejercicio 3
 
#### Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?

Lamentablemente, webapp2 sólo está desarrollado para Python 2.7, tal y como informa en su [pagina web](https://webapp-improved.appspot.com). Buscando un poco más de información, acabamos llegando a una [pregunta en stackoverflow](http://stackoverflow.com/questions/15639475/webapp2-with-python3), donde nos confirman lo peor, referenciando además [un issue](https://code.google.com/p/webapp-improved/issues/detail?id=40) donde se está debatiendo si llevar webapp2 a la versión 3 (y posteriors) de Python. Aunque por ahora, no hay nada hecho.

#Ejercicio 4

####Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente. 

Al estar trabajando con Python, he creído conveniente usar pip para empaquetar la aplicación del ejercicio 2.

He seguido [este tutorial](http://python-packaging.readthedocs.org/en/latest/).

1º Ponemos el contenido del paquete en un mismo directorio, y lo nombramos con el nombre que queremos que tenga el paquete.

2º Creamos un repositorio para el paquete (no es estrictamente necesario, pero así el paquete puede distribuirse más alla del ámbito local, de los pendrives, y de los enlaces del dropbox). [Aqui podemos ver el repositorio](https://github.com/JA-Gonz/appEjercicioIV)

3º Creamos un directorio con la carpeta de nuestro paquete, y otro archivo setup.py. En este archivo se guardará la configuración del paquete (nombre, autor, dependencias, etc.). El modelo del fichero setup.py es [como este](https://github.com/JA-Gonz/appEjercicioIV/blob/master/setup.py)

4º Creamos el entorno virutal con virtualenv y entramos

	virtualen venv
    source venv/bin/activate
    
5º Creamos el paquete:

	python setup.py install
    
6º El paquete ya se habrá creado. Si queremos ejecutarlo con una sla orden, debemos de tener un fichero __init__.py dentro del directorio del paquete, que será el que se ejecute (una especie de "main"). Para comprobarlo, hacemos:

	python appEjercicioIV

NOta: es posible que haya un error al instalar mysqldb. Seguir estos pasos:
I found the solution on this blog post here but I’ll list the steps here anyway.

    Be sure you have pip installed on your machine using this command:
        sudo easy_install pip
    If you already have pip installed, it’d be a good idea to upgrade it now:
        sudo pip install pip --upgrade
    Build the dependencies for python-mysqldb libraries:
        sudo apt-get build-dep python-mysqldb
    Install the Python MySQL libraries:
        sudo pip install MySQL-python
