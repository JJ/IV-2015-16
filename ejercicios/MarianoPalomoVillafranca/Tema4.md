Tema 4
===
> Mariano Palomo Villafranca

#### Ejercicio 1: Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en [GitHub](http://github.com/lxc/lxc) como en el [sitio web](http://linxcontainers.com/) está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.

Lo instalamos mediante: `sudo apt-get install lxc`.

Comprobamos la versión instalada:
```
$ lxc-ls --version
1.1.5
```

Y ahora, corroboramos que todo está correctamente con:

```
$ lxc-checkconfig
Kernel configuration not found at /proc/config.gz; searching...
Kernel configuration found at /boot/config-3.19.0-30-generic
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
usage : CONFIG=/path/to/config /usr/local/bin/lxc-checkconfig
```

#### Ejercicio 2: Comprobar qué interfaces puente se han creado y explicarlos.

En primer lugar, creamos un contedenor llamado `ubuntu01`:

```
$ sudo lxc-create -t ubuntu -n ubuntu01
```

Una vez terminado el proceso de descarga e instalación, la arrancamos con la orden:

```
$ sudo lxc-start -n ubuntu01
```

Una vez arrancada, ingresamos con usuario y contraseña "_ubuntu_" y listamos los interfaces con `ifconfig -a`. La primera de ellas, `lxcbr0`, corresponde a un interfaz puente, que permite que el contenedor tenga acceso a internet y la segunda es la encargada de comunicar diferentes contenedores.

#### Ejercicio 3.
##### 1. Crear y ejecutar un contenedor basado en Debian.

Para ello, basta con ejecutar:

```
$ sudo lxc-create -t debian -n debian01
$ sudo lxc-start -n debian01
```

##### 2. Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota: Fedora, al parecer, tiene problemas si estás en Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro. Por ejemplo, [Óscar Zafra ha logrado instalar Gentoo usando un script descargado desde su sitio, como indica en este comentario en el issue](https://github.com/IV-GII/GII-2013/issues/87#issuecomment-28639976).

Ahora, probamos a instalar CentOS, por ejemplo. Para ello, previamente instalamos el gestor de paquetes `yum`: `sudo apt-get install yum`.

A continuación, creamos el contenedor con `sudo lxc-create -t centos -n centos01` y establecemos la contraseña con `sudo chroot /var/lib/lxc/centos01/rootfs passwd`. Por últomo la iniciamos con `sudo lxc-start -n centos01`. 

#### Ejercicio 4:
##### 1. Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.
En modo de superusuario ejecutamos:

```
$ wget https://lxc-webpanel.github.io/tools/install.sh -O - | bash
```

