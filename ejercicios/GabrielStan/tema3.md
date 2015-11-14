# Tema 3

### Ejercicio 1

**Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.**

Me he dado de alta en **Heroku**, **OpenShift** y **BlueMix**

![bluemix](https://www.dropbox.com/s/z3r5qp7urdggchu/bluemixprofile.png?dl=1)
![heroku](https://www.dropbox.com/s/ri2b7us6zt2v85s/herokuprofile.png?dl=1)
![openshift](https://www.dropbox.com/s/70j4irdjlnyrqj0/opeshiftprofile.png?dl=1)

### Ejercicio 2

**Crear una aplicación en OpenShift y dentro de ella instalar WordPress.**

Usando la guia de instalación de aplicaciones de Openshift, he creado facilmente una instalación WordPress. [Wordpress en OpenShift](http://wordpress-paasforiv.rhcloud.com/)

![wordpress](https://www.dropbox.com/s/wgy2i84akvvqg83/wordpressopenshift.png?dl=1)


### Ejercicio 3

**Realizar una app en express (o el lenguaje y marco elegido) que incluya variables como en el caso anterior.**

He incluido un par de funciones que respondan a ciertas URLs, usando Django como framework.

![rest api](https://www.dropbox.com/s/lxdry4vahskcf9s/REST.png?dl=1)

### Ejercicio 4

** Crear pruebas para las diferentes rutas de la aplicación.**

escribimos algunos tests para las urls:

![urltests](https://www.dropbox.com/s/4z8ef4y1ehvsryo/pruebas%20vista.png?dl=1)

###Ejercicio 5

**Instalar y echar a andar tu primera aplicación en Heroku.**

Primero creamos un fichero **Procfile** para la configuración de Heroku.

![procfile](https://www.dropbox.com/s/yvr0ww4bmarwu24/procfile.png?dl=1)

A continuación, creamos una aplicación en Heroku y la configuramos con el repositorio en github.

![herokuapp](https://www.dropbox.com/s/5xt9qujy83xjcvi/herokuapp.png?dl=1)

Tenemos que activar el dyno, si no lo está.

![activar dyno](https://www.dropbox.com/s/n7t4kpryj6xw597/activar%20dyno.png?dl=1)

Y podemos ver la aplicación el la url proporcionada por defecto, en este caso. También se puede indicar una url a la hora de crear la aplicación.

### Ejercicio 7

**Haz alguna modificación a tu aplicación en node.js para Heroku, sin olvidar añadir los tests para la nueva funcionalidad, y configura el despliegue automático a Heroku usando Snap CI o alguno de los otros servicios, como Codeship, mencionados en StackOverflow**

Heroku ya tiene un servicio que permite integrar la aplicación desde un repositorio de github directamente.

![heroku app](https://www.dropbox.com/s/5xt9qujy83xjcvi/herokuapp.png?dl=1)

Como se puede observar, en Heroku también tenemos la opción de esperar a que las pruebas de CI pasen, antes de esplegar la aplicación. De esta manera, ya no hace falta integrar otro servivio CI con despliegue, ya que Heroku usa el que ya hay configurado sobre el repositorio.

Con cada push que se ejecute sobre el repositorio, Heroku espera las que pasen las pruebas, y en caso de que hayan pasado, procede a desplegar automaticamente la aplicación.

![despliegue heroku](https://www.dropbox.com/s/jkhqevg2isplnwa/heroku%20log.png?dl=1)

### Ejercicio 8

**Preparar la aplicación con la que se ha venido trabajando hasta este momento para ejecutarse en un PaaS, el que se haya elegido.**

Tal y como se ha mencionado en los ejercicios anteriores, se ha configurado la aplicación para su despliegue en **Heroku**, mediante un archivo de configuración **Procfile** y la configuración en Heroku. La aplicación se puede ver [aqui](http://arcane-springs-3380.herokuapp.com)








