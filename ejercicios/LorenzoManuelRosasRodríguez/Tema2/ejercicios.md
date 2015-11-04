#Tema 2

###Ejercicio 1 : Instalar alguno de los entornos virtuales de node.js y, con ellos, instalar la última versión existente, la versión minor más actual de la 0.12 y lo mismo para la 0.11 o alguna impar. Si no se usa habitualmente este lenguaje, hacer lo mismo con cualquier otro lenguaje de scripting.

Como llevo esta asignatura junto a DAI, he decidio usar el entorno virtual **virtualenv** de *Python*, este entorno virtual nos dará la posibilidad de usar una versión diferente de python cuando se requiera.
![instalacion](https://www.dropbox.com/s/fdzqddwkiowrfsa/img1.png?dl=1)

Para la creación del entorno virtual introduciré en la terminal *virtualenv nombre_proyecto*:

![creacionentorno](https://www.dropbox.com/s/8zoysj6awvposzp/img2.png?dl=1)

En mi caso ya he creado una, denominada apuestas, que contendrá una pequeña aplicación cogida de un manual de Django.

Podremos activar el entorno desde la carpeta del mismo e introduciendo en la pantalla :**source bin/activate** 

![activacion](https://www.dropbox.com/s/yjdd4pltjnsiged/img3.png?dl=1)


Ya podríamos instalar lo que fuera necesario en nuestro entorno, usando la herramienta **pip**, por ejemplo *Django 1.6*

![entornodjango](https://www.dropbox.com/s/vt7a0mmjhkf7wnw/img4.png?dl=1)

Para desactivarlo, ejecutamos **deactivate**

![desactivar](https://www.dropbox.com/s/4emfd7chdqdy6e8/img5.png?dl=1)

###Ejercicio 2: Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.

En mi caso he creado una pequeña aplicación siguiendo el tutorial de [Django](https://docs.djangoproject.com/en/1.8/intro/tutorial01/), el cual nos permitirá crear una aplicación para crear encuestas y votarlas.

Para usarla deberemos poner en la terminal **python manage.py runserver**, y nos saldrá algo parecido a esto:
![inicio_pag](https://www.dropbox.com/s/cn57dygf4jmzmjz/img6.png?dl=1)

Introduciremos esa dirección ip en nuestro navegador y ya podremos usarla. Al principio nos saldría las encuestas que ya hemos creado:
![encuestas](https://www.dropbox.com/s/578zwjvea9uewcf/img7.png?dl=1)

Si pinchamos en una nos saldría las distintas opciones:


![opciones](https://www.dropbox.com/s/a5bq5pmyhavazyy/img8.png?dl=1)

Y se guardaría nuestra respuesta:



![respuestas](https://www.dropbox.com/s/dw7juwy5ot7347s/img9.png?dl=1)

###Ejercicio 3: Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?
Tal y como he visto en los tutoriales, he cambiado las versiones de python que se usan en el entorno virtual apuestas y me ha funcionado( en la versión 2.7 y 3 de python).

![python2.7](https://www.dropbox.com/s/isboeaojuu5obx2/img10.png?dl=1)
![python3](https://www.dropbox.com/s/5yl93wgmo0534nc/img11.png?dl=1)

###Ejercicio 4: Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente.
En mi caso al usar django, el archivo más parecido que he localizado para realizar el ejercicio ha sido setup.py:

![archivo](https://www.dropbox.com/s/u0wmzqwbzt5vrtj/img12.png?dl=1)

###Ejercicio 5: Automatizar con grunt y docco (o algún otro sistema) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.

En mi caso, tras consultarlo en internet y con mis compañeros, he tenido que utilizar la herramienta Sphinx:
-Instalación:


![install](https://www.dropbox.com/s/s2nasxeoyajf89u/img13.png?dl=1)

-Creación de las carpetas correspondientes:


![crear_carpts](https://www.dropbox.com/s/zt6kmjz88r1iuv4/img14.png?dl=1)

-Creación de los archivos rst correspondientes por cada uno de los módulos que se quiere documentar:


![creacion_arc_rst](https://www.dropbox.com/s/uyjwnz47vqjum1v/img15.png?dl=1)
-Se ejecuta el make html.


![ejecucion_make](https://www.dropbox.com/s/7if4sss2a19ajxf/img16.png?dl=1)
-Podemos observar en la carpeta build como se generan los htmls correspondientes a la documentación.

![prueba1](https://www.dropbox.com/s/3bvonnq2vhw8ksg/img17.png?dl=1)
![prueba2](https://www.dropbox.com/s/tm2858drxvuze16/img18.png?dl=1)

###Ejercicio 6: Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga (vamos, lo que viene siendo TDD).

Yo me he basado en el tutorial de Django para realizar el ejercicio, ya que me ha venido bien para profundizar en este tema, para ello dentro de la carpeta polls, en el archivo tests.py he introducido lo siguiente:

![assert1](https://www.dropbox.com/s/t05efyp9zmdrrvr/img19.png?dl=1)

El cual, al ejecutarlo me ha salido:


![assert1](https://www.dropbox.com/s/xrxmz085sjvn2ha/img20.png?dl=1)

¿Qué es lo que ha pasado?, sencillamente lo que he hecho es crear una pregunta la cual instancia el pub_date del método Question en el futuro. Pero al comprobar si la pregunta se ha publicado recientemente nos sale verdadero y nos debería salir falso, por lo que deberíamos de modificar dicho método, por lo que nos dirigimos al archivo polls/models.py y lo dejamos de la siguiente forma:

 
![assert1](https://www.dropbox.com/s/ztjwfw6riajmjc0/img21.png?dl=1)

Ahora al ejecutarlo nos sale realiza el test correctamente:


![assert1](https://www.dropbox.com/s/o2yw439d6y3xuj6/img22.png?dl=1)

###Ejercicio7: Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante.

Ya lo he realizado en el ejercicio 6, mi archivo se llama polls/tests.py.

###Ejercicio8: Haced los dos primeros pasos antes de pasar al tercero. Configurar integración continua para nuestra aplicación usando Travis o algún otro sitio.

![assert1](https://www.dropbox.com/s/uoyn00dq4dw8vph/img23.png?dl=1)





