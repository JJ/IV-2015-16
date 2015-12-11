# Tema 4
### Ejercicio 1: Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.

Lo instalamos usando apt-get:

    # apt-get install lxc

Podemos comprobar la compatibilidad con:
    $ lxc-checkconfig
    Kernel config /proc/config.gz not found, looking in other places...
    Found kernel config file /boot/config-3.2.0-92-generic
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
    File capabilities: enabled

    Note : Before booting a new kernel, you can check its configuration
    usage : CONFIG=/path/to/config /usr/bin/lxc-checkconfig

Veamos ahora la versión instalada:

    $ lxc-version
    lxc version 0.7.5

Como es una versión antigua voy a añadir su repositorio y actualizar:

    # add-apt-repository ppa:ubuntu-lxc/lxc-stable
    # apt-get update
    # apt-get install lxc
    $ lxc-ls version
    1.1.5

### Ejercicio 2: Comprobar qué interfaces puente se han creado y explicarlos.

Primero voy a crear un contenedor de prueba:

    # lxc-create -t ubuntu -n testubuntu

Arranco con:

    # lxc-start -n testubuntu

Para acceder a una shell de un container ejecutamos:

    # lxc-console -n testubuntu

O bien podemos usar *ssh*:

    $ ssh ubuntu@ip-container

![http://i1376.photobucket.com/albums/ah6/jesusgn90/lxc2_zps79uupuch.png](http://i1376.photobucket.com/albums/ah6/jesusgn90/lxc2_zps79uupuch.png)

Para ver las interfaces ejecutamos desde fuera del contenedor:
    
    $ ifconfig -a

Tenemos la interfaz puente *lxcbr0* por la cual tenemos entre otras cosas acceso a internet desde nuesto contenedor.

###Ejercicio 3.
####1. Crear y ejecutar un contenedor basado en Debian.

    # lxc-create -t debian -n testdebian
    # lxc-start -n testdebian

####2. Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora.

    # lxc-create -t fedora -n testfedora
    # lxc-start -n testfedora

A través del lxc-webpanel podemos ver de un vistazo el estado de nuestros contenedores:

![http://i1376.photobucket.com/albums/ah6/jesusgn90/lxc6_zps23nclrym.png](http://i1376.photobucket.com/albums/ah6/jesusgn90/lxc6_zps23nclrym.png)

### Ejercicio 4: 
####1. Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.

    $ wget https://lxc-webpanel.github.io/tools/install.sh -O - | sudo bash

    http://localhost:5000/ 

Con usuario y contraseña admin.
    
####2. Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.

Hacemos click en el contenedor que queremos restringir y nos desplazamos hacia abajo, deberíamos ver lo siguiente:

![http://i1376.photobucket.com/albums/ah6/jesusgn90/lxc_zpsh2whj9nu.png](http://i1376.photobucket.com/albums/ah6/jesusgn90/lxc_zpsh2whj9nu.png)

Hacemos click en *Apply* y listo.

### Ejercicio 5. Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor. Usar nginx.

Test contra el container:

    $ ab -n 100000 -c 100 http://10.0.3.171/
    Server Software:        nginx/1.1.19
    Server Hostname:        10.0.3.171
    Server Port:            80

    Document Path:          /
    Document Length:        151 bytes

    Concurrency Level:      100
    Time taken for tests:   46.593 seconds
    Complete requests:      100000
    Failed requests:        0
    Write errors:           0

Crear la jaula:

    $ mkdir testjaula
    # debootstrap --arch=amd64 lucid ./testjaula http://archive.ubuntu.com/ubuntu
    # chroot ./testjaula

### Ejercicio 6. Instalar Docker

Podemos ver unas detalladas instrucciones de instalación para Linux en [http://docs.docker.com/linux/step_one/](http://docs.docker.com/linux/step_one/)

    wget -qO- https://get.docker.com/ | sh

###Ejercicio 7
####1.-Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.

    # docker pull ubuntu:xx.xx

Por ejemplo:

    # docker pull ubuntu:14.04

También podemos simplemente usar la *latest*:

    # docker pull ubuntu

Para CentOS se actua de igual forma:

    # docker pull centos

####2.-Buscar e instalar una imagen que incluya MongoDB.

He buscado en [https://hub.docker.com](https://hub.docker.com) y he encontrado una imagen oficial en [https://hub.docker.com/_/mongo/](https://hub.docker.com/_/mongo/), para instalarla ejecutamos:

    # docker pull mongo

Para ver las imagenes que tenemos instaladas usamos:

    # docker images

![http://i1376.photobucket.com/albums/ah6/jesusgn90/lxc4_zpsw27va34j.png](http://i1376.photobucket.com/albums/ah6/jesusgn90/lxc4_zpsw27va34j.png)

### Ejercicio 8. Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.
En general el crear usuarios o instalar software se realiza de igual forma que si usamos ese sistema operativo, si es un container ubuntu por ejemplo, pues usaremos apt-get.

El paso de crear un usuario me lo salto, voy a instalar nginx en un container basado en mi propia imagen del proyecto y comprobaremos el mapeo de puertos.

    # docker run -p 80 -it jesusgn90/try-2-learn /bin/bash
    # apt-get install nginx

En una terminal externa al contenedor ejecutamos:

    # docker ps
    CONTAINER ID        IMAGE                   COMMAND             CREATED             STATUS              PORTS                   NAMES
    8f3fe40254ba        jesusgn90/try-2-learn   "/bin/bash"         7 minutes ago       Up 7 minutes        0.0.0.0:32772->80/tcp   gloomy_lamarr

Vemos que esta mapeado el puerto 32772 al puerto 80 del container, que es el que por defecto sirven los servidores web como Apache, Nginx, etc ... abrimos nuestro navegador y vamos a:
    
    http://localhost:32772/

![http://i1376.photobucket.com/albums/ah6/jesusgn90/lxc5_zps0fluqr5f.png](http://i1376.photobucket.com/albums/ah6/jesusgn90/lxc5_zps0fluqr5f.png)

 
###Ejercicio 9. Crear a partir del contenedor anterior una imagen persistente con commit.

De forma general el protocolo para trabajar es:

    1. docker pull una-imagen
    2. docker run -it una-imagen /bin/bash
    3. Hacer cambios(instalar software, editar ficheros, etc ...)
    
    En una shell externa:

    4. docker ps #vemos el id del container
    5. docker commit id-container imagen-nueva

###Ejercicio 10. Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección.

Dockerfile:

    FROM jpetazzo/dind

    MAINTAINER Jesús Ángel González Novez <jesusgonzaleznovez@gmail.com> 

    RUN apt-get update
    RUN apt-get install -y nodejs
    RUN apt-get install -y npm
    RUN echo 'alias node="nodejs"' >> ~/.bashrc
    RUN . ~/.bashrc

    RUN cd /home/ && git clone https://github.com/jesusgn90/Try-2-Learn

    RUN cd /home/Try-2-Learn && npm install

Repositorio de Dockerhub aquí:

    [https://hub.docker.com/r/jesusgn90/try-2-learn/](https://hub.docker.com/r/jesusgn90/try-2-learn/)

Docker Pull Command:

    docker pull jesusgn90/try-2-learn

Uso de la imagen:

    docker run --privileged -p 3000 -it jesusgn90/try-2-learn 

Una vez dentro del container arrancaremos la aplicación...

    cd home/Try-2-Learn
    node bin/www
    docker -d &
