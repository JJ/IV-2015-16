# Tema 2
### Ejercicio 1: Instalar alguno de los entornos virtuales de node.js (o de cualquier otro lenguaje con el que se esté familiarizado) y, con ellos, instalar la última versión existente, la versión minor más actual de la 4.x y lo mismo para la 0.11 o alguna impar (de desarrollo).

Mostraré el uso de [virtualenv](https://virtualenv.pypa.io/en/latest/), herramienta para crear entornos aislados para Python.

Para instalarlo debemos primero instalar algunos paquetes:

    sudo apt-get install python-pip python-dev build-essential 

A continuación, y a través de [pip](https://pypi.python.org/pypi/pip), instalaremos virtualenv:

    sudo pip install virtualenv 

Podemos crear un entorno para Python 2.7:

    virtualenv entornov2

O por ejemplo para Python 3 en concreto, para ello debemos específicar el intérprete que deseamos usar:

    virtualenv -p /usr/bin/python3 entornov3

Para activar/desactivar el entorno simplemente debemos ejecutar:

    source entornov2/bin/activate
    (entornov2)deactivate

    source entornov3/bin/activate
    (entornov3)deactivate

entornov2 y entornov3 son los directorios raíz generados al crear el entorno, del cual cuelgan los directorios bin, include y lib de dicho entorno virtual. Estos directorios contienen los binarios y librerias necesarios para utilizar las correspondientes versiones de Python elegidas.

### Ejercicio 2: Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.

Se ha usado Django para crear la apliacación web, puede verse el repositorio [aquí](https://github.com/jesusgn90/ejercicio2_IV/)

###Ejercicio 3: Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?

Primeramente se ha usado:

    source entornov3/bin/activate
    (entornov3) pip install django

En este caso tenemos un entorno con:

    Python 3
    Django 1.8.5

No ha funcionado como se esperaba.

A continuación se ha usado:

    source entornov2/bin/activate
    (entornov2) pip install django

Ahora tenemos un entorno con:

    Python 2.7
    Django 1.8.5

Ahora si que ha funcionado correctamente, por tanto vemos que mi aplicación no está 
preparada para correr bajo Python 3.

