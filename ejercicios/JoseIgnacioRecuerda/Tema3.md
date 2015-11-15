#Ejercicios tema 3


##Ejercicio 1
###Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.

He optado por darme de alta en Herocu

![dado de alta en Heroku](https://www.dropbox.com/s/izlgum592wbyo1z/ejr1.png?dl=1)

También me he dado de alta en OpenShift para realizar el ejercicio 2

![dado de alta en OpenShift](https://www.dropbox.com/s/nowqnjqpkekf2oj/ejr1.2.png?dl=1)


##Ejercicio 2
Crear una aplicación en OpenShift y dentro de ella instalar WordPress.

En primer lugar seleccionamos crear una nueva aplicación

![crear aplicacion en OpenShift](https://www.dropbox.com/s/ddt3epsfhswr7fm/ejr2.1.png?dl=1)

Seleccionamos WordPress 4

![Seleccionamos WordPress 4](https://www.dropbox.com/s/6hn7455gtu0yyxz/ejr2.2.png?dl=1)

Escogemos una url pública, en mi caso es: http://php-ignaciorecuerda.rhcloud.com

![escogemos la url de nuestra aplicacion](https://www.dropbox.com/s/nr92axoulqt4vuo/ejr2.3.png?dl=1)

Terminamos de rellenar los datos que nos solicita la página y vemos como nos crea y lanza la aplicación

![aplicacion creada en OpenShift](https://www.dropbox.com/s/cwgrasytiiitd5e/ejr2.4.png?dl=1)

Nos metemos en la url pública y vemos que tenemos que rellenar unos datos para poder instalar WordPress

![instalar wordpress](https://www.dropbox.com/s/xwe280gezxe8r4f/ejr2.5.png?dl=1)

Una vez rellenos nos muestra que wordpress se ha instalado con éxito

![wordpress instalado con exito](https://www.dropbox.com/s/lexjunvhd6d1k8d/ejr2.6.png?dl=1)

Por último adjunto una captura de pantalla desde dentro de nuestro sitio Wordpress

![dentro de wordpress](https://www.dropbox.com/s/8hmdsb3ows3lq3x/ejr2.7.png?dl=1)




##Ejercicio 3
###Realizar una app en express (o el lenguaje y marco elegido) que incluya variables como en el caso anterior.

Para realizar este ejercicio he usado la aplicación de la porra

He necesitado usar varios comandos, algunos de ellos han sido han sido:

* npm init
* npm install express --save
* npm install -g grunt-cli
* npm install -g mocha
* npm install (para instalar todas las dependencias)
* sudo apt-get install sqlite3

A continuación he creado la base de datos con "sudo grunt creadb":

![instalado Base de datos](https://www.dropbox.com/s/zi6h2kpl4b6ksy3/ejr3.1.png?dl=1)

El siguiente paso es lanzar la aplicación con el comando "npm start" y una vez la aplicación esta ejecutandose en el puerto 5000 de localhost hacemos un put a la aplicación con los datos deseados. Los datos que yo he mandado han sido:

* competición: "Liga"
* año: "2015"
* Local: "Granada"
* Visitante: "RMadrid"

Se puede ver en la siguiente captura

![mandando datos con put](https://www.dropbox.com/s/7srj9rd1ygp7eeh/ejr3.2.png?dl=1)

Me voy a mi navegador y compruebo que los datos se han mandado correctamente al meterme en http://localhost:5000/porras que es la ruta encargada de mostrar las porras.

![instalado Base de datos](https://www.dropbox.com/s/zitef86xq753xx7/ejr3.3.png?dl=1)

Por último muestro una captura de mi terminal en la que se pueden ver las rutas a las que se ha ido llamando. En primer lugar vemos el PUT con los datos comentados anteriormente, y en segundo lugar un get de la ruta /porras que es la que nos ha mostrado en el navegador los datos.

![instalado Base de datos](https://www.dropbox.com/s/e4sgzdwq76fhj7w/ejr3.4.png?dl=1)



##Ejercicio 4
###Crear pruebas para las diferentes rutas de la aplicación.

He creado pruebas en el archivo test.js para las rutas que se tienen creadas. Este archivo se encuentra dentro del directorio test y tiene el siguiente contenido:

![contenido test/test.js](https://www.dropbox.com/s/33rvtq0utx6cfnm/ejr4.1.png?dl=1)

A continuación ejecuro el comando mocha test/test.js para ejecutar todos los test y podemos ver como los pasa correctamente.

![pasa todos los test](https://www.dropbox.com/s/xb4jel2e0go1r0u/ejr4.2.png?dl=1)


##Ejercicio 5
###Instalar y echar a andar tu primera aplicación en Heroku.

Para realizar este ejercicio he seguido los pasos del tutorial de [Heroku](https://devcenter.heroku.com/articles/getting-started-with-nodejs#introduction)

En primer lugar he instalado heroku Toolbelt

![instalado heroku Toolbelt](https://www.dropbox.com/s/z7t2wl3zlunf250/ejr5.1.png?dl=1)

Me logeo desde terminal

![Me logeo desde terminal](https://www.dropbox.com/s/omtlmu87y31lu11/ejr5.2.png?dl=1)

Nos descargamos un repositorio de git con el [enlace](https://github.com/heroku/node-js-getting-started.git) que nos proporcionan.

![Clono repositorio](https://www.dropbox.com/s/qg5wtdsy234oe39/ejr5_verdadero_1.png?dl=1)

Creamos nuestra primera aplicación en Heroku

![Creo aplicacion heroku](https://www.dropbox.com/s/5ctzzg2e4jlptmn/ejr5_verdadero_2.png?dl=1)

Hacemos un push al git remote de Heroku que se nos habia creado con el anterior comando

![subimos aplicacion a heroku](https://www.dropbox.com/s/x34q69mznx0k78n/ejr5_verdadero_3.png?dl=1)

Con todo esto la aplicación ya esta desplegada, pero nos aseguramos de que hay una instancia ejecutandose y introducimos el comando para que nos abra la aplicacion en nuestro navegador

![abrimos aplicacion](https://www.dropbox.com/s/2azc3homomasm0v/ejr5_verdadero_4.png?dl=1)

Como podemos comprobar nuestra aplicación se esta ejecutando ya en Heroku!

![abrimos aplicacion](https://www.dropbox.com/s/ibrp8fpo8cwxnjf/ejr5_verdadero_5.png?dl=1)

A continuacion me dispongo a instalar todas las dependencias que necesita la aplicacion con el comando mnpm install

![abrimos aplicacion](https://www.dropbox.com/s/h2vllvn5ttqjjz1/ejr5_verdadero_6.png?dl=1)

Por último termino el tutorial y consigo instalar más dependecias, me creo otra ruta de navegación y aprendo a subir los cambiar realizados desde terminal a Heroku


##Ejercicio 6
###Usar como base la aplicación de ejemplo de heroku y combinarla con la aplicación en node que se ha creado anteriormente. Probarla de forma local con foreman. Al final de cada modificación, los tests tendrán que funcionar correctamente; cuando se pasen los tests, se puede volver a desplegar en heroku.


Para realizar este ejercicio me he seguido apoyando del tutorial de [Heroku](https://devcenter.heroku.com/articles/getting-started-with-nodejs#introduction)

Yo este ejercicio lo he realizado usando mi propia aplicación de nodejs.

Creo una aplicación en Heroku, esta vez con el nombre que deseo, "openorder"

![creo app en heroku](https://www.dropbox.com/s/rxrpnhnj7o86nbd/ejr5.3.png?dl=1)

Una vez creada me voy a la página web de Heroku y verifico que se ha creado correctamente mi aplicación. Podemos comprobarlo en la siguiente captura de pantalla

![verifico creacion app](https://www.dropbox.com/s/s4pghabpy99zrmh/ejr5.7.png?dl=1)

Una vez verificado que se ha creado la aplicación me dispongo a enlazarlo con mi aplicación que esta ubicada en gitHub. Para ello selecciono mi aplicación en la web de Heroku, me voy al apartado "Deploy" y enlazo mi aplicación con el repositorio de GitHub, previamente autorizando a Heroku a acceder a mi cuenta de GitHub.

![enlazo mi app con repositorio gitHub](https://www.dropbox.com/s/87h6u6rg1y4d9ls/ejr5.4.png?dl=1)
![enlazo mi app con repositorio gitHub2](https://www.dropbox.com/s/qo5kk5sut7zvn79/ejr5.5.png?dl=1)

Por último, abro la aplicación con el comando "Heroku open" desde terminal 

![abro app desde terminal](https://www.dropbox.com/s/nyfsr7xlg6svhq6/ejr5.8.png?dl=1)

o abriendola desde la misma web

 ![abro aplicacion desde la web](https://www.dropbox.com/s/c8ig0bp5aimzcyr/ejr5.9.png?dl=1)

Aquí dejo una captura de la aplicacion funcionando en Heroku!

![app lanzada en Heroku](https://www.dropbox.com/s/41dgx5akn56n8qt/ejr5.6.png?dl=1)


Aquí dejo el enlace a mi apliación en Heroku por si se desea probar mi [aplicacion](https://openorder.herokuapp.com) 

Para arrancar la aplicación y probarla en local se puede hacer de dos formas, tanto usando el comando foreman (como se indica en en el guión de los ejercicios) como usando el comando "heroku local web". a continuación pongo capturas arrancando la aplicación en local con ambos comandos:

- Con el comando "foreman start web":

![lanzando local con foreman](https://www.dropbox.com/s/ca2xujget9ypeh2/ejr6.1.png?dl=1)


- Con el comando "heroku local web":

![lanzando local con Heroku](https://www.dropbox.com/s/wufxtmwi45hg01y/ejr6.2.png?dl=1)


##Ejercicio 7
###Haz alguna modificación a tu aplicación en node.js para Heroku, sin olvidar añadir los tests para la nueva funcionalidad, y configura el despliegue automático a Heroku usando Snap CI o alguno de los otros servicios, como Codeship, mencionados en StackOverflow

Para poder configurar el despliegue automático he utilizado Travis añadiendo el archivo .travis.yml. Este archivo contiene lo siguiente:

![contenido archivo .travis.yml](https://www.dropbox.com/s/plrh1o79r0149ok/ejr7.1.png?dl=1)

Nos metemos en la página de travis y seleccionamos el repositorio de la aplicación que estamos gestionando y podemos comprobar que pasa los test

![pagina de travis](https://www.dropbox.com/s/01sayme68xd900t/ejr7.2.png?dl=1)

Para finalizar nos vamos a la web de Heroku, seleccionamos dicha aplicación, y nos vamos al menú "Deploy". Dentro de este menú hay una sección que se denomina "Automatic deploys" en la que marcando la casilla que dice "Wait for CI to pass before deploy" para que la aplicación no se despliegue hasta que pase los test

![opcion heroku para que no arranque sin pasar test](https://www.dropbox.com/s/78opuxf0p155w0a/ejr7.3.png?dl=1)

##Ejercicio 8
###Preparar la aplicación con la que se ha venido trabajando hasta este momento para ejecutarse en un PaaS, el que se haya elegido.

Como se ha podido ver durante la realización de estos ejercicios he escogido el servicio en la nube paas (platform as a service) que ofrece Heroku.
A continuación dejo un enlace a mi aplicación desplegada en Heroku para que se pueda probar [aplicacion](https://openorder.herokuapp.com) 

Añado captura de pantalla de la aplicación desplegada desde la url en Heroku

![aplicacion en heroku](https://www.dropbox.com/s/z99iaqdgh0dg5ob/ejr8.1.png?dl=1)
