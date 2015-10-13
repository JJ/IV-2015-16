#Tema 2

###Ejercicio 1 : Instalar alguno de los entornos virtuales de node.js y, con ellos, instalar la última versión existente, la versión minor más actual de la 0.12 y lo mismo para la 0.11 o alguna impar. Si no se usa habitualmente este lenguaje, hacer lo mismo con cualquier otro lenguaje de scripting.

En mi caso no uso dicho lenguaje y por eso he optado por el entorno virtual **virtualenv** de *Python*, el cual como se explica en los apuntes nos permite usar una versión diferente en caso de estar inmerso en desarrollos de proyectos que necesitan diferentes versiones de Python.

![instalacion](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/virt_inst_zpsvq4gzyua.png)

A continuación para crear un entorno virtual ejecuto *virtualenv nombre_proyecto* , se observa como se crean los directorios relativos a las librerias, ejecutables,.., de *Python*.

![creacionentorno](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/creacentorno_zpsagqxknqe.png)

Ahora se puede entrar y activar el entorno creado mediante el comando **source bin/activate** 

![activacion](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/activacion_zps9gkq305d.png)

Con esto ya es posible instalar lo que sea necesario de Python usando la herramienta **pip**, por ejemplo *Django 1.6*

![entornodjango](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/django_zpszdug7kvo.png)

Por ultimo, para desactivarlo solo hay que ejecutar la orden **deactivate**

![desactivar](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/desactivar_zpsuduiec5s.png)

Añado la instalación de **nvm** para *nodejs*( para instalar [nodejs](http://www.hostingadvice.com/how-to/install-nodejs-ubuntu-14-04/#ubuntu-package-manager) puede seguirse esta página) como se indica en el enlace del [tema](https://github.com/creationix/nvm):

- Instalación mediante el comando **curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash**
![instalarentorno](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/1_zpszvr81ipu.png)
- Activación del entorno ejecutando **. ~/.nvm/nvm.sh**
- Instalación del entorno a usar, por ejemplo **nvm install 0.10**
- Y le indicamos que queremos usarla ( se pueden tener varias instalados ) **nvm use 0.10**
- Y para desactivar el entorno virtual **nvm deactivate**  
![actic_instal_uso_desact](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/2_zps5my29q28.png)

###Ejercicio 2: Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.
devcode.la