Y ahora accedemos a [http://localhost:5000/](http://localhost:5000/) con usuario y contraseña _admin_.

##### 2. Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.
Para ello, tras hacer click sobre alguno de los contenedores, accedemos a la opción correspondiente del menú y aparecerá la siguiente página:

![Ejercicio4.2](http://i292.photobucket.com/albums/mm28/mpvillafranca/restriccionwebpanel_zpsxuc0ukiq.png)
#### Ejercicio 5: Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor. Usar nginx.
Como contenedor, utilizaremos el creado en el Ejercicio 2 (ubuntu01). Para la jaula, podemos hacer uso de *debootstrap*, ejecutando lo siguiente:

```
$ sudo apt-get install debootstrap
$ sudo debootstrap --arch=amd64 lucid /home/jaula/
$ sudo chroot /home/jaula
```

Ahora, instalamos `nginx` y `curl`, para comprobar que nginx funcione correctamente.

```
$ sudo apt-get update
$ sudo apt-get install nginx
$ sudo apt-get install curl
```

Y ahora, probamos el rendimiento de la jaula contra su IP con `ab -n 10000 -c 1000 http://10.0.3.1/`, donde `-n 10000` hace que se solicite 10000 veces la página y `-c 1000` que se haga concurrentemente de mil en mil.

En el caso del contenedor, una vez iniciado, instalamos `nginx` de igual modo y ejecutamos el Apache Benchmark para su IP: `ab -n 10000 -c 1000 http://10.0.3.43/`.

Los resultados obtenidos son:

- Jaula: 0.795 segundos
- Contenedor: 0.988 segundos

Además, de las 10000 peticiones realizadas, la jaula ha fallado 920 mientras que en el contenedor han fallado practicamente todas. Por tanto, podemos concluir que las jaulas pueden manejar un mayor número de peticiones que los contenedores.

#### Ejercicio 6: Instalar docker.

Para ello, basta con ejecutar: `sudo apt-get -y install docker.io` e iniciarlo con `sudo docker -d &`.

#### Ejercicio 7:
##### 1. Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.

Una vez arrancado el servicio docker instalamos ubuntu y centOS con:

```
$ sudo docker pull ubuntu
$ sudo docker pull centos
```

Y comprobamos la instalación con:

```
$ sudo docker run ubuntu ls
$ sudo docker run centos ls
```
##### 2. Buscar e instalar una imagen que incluya MongoDB.

Para ello, basta con ejecutar:`sudo docker pull mongo` y comprobar la instalación con `sudo docker run mongo ls`.

#### Ejercicio 8: Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.

Arrancamos el contenedor y accedemos al terminal: `sudo docker run -i -t ubuntu /bin/bash`.

```
$ sudo docker run -i -t ubuntu /bin/bash
root@3337d368fde6:/# useradd -d /home/mpvillafranca -m mpvillafranca
root@3337d368fde6:/# passwd mpvillafranca
Enter new UNIX password: 
Retype new UNIX password: 
passwd: password updated successfully
root@3337d368fde6:/# sudo adduser mpvillafranca sudo
Adding user `mpvillafranca' to group `sudo' ...
Adding user mpvillafranca to group sudo
Done.
root@3337d368fde6:/# login mpvillafranca
Password: 
Welcome to Ubuntu 14.04 LTS (GNU/Linux 3.19.0-39-generic x86_64)

 * Documentation:  https://help.ubuntu.com/

The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

mpvillafranca@3337d368fde6:~$ sudo apt-get install nginx
```

#### Ejercicio 9: Crear a partir del contenedor anterior una imagen persistente con commit.

En la máquina anfitriona ejecutamos: `sudo docker ps -a=false`, obteniendo la ID del contenedor: 3337d368fde6. Ahora guardamos el estado del contenedor actual con: `sudo docker commit 3337d368fde6 primer-commit` y comprobamos que se ha creado una nueva imagen: `sudo docker images`.

#### Ejercicio 10: Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección.

En primer lugar, creamos nuestro `Dockerfile` en el directorio raiz del proyecto con el siguiente contenido:

```
FROM ubuntu:latest

#Autor
MAINTAINER Mariano Palomo Villafranca <mpvillafranca@correo.ugr.es>

#Actualizar el sistema
RUN sudo apt-get -y update

#Instalar git y descargar la aplicacion
RUN sudo apt-get install -y git
RUN sudo git clone https://github.com/mpvillafranca/hear-cloud.git

# Instalar Python y PostgreSQL
RUN sudo apt-get install -y python-setuptools
RUN sudo apt-get -y install python-dev
RUN sudo apt-get -y install build-essential
RUN sudo apt-get -y install python-psycopg2
RUN sudo apt-get -y install libpq-dev
RUN sudo easy_install pip
RUN sudo pip install --upgrade pip

#Instalamos las dependencias y la aplicacion
RUN cd hear-cloud/ && sudo pip install -r requirements.txt

#Realizamos migraciones
RUN cd hear-cloud/ && python manage.py syncdb --noinput
```

Y, situándonos en la raiz, ejecutamos: `sudo docker build -t hearcloud-docker .`. Ahora, ejecutamos y accedemos a la terminal del contenedor `sudo docker run -t -i hearcloud-docker /bin/bash` y lanzamos la aplicación: `python manage.py runserver 0.0.0.0:8000`.

Por último, accedemos desde el navegador a través de la IP del contenedor y comprobamos que todo funciona correctamente.
