#Tema 4
###Ejercicio1: Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.

La instalación la realizamos con la siguiente orden: **apt-get install lxc**.

Después comprobamos que todo esta correcto:

![Ejercicio1](https://www.dropbox.com/s/pmctryq58q8hkpi/Ejercicio1.png?dl=1)

###Ejercicio2: Comprobar qué interfaces puente se han creado y explicarlos.

Creamos un contenedor llamado caja:

![Ejercicio2a](https://www.dropbox.com/s/5uyz25m6az0h7l4/Ejercicio2a.png?dl=1)

Arrancamos el contenedor con la siguiente orden **lxc-start -n caja** y nos conectamos a el:

![Ejercicio2b](https://www.dropbox.com/s/wjan8bm5jc2iiq3/Ejercicio2b.png?dl=1)

Si hacemos un **ifconfig** en local podemos ver como se ha creado una nueva interfaz de red, para que el contenedor pueda tener acceso a internet.

![Ejercicio2c](https://www.dropbox.com/s/wpe1dm484sshwhb/Ejercicio2c.png?dl=1)

###Ejercicio3: 

####3.1 Crear y ejecutar un contenedor basado en Debian.

Creamos el contenedor **LXC** con la siguiente orden:

lxc-create -t debian -n caja-debian

![Ejercicio3.1a](https://www.dropbox.com/s/5det6lxdh26iuzh/Ejercicio3.1a.png?dl=1)

####3.2 Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya. Fedora, al parecer, tiene problemas si estás en Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro. Por ejemplo, Óscar Zafra ha logrado instalar Gentoo usando un script descargado desde su sitio, como indica en este comentario en el issue.

Como mi distribución es Ubuntu 14.04 LTS, creo un contenedor basacon en **CentOS**:

CentOS utiliza yum para instalar paquetes por tanto lo instalamos con la orden: apt-get install yum

![Ejercicio3.2a](https://www.dropbox.com/s/aqmyzsoqcdgh483/Ejercicio3.2a.png?dl=1)

![Ejercicio3.2b](https://www.dropbox.com/s/uvdqppvn0twgtec/Ejercicio3.2b.png?dl=1)


###Ejercicio4:
####4.1 Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.

Para instalar lxc-webpanel, lo hacemos con la siguiente orden: wget http://lxc-webpanel.github.io/tools/install.sh -O - | sudo bash

![Ejercicio4.1](https://www.dropbox.com/s/krzwemdzok3vizx/Ejercicio4.1.png?dl=1)

####4.2 Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.

En el navegador ponemos http://localhost:5000/ y nos sale el **LXC Web Panel**. Hacemos login con el usuario y contraseña "admin". Y ya podemos ver los contenedores que hemos creado:

![Ejercicio4.2a](https://www.dropbox.com/s/rzir55r5rgylgt4/Ejercicio4.2a.png?dl=1)

Ahora seleccionamos el contenedor al que queremos restringir los recursos, y lo configuramos a nuestro gusto:

![Ejercicio4.2b](https://www.dropbox.com/s/vylgfgo3y88n80x/Ejercicio4.2b.png?dl=1)

###Ejercicio6: Instalar docker.

Para la instalación seguimos el siguiente tutorial: [tutorial](http://docs.docker.com/engine/installation/ubuntulinux/).

Instalamos **Docker** con la siguiente orden: apt-get install docker.io

Instalamos **transport-https**: apt-get install apt-transport-https

Añadimos la llave del repositorio Docker: apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

Añadimos el repositorio a nuestra lista **apt** y actualizmos los repositorios: sh -c "echo deb https://get.docker.com/ubuntu docker main\/etc/apt/sources.list.d/docker.list"

Instalamos el paquete **lxc-docker**, y verificamos que se ha instalado:

![Ejercicio6](https://www.dropbox.com/s/pl3ndjmszh60sm6/Ejercicio6.png?dl=1) 


###Ejercicio7:

####7.1 Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.

Para instalar cualquier imagen podemos hacerlo de dos formas diferentes: con **docker pull imagen** descargamos la imagen y para instalarla, **docker run -i -t imagen**. Y si queremos que docker la descargue sola y la instale, entonces solo: **docker run -i -t imagen**.  

![Ejercicio7.1a](https://www.dropbox.com/s/ehfslhhlfauwzco/Ejercicio7.1a.png?dl=1)

![Ejercicio7.1b](https://www.dropbox.com/s/q1s9wekoovi88lw/Ejercicio7.1b.png?dl=1)

####7.2 Buscar e instalar una imagen que incluya MongoDB.

Para ello utilizamos la siguiente orden: docker pull hairmare/mongodb
 
![Ejercicio7.2](https://www.dropbox.com/s/jrresrkh5nnsxa3/Ejercicio7.2.png?dl=1)

Y finalmente podemos ver las imágenes que tenemos:

![Ejercicio7.3](https://www.dropbox.com/s/b6wj7dyo0gxinub/Ejercicio7.3.png?dl=1)


###Ejercicio8: Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.

Para este ejercicio voy a utilizar el contenedor con la imagen de Ubuntu creado en el ejercicio anterior:

Creación del usuario:
    
![Ejercicio8a](https://www.dropbox.com/s/qxmoblw8eptizm7/Ejercicio8a.png?dl=1)

Hacemos login con el usuario creado, e instalamos nginx:

![Ejercicio8b](https://www.dropbox.com/s/2rm8obndnib2tpa/Ejercicio8b.png?dl=1)

![Ejercicio8c](https://www.dropbox.com/s/tjsukbrdebu3np5/Ejercicio8c.png?dl=1)

###Ejercicio9: Crear a partir del contenedor anterior una imagen persistente con commit. 

Para poder realizar este ejercicio, debemos seleccionar un contenedor de los creados, e iniciarlo.
Con la orden **docker ps** obtenemos el ID del contenedor que acabos de iniciar:

![Ejercicio9.1](https://www.dropbox.com/s/qzoyygottwxm38j/Ejercicio9.1.png?dl=1)

Ahora guardamos el estado actual del contenedor con un **commit**, con la ID del contenedor obtenida. Y vemos que efectivamente se ha creado la imagen:

![Ejercicio9.2](https://www.dropbox.com/s/gaflm4rypc9zwja/Ejercicio9.2.png?dl=1)

###Ejercicio10: Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección. 

Para crear una imagen debemos hacer lo siguiente:

* Para trabajar con Docker hace falta tenerlo instalado, en el siguiente enlace es de una guía para la instalación en Ubuntu 14.04: [enlace](http://docker-ee.blogspot.com.es/2014/08/instalar-docker-en-ubuntu-1404.html) .

* Para la creación de la imagen que contenga las herramientas necesarias para el despliegue hace falta crear una **receta** llamada **Dockerfile**. Que es nada más y nada menos que un fichero donde le decimos que queremos que instale en la imagen. Aquí esta mi Dockerfile que he utilizado: [Dockerfile](https://github.com/alvaro-gr/proyecto-IV/blob/master/Dockerfile) .

* Por último la orden que necesitamos para compilar la imagen: **docker build -t alvaropl/apppoll -f Dockerfile ./** .

Creando la imagen:

![docker1](https://www.dropbox.com/s/96eldj2vvidnj0u/docker1.png?dl=1)

![imagenapp](https://www.dropbox.com/s/bntryzyxawnm0c5/imagenapp.png?dl=1)


