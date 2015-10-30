##Ejercicios 1: Instalar alguno de los entornos virtuales de node.js (o de cualquier otro lenguaje con el que se esté familiarizado) y, con ellos, instalar la última versión existente, la versión minor más actual de la 4.x y lo mismo para la 0.11 o alguna impar (de desarrollo).##

El lenguaje de programacion que he elegido ha sido python, por lo que he instalado virtualenv:
![InstalandoVirtualEnv](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/instalandoVirtualenv_zpsnibha78s.png)

Para cambiar la version he usado lo siguiente: 
	**virtualenv -p /usr/bin/pythonVersionAUtilizar directorioDondeSeinstalara**
	**cd directorioDondeSeinstalara**
	**source bin/activate **

Aquí una captura instalando y activando la última versión:
![InstalandoUltima](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/instalandoUltimaVersion_zpsayn130id.png)

Instalando version 3.4:
![Instalando3.4](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/instalandoVersion3.4_zpsokzqpcov.png)		

		
##Ejercicios 2: Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido. Se trata de hacer una aplicación simple que se pueda hacer rápidamente con un generador de aplicaciones como los que incluyen diferentes marcos MVC. Si cuesta mucho trabajo, simplemente prepara una aplicación que puedas usar más adelante en el resto de los ejercicios.## 
He creado una aplicación web simple con Flask (micro framework de python) por la cual se sirven distintas páginas web simples
dependiendo de lo que se escriba en la ruta de la dirección. En esta captura muestro lo que hace mi aplicación:
![AppFlask](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/ejAplicacionFlask_zpsvbhu41i2.png)


##Ejercicios 3: Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas? ##
Sí lo he ejecutado tanto en la versión 2.7.6 de  Python como en la versión 3.4.0, lo único es que ya que son directorios distintos, he tenido que instalar el micro framework Flask en cada una de las versiones del lenguaje. Como resultado funciona correctamente en todas ellas.

##Ejercicios 4: Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente. ##
En el caso de Python he creado el fichero requerimientos.txt en el cual he metido la descripción del módulo con la orden: **pip freeze > requerimientos.txt**.
Este ha sido el resultado:
![Requerimientos](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/ej4_zpslum9antf.png)

##Ejercicios 5: Automatizar con grunt y docco (o algún otro sistema) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.##
En mi caso he instalado pydoc, que es una herramienta que facilita la creación de la documentación para python, ya que viene instalado por defecto y es facil de manejar. Para usarlo hay que importarlo en nuestro código con la siguiente línea **import sys, pydoc**. En este ejemplo he documentado la función que uso en mi aplicación:
![pydoc](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/ej5_zpsvvsudtsv.png)
Pydoc tiene distintas opciones como generar la documentación en formato HTML (opción -w) o la opción -g que genera una interfaz gráfica para encontrar y servir documentación.

##Ejercicios 6: Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga (vamos, lo que viene siendo TDD).##
Para realizar este ejercicio dado que mi pequeña aplicación en python consiste en servir distintas páginas html dependiendo de la ruta escogida, he utilizado [HTMLParser](https://docs.python.org/2/library/htmlparser.html) que es un módulo para python que define una clase para analizar texto y archivos en formato HTML, el cual sirve para buscar e identificar etiquetas (tanto iniciales como finales) y datos dentro de estas. Con este módulo he realizado algunos test y aserciones. 
![PrimerasAserciones](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/ej6-1_zpsukljdsxt.png)

Como se puede ver en la imagen las primeras aserciones que he escrito son basicamente dos, bueno, en realidad una sola aserción en la que englobo la existencia de dos etiquetas, una la de html, es decir, que el documento abra y cierre correctamente con las etiquetas **<html>** y **</html>** y otra que el título de la página se encuentre en tamaño h1 y por tanto que estén las etiquetas **h1** y **/h1**.  Las etiquetas de inicio se encuentran definidas en la función **handle_starttag** y las de fin en **handle_endtag** como se puede ver en la imagen, en estas he utilizado una variable numérica para las comprobaciones.

La nueva funcionalidad que he elegido para probar que falle, es incluir una hoja de estilos (.css) en una de las páginas devueltas en una ruta, en concreto la de profesor. He añadido lo siguiente en mi función de HTMLParser:

![ParserCSS](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/ej6-hayCSS_zpseezcutdp.png)

Con este código compruebo si en attr (que contiene los atributos) se ha añadido el css correctamente. Una vez añadido esto y introduciendo la asercción correctamente antes de servir la página: **assert hay_css == 1**, sin haber definido un css nos salta la aserción: 

![AsserCss](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/ej6-hayCSS-Aser_zpsiftvkgy2.png)

En cambio una vez que definimos el css añadiendo esta línea: link href="/static/estilos.css" rel="stylesheet" type="text/css"  todo funciona correctamente:

![CorrecCss](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/ej6-hayCSS-Coorec_zpsxm1npwtq.png)


##Ejercicios 7: Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante.##
Para realizar programas de test en Python se utiliza la librería Unittest, que es un framework de testing que es una versión del lenguaje de Python de  Junit. Para incluir esta librería debemos añadir un import unittest. He introducido dos test, uno para comprobar la etiqueta HTML y otro para asegurar que se ha introducido el css correctamente. Estas son las funciones con los que los he definido:

![Tests](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/ej7testRealized_zpst3nw8mlk.png)

He eliminado la etiqueta HTML para comprobar que efectivamente funcionan los tests:

![fallo](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/ej7Fallo_zps5vcxften.png)

Luego la he vuelto a poner, y los tests se han ejecutado correctamente:

![todoOK](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/testCorrect_zpsfr82scvz.png)


Por último [aquí dejo un enlace a mi app y al test que he creado](https://github.com/pedrogazquez/Proyecto-IV/tree/master/appIV)
