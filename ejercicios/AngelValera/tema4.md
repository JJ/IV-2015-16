# **Ejercicios Tema 4**

###**Ejercicio 1:**Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.

Para instalar LXC usamos:

 **sudo apt-get install lxc**

Una vez instalado comprobamos si está preparado para usar este tipo de tecnología y también si se ha configurado correctamente, para ello usamos:
 
**lxc-checkconfig**. 

![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema4/Seleccioacuten_001_zpsouqazbef.png)

###**Ejercicio 2:** Comprobar qué interfaces puente se han creado y explicarlos.

Para crear un contenedor denominado una-caja e instalar Ubuntu en él debemos poner el siguiente comando:

**sudo lxc-create -t ubuntu -n una-caja**

Esperamos que termine para que nos indique el usuario y la contraseña:
![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema4/Seleccioacuten_001_zpswr6bsnzn.png)

Ahora lo que debemos hacer es arrancar el contenedor, para ello ejecutamos:

**sudo lxc-start -n una-caja**

Introducimos el usuario y contraseña que como vimos en la captura anterior era "ubuntu" en ambos casos.

Para comprobar los interfaces puente que se han generado, debemos abrir otra terminal desde el pc anfitrión y ejecutar **ifconfig**, en mi caso me ha generado dos interfaces:

* **lxcbr0** que sirve para que el contenedor tenga acceso a internet.
* **vethWH4BMG** para que el contenedor se pueda comunicar con otros contenedores.

![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema4/Seleccioacuten_002_zpsxxmhz3wu.png)

###**Ejercicio 3.1:**Crear y ejecutar un contenedor basado en Debian.

Para crear un contenedor basado en debian, usamos el mismo comando que usamos para el contenedor de ubuntu.

**sudo lxc-create -t debian -n cont-debian**

Lo ejecutamos del mismo modo:

**sudo lxc-start -n cont-debian**

(Al hacerlo me da un error *Failed to mount cgroup at /sys/fs/cgroup/systemd: Permission denied*)

####**Ejercicio 3.2:**Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor basado en tu distribución y otro basado en otrCrear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya. Fedora, al parecer, tiene problemas si estás en Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro. a que no sea la tuya. Fedora, al parecer, tiene problemas si estás en Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro. 

He decidido instalar CentOS, para ello debemos hacer lo siguiente:

* Tenemos que instalar todas las dependencias:

**sudo apt-get install librpm3 librpmbuild3 librpmio3 librpmsign1 libsqlite0 python-rpm python-sqlite python-sqlitecachec python-support python-urlgrabber rpm rpm-common rpm2cpio yum debootstrap bridge-utils**

