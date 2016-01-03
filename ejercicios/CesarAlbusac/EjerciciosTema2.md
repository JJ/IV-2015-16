##Ejercicio 1.

Instalar alguno de los entornos virtuales de node.js (o de cualquier otro lenguaje con el que se esté familiarizado) y,
con ellos, instalar la última versión existente, la versión minor más actual de la 4.x y lo mismo para 
la 0.11 o alguna impar (de desarrollo).

He instalado virtualenv ya que estamos usando python para las prácticas de otra asignatura así como mi proyecto de IV.
Para instalar virtualenv escribimos lo siguiente en el terminal:

	$ sudo pip install virtualenv

Comprobamos la version virtualenv --version e instalamos la última version:

![Version](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/PracticayEjercicios2/InstalandoUltimaVersion_zps9gb2ndhn.jpg )

Para cambiar la version ,debemos escribir lo siguiente: 
	virtualenv -p /usr/bin/python<Version> <directorio_de_Instalacion>
	cd <directorio_de_Instalacion>
	source bin/activate 


Donde <version> será la versión que queramos utilizar y <directorio_de_Instalacion> un directorio existente donde queremos que se instale.
Por ejemplo, para instalar la version 3.4:

![version3.4](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/PracticayEjercicios2/Instalandov34_zpsvenzcxbu.png)


##Ejercicios 2: 

Se trata de hacer una aplicación simple que se pueda hacer rápidamente con un generador de aplicaciones como los que incluyen 
diferentes marcos MVC. Si cuesta mucho trabajo, simplemente prepara una aplicación que puedas usar más adelante en el resto de los ejercicios.


He creado una aplicación web simple con Flask (microframework de python) por la cual se sirven distintas páginas web simples
dependiendo de lo que se escriba en la ruta de la dirección.
Aquí podemos verla:

![aplicacionWeb](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/PracticayEjercicios2/AplicacionWeb_zpskewqstkx.jpg)






##Ejercicio 3:
Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?

He ejecutado el código con Python2.7 y ha funcionado. Sin embargo , con Python 3.4 no me ha funcionado, como se puede ver en la imagen:
	
![DiferentesPython](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/PracticayEjercicios2/diferentesPython_zpsn7zojbue.png)

Al parecer hay un Debug con la versión y Flask , pero se resuelve de manera sencilla.

http://stackoverflow.com/questions/29090967/flask-bug-on-python-3-4-development-server-cant-run-if-app-contains-relative-i



##Ejercicio 4:
Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente.

En python tenemos **requirements.txt**. Para crearlo, en el entorno en el que se encuentre nuestro proyecto , debemos ejecutar
$ pip freeze > requirements.txt

![requirements](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/PracticayEjercicios2/requirements_zps6nlt8gzq.png)

Podemos ver la descripción más a fondo de estos archivos en los siguientes links:

