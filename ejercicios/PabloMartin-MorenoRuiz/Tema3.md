# Ejercicio1. Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.

Me he dado de alta en Openshift y pongo a continuación una imagen que muestra el inicio de sesesión.

![registro_openshift](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Seleccioacuten_010_zpsam2jltxv.png)



# Ejercicio 2. Crear una aplicación en OpenShift y dentro de ella instalar WordPress.

En este ejercicio tenemos que crear una aplicación para wordespress dentro de openshift. Cuando accedemos los primero que veremos será el siguiente menú para configurar la infraestructuta basíca dónde desarrollmos la aplicación (le indicamos el lenguaje que 
estamos usando 

![Panel_ininical_openshift](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Seleccioacuten_005_zpspzoisbwh.png)

En la siguiente imagen podemos ver que al configurar le podemos indicar por ejemlo el nombre parcial de la url.

![nombre_url](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Seleccioacuten_006_zps76j6tjv1.png)

En la siguiente imagen podemos ver cómo nuestro proyecto ha sido correctamente creado.

![Creado](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Seleccioacuten_007_zps6myubroa.png)


# Ejercicio 5. Instalar y echar a andar tu primera aplicación en Heroku.

En este aparto he configurado y ejecutado Heroku en 2 aplicaciones: la aplicación que nos da de muestra heroku y una que sólo nos muestra el típico "funcionó" de Django.

Lo he realizado esta forma porque con la primera compruebo cómo subir una aplicación a heroku sin preocuparme que el código esté bien, con la segunda ya tengo que modificar varios archvios y posteriormente explicado en el ejercicio 8 he introducido la de calificación de empresas para comprobar cómo introducir una con una base de datos.

- Lo primero que hay que hacer es crearse una cuenta en heroku
- una vez hecho esto hay que descargarse la herramientas de heroku introduciendo lo siguiente: wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
- Hay que tener en cuenta que hacen falta más herramiento que ya instalaremos cómo son forema y ruby. En mi caso tuve un herro bastante grave con la instalación de las versiones de ruby al final instale apt-get install ruby1.9.1-full 
- Una vez realizadas todas las intalacione nos loguemaos en heroku introduciendo heroku login y dándole los datos que nos pidan.
- Ahora nos introduciremos en la carpeta de nuestra aplicación o descargamos la de muestra de heroku.

Ahora voy a explicar los pasos para subir una aplicación. Después explicare un poco la configuración de una aplicación nuestra sin Base de datos.

- Dentro de la carpeta de la aplicación introducimos heroku create, esto nos creará la aplicación en heroku y nos introduce la dirección de heroku con alias "heroku" en nuestra lista remota de git.
- Una vez hecho esto mandamos la aplicación a heroku git push heroku master
- Una vez manda iniciamos un proceso heroku ps:scale web=1
- Y ya podemos ver nuestra web en un navegador ejecutando en el terminal Heroku open (nos abre una pestaña con la aplicación).

Ahora explicaré algunas cosas que hay que configurar en la aplicación para poder enviarla y que funcione.

Si mal no recuerdo hay que modificar 3 archivos:
- Procfile hay que introducirlo y ponerle la siguiente línea web: gunicorn gettingstarted.wsgi --log-file - . Teniendo en cuenta que gettingstarted es el nombre de nuestro proyecto.
- Dentro de la carpeta de configuraciones en el archivo de wsgi hay que introducir lo siguiente:

from django.core.wsgi import get_wsgi_application

from dj_static import Cling

application = Cling(get_wsgi_application())

En el caso de no usar Cling no nos funcionarán los CSS.

- setting hay que configurarlo introduciendo los siguientes parámetros:

![configurando_setting](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Seleccioacuten_011_zpsgh5dqrko.png)

static_root nos hace falta para los fichero estaticos que se se crean al usar python manage.py collectstatic que usa heroku para ejecutarlo localmente.

En el casi del ejercicio 8 dónde uso base de datos lo realizo de una formal distinta.

Y cómo nota importante en los requirements.txt hay que eliminar distributive porque heroku ya lo tiene instalado y si se intenta volver a instalar falla.

Y otro fallo que me costó ver es no ejecutar python manage.py collectstatic antes de enviarlo pués también le hace falta para mostrar al web.

[Web de ejemplo de Heroku subida por mi](https://infinite-badlands-9357.herokuapp.com/)

[Web de funcionó básica para ir empezando](https://gentle-coast-2534.herokuapp.com/)
