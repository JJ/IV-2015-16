# Ejercicios Tema 4
  
## Ejercicio 1

Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.


![instalacion_lxc](http://i.imgur.com/XlewdiJ.png)

Compruebo versión:

```
jesmorc@jesmorc-bigPC ~/IV/IV-2015-16/ejercicios/JesusGarciaGodoy $ lxc-monitor --version
1.0.8

```

Compruebo configuración:

```
jesmorc@jesmorc-bigPC ~/IV/IV-2015-16/ejercicios/JesusGarciaGodoy $ lxc-checkconfig 
Kernel configuration not found at /proc/config.gz; searching...
Kernel configuration found at /boot/config-3.16.0-38-generic
--- Namespaces ---
Namespaces: enabled
Utsname namespace: enabled
Ipc namespace: enabled
Pid namespace: enabled
User namespace: enabled
Network namespace: enabled
Multiple /dev/pts instances: enabled

--- Control groups ---
Cgroup: enabled
Cgroup clone_children flag: enabled
Cgroup device: enabled
Cgroup sched: enabled
Cgroup cpu account: enabled
Cgroup memory controller: enabled
Cgroup cpuset: enabled

--- Misc ---
Veth pair device: enabled
Macvlan: enabled
Vlan: enabled
Bridges: enabled
Advanced netfilter: enabled
CONFIG_NF_NAT_IPV4: enabled
CONFIG_NF_NAT_IPV6: enabled
CONFIG_IP_NF_TARGET_MASQUERADE: enabled
CONFIG_IP6_NF_TARGET_MASQUERADE: enabled
CONFIG_NETFILTER_XT_TARGET_CHECKSUM: enabled

--- Checkpoint/Restore ---
checkpoint restore: enabled
CONFIG_FHANDLE: enabled
CONFIG_EVENTFD: enabled
CONFIG_EPOLL: enabled
CONFIG_UNIX_DIAG: enabled
CONFIG_INET_DIAG: enabled
CONFIG_PACKET_DIAG: enabled
CONFIG_NETLINK_DIAG: enabled
File capabilities: enabled

Note : Before booting a new kernel, you can check its configuration
usage : CONFIG=/path/to/config /usr/bin/lxc-checkconfig

```

## Ejercicio 2

Comprobar qué interfaces puente se han creado y explicarlos.

Instalo la caja ubuntu:

![instalar_caja_ubuntu](http://i.imgur.com/n8h1571.png)

Accedo con las credenciales proporcionadas al acabar la instalación (*ubuntu, ubuntu*), y se arranca la caja con:

```
sudo lxc-start -n caja-ubuntu
```

Compruebo las interfaces de red:

![ifconfig_caja_ubuntu](http://i.imgur.com/jlZOWch.png)

Compruebo en mi PC host como se ha creado otra interfaz de red, la cual comunica a **caja-ubuntu** con internet.

![if_config_mipc]()

## Ejercicio 3

### 1.Crear y ejecutar un contenedor basado en Debian.

El contenedor del ejercicio anterior funciona sin problemas.

### 2.Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya. Fedora, al parecer, tiene problemas si estás en Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro.

He procedido a instalar **cirros**.

![caja_cirros](http://i.imgur.com/JknxG6c.png)

## Ejercicio 4

### 1.Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.

Como **root**, ejecutamos el siguiente comando:

```
wget https://lxc-webpanel.github.io/tools/install.sh -O - | bash
```
Y se nos instalará de esta manera:

![instalacion_lsc_webpanel](http://i.imgur.com/qHKhzaY.png)

Entramos a *localhost:5000* y nos aparece, tras entrar con las credenciales *admin, admin*, la pantalla inicial de **LXC Webpanel**, desde donde he podido iniciar uno de mis contenedores y parar el otro, tal y como se ve en la siguiente imagen:

![lxc_webpanel_intro](http://i.imgur.com/esn2ND9.png)


### 2.Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.

He procedido a tocar la configuración de mi *caja-ubuntu*, poniéndole que use máximo 1 GB de memoria (2 sumando la SWAP), y no dejándole usar más de 2 núcleos.

![caja_ubuntu_config](http://i.imgur.com/C7roFBj.png)


## Ejercicio 5

Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor. Usar nginx.

Primero instalo nginx con:

```
jesmorc@jesmorc-bigPC ~ $ sudo apt-get install nginx
[sudo] password for jesmorc: 
Leyendo lista de paquetes... Hecho
Creando árbol de dependencias       
Leyendo la información de estado... Hecho
Se instalarán los siguientes paquetes extras:
  nginx-common nginx-core
Paquetes sugeridos:
  fcgiwrap nginx-doc
Se instalarán los siguientes paquetes NUEVOS:
  nginx nginx-common nginx-core
0 actualizados, 3 se instalarán, 0 para eliminar y 190 no actualizados.
Necesito descargar 348 kB de archivos.
Se utilizarán 1.297 kB de espacio de disco adicional después de esta operación.
¿Desea continuar? [S/n] s
Des:1 http://archive.ubuntu.com/ubuntu/ trusty-updates/main nginx-common all 1.4.6-1ubuntu3.3 [18,1 kB]
Des:2 http://archive.ubuntu.com/ubuntu/ trusty-updates/main nginx-core amd64 1.4.6-1ubuntu3.3 [324 kB]

[...]

```

Después creo una jaula con:

```
mkdir jaulas

sudo debootstrap --arch=amd64 lucid /home/jaulas/lucid/ http://archive.ubuntu.com/ubuntu
```

Una vez creada la jaula vamos a configurarla con los siguientes comandos:

```
sudo chroot /home/jaulas/lucid/
```

Ahora estamos como *root* y procedemos a montar el fichero proc con el comando:

```
mount -t proc proc /proc
```



## Ejercicio 6 

Instalar docker.

Se instala sencillamente con el comando:

```
sudo apt-get install docker.io
```
![instalar_docker](http://i.imgur.com/By9ZtIq.png)

Comprobamos la versión con:

```
jesmorc@jesmorc-bigPC ~/IV/IV-2015-16 $ docker -v
Docker version 1.6.2, build 7c8fca2
```

Y vemos que en este caso la instalada es la **1.6.2**. El servicio se arranca y se detiene como otro servicio cualquiera, de esta manera:

```
sudo service docker start
sudo service docker start
```
Al instalarlo se ha iniciado automáticamente, así que ya está activo (se puede comprobar con *sudo service docker status*).

Comprobamos que funciona llamando a su *hello world* , el cual buscará en línea al no tenerlo nosotros en local.

![docker_helloworld](http://i.imgur.com/DIgE3L4.png)

Eliminar el fichero *docker.pid* cada vez que vayamos a ejecutar Docker con:

```
sudo rm /var/run/docker.pid
```


## Ejercicio 7

### 1.Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.

Instalamos la imagen alternativa de Ubuntu:

Arrancamos el servicio mediante:
```
sudo docker -d &
```
![docker_initialize](http://i.imgur.com/iHSO0Ei.png)

Creamos la imagen con:

```
sudo docker pull ubuntu
```

Comprobamos los tapers con:

```
sudo docker ps -a
```
![docker_taper](http://i.imgur.com/fXYxb2z.png)

Y los que se están ejecutando con:

```
sudo docker ps
```
![docker_taper_2](http://i.imgur.com/egwEw2e.png)

Arrancamos el contenedor:
```
sudo docker run -i -t ubuntu /bin/bash
```

Para **CentOS** hacemos lo mismo, como podemos ver en la siguiente imagen:

![docker_centos](http://i.imgur.com/ZpGFWeT.png)


### 2.Buscar e instalar una imagen que incluya MongoDB.

Se instala fácilmente con:

```
sudo docker pull mongo
```

Vemos que está instalada, junto con las previamente instaladas:

![docker_images](http://i.imgur.com/mtlUrJh.png)


## Ejercicio 8

Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.

Con el contenedor de *Ubuntu* iniciado (**), estando dentro creamos un usuario con:
```
useradd -d /home/us_docker -m us_docker
```

Le creamos una contraseña con:
```
passwd us_docker
```

Le añadimos privilegios con:
```
sudo adduser us_docker sudo
```

Nos logueamos con el usuario:
```
login us_docker
```

![docker_ubuntu_user](http://i.imgur.com/NTd1sUF.png)


Instalamos *nginx* con:
```
sudo apt-get install nginx
```

Instalamos *curl* con:
```
sudo apt-get install curl
```

Verificamos que funciona con:
```
curl 127.0.0.1
```


## Ejercicio 9

Crear a partir del contenedor anterior una imagen persistente con commit.

Si no está arrancado, arrancamos el contenedor mediante la orden: 
```
sudo docker start 721c92ad2ada
```
*NOTA*: la ID corta se obtiene ejecutando *sudo docker ps -a*


Comprobamos las ID largas para verificar que se esta trabajando con la imagen correcta:

```
sudo docker inspect 721c92ad2ada
```
![docker_inspect](http://i.imgur.com/jXEmO5S.png)

```
sudo docker images -notrunc
```
![docker_images_notrunc](http://i.imgur.com/M0Zb8Ju.png)


Realizamos el commit:
```
sudo docker commit  721c92ad2ada persistent_img
```

Comprobamos que se ha realizado el commit:
```
sudo docker images -notrunc
```
![docker_commit](http://i.imgur.com/X4gJH0e.png)


## Ejercicio 10

Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección.


Ejercicio realizado desde mi PC con **LinuxMint 17.2** .

Teniendo docker corriendo, creamos un archivo [**Dockerfile**](https://github.com/jesmorc/Proyecto-IV-modulo1/blob/master/Dockerfile) dentro de la carpeta del proyecto:

```
FROM ubuntu:latest

#Autor
MAINTAINER Jesus Garcia Godoy <jesusgg90@hotmail.com>

#Actualizar Sistema Base
RUN sudo apt-get update
#Descargar aplicacion
RUN sudo apt-get install -y git
RUN sudo git clone https://github.com/jesmorc/Proyecto-IV-modulo1

#Instalar paquetes necesarios
RUN sudo apt-get install -y python-setuptools
RUN sudo apt-get -y install python-dev
RUN sudo apt-get -y install build-essential
RUN sudo apt-get -y install python-psycopg2
RUN sudo apt-get -y install libpq-dev
RUN sudo apt-get install -y libmysqlclient-dev
RUN sudo apt-get install -y python-dev
RUN sudo easy_install pip
RUN sudo pip install --upgrade pip
RUN sudo pip install MySQL-python
RUN sudo pip install Flask
RUN sudo pip install nose

#Instalar la app
RUN cd Proyecto-IV-modulo1 && sudo pip install -r requirements.txt
```

En el directorio del repo, creamos una imagen con:
```
sudo docker build -t jesmorc_iv .
``` 
Esto cogerá por defecto el fichero *Dockerfile* si existe, tal y como vemos aquí:

![docker_jesmorc_iv](http://i.imgur.com/oczpPyj.png)

Ahora, cargamos la imagen con:
```
sudo docker run -t -i jesmorc_iv /bin/bash
```

Estando dentro, comprobamos la IP, porque luego la usaremos:

![docker_jesmorc_iv_ifconfig](http://i.imgur.com/X9EL12o.png)

Ejecutamos la aplicación(desde dentro):

![workinout_runserver](http://i.imgur.com/0GPpGwn.png)

En el navegador, en la dirección *http://172.17.0.19:5000/* (IP vista antes)podemos ver que la app funciona bien:

![workinout_working](http://i.imgur.com/iBOyF0T.png)

Hecho esto, procedemos a crear nuestra imagen en la página web de docker. Tras registrarme en su página me he creado un repositorio con *visibilidad pública*.

![docker_register](http://i.imgur.com/diwrPTM.png)

![docker_created_repo](http://i.imgur.com/KEHDXIW.png)

Ahora, introduzco el siguiente comando:
```
sudo docker build -f Dockerfile -t jesmorc/proyecto-iv:latest --no-cache=true ./
```

Me logueo con las credenciales de Docker:

```
sudo docker login
```

Y finalmente hago el push al repositorio de Docker:

```
sudo docker push jesmorc/proyecto-iv:latest
```

[**ENLACE A DOCKER DEL PROYECTO**](https://hub.docker.com/r/jesmorc/proyecto-iv/)

Para una mayor eficiencia he procedido a crear el siguiente script, el cual se encuentra en la carpeta *scripts* y se llama [*docker.sh*](https://github.com/jesmorc/Proyecto-IV-modulo1/blob/master/scripts/docker.sh). Contiene lo siguiente:

```
#!/bin/bash

#Actualizamos e instalamos docker
sudo apt-get update
sudo apt-get install -y docker-engine

#Descargar la imagen
sudo docker pull jesmorc/proyecto-iv:latest
#Ejecuta la imagen
sudo docker run -i -t jesmorc/proyecto-iv:latest /bin/bash
```
