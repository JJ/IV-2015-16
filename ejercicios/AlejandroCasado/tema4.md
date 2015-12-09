#Ejercicios Tema 4

##Ejercicio 1

###Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.

Para instalar [lxc](https://help.ubuntu.com/lts/serverguide/lxc.html#lxc-installation) podemos usar lo siguiente: `sudo apt-get install lxc`

Podemos ver que versión tenemos instalada con `lxc-ls --version`

![ejercicio1-1](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%204/ejercicio1-1_zpsik9dros6.png)

##Ejercicio 2

###Comprobar qué interfaces puente se han creado y explicarlos.

Primero creamos un contenedor con `sudo lxc-create -t ubuntu -n una-caja`

Una vez creado, lo arrancamos y nos conectamos a él con `sudo lxc-start -n una-caja`, cuando nos pidan usuario y contraseña ponemos `ubuntu` en ambos

Tras esto, vemos las interfaces nuevas con `ifconfig -a`

Las nuevas interfaces son:

~~~
vethYWT6NS Link encap:Ethernet direcciónHW fe:0b:3f:b1:7f:33 
Dirección inet6: fe80::fc0b:3fff:feb1:7f33/64 Alcance:Enlace
ACTIVO DIFUSIÓN FUNCIONANDO MULTICAST MTU:1500 Métrica:1
Paquetes RX:31 errores:0 perdidos:0 overruns:0 frame:0
Paquetes TX:76 errores:0 perdidos:0 overruns:0 carrier:0
colisiones:0 long.colaTX:1000 
Bytes RX:2810 (2.8 KB) TX bytes:12214 (12.2 KB)

lxcbr0 Link encap:Ethernet direcciónHW 00:00:00:00:00:00 
Direc. inet:10.0.3.1 Difus.:10.0.3.255 Másc:255.255.255.0
Dirección inet6: fe80::9cea:22ff:febd:a973/64 Alcance:Enlace
ACTIVO DIFUSIÓN MULTICAST MTU:1500 Métrica:1
Paquetes RX:33 errores:0 perdidos:0 overruns:0 frame:0
Paquetes TX:162 errores:0 perdidos:0 overruns:0 carrier:0
colisiones:0 long.colaTX:0 
Bytes RX:2732 (2.7 KB) TX bytes:28116 (28.1 KB)
~~~

La interfaz `lxcbr0` es una interfaz puente, que permite que el contenedor tenga acceso a internet. Mientras que `vethYWT6NS` se usa para poder tener comunicación entre los distintos contenedores.

##Ejercicios 3

###1. Crear y ejecutar un contenedor basado en Debian.

Para crear un contenedor basado en Debian usamos

`sudo lxc-create -t debian -n una-caja-debian`

Y para ejecutar el contenedor

`sudo lxc-start -n una-caja-debian` 



###2.Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya. Fedora, al parecer, tiene problemas si estás en Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro

He creado un contenedor basado en mi distribución en el ejercicio2

Para este ejercicio he decidido instalar instalar CentOS, para ello he seguido este [enlance](http://www.bonusbits.com/wiki/HowTo:Setup_CentOS_LXC_Container_on_Ubuntu)


Lo primero que tenemos que hacer todas las dependencias:

* `sudo apt-get install librpm3 librpmbuild3 librpmio3 librpmsign1 libsqlite0 python-rpm python-sqlite python-sqlitecachec python-support python-urlgrabber rpm rpm-common rpm2cpio yum debootstrap bridge-utils`

* Descargar el ejemplo de [aquí](https://gist.github.com/hagix9/3514296#file-lxc-centos)

* `sudo cp ~/Downloads/lxc-centos /usr/share/lxc/templates/`

* `sudo chmod +x /usr/share/lxc/templates/lxc-centos`

Tras esto creamos el contenedor

`lxc-create -n lxc-centos01 -t centos`

Y lo arrancamos
`lxc-start -n lxc-centos01`

##Ejercicios 4

###Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.

Para instalar `lxc-webpanel` vamos a su [web](http://lxc-webpanel.github.io/install.html) y seguimos las instrucciones

Comenzamos ejecutando lo siguiente:

* `wget https://lxc-webpanel.github.io/tools/install.sh -O - | bash`

Para el comando anterior debemos ser súper-usuario, para ello `sudo su`

Tras esto nos dirigimos a http://localhost:5000/ y veremos un login

![captura4-1](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%204/ejercicio4-1_zpsxf0shhoy.png)

Nos logeamos con `admin` tanto como contraseña y usuario

Una vez dentro, nos encontraremos con:

![captura4-2](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%204/ejercicio4-2_zpsgo1hs1mw.png)

###Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.


![captura4-3](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%204/ejercicio4-3_zpsrsv0qkbl.png)



##Ejercicio 5
###Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor. Usar nginx.

Comenzamos creando una jaula, para ello usamos:
`sudo debootstrap --arch=amd64 lucid /home/jaula/` 

Tras crearla la activamos con `sudo chroot /home/jaula`

Ahora instalamos `nginx`

* `sudo apt-get update`
* `sudo apt-get install nginx`

Si se tienen problemas a la hora de instalar nginx, consultar estas dos web.

* https://www.nginx.com/resources/wiki/start/topics/tutorials/install/

* https://pricklytech.wordpress.com/2014/05/16/ubuntu-server-14-4-trusty-add-apt-repository-command-not-found/

También instalamos `curl` para comprobar que nginx funciona correctamente:

* `sudo apt-get install curl`

Tras esto ejecutamos `curl localhost`

![ejercicio5-3](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%204/ejercicio5-3_zpsw8eigrwm.png)

Por último, probamos el rendimiento de nginx en la jaula con [apache benchmark](https://httpd.apache.org/docs/2.2/es/programs/ab.html) usando `ab -n 5000 -c 500 http://127.0.0.1/`

![ejercicio5-4](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%204/ejercicio5-4_zpsppzkjvo4.png)

Voy a instalar nginx sobre el contenedor creado en el ejercicio 2, aunque se puede crear uno nuevo si se quiere.

Arrancamos el contenedor `sudo lxc-start -n una-caja` y una vez dentro ejecutamos:

* `sudo apt-get update`
* `sudo apt-get install nginx`

Una vez instalado tenemos que arrancar el servicio

![ejercicio5](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%204/ejercicio5_zpsegtnxgjd.png)

Para comprobar que nginx funciona podemos usar [w3m](http://www.howtogeek.com/103574/how-to-browse-from-the-linux-terminal-with-w3m/)


En otra terminal usaremos `ab -n 5000 -c 500 http://10.0.3.75/`, para obtener la ip del contenedor basta con usar `ifconfig` desde él.

![ejercicio5-2](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%204/ejercicio5-2_zpscei5xs4a.png)



##Ejercicio 6
### Instalar docker

Para instalar docker basta con ejecutar

`sudo apt-get install docker.io`

##Ejercicios 7
###Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS

Para instalar una imagen de ubuntu, podemos usar

`docker pull ubuntu`

![ejercicio7-1](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%204/ejercicio7-1_zpsdrhhuvva.png)

Una opción para comprobar que la instalación ha sido exitosa es ejecutar

`sudo docker run ubuntu ls`

![ejercicio7-2](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%204/ejercicio7-2_zpswnaw3pby.png)

El caso de centos es similar al de arriba, instalamos con `sudo docker run centos ls` y comprobamos que esta todo correcto con `sudo docker run centos ls`

###Buscar e instalar una imagen que incluya MongoDB

Se procede de forma similar al ejercicio anterior.

Instalamos con `sudo docker pull mongo` y para asegurarnos de que todo esta correcto `sudo docker run mongo ls`

##Ejercicio 8
###Crear un usuario propio e instalar nginx en el contenedor creado de esta forma

Comenzamos lanzando el contenedor

`sudo docker run -i -t ubuntu /bin/bash`

Ahora creamos el usuario con los siguientes pasos

* `useradd -d /home/alex -m alex`
* `passwd alex`
* `adduser alex sudo`

Tras realizar los pasos anteriores podemos conectarnos usando el usuario creado

`login alex`

Para instalar nginx usamos `sudo apt-get install nginx` y para comprobar que funciona `curl localhost`

![ejercicio8-1](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%204/ejercicio8-1_zpswxehra8g.png)



##Ejercicio 9
###Crear a partir del contenedor anterior una imagen persistente con commit

Tenemos que localizar la id del contenedor, podemos usar `sudo docker ps -a=false`

![ejercicio9-1](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%204/ejercicio9-1_zpsbeyphtgj.png)

Ahora con la id, en mi caso `62d09dfdc3e3` podemos realizar el commit

![ejercicio9-2](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%204/ejercicio9-2_zpscucbfpxo.png)

Finalmente, comprobamos que la operación anterior se ha realizado correctamente

![ejercicio9-3](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%204/ejercicio9-3_zpswo2w1de5.png)

##Ejercicio 10
###Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección.

Lo primero que debemos hacer es crear un fichero `Dockerfile`, necesario para subir nuestra imagen a dockerhub. Este es mi fichero `Dockerfile`

~~~
FROM ubuntu:14.04
MAINTAINER Alejandro Casado Quijada <acasadoquijada@gmail.com>

#Instalamos git
RUN sudo apt-get -y update
RUN sudo apt-get install -y git

#Clonamos el repositorio
RUN sudo git clone https://github.com/acasadoquijada/IV.git

#Instalamos las herramientas de python3 necesarias
RUN sudo apt-get install -y python3-setuptools
RUN sudo apt-get -y install python3-dev
RUN sudo apt-get -y install build-essential
RUN sudo apt-get -y install python-psycopg2
RUN sudo apt-get -y install libpq-dev
RUN sudo easy_install3 pip
RUN sudo pip install --upgrade pip

#Instalamos los requerimientos necesarios
RUN cd IV/ && make install

#Realizamos la sincronización entre las BD
RUN cd IV/ && python3 manage.py syncdb --noinput
~~~

Una vez hecho esto, nos vamos a [docker hub](https://hub.docker.com/), nos situamos en 
`Create > Create automatic build` y seleccionamos el repositorio de nuestra aplicacion.


![ejercicio10-1](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%204/ejercicio10-1_zpsiaqrnyv5.png)

Tras esto, si hemos realizado correctamente el `Dockerfile` nos aparecerá una pantalla similar a esta

![practica4-1](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica%204/practica4-1_zpszewwu9b0.png)

Para descargar y ejecutar la imagen tenemos dos alternativas:

* Ejecutar este [script](https://github.com/acasadoquijada/IV/blob/master/scripts/docker.sh) y `cd IV && make run`

* Ejecutar `sudo docker pull acasadoquijada/ppe` , `sudo docker run -i -t acasadoquijada/ppe /bin/bash` y `cd IV && make run`

Cuando tengamos la aplicación en marcha basta con introducir `ip-imagen:8000` en nuestro navegador para comprobar que funciona correctamente

![practica4-2](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica%204/practica4-2_zpsa8yh0krj.png)


