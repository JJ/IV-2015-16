##Ejercicio 1
Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.

Me he registrado en **Heroku** y **OpenShift** como se puede ver en las siguientes imágenes:

![Heroku](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios3/ej1_zpsrccga1zv.png)
![OpenShift](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios3/ej1_2_zps2hqi81ct.png)


##Ejercicio 2
Crear una aplicación en OpenShift y dentro de ella instalar WordPress.

Primero, pinchamos en crear una nueva aplicación.
Luego, seleccionamos WordPress 4:
![SeleccionWordpress](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios3/ej2_zpspnjnad71.png)

Y la creamos:
![Creando](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios3/ej2_2_zpst2ecrvaf.png)


[Aquí](http://php-cesar2.rhcloud.com/) está la aplicación básica en Openshift.


##Ejercicio 3
Realizar una app en express (o el lenguaje y marco elegido) que incluya variables como en el caso anterior.

He realizado la app con Flask , que es un microFramework, incluyendo varias variables en las que se sirven
diferentes contenidos. Por ejemplo, tenemos la ruta '/', que sirve la página principal, la ruta '/user/username', las rutas como '/about', '/programs', '/services'.

![app1](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios3/ej3_zpswxaot0rc.png)
![app2](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios3/ej3_2_zpsl1mppybe.png)


##Ejercicio 4
Crear pruebas para las diferentes rutas de la aplicación.

Las pruebas que hago para las diferentes rutas consisten en testear si se devuelve lo que se debería devolver.
En este caso, hago pruebas para ver si funciona el formulario de registro, compruebo si las rutas devuelve 
los html, imágenes o texto plano que deberían devolver, como se puede ver en mi archivo de tests:

![tests_1](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios3/ej4_1_zpsxmspcdch.png)
![tests_2](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios3/ej4_2_zpsmaq5zjyh.png)


##Ejercicio 5
Instalar y echar a andar tu primera aplicación en Heroku.

Para instalar nuestra primera aplicación, vamos a seguir los pasos que tenemos en la web de heroku, en concreto
para la creación de una aplicación en [python](https://devcenter.heroku.com/articles/getting-started-with-python#introduction).

Antes que nada, debemos asegurarnos que hemos creado una cuenta, que tenemos instalado Python, Setuptools, Pip, 
Virtualenv y Postgres.
Lo único de todo ésto que yo no tenía instalado era Postgres, así que lo he tenido que instalar.
Las órdenes para configurarlo e instalarlo son las siguientes:

$ export DATABASE_URL=postgres:///$(whoami)
 
$ sudo apt-get install postgresql

Ahora,debemos descargarnos heroku para nuestro sistema operativo. Una vez descargado e instalado , tenemos que 
iniciar sesion con nuestra cuenta escribiendo **heroku login**: 
![ej5_1](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios3/ej5_1_zpsahifwoaj.png)

Ahora, clonamos el repositorio de Github que nos indica:
![ej5_2](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios3/ej5_2_zpsyw5aznfa.png)

Después, tenemos que crear la aplicación en Heroku, con la orden **heroku create** :
![ej5_3](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios3/ej5_3_zpsowkczhlt.png)

Y ahora desplegamos nuestro código con **git push heroku master**:
![ej5_4](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios3/ej5_4_zpsyapqzlku.png)

Aquí, se han instalado todas las dependencias de requirements.txt y ha preparado todos los archivos 
estáticos necesarios.

La aplicación ya está desplegada. Ahora nos aseguramos de ello comprobando si tenemos al menos una instancia;para
ello ponemos en consola **heroku ps:scale web=1**:
![ej5_5](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios3/ej5_5_zpsf4zgdffr.png)

Finalmente, abrimos la aplicación con **keroku open** y comprobamos que todo ha ido bien:
![ej5_6](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios3/ej5_6_zps8kb0edyv.png)


##Ejercicio 6
Usar como base la aplicación de ejemplo de heroku y combinarla con la aplicación en node que se ha creado anteriormente.
Probarla de forma local con foreman. Al final de cada modificación, los tests tendrán que funcionar correctamente;
cuando se pasen los tests, se puede volver a desplegar en heroku.


##Ejercicio 7
Haz alguna modificación a tu aplicación en node.js para Heroku, sin olvidar añadir los tests para la nueva funcionalidad,y configura el despliegue automático a Heroku usando Snap CI o alguno de los otros servicios, como Codeship,mencionados en StackOverflow.

Para configurar el despliegue automático utilizo Travis CI, diciéndole a Heroku que no despliegue hasta pasar los test:
![ej7_1](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios3/ej6_zpst9n0fbx7.png)
![ej7_2](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios3/ej7_zpszhtkczyg.png)

Y aquí con Snap CI:
[![Build Status](https://snap-ci.com/cesar2/Proyecto-IV/branch/master/build_image)](https://snap-ci.com/cesar2/Proyecto-IV/branch/master)
![ej7_3](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios3/ej7_3_zpssdl6by1e.png)

##Ejercicio 8
Preparar la aplicación con la que se ha venido trabajando hasta este momento para ejecutarse en un PaaS, 
el que se haya elegido.

He elgido Heroku debido a su archivo Procfile.
Para mi aplicación, he tenido que crear uno para que funcionase correctamente.
Hay que seguir los mismos pasos que en el Ejercicio 5 pero con nuestro repositorio y nuestros archivos.

Aqui está el enlace de mi [aplicación](https://dry-thicket-6813.herokuapp.com/)

![ej8](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios3/ej8_zpsaj3rrbdm.png)


