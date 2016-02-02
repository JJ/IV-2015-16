# Asignatura: IV Grupo de Practicas Miercoles 8:30h a 10:30h
## Miguel Ángel García Villegas

# Ejercicios Tema 4

## Ejercicio 1.
### Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.

Ejecutamos en el terminal: ```sudo apt-get install lxc```, se instalará la versión 1.0.8

![Versión1.0.8](https://www.dropbox.com/s/ddj9l05e5b10ojk/Captura%20de%20pantalla%20de%202016-01-07%2010%3A39%3A25.png?dl=1)




## Ejercicio 2.
### Comprobar qué interfaces puente se han creado y explicarlos.

Para crear contenedores deberemos también instalar varias
depencencias:
- [x] ```sudo apt-get install lxc-templates```
- [x] ```sudo apt-get install debootstrap```

Vamos a crear un contenedor  
```sudo lxc-create -t ubuntu -n contenedorU```

![Contenedor Debian](https://www.dropbox.com/s/7iqr67qsidhtyh9/ejer2.png?dl=1)

Vamos a iniciar el contenedor creado anteriormente. Ejecutamos en el terminal
```sudo lxc-start -n contenedorU```

Seguidamente tenemos que introducir ```ubuntu``` como usuario y contraseña.

![Contenedor Ubuntu](https://www.dropbox.com/s/mvpqv11t7lt6yzu/Captura%20de%20pantalla%20de%202016-01-07%2012%3A21%3A25.png?dl=1)

Ejecutando ifconfig en el contenedor, aquí podemos ver las interfaces que se han añadido.

![Ifconfig Contenedor Ubuntu](https://www.dropbox.com/s/3ozt3k3gsosb555/2.2.png?dl=1)

La interfaz ```eth0``` es para tener acceso a internet desde el contenedor, y ```lo``` es para la comunicación entre los contenedores.


## Ejercicio 3.

### 3.1 Crear y ejecutar un contenedor basado en Debian.

Vamos a crear un contenedor Debian. Ejecutamos en el terminal  
 ```sudo lxc-create -t debian -n contenedorD```

![Contenedor Debian](https://www.dropbox.com/s/o5gvgfsph4yihro/ejer3.2.png?dl=1)

### 3.2 Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya. Fedora, al parecer, tiene problemas si estás en Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro. Por ejemplo, Óscar Zafra ha logrado instalar Gentoo usando un script descargado desde su sitio, como indica en este comentario en el issue.

Verificamos que tenemos instalado yum, y nos disponemos a crear un contenedor centOS. Ejecutamos en el terminal  
```sudo lxc-create -t centos -n contenedorC```

![Contenedor CentOS](https://www.dropbox.com/s/ifwtpq6avt5zawm/3.2.png?dl=1)

Iniciamos el contenedor ejecutando en el terminal  
``` sudo lxc-start -n contenedorC ```

![Contenedor CentOS](https://www.dropbox.com/s/wfsnk189ik8n5uq/3.2.2.png?dl=1)


## Ejercicio 4.
### 4.1 Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.

Para llevar a cabo éste ejercicio he seguido los pasos de LXC Web panel: https://lxc-webpanel.github.io/install.html

- Ejecutamos en el terminal ```sudo su``` para ser root.
- Ejecutar seguidamente  
 ```wget https://lxc-webpanel.github.io/tools/install.sh -O - | bash ```


![Instalación lxc-webpanel](https://www.dropbox.com/s/614u2hfu0l9kv65/4.0.png?dl=1)

Una vez termina la instalación en el navegador insertamos la dirección que nos indica y nos sale para loguearnos en LXC Web Panel. Insertamos como user y pass ```admin```.

![localhost:5000](https://www.dropbox.com/s/xjekty9oj24oeao/4.1.png?dl=1)

Una vez logueados entramos en el Panel de contenedores, donde podemos ver los contenedores que anteriormente hemos instalado.

![Contenedores en Web Panel](https://www.dropbox.com/s/aglu0ceqefbc1nw/4.2.png?dl=1)

### 4.2 Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.

Para restringir los recursos de un contenedor, primero debemos pararlo, y seguidamente seleccionar el que queremos restringir, en mi caso he elegido el contenedor de Ubuntu, llamado ``` contenedorU ```

![Restricción de recursos contenedorU](https://www.dropbox.com/s/ykdskxgqt0wqavw/4.3.png?dl=1)

## Ejercicio 5.
### Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor. Usar nginx.

Para llevar a cabo éste ejercicio vamos a llevar a cabo los siguientes pasos:

### Contenedor

- Crear y arrancar el contenedor, en mi caso he creado uno nuevo de ubuntu. (Crear contenedor: ```sudo lxc-create -t ubuntu -n my-container``` Arrancar contenedor: ```sudo lxc-start -n my-container``` Usuario y pass: ```ubuntu```)

Instalamos ahora nginx, ejecutando en el terminal, ```sudo apt-get install nginx```

![Install nginx](https://www.dropbox.com/s/4xs5iyngz08a1uv/5.1.png?dl=1)

Arrancamos el servicio ejecutando en el terminal ```sudo service nginx start```

Instalar los paquetes necesarios para poder lanzar ab mediante ```sudo apt-get install apache2-utils```

![Install apache2-utils](https://www.dropbox.com/s/5hef069tvu9llmo/5.2.png?dl=1)

Ejecutar ```ifcongif -a```

![ifconfig -a](https://www.dropbox.com/s/19yc4kyg31jjqqm/5.3.png?dl=1)

Ahora desde otro terminal, ejecutamos ab -n 1000 -c 1000 http://10.0.3.236/.


![ab my-container](https://www.dropbox.com/s/mtu9065bfzv6u9a/5.4.png?dl=1)

### Jaula
Para crear una jaula ejecutamos ```sudo debootstrap --arch=amd64 lucid /home/jaula/jaulaMAGV/ http://archive.ubuntu.com/ubuntu``` en el terminal.

![Crear Jaula](https://www.dropbox.com/s/qhnbcjp6i327tky/5.5.png?dl=1)


Una vez creado después de un tiempo, nos situamos en ```/home/jaula/jaulaMAGV```. En dicha carpeta ejecutamos ```sudo chroot /home/jaula/jaulaMAGV```.

![Desde la Jaula](https://www.dropbox.com/s/d72cxu6d35pfh6b/5.6.png?dl=1)

Ahora tenemos que instalar el paquete nginx ejecutando en el terminal ``` apt-get install nginx ```Una vez instalado, arrancamos el servicio nginx ejecutando en el terminal ```sudo service nginx start```

Para poder hacer ifconfig -a, hay que montar el /proc, para ello debemos ejecutar ```mount -t proc proc /proc```
Y ahora sí podemos ejecutar ```ifconfig -a```.

![ifconfig -a Jaula](https://www.dropbox.com/s/ou6s7qhc9jyvaij/5.7.png?dl=1)

Como anteriormente inicimos con el contenedor, hay que hacer con la jaula.

Instalar los paquetes necesarios para poder lanzar ab mediante ```sudo apt-get install apache2-utils```

![Install apache2-utils](https://www.dropbox.com/s/5hef069tvu9llmo/5.2.png?dl=1)

Ejecutar ```ifcongif -a```

![ifconfig -a](https://www.dropbox.com/s/19yc4kyg31jjqqm/5.3.png?dl=1)

Ahora desde otro terminal, ejecutamos ```ab -n 1000 -c 1000 http://localhost/```.

![ab jaula](https://www.dropbox.com/s/mtu9065bfzv6u9a/5.4.png?dl=1)

Los resultados son algo mejores en la jaula, aunque en este caso son muy parecidos porque se están utilizando una página estática de poco peso.

## Ejercicio 6.
### Instalar docker.

Ejecutar en el terminal, ```sudo apt-get install docker.io```

![Instalar Docker](https://www.dropbox.com/s/ucozw1eba90r7zi/6.0.png?dl=1)

Comprobamos la versión y que está instalado con éxito, ejecutando en el terminal ```docker -v```

![Docker](https://www.dropbox.com/s/v0z5585rr65cef0/6.2.png?dl=1)

Para iniciar con daemon ejecutamos en el terminal ```sudo docker -d &```
![Error](https://www.dropbox.com/s/tx98f72n8t3225b/6.3.png?dl=1)

Esto nos da error, si existe el archivo docker.pid, debemos borrarlo antes de ejecutar el daemon. Para borrarlo ejecutamos ```sudo rm /var/run/docker.pid``` y seguidamente ejecutamos de nuevo ``` sudo docker -d &```


![Daemon](https://www.dropbox.com/s/kyk0gilwrvdqmwg/6.1.png?dl=1)

Comprobamos que ahora si, funciona.


## Ejercicio 7.

### 7.1 Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.

Lo primero es arrancar el servicio, ejecutando el comando ```sudo docker -d &```
Seguidamente creamos la imagen ejecutando el siguiente comando ```sudo docker pull ubuntu```

![Docker](https://www.dropbox.com/s/r5amn1s6b3y9nyj/7.1.png?dl=1)

Podemos comprobar los tapers y la versión ejecutando ```sudo docker ps``` y a continuación ```sudo docker images```

![Tapers](https://www.dropbox.com/s/6mzcykzkjknmvwr/7.2.png?dl=1)

Ejecutamos ```sudo docker run -i -t ubuntu /bin/bash``` para arrancar el contenedor.
![Arrancar contenedor](https://www.dropbox.com/s/miar8ymip7u9cy9/7.3.png?dl=1)

Para paralo hay que ejecutar ```sudo docker stop id```

Con CentOS es el mismo procedimiento.
Pasos a seguir para en el caso centOS.
- ```sudo docker pull centos```
- ```sudo docker ps```
- ```sudo docker images```
- ```sudo docker run -i -t centos /bin/bash```

![caso CentOS](https://www.dropbox.com/s/n0fw0byv2mu24t1/7.4.png?dl=1)


### 7.2 Buscar e instalar una imagen que incluya MongoDB.

Con Mongo es el mismo procedimiento.
Pasos a seguir para en el caso Mongo.
- ```sudo docker pull mongo```
- ```sudo docker ps```
- ```sudo docker images```
- ```sudo docker run -i -t mongo /bin/bash```

![caso Mongo](https://www.dropbox.com/s/jjl0l5b3eqh2iov/7.5.png?dl=1)


## Ejercicio 8.
### Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.

Para poder llevar a cabo todo esto, debemos arrancar el contenedor ejecutando en el terminal:
```sudo docker run -i -t ubuntu```

Nos disponemos a crear un usuario, para ello, ejecutamos de forma independiente
- useradd -d /home/us_docker -m us_docker (Creación usuario)
- passwd us_docker (pass para el usuario)
- sudo adduser us_docker sudo (privilegios para el usuario)

Una vez el usuario está creado y con privilegios nos disponemos a loguearnos. Ejecutamos en el terminal ```login us_docker```

Una vez logueado, instalamos nginx ejecutando en el terminal: ```sudo apt-get install nginx```

![Crear usuario, login e instalación](https://www.dropbox.com/s/ehue4a6mquw2kth/8.1.png?dl=1)

## Ejercicio 9.
### Crear a partir del contenedor anterior una imagen persistente con commit.

Vamos a coger el id del contenedor de Ubuntu que hemos utilizado anteriormente, para esto, debemos de ejecutar en el terminal ```sudo docker ps -a```. Arracamos el contenedor ejecutando en el terminal ```sudo docker start 6c9cd04e17db```

![Id contenedores](https://www.dropbox.com/s/1f78s5ni20ynfnp/9.1.png?dl=1)

Una vez arrancado nos disponemos a realizar el commit, ejecutando en el terminal ```sudo docker commit 6c9cd04e17db img_persistente```

Una vez hemos ejecutado el commit vamos a comprobar si se ha realizado, ejecutando el comando ```sudo docker images``` y comprobamos que ahí está bajo el nombre img_persistente

![Creación commit](https://www.dropbox.com/s/2w3k271jgcvnayi/9.2.png?dl=1)

## Ejercicio 10.
### Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección.

Vamos a crear el fichero Dockerfile para mi proyecto InsertaLogo, en la carpeta previa al proyecto. Nuestro fichero Dockerfile

    # Sistema operativo
    FROM ubuntu:latest

    # Autor
    MAINTAINER Miguel Angel Garcia Villegas <magvugr@gmail.com>

    #Actualizar Sistema Base
    RUN sudo apt-get -y update

    # Instalacion
    RUN sudo apt-get install -y git
    RUN sudo git clone https://github.com/magvugr/InsertaLogo

    #Instalar python
    RUN sudo apt-get -y install python-dev
    RUN sudo apt-get install -y python-setuptools
    RUN sudo apt-get install -y build-essential
    RUN sudo apt-get -y install python-psycopg2
    RUN sudo apt-get -y install libpq-dev
    RUN sudo easy_install pip
    RUN sudo pip install --upgrade pip

    WORKDIR InsertaLogo
    # Instalacion de las dependencias del proyecto
    RUN pip install -r requirements.txt

    EXPOSE 8000
    CMD python manage.py runserver


Vamos a iniciar el servicio docker, ejecutando en el terminal ```sudo docker -d &```. Una vez arrancado dentro del directorio del proyecto crear la imagen ejecutando en el terminal el siguiente comando ```sudo docker build -f Dockerfile -t insertalogo . ``` (importante, No mayusculas y añadir el punto del final)

![Creación imaginsertalogo](https://www.dropbox.com/s/kusvur9wtbyc542/10.6.png?dl=1)

Mediante el comando ```sudo docker images``` comprobamos que se ha creado con éxito.

![imagen docker insertalogo](https://www.dropbox.com/s/5alveu8mtjrosj4/10.7.png?dl=1)

Arrancamos ahora la imagen ejecutando en el terminal ```sudo docker run -t -i inserta_logo /bin/bash```, hacemos un ```ifconfig -a``` para saber la ip, y nos vamos a la carpeta de nuestro proyecto.

![insertalogo docker](https://www.dropbox.com/s/vhp4v72sszpwf7w/10.5.png?dl=1)

Una vez en nuestra carpeta de proyecto ejecutamos

![python manage.py](https://www.dropbox.com/s/0vrifpy3ailwgkm/10.4.png?dl=1)

Nos vamos al navegador ponemos la dirección ip con el puerto indicado y el resultado :-)

![resultado](https://www.dropbox.com/s/5lf6l9ivkguuteh/Captura%20de%20pantalla%20de%202016-01-15%2013%3A17%3A14.png?dl=1)

Si al arrancar el docker, este no tiene conexión a internet, podemos resolverlo editando /etc/NetworkManager/NetworkManager.conf y comentando la línea dns=dnsmask y tras esto, reiniciar el servicio con:

sudo restart network-manager
