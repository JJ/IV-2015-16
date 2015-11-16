# Tema 3
###Ejercicio 1: Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.

Me he registrado en [Heroku](https://www.heroku.com/), he creado una aplicación de pruebas y otra con nombre propio, Try-2-Learn, usada para el proyecto propio de las prácticas de esta asignatura.

![Heroku](img/tema3-1.1.png)

###Ejercicio2: Crear una aplicación en OpenShift y dentro de ella instalar WordPress.

Nos registramos en [OpenShift](https://www.openshift.com/app/account/new), creamos nuestra primera aplicación, lo cual nos da a elegir entre varios tipos, una de ella WordPress 4, la seleccionamos:

![paso1](img/tema3-2.1.png)

Después configuramos algunos parámetros:

![paso2](img/tema3-2.2.png)

Ya tenemos la aplicación instalada:

![paso3](img/tema3-2.3.png)

Podemos visitarla [aquí](http://jesusgn90-pruebaiv15.rhcloud.com/)

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
