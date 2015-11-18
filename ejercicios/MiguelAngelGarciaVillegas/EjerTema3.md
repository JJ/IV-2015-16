# Asignatura: IV Grupo de Practicas Miercoles 8:30h a 10:30h
## Miguel Ángel García Villegas

# Ejercicios Tema 3

## Ejercicio 1.
### Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.

El servicio que voy a utilizar para éste ejercicio es [OpenShift](https://www.openshift.com).

Una vez accedemos a la web, de [OpenShift](https://www.openshift.com) para registrarnos debemos pulsar en "***Sign up for free***" a continuación debemos rellenar  el siguiente formulario:

![Formulario de Registro](https://mega.nz/#!ZRdykTYa)
Figura 1 Ejercicio 1

Una vez aceptado el formulario, tendremos que verificarlo a través de nuestro correo. Una vez verificado [OpenShift](https://www.openshift.com) nos da la bienvenida

![Bienvenida](https://www.dropbox.com/s/lu8b1wqk0ldfn6v/Ejer1%2002.png?dl=0)
Figura 2 Ejercicio 1

## Ejercicio 2
### Crear una aplicación en OpenShift y dentro de ella instalar WordPress.

Cuando ya somos usuarios de [OpenShift](https://www.openshift.com), una vez logueados, nos sale la siguiente ventana de bienvenida, mostrado en en el ejercicio anterior. `Figura 2`.

Pulsamos donde pone `Create your first application now` y nos lleva a una nueva página la cual nos muestra la cantidad de aplicaciones que nos da la posibilidad de elegir, subdivididas en diferentes grupos:
- Instant App
- xPaaS
- Java
- Php
- Ruby
- Python
- Y otros tipos, como por ejemplo: **Nodejs**, **Perl**...

Nosotros para llevar a cabo éste ejercicio, debemos seleccionar dentro del apartado **Instant App**, `WordPress 4`

A continuación debemos de configurar nuestra aplicación, también asignamos la url pública a nuestra aplicación

![Configuración Aplicación WordPress 4](https://www.dropbox.com/s/avvahnz69vjaaom/Ejer2%2001.png?dl=0)
Figura 1 Ejercicio 2

Y a continuación le damos al botón `Create Application`.
Al rato, nos preguntará que si vamos o no a cambiar el código de la aplicación, nosotros por ahora le decimos que no y autmáticamente nos llevará a la siguiente ventana.

![Creado php-magv.rhcloud.com](https://www.dropbox.com/s/k1mfzwnnecgymlb/Ejer2%2002.png?dl=0)
Figura 2 Ejercicio 2

Una vez creado, le pinchamos en el enlace `php-magv.rhcloud.com`
y nos lleva a configurar WordPress, al siguiente enlace `http://php-magv.rhcloud.com/wp-admin/install.php` para configurar el idioma que queremos en WordPress, seleccionamos Español y le damos a continuar.

A continuación nos pide que completemos la información siguiente:

- Título del sitio
- Nombre de usuario
- Contraseña
- Tu correo electrónico
- Privacidad

![Información a Cumplimentar](https://www.dropbox.com/s/ptyjbgue5kayqxl/Ejer2%2003.png?dl=0)
Figura 3 Ejercicio 2

Una vez completada dicha información, pulsamos el botón `Instalar WordPress`

Seguidamente nos sale un mensaje, de que WordPress se ha instalado correctamente, mostrando nuestro nombre de usuario y contraseña, más el botón de acceder.

Pulsamos en acceder y ya está listo. Ya podemos configurar nuestra app WordPress.

![Todo listo](https://www.dropbox.com/s/ajjxff263qn48it/Ejer2%2004.png?dl=0)
Figura 4 Ejercicio 2

Podemos visitar nuestro sitio pinchando aquí [aquí](http://php-magv.rhcloud.com/). 

## Ejercicio 3
### Realizar una app en express (o el lenguaje y marco elegido) que incluya variables como en el caso anterior.

## Ejercicio 4
### Crear pruebas para las diferentes rutas de la aplicación.

# Ejercicio 5
### Instalar y echar a andar tu primera aplicación en Heroku.

# Ejercicio 6
### Usar como base la aplicación de ejemplo de heroku y combinarla con la aplicación en node que se ha creado anteriormente. Probarla de forma local con foreman. Al final de cada modificación, los tests tendrán que funcionar correctamente; cuando se pasen los tests, se puede volver a desplegar en heroku.

### Como en todos los ejemplos anteriores, se puede cambiar “node” y “heroku” por la herramienta que se haya elegido.

# Ejercicio 7
### Haz alguna modificación a tu aplicación en node.js para Heroku, sin olvidar añadir los tests para la nueva funcionalidad, y configura el despliegue automático a Heroku usando Snap CI o alguno de los otros servicios, como Codeship, mencionados en StackOverflow

# Ejercicio 8
### Preparar la aplicación con la que se ha venido trabajando hasta este momento para ejecutarse en un PaaS, el que se haya elegido.
