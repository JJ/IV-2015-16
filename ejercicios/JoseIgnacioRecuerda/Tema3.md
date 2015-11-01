#Ejercicios tema 3


##Ejercicio 1
###Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.

He optado por darme de alta en Herocu

![dado de alta en Heroku](https://www.dropbox.com/s/izlgum592wbyo1z/ejr1.png?dl=1)


##Ejercicio 2
Crear una aplicación en OpenShift y dentro de ella instalar WordPress.



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

