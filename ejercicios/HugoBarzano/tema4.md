# Tema 4. Virtualización ligera usando contenedores

##Ejercicio 1:Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.

Ubuntu 14.04 ofrece LXC 1.0.3, que es la última versión. Podemos instalarlo mediante la orden 

	sudo apt-get install lxc

Podemos crear un contenedor con privilegios de manera interactiva, esta forma solicitará el tipo de contenedor y el sistema de archivos raíz para descargar - en particular, la distribución, la liberación y la arquitectura mediante la instrucción:

	sudo lxc-create --template download --name nombre1

o de forma más abreviada: 

	sudo lxc-create -t download -n nombre1

Considero que las siguientes ordenes, pueden ser de utilidad:

	 lxc-ls 	-> Lista de contenedores

	 lxc-info 	-> Información sobre el contenedor

	 lxc-start	-> Iniciar contenedor

	 lxc-stop	-> Detener contenedor

	 lxc-attach	-> Acceder contenedor

	 lxc-console	-> Acceder contenedor
	
	 lxc-destroy	-> Eliminar contenedor

Mediante **lxc-checkconfig** podemos comprobar que efectivamente LXC esta correctamente instalado y listo para funcionar:

![lxc_check](https://www.dropbox.com/s/fk2231a093s0vs8/checkconfig.png?dl=1)

##Ejercicio 2: Comprobar qué interfaces puente se han creado y explicarlos.

Para comprobar las interfaces, vamos a seguir los pasos del tema 4 y crear 2 contenedores. En el primero vamos a instalar Ubuntu:

	sudo lxc-create -t ubuntu -n caja1

Una vez creada, podemos iniciarla mediante 

	sudo lxc-start -n caja1

Para conectarnos a la máquina, debemos introducir **ubuntu** como usuario y contraseña.
![caja1_login](https://www.dropbox.com/s/lzjvw1ato90so7e/caja1_log.png?dl=1)

Para detener la máquina:

	sudo lxc-stop -n caja1

El contenedor tiene acceso a internet a través del anfitrión. Podemos consultar los puentes creados en el archivo **/var/lib/lxc/caja1/config**
![caja1_config](https://www.dropbox.com/s/yozwhfin50r2twh/caja1_config.png?dl=1)

Podemos observar que se han creado los puentes lxcbr0 y veth, una red ethernet virtual linkada a lxcbr0.

Mediante **ifconfig** podemos comprobar que se trata de redes tipo  MULTICAST. 

![ifconfig](https://www.dropbox.com/s/pz4r7opwwm9c63c/ifconfig.png?dl=1)
	

En el segundo, vamos a instalar una imagen similar a la que se usa en EC2 de Amazon:

	sudo lxc-create -t ubuntu-cloud -n nube1

Efectivamente en la creación podemos observar que el funcionamiento es ligeramente diferente, porque se descarga un fichero .tar.gz usando wget.

![nube1](https://www.dropbox.com/s/qv8x3484lozmp2v/nube1.png?dl=1)

Las interfaces puente creadas, son similares a las de nube1

##Ejercicio 3:

###3.1:Crear y ejecutar un contenedor basado en Debian.

Para crear un contenedor basado en Debian podemos utilizar:

	 sudo lxc-create -t debian -n caja_debian

Pero he obtenido el siguiente error a la hora de lanzarla:
	
	**Failed to mount cgroup at /sys/fs/cgroup/systemd: Permission denied**

###3.2:Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya. Fedora, al parecer, tiene problemas si estás en Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro. Por ejemplo, Óscar Zafra ha logrado instalar Gentoo usando un script descargado desde su sitio, como indica en este comentario en el issue.

Voy a crear un contenedor centos. Para ello, previamente es necesario instalar el gestor de paquetes yum

	sudo apt-get install yum

Para crear el contenedor:

	sudo lxc-create -t centos -n caja_centos

Después de crearlo, debemos ejecutar la siguiente instrucción para establecer la contraseña:

	sudo chroot /var/lib/lxc/caja_centos/rootfs passwd

Tras esto ya podemos iniciar el contenedor 

	sudo lxc-start -n caja_centos

![centos](https://www.dropbox.com/s/dignwsphoiptpq2/centos.png?dl=1)



##Ejercicio 4:

###4.1: Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.

Para realizar la instalación, es necesario estar en modo súper usuario (sudo su) y ejecutar lo siguiente:

wget https://lxc-webpanel.github.io/tools/install.sh -O - | bash

Una vez que este instalado, podemos acceder al web panel desde el navegador http://localhost:5000/ con user: admin y pass:admin
En la siguiente captura, podemos observar las maquinas creadas en los ejercicios anteriores. Dichas maquinas están corriendo, pausadas o detenidas. 

![web_panel](https://www.dropbox.com/s/3x1b9o5qo00v247/webP.png?dl=1)

También podemos acceder a la configuración de las interfaces puente

![web_net](https://www.dropbox.com/s/ekxrkcpb1rnmnj4/webNet.png?dl=1)

###4.2: Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.

Si queremos visualizar y configurar con mas detalle una maquina concreta, basta con pinchar en ella y nos aparecerá un menú de configuración:

![web_centos](https://www.dropbox.com/s/eufv1kzm448r3fl/webCentos.png?dl=1)

Al final de este menú, podemos restringir los recursos disponibles para este contenedor

![restricion](https://www.dropbox.com/s/sk5i0az4v30kld9/restricion.png?dl=1)


##Ejercicio 5: Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor. Usar nginx.

###Jaula
Para crear una jaula, ejecutamos 

	 sudo debootstrap --arch=amd64 dapper /home/jaula/ http://archive.ubuntu.com/ubuntu


Ahora debemos instalar ciertas herramientas para poder realizar la comparativa de rendimiento con el contenedor. Para realizar la
instalación de las siguientes herramientas, he seguido los pasos que Israel hizo en el [ejercicio 5](https://github.com/JJ/GII-2014/blob/master/ejercicios/IsraelBlancas/tema3.md) el año pasado. Sustitullendo **saucy** por **dapper**

	sudo apt-get update //Actualizar repositorio
	sudo apt-get install nginx //Instalar el servidor de aplicación
	sudo apt-get install curl //Para realizar peticiones al servidor web y comprobar que funciona 
	sudo service nginx start //Iniciar el servidor de aplicación
	sudo apt-get install apache2-utils //Para poder utilizar Apache Benchmark

**Nota:** Si a la hora de iniciar el servicio nginx tenemos problemas, debido a que algún proceso esta utilizando el puerto 80
 y no podemos arrancar el servicio, una solución es ejecutar:

	sudo fuser -k 80/tcp

Para liberar el puerto y ya si **sudo service nginx start**

Mediante **curl http://127.0.0.1** podemos comprobar que nginx esta funcionando y con **ifconfig** que la ip de la **jaula dapper** es **10.0.3.1**

![if_config](https://www.dropbox.com/s/pz4r7opwwm9c63c/ifconfig.png?dl=1)

Ahora vamos a lanzar AB 

	ab -n 10000 -c 1000 http://10.0.3.1/

![ab_jaula](https://www.dropbox.com/s/zjpveb3ovjo8dk3/ab_jaula.png?dl=1) 


###Contenedor
Como contenedor, voy a utilizar **caja1** creado en el ejercicio 2 que contiene un Ubuntu. Lo iniciamos mediante 
	
	sudo lxc-start -n caja1

Es necesario instalar las mismas herramientas que en la jaula. Mediante **curl http://127.0.0.1** podemos comprobar que nginx esta funcionando y con **ifconfig** que la ip de la **caja1** es **10.0.3.59**

Ahora vamos a lanzar AB 

	ab -n 10000 -c 1000 http://10.0.3.59/ 

![ab_caja1](https://www.dropbox.com/s/joactz8j7qav313/ab_caja1.png?dl=1)


En vista de los resultados, podemos apreciar que la Jaula ha tardado 0.851 segundos frente a los 1.052 segundos que ha tardado el contenedor. De las 10000 peticiones realizadas en la prueba, la jaula ha fallado 896 mientras que en el contenedor han fallado todas.
Podemos apreciar también que la jaula es capaz de servir 11747.94 peticiones por segundo, mientras que el contenedor solo 9509.40. Por ultimo resaltar que el ratio de transferencia en la jaula es de 9212.04 Kbytes/segundo mientras que en el contenedor es de 7348.00 Kbytes/segundo.

Parece ser que la jaula tiene un mayor rendimiento que el contenedor, aun así estas prueba debería realizarse con un volumen mayor de datos y en mayor número para obtener unos resultados mas fiables. 


##Ejercicio 6: Instalar docker.
Para instalar docker correctamente, es necesario seguir los siguientes pasos:

**Paso 1:** Añadir una llave gpg

	sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

**Paso 2:** Editar el archivo **/etc/apt/sources.list.d/docker.list** y añadir la siguiente entrada si estamos trabajando con ubuntu 14.04

	deb https://apt.dockerproject.org/repo ubuntu-trusty main

**Paso 3:** Actualizar

	sudo apt-get update

**Paso 4:** Instalar recomendaciones, paquete **linux-image-extra**

	sudo apt-get install linux-image-extra-$(uname -r)

**Paso 5:** Instalar Docker

	sudo apt-get install docker-engine

**Paso 6:** Iniciar el servicio

	sudo service docker start

Podemos verificar que **Docker** esta funcionando mediante **sudo docker run hello-world** o **sudo docker info**

![docker](https://www.dropbox.com/s/76180chk8fehjlp/docker.png?dl=1)

Para mas detalles, consultar la documentación de [Docker](https://docs.docker.com/engine/installation/ubuntulinux/)
	
##Ejercicio 7: 

###7.1:Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.

Instalar una imagen ubuntu: 

	sudo docker pull ubuntu		//Crea la imagen
o
	sudo docker run -i -t ubuntu /bin/bash //CRea la imagen y la ejecuta. Lanza un interprete interactivo

Podemos consultar los todos los tapers instalados mediante **sudo docker ps -a** y los que están en ejecución con **sudo docker ps**

![ubuntu](https://www.dropbox.com/s/abo9yxwhcnfkh0b/docker_ubuntu.png?dl=1)

Instalar una imagen CentOS

Otra forma de administrar nuestros dockers sin tener que arrastrar el ID es la siguiente:

**Crear e Iniciar Docker**

	JOB=$(sudo docker run -i -t centos /bin/bash)

**Para Docker**

	sudo docker stop $JOB

**Iniciar Docker**

	sudo docker start $JOB

**Reiniciar Docker**
	
	sudo docker restart $JOB

**Matar el proceso**

	sudo docker kill $JOB

**Borar el Docker**

	sudo docker stop $JOB //Es necesario detener el contenedor
	sudo docker rm $JOB

Finalmente consultamos los contenedores en ejecución:

![centos](https://www.dropbox.com/s/9mpxnhzqw2jgg16/docker_centos.png?dl=1)	

###7.2:Buscar e instalar una imagen que incluya MongoDB.

Instalar una imagen que incluye MongoDB

	sudo docker run mongo //Crea la imagen y la lanza
o
	sudo docker pull mongo	//Crea la imagen

![mongo](https://www.dropbox.com/s/hrforfm3r295pgr/mongo_docker.png?dl=1)



##Ejercicio 8: Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.

He tenido problemas utilizando docker en mi maquina anfitrión. Principalmente el arranque de mi máquina ahora tarda un montón, además los contenedores no pueden realizar update de los repositorios correctamente. Debido a todo esto, voy a reinstalar docker en una maquina virtual y en lugar de utilizar **sudo apt-get install docker-engine** voy a utilizar **sudo apt-get install docker.io**

Retomando el ejercicio, lo primero que es arrancar el contenedor con interprete interactivo:

	sudo docker run -i -t ubuntu

Crear un usuario y asignarle una contraseña

	useradd -d /home/usuario_docker -m usuario_docker
	passwd usuario_docker

Añadir usuario_docker al grupo de usuarios con permiso de superusuario

	adduser usuario_docker sudo

Iniciar sesión con el nuevo usuario

	login user 

Instalamos Nginx y lo iniciamos

	sudo apt-get install nginx
	sudo service nginx start

Comprobamos que funciona

	curl http://127.0.0.1 

![usuario_docker](https://www.dropbox.com/s/fmspjdkn69bt277/usuario_docker.png?dl=1)

	

##Ejercicio 9: Crear a partir del contenedor anterior una imagen persistente con commit.

Pasos para realizar una imagen persistente:

**Paso 1:** Localizar la ID de la maquina que deseamos commitear

	sudo docker ps -a

![ej9](https://www.dropbox.com/s/9fjbk2ij1twlen2/ej9.png?dl=1)

**Paso 2:**Comprobar que la ID es correcta

	sudo docker inspect ID

![ej9_2](https://www.dropbox.com/s/ad1bvp3p8sq4dhk/ej9_2.png?dl=1)

**Paso 3:** Localizar la ID completa de la imagen, buscnado en el fichero json resultado de la instrución anterior el campo ID. Puesto que estoy en una maquina virtual y la ID es demasiado larga para escribirla, voy a utilizar la ID reducida. 

**Paso 4:** Realizar el commit

	sudo docker commit ID nombre_comit

**Paso 5:** Comprobar commit

	sudo docker images

![ej9_3](https://www.dropbox.com/s/3tzezu1qmqrdyno/ej9_3.png?dl=1)

##Ejercicio 10: Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección. 

Para crear nuestra propia imagen, es necesario crear un archivo Dockerfile como este:

	FROM ubuntu:latest

	#Autor
	MAINTAINER Hugo Barzano Cruz <hugobarzano@gmail.com>

	#Actualizar Sistema Base
	RUN sudo apt-get -y update

	#Descargar aplicacion
	RUN sudo apt-get install -y git
	RUN sudo git clone https://github.com/hugobarzano/osl-computer-management.git

	# Instalar Python y PostgreSQL
	RUN sudo apt-get install -y python-setuptools
	RUN sudo apt-get -y install python-dev
	RUN sudo apt-get -y install build-essential
	RUN sudo apt-get -y install python-psycopg2
	RUN sudo apt-get -y install libpq-dev
	RUN sudo easy_install pip
	RUN sudo pip install --upgrade pip

	#Instalamos la aplicacion
	RUN ls
	RUN cd osl-computer-management/ && ls -l
	RUN cd osl-computer-management/ && cat requirements.txt
	RUN cd osl-computer-management/ && sudo pip install -r requirements.txt

	#Realizamos migraciones
	RUN cd osl-computer-management/ && python manage.py syncdb --noinput


Una vez que este creado, le decimos a docker que genere una imagen

	sudo docker build -f Dockerfile -t nombre_imagen . 

Cuando se completen todos los steps, la imagen se habrá creado correctamente.
Podemos comprobarlo con **sudo docker ps -a** o **sudo docker images**

![dockerfile](https://www.dropbox.com/s/bi93eo31r8779n1/dockerfile.png?dl=1)

Para comprobar que esta funcionando correctamente, debemos iniciar el contenedor con la imagen creada:

	sudo docker run -t -i computermanagemet /bin/bash

Entramos en el directorio de la aplicación y la ejecutamos

	python manage.py runserver 0.0.0.0:1111 &

![dockerfile_2](https://www.dropbox.com/s/8dhs351qjdhjofp/dockerfile_2.png?dl=1)

Finalmente mediante el navegador del anfitrión y accediendo a la dirección del docker, podemos comprobar que esta funcionando correctamente. 

![dockerfile_3](https://www.dropbox.com/s/duf5hfgtdv8ivsq/dockerfil_3.png?dl=1)


###Cosas a tener en cuenta: 

Si deseamos iniciar la build desde el principio, es decir no utilizar la cache de un contenedor anterior, podemos utilizar

	sudo docker build -f Dockerfile -t nombre_imagen --no-cache=true ./ 	

Si al arrancar el docker, este no tiene conexión a internet, podemos resolverlo editando **/etc/NetworkManager/NetworkManager.conf** y comentando la línea **dns=dnsmask** y tras esto, reiniciar el servicio con:

	sudo restart network-manager

