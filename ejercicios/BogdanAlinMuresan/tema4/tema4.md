##Ejercicios tema 4 . Séptima semana
----
##Ejercicio 1 
####Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.

Lo instalamos desde terminal
    
    sudo apt-get install lxc

Con el comando `lxc-checkconfig`  comprobamos que nuestra máquina esta preparada para utilizar este tipo de tecnologia

![foto](http://i1175.photobucket.com/albums/r624/Bob_Mures/tema%204/ej1_lex-checkconfig_zpsof0z9b5d.png)

##Ejercicio 2 

####Comprobar qué interfaces puente se han creado y explicarlos.
Con el comando 

    ifconfig -a  
   
vemos que se ha creado una interfaz puente

    lxcbr0
    
##Ejercicio 3

####3.1Crear y ejecutar un contenedor basado en Debian.
Para crear el contenedor debian se usa el comando 

    sudo lxc-create -t debian -n micontenedordebian
    
Para ejecutarlo 

    sudo lxc-start -n micontenedordevian
    
 para pararlo 
 
     halt
     
  ![micontenendordebian_running](http://i1175.photobucket.com/albums/r624/Bob_Mures/tema%204/micontenendordebian_running_zpsaly8fpki.png)

####3.2Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya. Fedora, al parecer, tiene problemas si estás en Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro. Por ejemplo, Óscar Zafra ha logrado instalar Gentoo usando un script descargado desde su sitio, como indica en este comentario en el issue. 

Antes instalamos el paqueta curl yum

    sudo apt-get install curl yum 
    
Instalamos fedora 

     sudo lxc-create -t fedora -n fe
     
Ejecutamos el contenedor

    sudo lxc-start -n fe

![fedora_cotenedor_running](http://i1175.photobucket.com/albums/r624/Bob_Mures/tema%204/fedora_cotenedor_running_zpstffahimu.png)     


##Ejercicio 4 
####4.1 Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.

Instalamos lxc-webpanel

    wget http://lxc-webpanel.github.io/tools/install.sh -O - | sudo bash

y accedemos a el `http://localhost:5000`

![lxc-webpanel](http://i1175.photobucket.com/albums/r624/Bob_Mures/tema%204/lxc-webpanel_zpstigxap6v.png)


####4.2 Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.

Si seleccionamos un contenedor podemos restringir sus recursos que puede usar

![lxc-webpanel_editar](http://i1175.photobucket.com/albums/r624/Bob_Mures/tema%204/lxc-webpanel_editar_zpsfqdu6fng.png)

##Ejercicio 5

####Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor. Usar nginx.

**Resultados con el jaula**:

MaTps  65.00, Tps  65.00, Resp Time  0.252, Err   0%, Count	65

MaTps  61.26, Tps  27.57, Resp Time  0.681, Err   0%, Count	94

MaTps  55.36, Tps   2.33, Resp Time  1.232, Err   0%, Count	97

MaTps  49.87, Tps   0.38, Resp Time  4.869, Err   0%, Count	98

MaTps  45.35, Tps   4.68, Resp Time  6.408, Err   0%, Count 103

MaTps  41.02, Tps   2.12, Resp Time  7.595, Err   0%, Count 107

MaTps  37.39, Tps   4.70, Resp Time  9.221, Err   0%, Count 117

MaTps  33.71, Tps   0.59, Resp Time 12.472, Err   0%, Count 123

MaTps  30.53, Tps   1.89, Resp Time 21.698, Err   0%, Count 128

MaTps  27.49, Tps   0.10, Resp Time 33.351, Err   0%, Count 129

MaTps  24.75, Tps   0.15, Resp Time 40.056, Err   0%, Count 130

MaTps  22.29, Tps   0.15, Resp Time 45.722, Err   0%, Count 131

MaTps  20.08, Tps   0.20, Resp Time 51.666, Err   0%, Count 132

MaTps  18.20, Tps   1.28, Resp Time 51.967, Err   0%, Count 134


**Resultados con la contenedor**:

MaTps  54.15, Tps  50.55, Resp Time  0.514, Err   0%, Count	35

MaTps  42.00, Tps  32.21, Resp Time  1.545, Err   0%, Count	47

MaTps  42.65, Tps   2.01, Resp Time  3.001, Err   0%, Count	60

MaTps  49.45, Tps   2.80, Resp Time  2.457, Err   0%, Count	73

MaTps  45.88, Tps   2.76, Resp Time 12.120, Err   0%, Count 85

MaTps  45.99, Tps   1.05, Resp Time 13.504, Err   0%, Count 93

MaTps  24.21, Tps   2.39, Resp Time 15.104, Err   0%, Count 105

MaTps  21.79, Tps   0.91, Resp Time 18.985, Err   0%, Count 108

MaTps  20.69, Tps   0.21, Resp Time 35.412, Err   0%, Count 111

MaTps  18.74, Tps   1.53, Resp Time 46.253, Err   0%, Count 115

MaTps  12.01, Tps   0.63, Resp Time 50.367, Err   0%, Count 118

MaTps  14.03, Tps   1.20, Resp Time 56.210, Err   0%, Count 122

MaTps  11.42, Tps   0.12, Resp Time 63.326, Err   0%, Count 126

MaTps  10.21, Tps   0.90, Resp Time 67.001, Err   0%, Count 128


Como se puede ver, la jaula es más rápida (sirve más peticiones) que el contenedor. Esto es debido a que el contenedor tiene que acceder a través del puente (el que se crea cuando se instala).

##Ejercicio 6 
####Instalar docker.
He instalado Docker en mac os x  siguiendo el tutorial de la web oficial

Descargar e instalar  [`docker toolbox`](https://www.docker.com/docker-toolbox)

![docker_instalado](http://i1175.photobucket.com/albums/r624/Bob_Mures/tema%204/docker_instalado_zpsgc7ayk12.png)

##Ejercicio 7
####7.1 Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.
Al ejecutar el comando `docker run ubuntu:12.04` y `docker run centos:latest`  se descarga localmente la imagen y se instala ubuntu y centos respectivamente en un contendor

![docker_images](http://i1175.photobucket.com/albums/r624/Bob_Mures/tema%204/docker_images_zpsofvbrfxz.png)

####7.2 Buscar e instalar una imagen que incluya MongoDB.

En el sigiente link buscamos la imagen `https://hub.docker.com`

Ejecutamos e instalamos una imagen que incluya mongo 

    docker run --name some-mongo -d mongo

![docker_mongo](http://i1175.photobucket.com/albums/r624/Bob_Mures/tema%204/docker_mongo_zpsydhbkktc.png)

##Ejercicio 8
####Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.

+ Entramos al contenedor `docker run -i -t ubuntu:12.04  /bin/bash`
+ Añadimos el nuevo usuario useradd -d `/home/usernginx -m usernginx`
+ Damos permisos de sudo al nuevo usuario `adduser usernginx sudo`
+ Establecemos contraseña al nuevo usuario `passwd usernginx`
+ Entramos como el nuevo usuario `su nginxuser`
+ Actualizamos los repos e instalamos el servidor `sudo apt-get update && sudo apt-get install nginx`
+ Iniciamos el servidor `service nginx start`

![server worker](http://i1175.photobucket.com/albums/r624/Bob_Mures/tema%204/server_nginx_worker_zpsanhyzmki.png)

##Ejercicio 9 

####Crear a partir del contenedor anterior una imagen persistente con commit.

+ Abrimos nueva terminal de docker 

+ Obtenemos el id del contenedor `docker ps` en mi caso `3951ff2d8043`

~~~

MacBook-Pro-de-Bogdan:~ bogdan$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
3951ff2d8043        ubuntu:12.04        "/bin/bash"         30 minutes ago      Up 30 minutes 
                          sleepy_brahmagupta
~~~

+ creamos la nueva imagen `docker commit 3951ff2d8043 nuevaImagenUbuntu:12.04`
,se genera in id `b78c8735fe0e40078b0addc1993fc00f22ae524b89c6e9952e3279ad2ca481c5`

+ Comprobamos con `docker images`

![commitubuntu](http://i1175.photobucket.com/albums/r624/Bob_Mures/tema%204/commitubuntu_zpshmbhh7k8.png)

##Ejercicio 10
####Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección.

+ Creamos una cuenta en `https://hub.docker.com`
+ Nos vamos al menu y le damos a  `create automated build`
+ Acceptamos los permisos para que docker lea de nuestro repo en Github
+ Seleccionamos el repositorio de Github con nuestro proyecto el cual se desplegara en docker.

Lo siguiente es crear un fichero Dockerfile para indicar que se debe instalar.

~~~
FROM ubuntu:12.04

MAINTAINER Bogdan Alin Muresan <alinugr@gmail.com>

RUN apt-get update

#Download the app
RUN apt-get install -y git
RUN git clone https://github.com/bogdananas/proyectoIV-modulo2.git

#instalar dependencias
RUN apt-get install -y python-setuptools
RUN apt-get -y install python-dev
RUN apt-get -y install build-essential
RUN apt-get -y install python-psycopg2
RUN apt-get -y install libpq-dev
RUN easy_install pip
RUN pip install --upgrade pip



#instalamos la aplicaión
RUN pwd
RUN cd proyectoIV-modulo2 / && ls -l
RUN pwd
RUN cd proyectoIV-modulo2 && pip install -r requirements.txt --allow-all-external

~~~ 
 
+ Creamos la imagen a partir del fichero Dockerfile

		 bogdan$ docker build -t alinugr . 
		 
![docker build](http://i1175.photobucket.com/albums/r624/Bob_Mures/tema%204/dockerbuild_zpsruvu4rbb.png)

+ Combrobar que la imagen se ha creado. `docker images`

![dockerimages](http://i1175.photobucket.com/albums/r624/Bob_Mures/doickerrun_zpsd25h63l9.png)

+ Ejecutamos la imagen creada `docker run -i -t -p 5000:5000 blog_iv /bin/bash`


+ Entramos al directorio del proyecto y arrancamos el servidor `python manage.py runserver http://172.17.0.2:5000/`

##Cuidado!!!!
Para acceder a la direccion ip del docker hay que introducir la ip que sale al abrir el terminal.Acceder la ip que tiene el contenedor haciendo ifconfig no me funciona!!

![dockerrun](http://i1175.photobucket.com/albums/r624/Bob_Mures/tema%204/docker_run_zpsyhu8u1cl.png)





 