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

