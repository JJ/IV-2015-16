#Ejercicios tema 2


##Ejercicio 1
###Instalar alguno de los entornos virtuales de node.js (o de cualquier otro lenguaje con el que se esté familiarizado) y, con ellos, instalar la última versión existente, la versión minor más actual de la 4.x y lo mismo para la 0.11 o alguna impar (de desarrollo).

HE SEGUIDO ESTE TUTORIAL: https://www.digitalocean.com/community/tutorials/how-to-install-node-js-with-nvm-node-version-manager-on-a-vps

En primer lugar descargamos el fichero install.sh con el comando:

curl https://raw.githubusercontent.com/creationix/nvm/v0.11.1/install.sh | bash
![captura descarga fichero install.sh](https://www.dropbox.com/s/syl4fjl0n2c0cot/1.png?dl=1)

Reinicio la máquina para que se puedan observar los cambios.

Con el comando "nvm ls-remote" podemos ver las distintas versiones de nvm e instalar la que necesitemos.

Instalamos la versión más actual de la v0.11 que es la v0.11.16 con el comando:
nvm install v0.11.16

Instalamos por otro lado la versión más actual de nvm (es la v4.2.1) mediante el comando:
nvm install stable 
![captura instalación última version nvm](https://www.dropbox.com/s/3bktc82dq8amujk/2.png?dl=1)

Y finalmente compruebo que se han instalado las dos versiones que le he indicado con el comando:
nvm ls
![captura visualiza versiones instaladas de nvm](https://www.dropbox.com/s/i2ebltq95393461/3.png?dl=1)

por otro lado he instalado también nodejs:
sudo apt-get install nodejs

y los paquetes del repositorios que necesita npm:
sudo apt-get install npm



##Ejercicio 2
Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.
Se trata de hacer una aplicación simple que se pueda hacer rápidamente con un generador de aplicaciones como los que incluyen diferentes marcos MVC. Si cuesta mucho trabajo, simplemente prepara una aplicación que puedas usar más adelante en el resto de los ejercicios.

He creado una aplicación en la que existen cuatro empresas en las que los alumnos pueden hacer las prácticas de empresa de la carrera. Se puede seleccionar la empresa que se desee y se mostrará un listado con los alumnos que ya están inscritos a dicha empresa. Desde esa vista se pueden ingresar alumnos a esas empresas. Esta aplicación la he creado siguiendo el tutorial de esta [web](http://blog.koalite.com/2011/11/tutorial-node-js-express-jquery-i-creando-la-aplicacion/). El enlace de mi repositorio es [este](https://github.com/ignaciorecuerda/aplicacion_web)

Adjunto captura del comando para poner en funcionamiento la parte del seridor
![Poner en marcha el servidor](https://www.dropbox.com/s/bwdihoxtbfm0ldm/Ejr2.4.png?dl=1)

Adjunto captura de la aplicación en funcionamiento
![aplicación funcionando](https://www.dropbox.com/s/9bxm1o5264ro5et/Ejr2.5.png?dl=1)

##Ejercicio 3
Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?

He probado las dos versiones instaladas en el ejercicio 1 de este tema (v0.11.16 y v4.2.1) y con ambas funciona correctamente

![aplicación funcionando](https://www.dropbox.com/s/wecgtsrmb4145ix/Ejr3.png?dl=1)


##Ejercicio 4
Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente.

Para la realización de este ejercicio he utilizado el comando "npm init" y he completado todo los campos que van saliendo. Esto modifica mi archivo package.json que finalmente queda así:

![archivo package.json](https://www.dropbox.com/s/1p1t6r0r8y0larr/Ejr4.png?dl=1)

##Ejercicio 5
Automatizar con grunt y docco (o algún otro sistema) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.

Lo primero que hago es instalar tanto grunt como docco, con los siguientes comandos que se pueden ver en la captura de pantalla

![instalando grunt y docco](https://www.dropbox.com/s/s1d3m1rmzshks5i/Ejr5.1.png?dl=1)

Ahora el archivo package.json tiene el siguiente contenido:

![archivo package.json](https://www.dropbox.com/s/yxpsju8qlkf1ekx/Ejr5.2.png?dl=1)

Creamos el archivo Gruntfile.js en la raiz de nuestro proyecto. Este archivo tiene el siguiente contenido:

![archivo Gruntfile.js](https://www.dropbox.com/s/0s4ruyvkb0l2cpx/Ejr5.3.png?dl=1)

Por último no queda nada mas que ejecutar el comando "grunt" para que nos genere la documentación del proyecto en un nuevo directorio "docs". Nos genera .html con información del proyecto. 

![comando grunt](https://www.dropbox.com/s/1pk2g3fdjsmh58s/Ejr5.4.png?dl=1)

##Ejercicio 6
Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga (vamos, lo que viene siendo TDD).

Me voy al archivo index.js donde quiero asegurarme que el nombre del alumno que quieren añadir en la empresa tiene al menos 3 caracteres. En el método usado para añadir un alumno lo modifico añadiendo el assert y queda así:

![metodo añadir alumno con asser](https://www.dropbox.com/s/2m6vcu1la35kj7b/Ejr6.1.png?dl=1)

A continuación vuelvo a lanzar la aplicación y pruebo a introducir un alumno a una empresa con el nombre "a" (menor de 3 caracteres), no me permite añadirlo e imprime el mensaje que he puesto. Y después introduzco "alberto" y lo añade sin problema

![metodo añadir alumno con asser](https://www.dropbox.com/s/aumdd37xza4nuqs/Ejr6.2.png?dl=1)


##Ejercicio 7
Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante.

En primer lugar instalamos mocha con el comando "sudo npm install -g mocha"

![instalando moncha](https://www.dropbox.com/s/dxlyquv0gqvxjrd/Ejr7.1.png?dl=1)

En el directorio raiz del proyecto creo una carpeta llamada "test" y dentro de esta el archivo test.js que tiene el siguiente contenido:

![contenido test.js](https://www.dropbox.com/s/2idiggalxq4916u/Ejr7.2.png?dl=1)

Por último solo falta ejecutar el comando que vemos a continuación con el resultado:

![mocha test/test.js](https://www.dropbox.com/s/2ifpq81vaniczwy/Ejr7.3.png?dl=1)


##Ejercicio 8
Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante.

He usado [Travis](https://travis-ci.org).

En primer lugar me he tenido que registrar con la misma cuenta de hitHub. Una vez dentro tengo que dar permiso para que acceda a mi cuenta de gitHub y así poder escoger el proyecto de la aplicación que quiero que se ejecute.
Creo el fichero .travis.yml y lo agrego a la raiz de mi repositorio, Este fichero tiene el siguiente contenido;

![.travis.yml](https://www.dropbox.com/s/f7vjbqcz78v6bw4/Ejr8.1.png?dl=1)

Por último desde travis ejecutamos el test y vemos que ha pasado el test.

![build passing](https://www.dropbox.com/s/uvzbbd1umttpgkh/Ejr8.2.png?dl=1)