[¿Qué son los archivos requirements?](http://pip.readthedocs.org/en/stable/user_guide/#requirements-files)

[Formato de los archivos requirements.](http://pip.readthedocs.org/en/stable/reference/pip_install/#requirements-file-format)


##Ejercicio 5:
Automatizar con grunt y docco (o algún otro sistema) la generación de documentación de la librería que se cree. Previamente, 
por supuesto, habrá que documentar tal librería.

Para la generación de documentación en Python tenemos varias posibles herramientas. Tanto  [epydoc](http://epydoc.sourceforge.net/api/), como
[Sphinx](http://matplotlib.org/sampledoc/index.html)  son buenas para este trabajo. También tenemos [pydoc](https://docs.python.org/2/library/pydoc.html)

He usado **pydoc** ya que es más sencillo que los demás.

Con el comando pydoc sys podemos ver la ayuda de esta herramienta:

![Imagen_ayuda](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/PracticayEjercicios2/pydocsys_zpszraifpmb.png)

Debemos importar en nuestro código pydoc, para que pueda usarse:

![Imagen_importar](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/PracticayEjercicios2/importPydoc_zpsslkw2hnb.png)

Pydoc nos permite mostrar la documentación ya sea en forma de texto por consola, servido en el navegador, o guardado en formato html.

Nos devuelve información sobre los módulos, clases, funciones y métodos.

![documentacion_consola](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/PracticayEjercicios2/documentacion_zpsut8jzgaf.png)

Con el flag -w antes del argumento creará la documentación HTML en el directorio actual, en lugar
de mostrarlo en consola.

Podemos usar pydoc para lanzar un servidor HTTP en la máquina local que servirá la
documentación visitando el navegador. Por ejemplo, si ponemos **pydoc -p 9999**, se lanzará
un servidor HTTP en el **puerto 9999**, permitiendonos ver la documentación en nuestro 
navegador a través de la url **http://localhost:9999/**:

![documentacion_http](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/PracticayEjercicios2/documentacionhttp_zps1mmeseff.png)



##Ejercicio 6:
Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. 
Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga (vamos, lo que viene siendo TDD).


Ya que mi aplicación web devuelve páginas html e imágenes, vamos a realizar un par de test que comprueben si todo ha ido correctamente.
He utilizado [HTMLParser](https://docs.python.org/2/library/htmlparser.html) para analizar los textos que devuelvo, de manera que si encuentra una etiqueta que sea html,todo habrá ido correctamente, pero si no la encuentra, saltará la función assert.

El código de HTMLparser es el siguiente:

![htmlparser](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/PracticayEjercicios2/ej6_1_zpsevc4iqsm.png)

Como podemos ver, hemos tenido que importar la bilbioteca HTMLparser.
En la clase que he definido, analiza las etiquetas para comprobar si hay etiquetas html o bien img, y en caso de que 
existan, modifico una variable que indicará si existe o no.

Ahora, en las funciones, pongo assert de manera que salten si no han devuelto lo que tenían que devolver, ya sea html
o sean imágenes.
En el caso de index, falla, ya que en principio sólo devuelve un texto plano, no está en html.
En el caso de las urls coches y bicis, no fallan, ya que los dos devuelven código html y al menos una imagen.

![funciones_assert](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/PracticayEjercicios2/ej6_2_zpsfv1isl4n.png)

Un ejemplo de los assert que saltan y los que no: 

![pagina_coches](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/PracticayEjercicios2/ej6_coches_zpsjgu22ysl.png)
![pagina_index](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/PracticayEjercicios2/ej6_index_zpsgbvzyauz.png)

Ya que la página por defecto nos falla, porque no le devolvemos un html, pasamos a modificarlo para que no salte el assert:

![pagina_index2](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/PracticayEjercicios2/ej6_index3_zps6zvz2oed.png)

Y, como podemos ver en la siguiente imagen, ya no nos salta el assert:
![pagina_index3](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/PracticayEjercicios2/ej6_index2_zps3ge4ocgm.png)


##Ejercicio 7:
Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante.

En python , un framework para realizar test es **unittest**. Para poder usarlo, en nuestro código debemos importar unittest:

La documentación referente a los test con unittest se encuentra en el siguiente [enlace](https://docs.python.org/2/library/unittest.html).

He creado test.py que contendrá los test que quiero probar. Tenemos que importar unittest, así como HTMLparser.
Luego creamos una clase que contendrá los test, llamada  TestMethods:

![test_1](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/PracticayEjercicios2/test_zpsifti2npc.png)

![test_2](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/PracticayEjercicios2/test_2_zpsljdz4o0n.png)

Ahora, vamos al terminal y ejecutamos python test.py, lo que nos devuelve lo siguiente:

![test_terminal](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/PracticayEjercicios2/test_terminal_zpsupgkggag.png)

Y si quitásemos la imagen de /bicis , para comprobar si nos saldría el error: 

![test_terminal_error](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/PracticayEjercicios2/test_fallo_zpsxv0pi6a7.png)


##Ejercicio 8:
Haced los dos primeros pasos antes de pasar al tercero.


He escogido [travis](https://travis-ci.org/) para realizar esta tarea.
En primer lugar, tenemos que darnos darnos de alta con nuestro usuario de GitHub, y autorizar la aplicación:
![Autorizar](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/ejercicio7_zpsotpqhn1p.png)

Después, debemos activar el repositorio en el que queremos activar la integración continua:
![activar](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/travis_aceptar_zpsu1wthpo4.png)

El archivo [.travis.yml](https://github.com/cesar2/Proyecto-IV/blob/master/.travis.yml) es el que vamos a usar para la integración continua.

Al crear el archivo de configuración de la integración continua, en este caso es un archivo .yml, indicamos entre
otras cosas, el lenguaje que usamos, la versión, cómo instalar dependencias y ejecutar los tests:
![arhivo_travis](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/PracticayEjercicios2/archivo_travis_zpsbncg84el.png)


Añadimos en nuestro repositorio el fichero **.travis.yml**  y automáticamente, en la página de travis se ejecutarán la integración:
![integracion](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/travis4_zpsnqeocjvs.png)

![test_travis](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/travis2_zpsift8yffn.png)




