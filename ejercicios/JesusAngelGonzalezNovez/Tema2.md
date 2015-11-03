# Tema 2
### Ejercicio 1: Instalar alguno de los entornos virtuales de node.js (o de cualquier otro lenguaje con el que se esté familiarizado) y, con ellos, instalar la última versión existente, la versión minor más actual de la 4.x y lo mismo para la 0.11 o alguna impar (de desarrollo).

Mostraré el uso de [virtualenv](https://virtualenv.pypa.io/en/latest/), herramienta para crear entornos aislados para Python.

Para instalarlo debemos primero instalar algunos paquetes:

    sudo apt-get install python-pip python-dev build-essential 

A continuación, y a través de [pip](https://pypi.python.org/pypi/pip), instalaremos virtualenv:

    sudo pip install virtualenv 

Podemos crear un entorno para Python 2.7:

    virtualenv entornov2

O por ejemplo para Python 3 en concreto, para ello debemos específicar el intérprete que deseamos usar:

    virtualenv -p /usr/bin/python3 entornov3

Para activar/desactivar el entorno simplemente debemos ejecutar:

    source entornov2/bin/activate
    (entornov2)deactivate

    source entornov3/bin/activate
    (entornov3)deactivate

entornov2 y entornov3 son los directorios raíz generados al crear el entorno, del cual cuelgan los directorios bin, include y lib de dicho entorno virtual. Estos directorios contienen los binarios y librerias necesarios para utilizar las correspondientes versiones de Python elegidas.

### Ejercicio 2: Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.

Se ha usado Django para crear la apliacación web, puede verse el repositorio [aquí](https://github.com/jesusgn90/ejercicio2_IV/)

###Ejercicio 3: Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?

Primeramente se ha usado:

    source entornov3/bin/activate
    (entornov3) pip install django

En este caso tenemos un entorno con:

    Python 3
    Django 1.8.5

No ha funcionado como se esperaba.

A continuación se ha usado:

    source entornov2/bin/activate
    (entornov2) pip install django

Ahora tenemos un entorno con:

    Python 2.7
    Django 1.8.5

Ahora si que ha funcionado correctamente, por tanto vemos que mi aplicación no está 
preparada para correr bajo Python 3.

###Ejercicio4: Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente.

Dado que mi aplicación esta realizada usando Django, se basa en Python, por tanto no se usa un package.json, no obstante podemos hacer uso de un fichero llamado requirements.txt que es lo que normalmente se usa. En este fichero se describen las dependencias del proyecto. Existen herramientas como "freeze" para generar la lista de dependencias.

    pip freeze > requirements.txt
    pip install -r requirements.txt

Como ejemplo realizaremos un "pip freeze" en el virtualenv de la aplicación:

    alabaster==0.7.6
    Babel==2.1.1
    Django==1.8.5
    docutils==0.12
    Jinja2==2.8
    MarkupSafe==0.23
    Pygments==2.0.2
    pytz==2015.7
    six==1.10.0
    snowballstemmer==1.2.0
    Sphinx==1.3.1
    sphinx-rtd-theme==0.1.9
    wheel==0.24.0

Excepto Django y wheel las demás dependencias viene a raíz de Sphinx, pero para usar la aplicación no es necesario Spinx pues lo usamos sólo para documentarla.

###Ejercicio 5: Automatizar con grunt y docco (o algún otro sistema) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.

Se va a documentar la app del ejercicio 2 de este mismo tema, dicha app está hecha con Django por tanto debemos usar Sphinx para documentarla, para instalarla:

    pip install sphinx

Una vez instalado nos situamos en el directorio del proyecto y comenzamos a usar Sphinx en su modo "quickstart" para responder una serie de preguntas:

    sphinx-quickstart

Una vez terminado y según como respondamos se nos deberían crear dos nuevos directorios, "build" y "source" y un Makefile para generar los ficheros html, podemos moverlos a otro directorio si queremos. Ahora debemos decirle que nos genere la documentación para la app o las apps que hemos creado dentro del proyecto Django, en mi caso sólo he creado una llamada "empresas", usaremos el siguiente comando:

    sphinx-apidoc empresas/ source/

Ahora ya tenemos autogenerados los ficheros necesarios para incluirlos en la documentación. A continuación solo nos queda generar en formato html toda la documentación:

    make html

Ahora encontraremos dentro de "build" la web generada para la documentación.

Para más información sobre Sphinx y la sintaxis de comentarios para Python puede visitarse su [web](http://sphinx-doc.org/) y también la sección de documentación de Django [aquí](https://docs.djangoproject.com/en/1.8/internals/contributing/writing-documentation/)

###Ejercicio 6: Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga (vamos, lo que viene siendo TDD). Ejercicio 7: Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante.
Cuando usamos Django y necesitamos hacer uso de test unitarios se utiliza el fichero app/tests.py, en mi caso crearé un test para comprobar que todas las urls están correctamente mapeadas a sus vistas, para ello crearé el siguiente test en el fichero empresas/tests.py:

    from django.test import TestCase
    from django.core.urlresolvers import resolve
    from empresas.models import Empresa
    from empresas.views import *
    # Create your tests here.
    class EmpresaTest(TestCase):
        def test_urls(self):
            found = resolve('/')
            self.assertEqual(found.func, index)
            found = resolve('/todo/')
            self.assertEqual(found.func, todo)
            found = resolve('/ranking/')
            self.assertEqual(found.func, ranking)

De esta forma aseguramos que las urls '/', '/todo/' y '/ranking/' usan sus correspondientes vistas, de lo contrario dará una excepción. Para probar el test ejecutamos:

    python manage.py test

