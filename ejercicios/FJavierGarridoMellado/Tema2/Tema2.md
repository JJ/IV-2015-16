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

En mi caso he creado una aplicación sencilla donde se añade la empresa junto al nombre del alumno y la calificación de su practica, además se permite borrar dichos datos, la he realizado usando el framework **Express** de **nodejs**.No es gran cosa la aplicación, así que espero mejorarla mas adelante.A continuación dejo unas fotos de los pasos seguidos para su realización.

- Tras crear el directorio donde vamos a tener la aplicación hay que meterse en el y ejecutar **npm init** para que cree el archivo **package.json**

![npmini](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/npminit_zps1bd2fa0e.png)

- A continuación se ejecuta **npm install express** para disponer del framework en la aplicación( hay que usar tambien la opción -g sino esta en el sistema de manera global)

![expressenlaapp](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/instexpress_zpseuftoxje.png)

- Se ejecuta con la opción **npm start** , antiguamente era **npm start bin/www**

![npmstart](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/npmstart_zpsoasgzcju.png)

- Y la aplicación que permite registrar unas practicas y eliminarla

![generarprac](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/antildeadirempresapract_zpsniuxilz7.png)

![eliminarprac](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/eliminarempresa_zpsupcuiqy4.png)

![eliminarprac2](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/eliminarempresa2_zpseqi9236l.png)

El repositorio se encuentra en el siguente [enlace](https://github.com/javiergarridomellado/Empresa_expressiv.git).

Por otra parte he creado otra app usando el framework Django ( Python ) debido a que el proyecto final en mi caso usa dicha herramienta.

- Activación del entorno virtual ejecutando **source bin/activate**

- Instalación de la versión de Django que se va a usar **pip install Django==1.5**

![instalardjango](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/instalacionDjango_zpsz6uhymoq.png)

- Creación del proyecto mediante la orden **django-admin.py startproject nombreproyeto**

![crearproyecto](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/creacionproyecto_zpsaf3oms0f.png)

- Dentro de la carpeta del proyecto se crea la aplicación mediante la orden **django-admin.py startapp nombreaplicacion**

![crearapp](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/crearapp_zpsucsg99bc.png)

- La aplicación funcionando tras haber sincronizado la base de datos con **python manage.py syncdb** y ejecutar el servidor con la orden **python manage.py runserver**, en este caso solo le he dado la funcionalidad de registrar las practicas de Empresa.

![appdjango](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/RegistrarEmpresa_zpsey2ioquo.png)

![appdjango2](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/Redirigir%20Empresa_zps7kcvr0hm.png)

El repositorio se encuentra en el siguiente [enlace](https://github.com/javiergarridomellado/Empresa_django.git)

###Ejercicio 3: Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?

He activado el entorno virtual con la orden **~/.nvm/nvm.sh** y he procedido a probar con las versiones **v4.2.1** ( stable ), **v0.10.40** y **v0.11.13**.Funciona correctamente ( puede ejecutarse tambien con **npm** en vez de **node**).

![entornoestable](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/nodestable_zps2knqhjwn.png)

![version010](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/node010_zps5kwoqevz.png)

![version011](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/node011_zpshkp8wjeg.png)

En el caso de Python he definido para **virtualenv** la ruta para que use **Python3** mediante el comando **virtualenv --python=/usr/bin/python3 nombre**,  puede verse en la carpeta **/bin** como esta la version 3 para usarse pero al arrancar el servidor da un error en la importación de un modulo de django que posiblemente sea causado por ser la version 1.5 y por tanto no use diche versión.

![python3](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/errorpython3_zpsig2cbyi7.png)

###Ejercicio 4: Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente.

Usando el comando **npm init** se crea el archivo **package.json** como puede verse en la figura.

![package](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/ejerc4_zps7adcvb89.png)

En el caso de **django** lo mas parecido que he encontrado es el archivo **settings.py** donde se encuentra el nombre de la aplicación, tipo de base de datos usada, etc.

![django](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/django_zpsq2vd3ksl.png)
