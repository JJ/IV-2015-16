# Ejercicios Tema 2
  
## Ejercicio 1

Instalar alguno de los entornos virtuales de node.js (o de cualquier otro lenguaje con el que se esté familiarizado) y, con ellos, instalar la última versión existente, la versión minor más actual de la 4.x y lo mismo para la 0.11 o alguna impar (de desarrollo).

Instalación de **nvm** ,y con éste instalar **nodejs**, para lo cual he seguido el tutorial de esta página: [Instalar nvm](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-with-nvm-node-version-manager-on-a-vps):

- Primero se instala con el comando **curl** y el enlace de la versión deseada de **nvm**, en mi caso la última, la cual he comprobado que lo es en [nvm releases](https://github.com/creationix/nvm/releases).
![instalar nvm](http://i.imgur.com/gDzjOwA.png)
- Reflejar los cambios que nvm ha hecho en el *path*.  
![profile update](http://i.imgur.com/z1mvNxW.png)
- Procedo a instalar la última versión de **node.js**, la cual aparece al final de la lista si escribimos *nvm ls-remote*, o simplemente mirando [su web](https://nodejs.org/en/), en donde aparece en el centro de la pantalla, en este caso la *v4.2.1*.
![nvm ls-remote](http://i.imgur.com/ef53x8y.png)
![instalar node.js](http://i.imgur.com/bervxOz.png)
- Usando *node --version* podemos ver que efectivamente hemos instalado esa versión y está activa.
- Procedo a instalar una versión antigua de **node.js**, por ejemplo, la *v0.11.11* 
![instalar node.js antiguo](http://i.imgur.com/ZifJx5Z.png)
- Esto hará activa esta versión antigua, por lo que queremos volver a activar la primero que hemos instalado, la última versión, debemos hacer uso de *use*, como se puede ver en la imagen anterior, ahora estamos usando de nuevo la *v.4.2.1*.

## Ejercicio 2

Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.

He procedido a realizar una aplicación sencilla con **Express** para agilizar el proceso, siguiente este [tutorial](http://www.codedrinks.com/como-crear-una-pagina-web-con-node-js-express-jade-y-stylus/).

![ej2.png](http://i.imgur.com/Wmycejo.png)



## Ejercicio 3

Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?

Efectivamente, funciona en las dos versiones de **node.js** que tengo instaladas, que son la v4.2.1 y la v0.11.11, como se puede comprobar en las siguientes capturas.
![ej3_1.png](http://i.imgur.com/yjnqyxF.png)
![ej3_2.png](http://i.imgur.com/QefYK2b.png)


## Ejercicio 4

Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente. 

Con **npm init** he puesto las características que faltaban. (No las tiene todas porque en los siguientes ejercicios se le agregan).

![ej4.png](http://i.imgur.com/zAOTX3l.png)

## Ejercicio 5

Automatizar con grunt y docco (o algún otro sistema) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.

- Instalamos *grunt* globalmente:
![ej5_1.png](http://i.imgur.com/eEXjbmo.png)

- Instalamos **docco** y **grunt-docco** desde la carpeta del proyecto, con las opciones que aparecen en la imagen:
![ej5_2.png](http://i.imgur.com/rjnsfbF.png)

- Vemos como ha habido cambios en *package.json*
![ej5_3.png](http://i.imgur.com/EIIMBSZ.png)

- Por último vemos que se crea el archivo *Gruntfile.js* y ejecutamos el comando **grunt** desde la carpeta del proyecto, diciendo que la documentación se ha generado.
![ej5_4.png](http://i.imgur.com/Xd5XkiK.png)

## Ejercicio 6

Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga (vamos, lo que viene siendo TDD).

- En *index.jade* he escrito el siguiente *assert*:
![ej6_1.png](http://i.imgur.com/lt06FOb.png)

- Vemos en consola que falla, dado que solamente hay 3 empresas en el vector
![ej6_2.png](http://i.imgur.com/HiyLAma.png)

## Ejercicio 7

Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante. 

- Instalamos **mocha** globalmente con **sudo apt-get install -g mocha**.
- Creamos la carpeta para los tests y dentro el archivo *test.js*, el cual contiene lo siguiente:
![ej7_1.png](http://i.imgur.com/7FMqE6b.png)
- Ejecutamos el test con el comando que aparece en la siguiente imagen:
![ej7_2.png](http://i.imgur.com/JRx3ViC.png)

## Ejercicio 8

Ejercicio: Haced los dos primeros pasos antes de pasar al tercero.

- Primero me he dado de alta en Travis con GitHub.

- Después he activado la integración continua en el repositorio de la aplicación de empresas.
![ej8_2.png](http://i.imgur.com/zCvbP8l.png)

- He creado el archivo **.travis.yml** dentro de la carpeta del proyecto con el siguiente contenido:
![ej8_3.png](http://i.imgur.com/OOKCQAV.png)

- Finalmente se puede ver como la integración continua funciona y la aplicación ha pasado la prueba.
![ej8_4.png](http://i.imgur.com/0yEJPTl.png)