*Descargamos el siguiente [script:](https://gist.github.com/hagix9/3514296#file-lxc-centos)

Lo copiamos en el direcctorio correcto y le damos permisos de ejecucion:

* **sudo cp ~/Downloads/lxc-centos /usr/share/lxc/templates/**
* **sudo chmod +x /usr/share/lxc/templates/lxc-centos**

Y ahora creamos el contenedor:

* **lxc-create -n cont-Centos -t centos**

Para ejecutarlo usamos:

* **lxc-start -n cont-Centos**

####**Ejercicio 4.1:**Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.

Para instalar lxc-webpanel debemos seguir los pasos que nos indica en la [web](http://lxc-webpanel.github.io/install.html).

Primero tenemos que ejecutar:

``` wget https://lxc-webpanel.github.io/tools/install.sh -O - | bash ```

Después, abrimos el navegador con la dirección: ``` http://localhost:5000/ ```

lo que nos muestra la siguiente página de login:

![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema4/Seleccioacuten_003_zpst7tiaskp.png)

Ponemos tanto para username como para password "admin".

Hecho esto nos abrirá una página como la siguiente en la que podemos ver los contenedores que hemos creado.

![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema4/Seleccioacuten_005_zpsa0ci7aya.png)

####**Ejercicio 4.2:**Desde el panel Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.

Para restringir los recursos de un contenedor, tenemos que hacer click en alguno de ellos, de manera que nos motrará sus recursos actuales y solo tenemos que modificarlos y aplicarlos (estando ese contenedor apagado). 

Vamos a hacer un ejemplo con el contenedor "una-caja". De entrada obtenemos lo siguiente:
![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema4/Seleccioacuten_006_zps3g37jgki.png)

![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema4/Seleccioacuten_007_zpsmgcve906.png)

Modificamos los recursos de memoria quedando de esta manera:

![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema4/Seleccioacuten_008_zpsh9c4clsw.png)


####**Ejercicio 5:**Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor. Usar nginx.

Para realizar las pruebas vamos a utilizar un apache benchmark sobre los servidores nginx tanto en el contenedor como en la jaula.

* **SOBRE EL CONTENEDOR:**

Voy a usar el contenedor que ya creamos y utilizamos antes: "una-caja" que tenia ubuntu y hacemos lo siguiente:

1. Primero arrancamos el contenedor:  **sudo lxc-start -n una-caja**
* Después actualizamos los repositorios: **sudo apt-get update**
* Instalamos el servidor nginx: **sudo apt-get install nginx**
* Iniciamos el servicio: **sudo service nginx start**
* Instalamos lo necesario para ejecuta el apache benchmak:**sudo apt-get install apache2-utils**

Podemos comprobar que nginx funciona correctamente si comprobamos su ip con **ifconfig -a** y en el navegador ponemos esa ip:
![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema4/Seleccioacuten_014_zpsr9uq3jpg.png)

Ahora desde otra terminal lanzamos el comando:

 **```ab -n 2000 -c 1000 http://10.0.3.169/```**

 lo que nos da como resultado:
![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema4/Seleccioacuten_013_zps2thi9jms.png)

* **SOBRE LA JAULA:**

Para crear una jaula he tenido que hacer lo siguiente:

* Creamos la jaula, para ello he usado el siguiente comando: **```debootstrap --arch=i386 lucid /home/jaula/angel/ http://archive.ubuntu.com/ubuntu```**
* Ahora debemos ejecutar: **```sudo chroot /home/jaula/angel ```** esto hace que prompt cambie al de root.

* Ahora siguiendo con lo que nos dice esta [página](https://www.nginx.com/resources/wiki/start/topics/tutorials/install/) en el fichero **/etc/apt/sources.list** he añadido las siguientes líneas:

**```deb http://nginx.org/packages/ubuntu/ lucid nginx```**

**```deb-src http://nginx.org/packages/ubuntu/ lucid nginx```**

* Actualizamos esos repositorios: **apt-get update**

* Instalamos nginx:  **apt-get install nginx**

Para activar nginx primero desde otra terminal he tenido que ejecutar: **sudo fuser -k 80/tcp** con esto dejamos libre el puerto 80.

* Activamos el servicio nginx: **sudo service nginx start**

* Para poder hacer ifconfig -a tenemos que montar el directorio /proc, para ello desde la terminal de la jaula: **mount -t proc proc /proc**

Una vez que sabemos la ip de la jaula, podemos comprobar que nginx funciona usando el navegador como antes poniendo la ip o localhost en este caso o mediante curl.
![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema4/Seleccioacuten_015_zpsxiryhtxg.png)
* Instalamos como en el caso anterior lo necesario para ejecutar el apache benchmark: **sudo apt-get install apache2-utils**

Desde otra terminal ejecutamos el comando: 

 **```ab -n 2000 -c 1000 http://10.0.3.1/```**

Que nos da como resultado:
![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema4/Seleccioacuten_016_zpsolr1tnon.png)

A la vista de los resultados, podemos ver que la jaula ha tardado  segundos, mientras que el contenedor ha tardado 0.319 segundos, además si nos fijamos en elas respuestas por segundo podemos ver que la jaula ofrece 7376.81respuestas por segundo, mientras que el contenedor, 6265.33 respuestas por segundo, por tanto podemos afirmar que la jaula ofrece un mejor rendimiento, hay que indicar que se está sirviendo una página estática y necesitariamos una página mayor para que los resultados del apache benchmark fuesen más realistas.

####**Ejercicio 6:**Instalar docker.

Para instalar Docker tenemos que ejecutar el siguiente comando:

**```sudo apt-get install docker.io```**

Ejecutamos para lanzarlo: 

**```sudo docker -d &```**

O también: 

**```sudo service docker start```**

Podemos comprobar el estado del servicio:

**```sudo service docker status```**

Y para comprobar que funciona

**```sudo docker run hello-world```**

![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema4/Seleccioacuten_017_zpsjajaxirb.png)

Hay que borrar el archivo docker.pid cada vez que se vaya a ejecurar docker.


**```sudo rm /var/run/docker.pid```**


####**Ejercicio 7.1:** Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.

Para instalar una imagen de Ubuntu usando docker, estando el servicio de docker activado, debemos usar:

**sudo docker pull ubuntu**

Y para ejecutarlo usamos:

**sudo docker run -i -t ubuntu /bin/bash**

Y lo mismo para CentOS:

**sudo docker pull centos**

Y para su ejecución:

**sudo docker run -i -t centos /bin/bash**

![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema4/Seleccioacuten_018_zpsjrit7tnt.png)

Estos comandos indican que se está creando un seudo-terminal (-t) y se está ejecutando el comando interactivamente (-i). A partir de ahí sale la línea de órdenes, con privilegios de superusuario, y podemos trabajar con la máquina e instalar lo que se nos ocurra.

####**Ejercicio 7.2:** Buscar e instalar una imagen que incluya MongoDB.

Para instalar una imagen con mongo he ejecutado al igual que en los casos anteriores:

**sudo docker pull mongo**

Y para ejecutarlo, lo hacemos de la misma manera:
![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema4/Seleccioacuten_019_zpslrclzghu.png)

####**Ejercicio 8:** Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.

Vamos a seguir una serie de pasos:

* Primero ejecutamos el contenedor Ubuntu: 

**```sudo docker run -i -t ubuntu```**

* Creamos un nuevo usuario:

**```useradd -d /home/usuario -m usuario```**

* Añadimos una contraseña a ese usuario:

**```passwd usuario```**

* Le damos privilegios:

**```sudo adduser usuario sudo```**

* Nos logueamos con dicho usuario.

**```login usuario```**

Estos pasos podemos verlos en la siguiente imagen.
![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema4/Seleccioacuten_020_zpsvp2muvq6.png)

Una vez hecho esto, tenemos que instalar nginx, activar el servicio y comprobar que funciona:

* Instalo nginx:

**```sudo apt-get install nginx```**

* Activo el servicio de nginx:

**```sudo service nginx start```**

* Instalo curl:

**```sudo apt-get install curl```**

* Comprovamos que funciona mediante:

**```curl 127.0.0.1```**

Podemos comprobar que funciona, mirando con ifconfig la ip del contenedor que en este caso es 172.17.0.2 y poniendola en el navegador:
![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema4/Seleccioacuten_022_zpsnbxlrrh8.png)

####**Ejercicio 9:** Crear a partir del contenedor anterior una imagen persistente con commit.

Para crear una imagen persistente usando commit tenemos que hacer lo siguiente:

* En una terminal, ejecutamos el docker: 

**```sudo docker run -i -t ubuntu```**

* Ahora desde otra terminal ejecutamos:

 **```sudo docker ps -a=false```**

Esto nos muestra el ID del docker.

* Ahora el esquema a seguir es ```sudo docker commit <id obtenida> <comentario commit>``` en mi caso:

 **```sudo docker commit 51a9e337ff98 primer-commit```**

* Podemos comprobar que se ha creado la nueva imagen usando: **```sudo docker images```**

![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema4/Seleccioacuten_023_zpsnf4dsp3t.png)

####**Ejercicio 10:** Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección.

Para crear una imagen para mi proyecto en la asignatura he tenido que hacer lo siguiente, siguiendo con la [documentación oficial](http://docs.docker.com/engine/reference/builder/):

* Primero en el directorio raíz del proyecto y con el demonio de docker funcionando ```sudo docker -d &``` creamos un fichero **Dockerfile** y en el (en mi caso) añadimos lo siguiente:
```
FROM ubuntu:latest

#Autor
MAINTAINER ÁNGEL VALERA MOTOS  <angelvalera.epal@gmail.com>

#Actualizar Sistema Base
RUN sudo apt-get -y update

#Descargar aplicacion
RUN sudo apt-get install -y git
RUN sudo git clone https://github.com/AngelValera/proyectoIV-Modulo-1.git

# Instalar Python y PostgreSQL
RUN sudo apt-get install -y python-setuptools
RUN sudo apt-get -y install python-dev
RUN sudo apt-get -y install build-essential
RUN sudo apt-get -y install python-psycopg2
RUN sudo apt-get -y install libpq-dev
RUN sudo easy_install pip
RUN sudo pip install --upgrade pip

#Instalar la app
RUN ls
RUN cd proyectoIV-Modulo-1/ && ls -l
RUN cd proyectoIV-Modulo-1/ && cat requirements.txt
RUN cd proyectoIV-Modulo-1/ && sudo pip install -r requirements.txt

#Migraciones
RUN cd proyectoIV-Modulo-1/ && python manage.py migrate --noinput
```
* Ahora dentro del directorio del proyecto creamos la imagen, para ello podemos usar, uno de los tres comandos siguientes:

```sudo  docker build -t merka_iv .```

**```sudo docker build -f Dockerfile -t merka_iv .```**

```sudo docker build -f Dockerfile -t merka_iv --no-cache=true ./``` *--no-cache=true* hace que no utilice la caché de un contenedor anterior

* Hecho esto comprobamos que la imagen se ha creado correctamente:**```sudo docker images```**

![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema4/Seleccioacuten_024_zpshu0geo6t.png)

* Ahora arrancamos la imagen, usando para ello: 

**```sudo docker run -t -i merka_iv /bin/bash```**

![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema4/Seleccioacuten_025_zpsmwyyzxpn.png)

* Una vez dentro de la imagen comprobamos los directorios creados, entramos al  directorio del proyecto, comprobamos con ifconfig la ip de la imagen, y la ejecutamos, usando:

**```cd proyectoIV-Modulo-1/```**

**``` ifconfig```**

**```python manage.py runserver 0.0.0.0:2222 &```**

![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema4/Seleccioacuten_026_zpsccgurz8r.png)

Ahora con el navegador ingresando la ip y el puerto corespondiente que en este caso son *172.17.0.3:2222* podemos ver que funciona correctamente la aplicación:

![](http://i666.photobucket.com/albums/vv21/angelvalera/EjerciciosTema4/Seleccioacuten_027_zpsvo13ep5i.png)

Si surgen problemas con la conexión a internet se puede solucionar de dos formas:

* La primera es como indica [FJavierGarridoMellado](https://github.com/JJ/IV-2015-16/blob/master/ejercicios/FJavierGarridoMellado/Tema4/Tema4.md), ejecutando:

```sudo rm /var/run/docker.pid```

y luego 

```sudo docker -d &```


Y la otra forma es como indica [hugobarzano](https://github.com/JJ/IV-2015-16/blob/master/ejercicios/HugoBarzano/tema4.md), editando **/etc/NetworkManager/NetworkManager.conf** y comentando la línea **dns=dnsmask**, hecho esto reiniciamos el servicio:

```sudo restart network-manager```

