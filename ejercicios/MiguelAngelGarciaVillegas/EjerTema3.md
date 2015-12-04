# Asignatura: IV Grupo de Practicas Miercoles 8:30h a 10:30h
## Miguel Ángel García Villegas

# Ejercicios Tema 3

## Ejercicio 1.
### Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.

El servicio que voy a utilizar para éste ejercicio es [OpenShift](https://www.openshift.com).

Una vez accedemos a la web, de [OpenShift](https://www.openshift.com) para registrarnos debemos pulsar en "***Sign up for free***" a continuación debemos rellenar  el siguiente formulario:

![Formulario de Registro](https://www.dropbox.com/s/w1uirhpt8zhdxpg/Ejer1%2001.png?dl=1)
Figura 1 Ejercicio 1

Una vez aceptado el formulario, tendremos que verificarlo a través de nuestro correo. Una vez verificado [OpenShift](https://www.openshift.com) nos da la bienvenida

![Bienvenida](https://www.dropbox.com/s/lu8b1wqk0ldfn6v/Ejer1%2002.png?dl=1)
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

![Configuración Aplicación WordPress 4](https://www.dropbox.com/s/avvahnz69vjaaom/Ejer2%2001.png?dl=1)
Figura 1 Ejercicio 2

Y a continuación le damos al botón `Create Application`.
Al rato, nos preguntará que si vamos o no a cambiar el código de la aplicación, nosotros por ahora le decimos que no y autmáticamente nos llevará a la siguiente ventana.

![Creado php-magv.rhcloud.com](https://www.dropbox.com/s/k1mfzwnnecgymlb/Ejer2%2002.png?dl=1)
Figura 2 Ejercicio 2

Una vez creado, le pinchamos en el enlace `php-magv.rhcloud.com`
y nos lleva a configurar WordPress, al siguiente enlace `http://php-magv.rhcloud.com/wp-admin/install.php` para configurar el idioma que queremos en WordPress, seleccionamos Español y le damos a continuar.

A continuación nos pide que completemos la información siguiente:

- Título del sitio
- Nombre de usuario
- Contraseña
- Tu correo electrónico
- Privacidad

![Información a Cumplimentar](https://www.dropbox.com/s/ptyjbgue5kayqxl/Ejer2%2003.png?dl=1)
Figura 3 Ejercicio 2

Una vez completada dicha información, pulsamos el botón `Instalar WordPress`

Seguidamente nos sale un mensaje, de que WordPress se ha instalado correctamente, mostrando nuestro nombre de usuario y contraseña, más el botón de acceder.

Pulsamos en acceder y ya está listo. Ya podemos configurar nuestra app WordPress.

![Todo listo](https://www.dropbox.com/s/ajjxff263qn48it/Ejer2%2004.png?dl=1)
Figura 4 Ejercicio 2

Podemos visitar nuestro sitio pinchando aquí [aquí](http://php-magv.rhcloud.com/).

## Ejercicio 3
### Realizar una app en express (o el lenguaje y marco elegido) que incluya variables como en el caso anterior.

He creado un app en Flask sencilla con dos rutas.
Siguiendo esta web y este tutorial. [Flask](http://flask.pocoo.org/)

appPrueba.py

    # -*- coding: utf-8 -*-
    import os

    from flask import Flask
    from flask import request

    app = Flask(__name__)

    #/hello
    @app.route('/')
    def hello():
        return 'Bienvenido a la pagina inicial'

    @app.route('/test2')
    def test2():
        return 'Realizando un segundo test'

    if __name__ == '__main__':
        app.debug = True
        # Enlazar con el puerto si esta definido, si no por defecto 5000.
        port = int(os.environ.get('PORT', 5000))
        app.run(host = '0.0.0.0', port = port)  # 0.0.0.0 para permitir conexiones desde cualquier sitio. Ojo, peligroso en modo debug

## Ejercicio 4
### Crear pruebas para las diferentes rutas de la aplicación.

He realizado los diferentes test a la app creada antes, siguiendo las indicaciones propias de las web de Flask para hacer test. [Test en Flask](http://flask.pocoo.org/docs/0.10/testing/)

Mi test.py y los test que he realizado son los siguientes.

    import os
    import appPrueba
    import unittest
    import tempfile

    class appPruebaTestCase(unittest.TestCase):

        def setUp(self):
            self.db_fd, appPrueba.app.config['DATABASE'] = tempfile.mkstemp()
            appPrueba.app.config['TESTING'] = True
            self.app = appPrueba.app.test_client()
            #appPrueba.init_db()

        def tearDown(self):
            os.close(self.db_fd)
            os.unlink(appPrueba.app.config['DATABASE'])

        def test_raiz(self):
            rv = self.app.get('/')
            assert 'Bienvenido a la pagina inicial' in rv.data

        def test_test2(self):
        	rv = self.app.get('/test2')
            assert 'Realizando un segundo test' in rv.data



    if __name__ == '__main__':
        unittest.main()

El resultado de las pruebas es el siguiente.

![Resultado Test](https://www.dropbox.com/s/fp7x3b3fhgykiqp/Figura%204.png?dl=1)
Figura 4.1 Resultado Test





# Ejercicio 5
### Instalar y echar a andar tu primera aplicación en Heroku.

**Python en Heroku** [Tutorial Heroku](https://devcenter.heroku.com/articles/getting-started-with-python#introduction).

### Requisitos previos

  - Una cuenta en [Heroku](https://id.heroku.com/login)

  ![Bienvenido a Heroku](https://www.dropbox.com/s/ny4tj0ing36juwx/Captura%20de%20pantalla%20de%202015-11-20%2015%3A52%3A48.png?dl=1)
  Figura 5.1 Bienvenido a Heroku
  - [Python](http://docs.python-guide.org/en/latest/starting/install/linux/) previamente instalado, en nuestro caso linux.
  - **Setuptools** y **Pip**
  - Instalar [VirtualenV](https://github.com/kennethreitz/python-guide/blob/master/docs/dev/virtualenvs.rst) mediante `pip install virtualenv`
  - [Postgres](https://devcenter.heroku.com/articles/heroku-postgresql#local-setup) instalados, si se ejecuta la aplicación a nivel local

### Configuración

Vamos a instalar [Heroku Toolbelt](https://toolbelt.heroku.com/install-ubuntu.sh), que nos proporciona acceso a Heroku Command Line Interface (CLI), que se puede utilizar para gestionar y ampliar sus aplicaciones y complementos, también ayuda en la gestión de las aplicaciones en forma local.

![Instalar Heroku Toolbelt](https://www.dropbox.com/s/pn6xauwpoemvxpd/05.%2001.png?dl=1)

Figura 5.2 Una vez instalado Heroku Toolbelt ya podemos utilizar el comando heroku desde la consola.

Ejecutamos heroku en la consola para que se instalen también las demás dependencias.

Para autentificarnos utilizamos el comando `heroku login` y nos pide:
- Email
- Contraseña

![Autentificación Heroku](https://www.dropbox.com/s/2ornpj5oxkyzf5n/05.02.png?dl=1)

Figura 5.3 Autentificación Heroku

Si estamos usando proxy, pulsa [aquí](https://devcenter.heroku.com/articles/using-the-cli#using-an-http-proxy) para ver lo que debes hacer.

### Preparando la aplicación
Vamos a clonar una [aplicación de ejemplo](https://github.com/heroku/python-getting-started), que se encuentra en un repositorio GitHub.

Para ello ejecutamos:

    git clone https://github.com/heroku/python-getting-started.git

Y seguidamente nos vamos al directorio, python-getting-started

    cd python-getting-started

Buscamos en dicho directorio el archivo [requeriment.txt](https://github.com/heroku/python-getting-started/blob/master/requirements.txt) el cual es utilizado por **Pip**.

### Implementar la aplicación

Crear una aplicación en Heroku:

    $ heroku create

![Clonar Aplicación y Crear aplicación Heroku](https://www.dropbox.com/s/y9347yqhcbk4u11/05.04.png?dl=1)

Figura 5.4 Clonar Aplicación y Crear aplicación Heroku

Cuando se crea una aplicación, también se crea un control remoto git (llamado heroku) y se asocia con su repositorio git local.
Heroku genera un nombre aleatorio (en este caso `morning-anchorage-5665`) para su aplicación, o se puede pasar un parámetro para especificar su propio nombre de la aplicación.

Ahora ejecutamos el comando `git push heroku master`

[Desplegar con Git](https://devcenter.heroku.com/articles/git).

La aplicación se despliega y hay que asegurarnos de que está ejecutando al menos una instancia de la aplicación, ejecutando en el terminal `heroku ps:scale web=1` y a continuación podemos visitar la aplicación en la URL generada por el nombre de la aplicación o ejecutando `heroku open`:

![Heroku ps:scale web=1 y Heroku open](https://www.dropbox.com/s/foy94yq447lnpxd/05.06.png?dl=1)

Figura 5.5 Heroku ps:scale web=1 y Heroku open

Visitando la Url o ejecutando `heroku open` deberemos ver:

![Resultado Morning Anchorage 5665](https://www.dropbox.com/s/7jm4h70jhb61iou/05.07.png?dl=1)

Figura 5.6 Resultado Morning Anchorage 5665


Podemos visitar la app, [aquí](https://morning-anchorage-5665.herokuapp.com/)


# Ejercicio 6
### Usar como base la aplicación de ejemplo de heroku y combinarla con la aplicación en node que se ha creado anteriormente. Probarla de forma local con foreman. Al final de cada modificación, los tests tendrán que funcionar correctamente; cuando se pasen los tests, se puede volver a desplegar en heroku.
### Como en todos los ejemplos anteriores, se puede cambiar “node” y “heroku” por la herramienta que se haya elegido.

He subido mi pequeña aplicación en flask, en Heroku y aquí dejo el enlace para poder verlo.
https://fast-plateau-1122.herokuapp.com/

# Ejercicio 7
### Haz alguna modificación a tu aplicación en node.js para Heroku, sin olvidar añadir los tests para la nueva funcionalidad, y configura el despliegue automático a Heroku usando Snap CI o alguno de los otros servicios, como Codeship, mencionados en StackOverflow

# Ejercicio 8
### Preparar la aplicación con la que se ha venido trabajando hasta este momento para ejecutarse en un PaaS, el que se haya elegido.
