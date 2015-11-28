# Tema 3
###Ejercicio 1: Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.

Me he registrado en [Heroku](https://www.heroku.com/), he creado una aplicación de pruebas y otra con nombre propio, Try-2-Learn, usada para el proyecto propio de las prácticas de esta asignatura.

![Heroku](http://i1376.photobucket.com/albums/ah6/jesusgn90/tema3-1.1_zpsoc02ngtj.png)

###Ejercicio2: Crear una aplicación en OpenShift y dentro de ella instalar WordPress.

Nos registramos en [OpenShift](https://www.openshift.com/app/account/new), creamos nuestra primera aplicación, lo cual nos da a elegir entre varios tipos, una de ella WordPress 4, la seleccionamos:

![paso1](http://i1376.photobucket.com/albums/ah6/jesusgn90/tema3-2.1_zps5iuxbbkd.png)

Después configuramos algunos parámetros:

![paso2](http://i1376.photobucket.com/albums/ah6/jesusgn90/tema3-2.2_zpstn2bkxbe.png)

Ya tenemos la aplicación instalada:

![paso3](http://i1376.photobucket.com/albums/ah6/jesusgn90/tema3-2.3_zpszd4xiu5l.png)

Podemos visitarla [aquí](http://jesusgn90-pruebaiv15.rhcloud.com/)

###Ejercicio 3: Realizar una app en express (o el lenguaje y marco elegido) que incluya variables como en el caso anterior.

Sigo usando mi propio proyecto, pues uso justamente Express, link [Try-2-Learn](https://github.com/jesusgn90/Try-2-Learn)

###Ejercicio 4: Crear pruebas para las diferentes rutas de la aplicación.

Mi test inicial es para comprobar arrancado de servidor y manejo de rutas, podemos verlo [aquí](https://github.com/jesusgn90/Try-2-Learn/tree/master/app/test)

###Ejercicio 5: Instalar y echar a andar tu primera aplicación en Heroku

Mostraré como lo he realizado en el proyecto propio de las prácticas de la asignatura. El proyecto propio es [Try-2-Learn](https://github.com/jesusgn90/Try-2-Learn), pues dentro esta el directorio "app", que es la aplicación nodejs, en el he creado otro repositorio para Heroku. 

    Instalamos [Heroku Toolbelt](https://toolbelt.heroku.com/)
    $ heroku login
    $ cd app
    $ git init
    $ heroku apps:create try-2-learn

Ya tenemos creada una aplicación en Heroku llamada try-2-learn, ahora vamos a añadir todo el subdirectorio "app" al nuevo repositorio que creamos anteriormente.

    $ heroku git:remote -a try-2-learn
    $ git add .
    $ git commit -am "prueba"
    $ git push heroku master

De esta forma hemos actualizado indicando a heroku de que repositorio debe coger el código y finalmente lo hemos desplegado. Para arrancar la aplicación para verla en un navegador ejecutamos:

    $ heroku open

Podemos verla en [https://try-2-learn.herokuapp.com/](https://try-2-learn.herokuapp.com/)

###Ejercicio 6: Usar como base la aplicación de ejemplo de heroku y combinarla con la aplicación que se ha creado anteriormente. Probarla de forma local con foreman. Al final de cada modificación, los tests tendrán que funcionar correctamente; cuando se pasen los tests, se puede volver a desplegar en heroku.
    
He seguido usando mi proyecto propio de las prácticas, como uso NodeJS voy a usar [Node-Foreman](https://github.com/strongloop/node-foreman). Lo instalamos de forma global:

    $ npm install -g foreman

Tenemos un Procfile con:

    web: npm start

A continuación solo debemos ejecutar:

    $ nf start web=1

Para ver más parámetros y sus finalidades sobre el comando "nf" podemos visitar [https://github.com/strongloop/node-foreman](https://github.com/strongloop/node-foreman) o bien ejecutar:

    $ nf --help

