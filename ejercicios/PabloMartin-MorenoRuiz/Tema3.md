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
- Hay que tener en cuenta que hacen falta más herramiento que ya instalaremos cómo son forema y ruby. En mi caso tuve un error bastante grave con la instalación de las versiones de ruby al final instale apt-get install ruby1.9.1-full 
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


# Ejercicio 6. Usar como base la aplicación de ejemplo de heroku y combinarla con la aplicación en node que se ha creado anteriormente. Probarla de forma local con foreman. Al final de cada modificación, los tests tendrán que funcionar correctamente; cuando se pasen los tests, se puede volver a desplegar en heroku.

foreman start web nos permite probar nuestra web cómo si estuviera siendo ejecutada en heroku. Veamos, según he comprobado por su funcionamiento se ejecuta localmente (es decir, usa localhost en la base de datos) lo que ocurre es que ejecuta Procfile y lanza por hay la aplicación (wsgi). Así podemos comprobar que esa parte la tenemos bien configurada pero aun así estamos usando la herramienta localmente (ip privada) y al subirlo a heroku (se puede ver mejor en el ejercicio 8) tendremos problemas con la base de datos.

Ejemplo de uso:

![foreman](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Seleccioacuten_012_zps6ps9xnmw.png)

# Ejercicio 7. Haz alguna modificación a tu aplicación en node.js para Heroku, sin olvidar añadir los tests para la nueva funcionalidad, y configura el despliegue automático a Heroku usando Snap CI

He configurado, probado y subido la aplicación de las calificaciones con base de datos. Lo explico en mayor profundidad en el ejercicio 8, aquí explicaré la configuración de snap-ci y la modificación realizada en la práctica.

Introduciendonos en Snap-ci podemos ver la lista de nuestros proyectos a los que queremos hacerle cauces (pipelines). En este caso se ha diseñado para que el código una vez introducido en github y pasado travis nos lo mande a heroku.

Introducimos el repositorio que queramos en el pipeline, seleccionamos heroku de entre los Deploy y uan vez hecho esto lo configuramos cómo se muestra en la siguiente imagen:

![configuracion_heroku](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Seleccioacuten_014_zpsbwwktmhz.png)

Se ha añadido a la web la opción modificar empresas que es dónde modificamos una calificación de la empresa si la empresa ya está calificada. 

[En este repositorio se pueden ver los cambios](https://github.com/pmmre/Empresas)

[Este es un enlace a la web ejecutándolo](https://salty-reaches-8826.herokuapp.com/)

# Ejercicio 8. Preparar la aplicación con la que se ha venido trabajando hasta este momento para ejecutarse en un PaaS, el que se haya elegido.

En este caso he subido la aplicación de calificar empresas en la que venimos trabajando en los ejercicios anteriores. Estaba trabajando con la base de datos sqlite que viene por defecto en Django pero heroku nos pide que utilicemos postgressql. Así que lo he configurado es usando las 2 bases de datos. Sqlite la dejo para desarrollo y postgressql para heroku.

Lo he hecho modificando la configuración del settings para la base de datos por la siguiente:

ON_HEROKU = os.environ.get('ON_HEROKU')

if ON_HEROKU:

    DATABASES = {'default' : dj_database_url.config() }

else:

    DATABASES = {

        'default': {

            'ENGINE': 'django.db.backends.sqlite3',

            'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),

        }

    }


Con esto lo que hago es que si esto en un entorno que no sea heroku ejecuto sqlite3 pero si estoy en heroku utilizo postgressql cómo él me indica.

[Repositorio de la aplicación](https://github.com/pmmre/Empresas)

[Web ejecutándose](https://salty-reaches-8826.herokuapp.com/)

