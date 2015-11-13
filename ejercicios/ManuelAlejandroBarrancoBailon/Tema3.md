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
* Creamos nuestro archivo **serializers.py** dentro de la carpeta de nuestra aplicación. En este fichero creamos la clase serializadora *PenhaSerializer*.[!clase PenhaSerializer](http://i1016.photobucket.com/albums/af281/raperaco/claseSerializadora_zpsd9aqg3ky.png)
* Ahora probamos nuestra clase serializadora. Para ello desde el terminal de Python (*python manage.py shell*):
[!Datos Serializados terminal](http://i1016.photobucket.com/albums/af281/raperaco/serializador_shell_python_zpsnz3ocqq2.png)
Tambien podemos mostrar los datos en formato JSON:
[!JSON](http://i1016.photobucket.com/albums/af281/raperaco/jsonRenderer_zpsfio92wmv.png)
* Ahora vamos a crear una vista que devuelva los datos en formato JSON usando nuestra clase serializadora. Creamos una clase que contendrá las distintas vistas.
[!Clase JSONResponse](http://i1016.photobucket.com/albums/af281/raperaco/JSONResponse_zpsu0d1xssk.png)
Creamos una vista que servirá para listar las peñas.
[!Listar Penhas JSON](http://i1016.photobucket.com/albums/af281/raperaco/listarPenhasJSON_zpskve1qwvz.png)
Y otra vista para recuperar, actualizar o borrar peñas.
[!ActualizarPenhasJSON](http://i1016.photobucket.com/albums/af281/raperaco/actualizarPenhasJSON_zpsza3cuwyu.png)
* Añadimos las URLs al fichero *urls.py* de nuestra aplicación.
* [!URLs REST](http://i1016.photobucket.com/albums/af281/raperaco/urlsREST_zpsatk5p6rg.png)