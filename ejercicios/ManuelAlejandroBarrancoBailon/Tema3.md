#Tema 3

##Ejercicios

###Ejercicio 1
**Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.**
Me he dado de alta en el servicio Heroku, habiendo elegido Python como mi lenguaje de desarrollo. Una imagen del panel de control inicial de Heroku se puede ver en la siguiente imagen:
![Portada Heroku](http://i1016.photobucket.com/albums/af281/raperaco/heroku_zps7odaxvku.png)

###Ejercicio 2
**Crear una aplicación en OpenShift y dentro de ella instalar WordPress.**
Lo primero es registrarse en OpenShift.
![OpenShift](http://i1016.photobucket.com/albums/af281/raperaco/openshift_zpspmzp90xg.png)
A continuación marcamos la opción de *Crear la primera aplicación*, y elegimos entre las disponibles, **Wordpress**.
![Install Wordpress](http://i1016.photobucket.com/albums/af281/raperaco/installAppOpenShift_zpshwxsz2r0.png)
Tras especificar el nombre de nuestro sitio, e instalar la aplicación, nos vamos en un navegador a la URL que hemos especificado en Wordpress y comienza la instalación de Wordpress. El primer paso será elegir el idioma, y a continuación el resto de ajustes:
![installWordpress1](http://i1016.photobucket.com/albums/af281/raperaco/wordpress2_zpsedmusxjz.png)

Tras finalizar la instalación, podemos ver nuestro blog en la URL que indicamos en la instalación de Wordpress (en mi caso *phpwp-mabarrbai.rhcloud.com*).
![blogWordpress](http://i1016.photobucket.com/albums/af281/raperaco/blogWordpress_zpsse5qcuxm.png)


###Ejercicio 3
**Realizar una app en express (o el lenguaje y marco elegido) que incluya variables como en el caso anterior.**
Ya que estoy trabajando con Python y Django, he optado por usar el framework [**Django REST**](http://www.django-rest-framework.org/).
Siguiendo el [tutorial](http://www.django-rest-framework.org/tutorial/1-serialization/) de la página oficial, voy a comentar los pasos más importantes realizados:
* Instalar el framework con *pip install djangorestframework*
* En el fichero *settings.py* de nuestro proyecto Django, añadir la aplicación rest_framework a *INSTALLED_APPS.
* Creamos nuestro archivo **serializers.py** dentro de la carpeta de nuestra aplicación. En este fichero creamos la clase serializadora *PenhaSerializer*.![clase PenhaSerializer](http://i1016.photobucket.com/albums/af281/raperaco/claseSerializadora_zpsd9aqg3ky.png)
* Ahora probamos nuestra clase serializadora. Para ello desde el terminal de Python (*python manage.py shell*):
![Datos Serializados terminal](http://i1016.photobucket.com/albums/af281/raperaco/serializador_shell_python_zpsnz3ocqq2.png)
Tambien podemos mostrar los datos en formato JSON:
![JSON](http://i1016.photobucket.com/albums/af281/raperaco/jsonRenderer_zpsfio92wmv.png)
* Ahora vamos a crear una vista que devuelva los datos en formato JSON usando nuestra clase serializadora. Creamos una clase que contendrá las distintas vistas.
![Clase JSONResponse](http://i1016.photobucket.com/albums/af281/raperaco/JSONResponse_zpsu0d1xssk.png)
Creamos una vista que servirá para listar las peñas.
![Listar Penhas JSON](http://i1016.photobucket.com/albums/af281/raperaco/listarPenhasJSON_zpskve1qwvz.png)
Y otra vista para recuperar, actualizar o borrar peñas.
![ActualizarPenhasJSON](http://i1016.photobucket.com/albums/af281/raperaco/actualizarPenhasJSON_zpsza3cuwyu.png)
* Añadimos las URLs al fichero *urls.py* de nuestra aplicación.
* ![URLs REST](http://i1016.photobucket.com/albums/af281/raperaco/urlsREST_zpsatk5p6rg.png)
* Finalmente, con el servidor de desarrollo en ejecución podemos obtener una lista de todas las peñas registradas o una peña en concreto identificándola con su ID(primary key).
	* ![listarPenhasJSON](http://i1016.photobucket.com/albums/af281/raperaco/JSONlistarPenhas_zpsrfeumxlh.png)
	* ![detallePenhaJSON](http://i1016.photobucket.com/albums/af281/raperaco/detallePenhaJSON_zpsunwvzpzk.png)

###Ejercicio 4
**Crear pruebas para las diferentes rutas de la aplicación.**
He realizado las pruebas sobre las rutas */penhas/* y sobre */penhas/1/* y */penhas/2/*. Las pruebas realizadas consisten en realizar peticiones a esas rutas correctamente, es decir que se recibe el **código HTTP 200** y también se comprueba que el tipo de contenido recibido sea **JSON**.
A continuación se puede ver el código de los tests (en el fichero *tests.py*) y cómo se superan los tests:
![cabecerasTests](http://i1016.photobucket.com/albums/af281/raperaco/importTests_zpslbwbyynb.png)
![testsJSON](http://i1016.photobucket.com/albums/af281/raperaco/testsJSON_zps3qzsduy1.png)
![TestsOK](http://i1016.photobucket.com/albums/af281/raperaco/testsOK_zpsbracoy94.png)

###Ejercicio 5
**Instalar y echar a andar tu primera aplicación en Heroku.**
Siguiendo el [tutorial](https://devcenter.heroku.com/articles/getting-started-with-django) oficial de Heroku para despliegue de aplicaciones Django, realizamos los siguientes pasos:
* Descargamos el cinturón de herramientas de Heroku con la orden:
~~~
wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
~~~
* Desde el terminal, nos logueamos en Heroku con la orden:
~~~
heroku login
~~~
* Creamos un fichero **Procfile** en la carpeta raíz de nuestro proyecto, en el que indicamos los pasos necesarios para desplegar la aplicación web en Heroku.
* Actualizamos el fichero de dependencias de nuestra aplicación.
~~~
pip freeze > requirements.txt
~~~
(Tener en cuenta que introduce como dependencia, la aplicación Django en sí, en mi caso TusPachangas. Eliminarla del fichero de requisitos)
* Modificamos el fichero *settings.py* para indicarle la base de datos de Heroku a usar. Por tanto, tenemos que añadir el siguiente código:
~~~
import dj_database_url
SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')
ALLOWED_HOSTS = ['*']
ON_HEROKU = os.environ.get('PORT')
if ON_HEROKU:
    DATABASE_URL='postgres://fhtyiztxysbrdn:WI7TLSaRrLYxotdwfryDYIQwn2@ec2-54-225-192-128.compute-1.amazonaws.com:5432/demv8ll9orcqeg'
    DATABASES = {'default': dj_database_url.config(default=DATABASE_URL)}
~~~
Con esto lo que le estamos indicando es que cuando se encuentre en Heroku, que use la base de datos de la URL especificada (la obtenemos desde el panel de control de Heroku, cada una diferente para un usuario, obviamente).
* En el fichero *wsgi.py*, añadir el siguiente código:
~~~
from django.core.wsgi import get_wsgi_application
from dj_static import Cling
application = Cling(get_wsgi_application())
~~~
* Preparamos todos los ficheros modificados para subirlos a un repositorio GitHub.
~~~
git init
git add .
git commit -m "my django app"
~~~
* Creamos un nuevo repositorio git para subir la aplicación a Heroku.
~~~
heroku create
~~~
* Subimos nuestra aplicación al nuevo repositorio creado.
~~~
git push heroku master
~~~
* Realizamos los cambios sobre la base de datos Heroku, para que tengan efecto.
~~~
heroku run python manage.py makemigrations
heroku run python manage.py migrate
heroku run python manage.py createsuperuser
~~~
* Indicamos que nos abra nuestra app desplegada en Heroku en un navegador.
~~~
heroku open
~~~
* Vemos nuestra app desplegada en Heroku:
* /
![heroku](http://i1016.photobucket.com/albums/af281/raperaco/heroku_zpsgojniwgh.png)
* /penhas/
![heroku1](http://i1016.photobucket.com/albums/af281/raperaco/heroku1_zpswwx1rjgb.png)
* /penhas/2/
![heroku2](http://i1016.photobucket.com/albums/af281/raperaco/heroku2_zpsyw5ew7gr.png)
Para cambiar el nombre de nuestra aplicación en Heroku, como en las imágenes anteriores, lo podemos cambiar desde el panel de ajustes de nuestra app en la web de Heroku. Tras cambiarlo, hay que actualizar el nombre del repositorio remoto de nuestra aplicación con el nuevo nombre, para ello hay que ejecutar(en mi caso):
~~~
git remote rm heroku
heroku git:remote -a tuspachangas
~~~

###Ejercicio 6
**Usar como base la aplicación de ejemplo de heroku y combinarla con la aplicación en node que se ha creado anteriormente. Probarla de forma local con foreman. Al final de cada modificación, los tests tendrán que funcionar correctamente; cuando se pasen los tests, se puede volver a desplegar en heroku.**
Como yo he usado mi aplicación propia tanto en local como en remoto en Heroku, uso aquí directamente mi aplicación.
Para ello, instalo foreman y lanzo mi aplicación en local con:
~~~
sudo gem install foreman
foreman start web
~~~
![foreman1](http://i1016.photobucket.com/albums/af281/raperaco/ej6_zpstlxh0rbo.png)
En el navegador podemos verla en el puerto 5000:
![foreman2](http://i1016.photobucket.com/albums/af281/raperaco/ej6_1_zpskpfaejmr.png)

De igual forma, se puede ejecutar en local con:
~~~
heroku local
~~~

###Ejercicio 7
**Haz alguna modificación a tu aplicación en node.js para Heroku, sin olvidar añadir los tests para la nueva funcionalidad, y configura el despliegue automático a Heroku usando Snap CI o alguno de los otros servicios, como Codeship, mencionados en StackOverflow**
1. En la pestaña *Login* de la esquina superior derecha de [SnapCI](https://snap-ci.com) tras pulsar sobre ella, automáticamente detecta que tengo una sesión abierta en GitHub y me solicita conectarla con GitHub.
2. Tras dar permiso a la conexión de SnapCI con GitHub, en una nueva pantalla se le indica que repositorio sincronizar en SnapCI. En mi caso, selecciono el repositorio de mi aplicación TusPachangas.
3. Conectamos nuestro Heroku con nuestro GitHub y nuestro repositorio de la aplicación web desde la pestaña Deploy de Heroku.
4. A continuación indicamos el despliegue automático tras hacer push al repositorio de GitHub.
![Despliegue automático](http://i1016.photobucket.com/albums/af281/raperaco/despliegueAutomatico_zpswtewtlyz.png)
5. Tras hacer un push al repositorio git de nuestra aplicación, vemos cómo automáticamente lo detecta Travis (hito anterior), SnapCI y Heroku.
![SnapCI](http://i1016.photobucket.com/albums/af281/raperaco/despl_auto_zpst6ds55uf.png)
![Heroku](http://i1016.photobucket.com/albums/af281/raperaco/despl_auto1_zps8lzbwazw.png)
6. Ahora vamos a indicarle que tambíen realice los tests indicados en tests.py mediante la orden *make test*. 
Para ello, editamos la *pipeline* y le establecemos un nombre, le indicamos que versiones de Python y PostgreSQL usamos en Heroku y los comandos a realizar para los tests.
![PipelineSnapCI](http://i1016.photobucket.com/albums/af281/raperaco/pipelineSNAPCI_zpsjws39a6a.png)
7. Vemos como los tests son superados.
![testsSnapCI](http://i1016.photobucket.com/albums/af281/raperaco/testsSnapCI_zps4qhrwu4x.png)
8. Obtenemos el badge de SnapCI y lo pegamos en nuestro README de nuestra app.
[![Build Status](https://snap-ci.com/mabarrbai/TusPachangas/branch/master/build_image)](https://snap-ci.com/mabarrbai/TusPachangas/branch/master)

###Ejercicio 8
**Preparar la aplicación con la que se ha venido trabajando hasta este momento para ejecutarse en un PaaS, el que se haya elegido.**
Como he venido trabajando con mi aplicación propia en los anteriores ejercicios, por tanto ya tengo mi aplicación desplegada en Heroku.
[![Deploy to Heroku TusPachangas](http://blog.openplans.org/wp-content/uploads/2014/12/Screen-Shot-2014-12-03-at-10.47.32-PM.png)](https://tuspachangas.herokuapp.com/)
