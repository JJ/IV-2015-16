# Ejercicios Tema 2
  
## Ejercicio 1

Instalar alguno de los entornos virtuales de node.js (o de cualquier otro lenguaje con el que se esté familiarizado) y, con ellos, instalar la última versión existente, la versión minor más actual de la 4.x y lo mismo para la 0.11 o alguna impar (de desarrollo).

Instalación de **nvm** ,y con éste instalar **nodejs**, para lo cual he seguido el tutorial de esta página: [Instalar nvm](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-with-nvm-node-version-manager-on-a-vps):

- Primero se instala con el comando **curl** y el enlace de la versión deseada de **nvm**, en mi caso la última, la cual he comprobado que lo es en [nvm releases](https://github.com/creationix/nvm/releases).
![instalar nvm](http://i.imgur.com/gDzjOwA.png)
- Reflejar los cambios que nvm ha hecho en el *path*.
![profile update]()
- Procedo a instalar la última versión de **node.js**, la cual aparece al final de la lista si escribimos *nvm ls-remote*, o simplemente mirando [su web](https://nodejs.org/en/), en donde aparece en el centro de la pantalla, en este caso la *v4.2.1*.
![nvm ls-remote]()
![instalar node.js]()
- Usando *node --version* podemos ver que efectivamente hemos instalado esa versión y está activa.
- Procedo a instalar una versión antigua de **node.js**, por ejemplo, la *v0.11.11* 
![instalar node.js antiguo]()
- Esto hará activa esta versión antigua, por lo que queremos volver a activar la primero que hemos instalado, la última versión, debemos hacer uso de *use*:
![cambiar version node.js]()
- Ahora estamos usando de nuevo la *v.4.2.1*

## Ejercicio 2

Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.

## Ejercicio 3

Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?

## Ejercicio 4

Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente. 

## Ejercicio 5

Automatizar con grunt y docco (o algún otro sistema) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.

## Ejercicio 6

Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga (vamos, lo que viene siendo TDD).

## Ejercicio 7

Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante. 


## Ejercicio 8

Ejercicio: Haced los dos primeros pasos antes de pasar al tercero.
