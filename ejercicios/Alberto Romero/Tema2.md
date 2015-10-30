#Alberto Romero Cañadas
#Tema 2

##Ejercicio 1.
##Instalar alguno de los entornos virtuales de node.js (o de cualquier otro lenguaje con el que se esté familiarizado) y, con ellos, instalar la última versión existente, la versión minor más actual de la 4.x y lo mismo para la 0.11 o alguna impar (de desarrollo).

Siguiente el tutorial de la propia web de [Nodejs](http://nodejs.org/en/download/package-manager/), hemos instalado las diferentes versiones.

![Versiones Nodejs](https://i.gyazo.com/b57a48792659d0d59458e0a4bc56f3a6.png "Versiones Nodejs")

##Ejercicio 2.
##Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.

Hemos creado varias aplicaciones en diferentes lenguajes.

Una web para [calificar empresas](https://github.com/sn1k/Calificador-Empresas) en PHP + mysql.

![calificador empresas](https://i.gyazo.com/5ce0d3cecb75f8dd62ad0914a1dcb917.png "empresas")

Web estática en Node.JS, siguiente el tutorial de [CodeDrinks] (http://www.codedrinks.com/como-crear-una-pagina-web-con-node-js-express-jade-y-stylus/).
![static](https://i.gyazo.com/2ca55290b0e692717a7e02abcb1c3c86.png "static")

Una página web en Node.JS, siguiendo el tutorial de [Koalite](http://blog.koalite.com/2011/11/tutorial-node-js-express-jquery-i-creando-la-aplicacion/).

![vehiculos](https://i.gyazo.com/d10316028e027697011d7fe3970aeae5.png "vehiculos")

 
Para el resto de ejercicios vamos a usar esta última.

##Ejercicio 3.
##Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?

Funciona tanto en v0.12.7 como en v0.11.6 instalados en el tema 1.


##Ejercicio 4
##Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente.

Hemos creado la descripción usando npm init.

![json](https://i.gyazo.com/17b8e9cecf7be96e434e9f4c522532b5.png "json")
#Ejercicio 5.
##Automatizar con grunt y docco (o algún otro sistema) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.

Instalamos grunt y docco para esta tarea:
![grunt](https://i.gyazo.com/1563a4834cc871eb770e0ecdb9c7047c.png "grunt")
![docco](https://i.gyazo.com/4d3bf74f938541a7c6a1d8febf7c7b56.png "docco")

#Ejercicio 6.
##Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga (vamos, lo que viene siendo TDD).

Hemos añadido una aserción que nos comprueba si el comentario sobre el vehículo está vacio:
![coment](https://i.gyazo.com/b02bdde774cb107 "coment")



#Ejercicio 7.
##Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante.

Instalamos mocha y creamos la carpeta test. Dentro de la carpeta test, crearemos un test.js.
![mocha](https://i.gyazo.com/a278cf5f32c044cc494e08a63b82f056.png "mocha")

Creamos un assert para comprobar si el servicio se ha ejecutado con normalidad:

![assert](https://i.gyazo.com/65d01440ef72b780c6f39a4d83358f26.png "assert")

![assert](https://i.gyazo.com/b02bdde774cb1078ddb65dfded660f7d.png "assert")

#Ejercicio 8.
##Ejercicio: Haced los dos primeros pasos antes de pasar al tercero.
Hemos creado el archivo shippable.yml correctamente en nuestro repositorio, y lo hemos construido correctamente.
![shippable](https://i.gyazo.com/76887999520f8cfebd13dc9e44fe2e9f.png "shippable")


