# Asignatura: IV Grupo de Practicas Miercoles 8:30h a 10:30h
## Miguel Ángel García Villegas

# Ejercicios Tema 2

## Ejercicio 1.
### Instalar alguno de los entornos virtuales de node.js (o de cualquier otro lenguaje con el que se esté familiarizado) y, con ellos, instalar la última versión existente, la versión minor más actual de la 4.x y lo mismo para la 0.11 o alguna impar (de desarrollo).

###Vamos a instalar Python Virtualenv en una máquina con Ubuntu

Primero asegurarnos que tenemos instalados unos paquetes comunes de python que nos serán necesarios.
**sudo apt-get install python-software-properties**

Ahora comenzamos a ejecutar los comandos para llevar a cabo la instalación
**$ sudo apt-get install python-virtualenv**

Para crear un virtualenv simplemente se ejecuta el siguiente comando desde una terminal:
**virtualenv NombreProyecto**

Y se crea un directorio NombreProyecto, el cual contiene tres directorios más, bin/, include/ y lib/

En el directorio bin/ se encuentran los ejecutables necesarios para interactuar con el virtualenv. En include/ se encuentran algunos archivos de cabecera de C (cuya extensión es *.h) necesarios para compilar algunas librerías de Python. Y finalmente en lib/ se encuentra una copia de Python así como un directorio llamado site-packages/ en el cual se aloja el código fuente de los paquetes Python instalados en el virtualenv.

Para Activar y desactivar un proyecto python en virtualenv
Activar: Dentro de la carpeta del proyecto
**$ source bin/activate**

Desactivar:
**(NombreProyecto)$ deactivate**

Para Instalar paquetes en un proyecto python virtualenv, ejemplo django
**(NombreProyecto)$ pip install django**

###Instalación NVM
NVM, que es el que nos interesa, permite instalar múltiples versiones de Node.js y npm en un mismo ambiente, dejando cada una completamente aislada de las otras. Sí, puedes tener Node v0.4 y v0.11 instaladas en tu equipo y ejecutar una u otra según lo necesites
**sudo apt-get install -y curl build-essential libssl-dev git**

Para instalar las versiones que nos piden:
**nvm install v0.11.15**
**nvm install v4.0.0**

Para mostrar las que tienes instaladas:
**nvm ls**

## Ejercicio 2.
### Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido. Se trata de hacer una aplicación simple que se pueda hacer rápidamente con un generador de aplicaciones como los que incluyen diferentes marcos MVC. Si cuesta mucho trabajo, simplemente prepara una aplicación que puedas usar más adelante en el resto de los ejercicios.

Para éste ejercicio podríamos elegir varias opciones, como por ejemplo, node.js y express, aunque finalmente me he decidido hacerlo en python con Django. Una vez instalado python (explicado ejercicio anterior), arrancamos el virtualenv IV2 (mi proyecto). A continuación de ejecutar ése comando, para Activar y desactivar un proyecto python en virtualenv
Activar: Dentro de la carpeta del proyecto
**$ source bin/activate**

Desactivar:
**(NombreProyecto)$ deactivate**

Y una vez activado nos disponemos a instalar django en paquetes en un proyecto python virtualenv,
**(NombreProyecto)$ pip install django**

Ahora vamos a crear nuestro proyecto.
**django-admin.py startproject practicaEmpresas**

Esta instrucción creará:
 - [] manage.py
 - [] practicaEmpresas
	- [] __init__.py
	- [] settings.py
	- [] urls.py
	- [] wsgi.py

Para ver que el proyecto funciona
**python manage.py migrate**
**python manage.py runserver**

Si el puerto del servicio está ocupado, 127.0.0.1:8000 se podría cambiar
ejecutando python manage.py runserver numPuerto (ejemplo 8888)

<img src="https://photos-4.dropbox.com/t/2/AADYj_t7O0rBzqNyi7Y66OVk2pVoiS1Ykz_Fht2Vh8exfQ/12/380869476/png/32x32/1/_/1/2/imag.png/EKm7x4MDGA0gASgB/oqsCbEWUywLYlM77fBTWsW27NPwAYSTSYnFLzdTz16A?size=1024x768&size_mode=2" />

Cuando comprobamos que todo funciona correctamente, nos disponemos a crear la aplicación.
Desde la carpeta del proyecto, debemos ejecutar el comando
**python manage.py startapp appPrincipal**

Después de ésta instrucción, nuestra carpeta IV2 queda con éste contenido.

 - [] manage.py
 - [] practicaEmpresas
	- [] __init__.py
	- [] settings.py
	- [] urls.py
	- [] wsgi.py
- [] appPracticas.py
  - [] __init__.py
  - [] models.py
  - [] test.py
  - [] views.py

## Ejercicio 3.
### Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?

## Ejercicio 4.
### Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente.

## Ejercicio 5.
### Automatizar con grunt y docco (o algún otro sistema) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.

## Ejercicio 6.
### Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga (vamos, lo que viene siendo TDD).

## Ejercicio 7.
### Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante.

## Ejercicio 8.
### Ejercicio: Haced los dos primeros pasos antes de pasar al tercero.
