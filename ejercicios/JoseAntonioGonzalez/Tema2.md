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
    