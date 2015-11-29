#Tema 4 - Virtualización ligera usando contenedores
##Rafael Lachica Garrido

##Ejercicio 1 - Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.

Para instalar lo hacemos a través de apt-get:
```
rafaellg8@system32:~/Documentos/GII/Cuarto/IV/IV-2015-16/ejercicios/RafaelLachicaGarrido$ sudo apt-get install lxc
```
Comprobamos que la versión es mayor a la 1.0:
![imagenLXC-Version](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-11-17%20132333_zpswkvv3c99.png)

Comprobamos la configuración establecida esté todo correcto:
![imagen](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-11-17%20133408_zps1racbchq.png)

##Ejercicio 2 - Comprobar qué interfaces puente se han creado y explicarlos.

Instalamos la caja con ubuntu:
```
rafaellg8@system32:~$ sudo lxc-create -t ubuntu -n ubuntu-caja
Checking cache download in /var/cache/lxc/precise/rootfs-amd64 ... 
Installing packages in template: ssh,vim,language-pack-en,language-pack-es
Downloading ubuntu precise minimal ...
```

Termina y nos da los datos para acceder:
```
##
# The default user is 'ubuntu' with password 'ubuntu'!
# Use the 'sudo' command to run tasks as root in the container.
##
```

Accedemos y arrancamos la caja:
```
 sudo lxc-start -n ubuntu-caja
```


Comprobamos la configuración de las interfaces de red:
```
ubuntu@ubuntu-caja:~$ ifconfig
eth0      Link encap:Ethernet  direcciónHW 00:16:3e:ac:d6:c4  
          Direc. inet:10.0.3.67  Difus.:10.0.3.255  Másc:255.255.255.0
          Dirección inet6: fe80::216:3eff:feac:d6c4/64 Alcance:Enlace
          ACTIVO DIFUSIÓN FUNCIONANDO MULTICAST  MTU:1500  Métrica:1
          Paquetes RX:42 errores:0 perdidos:0 overruns:0 frame:0
          Paquetes TX:22 errores:0 perdidos:0 overruns:0 carrier:0
          colisiones:0 long.colaTX:1000 
          Bytes RX:5769 (5.7 KB)  TX bytes:2284 (2.2 KB)

lo        Link encap:Bucle local  
          Direc. inet:127.0.0.1  Másc:255.0.0.0
          Dirección inet6: ::1/128 Alcance:Anfitrión
          ACTIVO BUCLE FUNCIONANDO  MTU:65536  Métrica:1
          Paquetes RX:0 errores:0 perdidos:0 overruns:0 frame:0
          Paquetes TX:0 errores:0 perdidos:0 overruns:0 carrier:0
          colisiones:0 long.colaTX:0 
          Bytes RX:0 (0.0 B)  TX bytes:0 (0.0 B)
```

Tiene interfaces normales como cualquier PC.
Probamos ahora nuestra interfaces locales, de nuestro PC local a ver si han sido modificadas:

![imagenIfconfig](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-11-17%20141323_zpsqasmqost.png)

Vemos que nos crea la interfaz nueva de lxcbr, que la usa para que nos podamos comunicar desde el contenedor con internet.

##Ejercicio 3: Crear y ejecutar un contenedor basado en Debian.
##En general, crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya.
Como ya he instalado el contenedor de ubuntu, crearé otro de **cirros**:
```
rafaellg8@system32:~$ sudo lxc-create -t cirros -n cirrosBox
--2015-11-23 18:42:31--  http://download.cirros-cloud.net/0.3.4/cirros-0.3.4-x86_64-lxc.tar.gz
Resolviendo download.cirros-cloud.net (download.cirros-cloud.net)... 69.163.241.114
Conectando con download.cirros-cloud.net (download.cirros-cloud.net)[69.163.241.114]:80... conectado.
Petición HTTP enviada, esperando respuesta... 200 OK
```

##Ejercicio 4:
### a) Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.
### b)Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.
Seguimos este tutorial de lxc para instalarlo [lxc-webpage](https://lxc-webpanel.github.io/install.html).

Ejecutamos como superusuario la orden:
```
wget https://lxc-webpanel.github.io/tools/install.sh -O - | bash
```
Esto descarga y ejecuta el script. Nos sale la instalación:
```
root@system32:/home/rafaellg8#  wget https://lxc-webpanel.github.io/tools/install.sh -O - | bash
--2015-11-23 18:50:01--  https://lxc-webpanel.github.io/tools/install.sh
Resolviendo lxc-webpanel.github.io (lxc-webpanel.github.io)... 23.235.43.133
Conectando con lxc-webpanel.github.io (lxc-webpanel.github.io)[23.235.43.133]:443... conectado.
Petición HTTP enviada, esperando respuesta... 200 OK
Longitud: 2678 (2,6K) [application/x-sh]
Grabando a: “STDOUT”

100%[===============================================================================================================================>] 2.678       --.-K/s   en 0s      

2015-11-23 18:50:02 (200 MB/s) - escritos a stdout [2678/2678]

 _     __   _______  __          __  _       _____                 _ 
| |    \ \ / / ____| \ \        / / | |     |  __ \               | |
| |     \ V / |       \ \  /\  / /__| |__   | |__) |_ _ _ __   ___| |
| |      > <| |        \ \/  \/ / _ \ '_ \  |  ___/ _` | '_ \ / _ \ |
| |____ / . \ |____     \  /\  /  __/ |_) | | |  | (_| | | | |  __/ |
|______/_/ \_\_____|     \/  \/ \___|_.__/  |_|   \__,_|_| |_|\___|_|


Adding /etc/init.d/lwp...
Done
Starting server...done.
Connect you on http://your-ip-address:5000/

```
Ahora abrimos ```localhost:5000``` en el navegador y tenemos nuestras opciones de lxc y arrancamos nuestras cajas:
**Nota** usuario y contraseña admin.
![box](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/cf633b5e-c3ff-4fb0-bd97-13703dd6809b_zpsx4g2znxn.png)

b) Restringir recursos:
Para ello paramos las máquinas primero y después elegimos en cada contenedor los recursos, yo por ejemplo, como en local tengo ubuntu y después hay que comparar, tocaré los recursos de ubuntu:
![boxsetting](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/eae7486f-0055-4056-939f-644f64897c73_zpsnqbgcser.png)

En mi caso he ajustado sólo 1 GB para la memoria RAM, y que funcione sólo con 2 de los 4 núcleos.

##Ejercicio 5. Comparar servidores usando nginx entre jaulas y contenedores.
Para crear una jaula usaré el software que ya me viene instalado en ubuntu llamado **debootstrap**. He usado el siguiente enlace para crearlas: [fuente](https://help.ubuntu.com/community/BasicChroot)
Procedemos a crear la jaula:
 ```sudo debootstrap --arch=amd64 lucid /home/jaulas/lucid/ http://archive.ubuntu.com/ubuntu```
Entramos en la jaula y la configuramos:
```
sudo chroot /home/jaulas/lucid/
```
A continuación instalamos nginx, el problema es que la jaula tiene pocos repositorios y programas instaladas por lo que tenemos que instalarlo todo de forma muy manual:
Instalar wget

```
apt-get -y install wget
```
Descargamos clave nginx y la añadimos al repositorio:
```
http://nginx.org/keys/nginx_signing.key
```
```
root@system32:/# apt-key add nginx_signing.key
OK

```
Añadimos repositorio:
```
echo "deb http://nginx.org/packages/ubuntu/ raring nginx" >> /etc/apt/sources.list echo "deb-src http://nginx.org/packages/ubuntu/ raring nginx" >> /etc/apt/sources.lis
```

Instalamos finalmente nginx y curl:
```
apt-get install nginx curl
```

Nos da un problema de que el puerto está ya ocupado, seguramente por apache:
```
root@system32:/# nginx 
nginx: [emerg] bind() to 0.0.0.0:80 failed (98: Address already in use)
```
Cambiaremos el puerto en el que escucha, por ejemplo 8080, para ello editamos el fichero **/etc/nginx/conf.d/default.conf**:
Primero instalamos nano:
```
root@system32:/# apt-get install nano
```
Y ahora editamos el archivo **/etc/nginx/conf.d/default.conf**:
```
server {
    listen       8080;
    server_name  localginx;
     
```
Comprobamos que funciona ya todo:
```
root@system32:/# service nginx start
root@system32:/# service nginx status
 * nginx is running
```

Probamos nginx con curl:
```
root@system32:/# curl 127.0.0.1:8080
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```

**Ahora instalaremos Nginx en ubuntu-box.**
Tan sencillo como arrancar la máquina y ejecutar:
```
ubuntu@ubuntu-caja:~$ sudo apt-get install nginx
```

**NOTA**: lo que si he tenido que modificar es que la memoria swap sea ilimitado porque sino da error al inciar la máquina, al parecer es un bug de lxc.
Comprobamos ahora que funciona nginx:
```
ubuntu@ubuntu-caja:~$ sudo service nginx start
Starting nginx: nginx.
ubuntu@ubuntu-caja:~$ curl localhost
<html>
<head>
<title>Welcome to nginx!</title>
</head>
<body bgcolor="white" text="black">
<center><h1>Welcome to nginx!</h1></center>
</body>
</html>
```

Ahora procederemos a comparar el rendimiento, para ello usaré [Siege](https://www.joedog.org/siege-home/)

###JAULA UBUNTU###

Probamos en la jaula de ubuntu:
```
sudo chroot /home/jaulas/lucid
siege -b -c 1000 -t 120s 127.0.0.1:8080/
```
**Resultado**:
![imagen](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-11-24%20125912_zpsp4uozlhb.png)
Obtenemos una disponibilidad del 99.96% y un rendimiento de 1.98 MB/S. Apenas se pierden envíos, sólo 152.

###UBUNTU CAJA###
Instalamos y después probamos la carga en la caja:
```
ubuntu@ubuntu-caja:~$ sudo apt-get install siege
```
Esto ejecuta un benckmark con 1000 conexiones concurrentes durante 120 segundos.
```
ubuntu@ubuntu-caja:~$ siege -b -c 1000 -t 120 localhost
```
![imagen](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-11-24%20131002_zpso39vpaww.png)
Aquí vemos que el rendimiento apenas llega a 0.25 MB/S, y que se han perdido 1121 envíos.

##Ejercicio 6. Instalar Docker
Podemos instalarlo en ubuntu desde el repositorio oficial:
```
 sudo apt-get install docker.io
 ```
 Comprobamos versión:
 ```
rafaellg8@system32:~$ docker -v
Docker version 1.6.2, build 7c8fca2
```

Ejecutamos docker, para ello vemos en la ayuda que se activa mediante el daemon:
```
rafaellg8@system32:~/Documentos/GII/Cuarto/IV/IV-2015-16$ sudo docker -d
INFO[0000] +job serveapi(unix:///var/run/docker.sock)   
INFO[0000] Listening for HTTP on unix (/var/run/docker.sock) 
FATA[0000] Shutting down daemon due to errors: pid file found, ensure docker is not running or delete /var/run/docker.pid 
```
Nos informa de que debemos borrar el daemon, porque al parecer está escuchando ya ese socket con un pid determinado.
Lo borramos y volvemos a ejecutar y vemos que funciona ya todo perfecto:
```
rafaellg8@system32:~/Documentos/GII/Cuarto/IV/IV-2015-16$ sudo rm /var/run/docker.pid 
rafaellg8@system32:~/Documentos/GII/Cuarto/IV/IV-2015-16$ sudo docker -d
INFO[0000] +job serveapi(unix:///var/run/docker.sock)   
INFO[0000] Listening for HTTP on unix (/var/run/docker.sock) 
INFO[0000] +job init_networkdriver()                    
INFO[0000] -job init_networkdriver() = OK (0)           
WARN[0000] Your kernel does not support cgroup swap limit. 
INFO[0000] Loading containers: start.                   

INFO[0000] Loading containers: done.                    
INFO[0000] docker daemon: 1.6.2 7c8fca2; execdriver: native-0.2; graphdriver: aufs 
INFO[0000] +job acceptconnections()                     
INFO[0000] -job acceptconnections() = OK (0)            
INFO[0000] Daemon has completed initialization  
```

##Ejercicio 7. a) Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.
###b) Instalar una imagen que incluya ya MongoDB.

a) Para instalar una imagen de ubuntu y otra adicional simplemente usamos el comando docker pull:
```
rafaellg8@system32:~/Documentos/GII/Cuarto/IV/IV-2015-16$ sudo docker pull ubuntu
```
Ahora instalamos otra, que será la última versión de Debian:
```
rafaellg8@system32:~/Documentos/GII/Cuarto/IV/IV-2015-16$ sudo docker pull debian:latest
INFO[0849] POST /v1.18/images/create?fromImage=debian%3Alatest 
```
Toda está información la podemos encontrar en el [manual](https://docs.docker.com/) de docker.

b) Para instalar una imagen que incluya MongoDB, debemos de instalar la imagen de [docker-library/mongo](https://github.com/docker-library/mongo/blob/c9a1b066a0f35f679c2f8e1854a21e025867d938/3.0/Dockerfile)

Buscamos la imagen de la librería:
```
rafaellg8@system32:~/Documentos/GII/Cuarto/IV/IV-2015-16$ sudo docker search mongo
INFO[1251] GET /v1.18/images/search?term=mongo          
INFO[1251] +job search(mongo)                           
INFO[1251] +job resolve_repository(mongo)               
INFO[1251] -job resolve_repository(mongo) = OK (0)      
INFO[1252] -job search(mongo) = OK (0)                  
NAME                           DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED
mongo                          MongoDB document databases provide high av...   1106      [OK]  
```

Probamos a hacer un pull de la librería:
```
rafaellg8@system32:~/Documentos/GII/Cuarto/IV/IV-2015-16$ sudo docker pull mongo
```

Listamos las imágenes en docker que tenemos instaladas para comprobar que todo está correcto, para ello usamos el comando images:
```
rafaellg8@system32:~/Documentos/GII/Cuarto/IV/IV-2015-16$ sudo docker images 
INFO[1622] GET /v1.18/images/json                       
INFO[1622] +job images()                                
INFO[1622] -job images() = OK (0)                       
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
mongo               latest              ae293c6896a1        4 days ago          261.6 MB
debian              latest              ea6bab360f56        4 days ago          125.1 MB
ubuntu              latest              ca4d7b1b9a51        2 weeks ago         187.9 MB
```

##Ejercicio 8. Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.

Arrancamos el docker de ubuntu interactivo de forma:
```
sudo docker run -i -t ubuntu
```
Y después procederemos a crear un usuario y asignarlo a grupo de superusuario,primero probamos con debian:
![imagen](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-11-24%20223424_zpsbw52fwft.png)

Hacemos lo mismo para ubuntu, arrancamos y creamos su usuario:
```
root@1510dc2d3475:/# useradd -d /home/user -m user
root@1510dc2d3475:/# passwd user
Enter new UNIX password: 
Retype new UNIX password: 
passwd: password updated successfully
root@1510dc2d3475:/# sudo su  
root@1510dc2d3475:/# adduser user sudo
Adding user `user' to group `sudo' ...
Adding user user to group sudo
Done.
root@1510dc2d3475:/# login user
Password: 
Welcome to Ubuntu 14.04 LTS (GNU/Linux 3.19.0-31-generic x86_64)

 * Documentation:  https://help.ubuntu.com/
```
Para instalar Nginx, como apenas tiene paquetes, hay que instalar antes el software-common:
```
user@1510dc2d3475:~$ sudo apt-get install software-properties-common
```
Actualizamos:
```
user@1510dc2d3475:~$ sudo apt-get update
```

Instalamos Nginx:

```
user@1510dc2d3475:~$ sudo apt-get install nginx
```

Arrancamos servicio y hacemos comprobaciones de que funciona:
![nginx](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-11-24%20225454_zpshvpgcpfm.png)


##Ejercicio 9. Crear a partir del contenedor anterior una imagen persistente con commit.

Para realizar un commit en la máquina con docker necesitamos tener la ID, para ello ejecutamos ps:
```
rafaellg8@system32:~$ sudo docker ps -a
INFO[0011] GET /v1.18/containers/json?all=1             
INFO[0011] +job containers()                            
INFO[0011] -job containers() = OK (0)                   
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                    PORTS               NAMES
1510dc2d3475        ubuntu:latest       "/bin/bash"         18 hours ago        Exited (0) 17 hours ago                       modest_rosalind     
d1b8edbccd6e        debian:latest       "/bin/bash"         18 hours ago        Exited (0) 18 hours ago                       evil_jang           
df1684de4021        debian:latest       "/bin/bash"         18 hours ago        Exited (0) 18 hours ago                       sleepy_ptolemy   
```

El ID de ubuntu es **1510dc2d3475**.

Comprobamos que existe el ID correctamente de la máquina con docker inspect:
```
rafaellg8@system32:~$ sudo docker inspect 1510dc2d3475
```
Nos devuelve un json donde podemos ver cosas como memoria asignada, directorios, ips, además de el estado de la máquina y la última vez que se arrancó docker en ese contenedor:
```
"Path": "/bin/bash",
    "ProcessLabel": "",
    "ResolvConfPath": "/var/lib/docker/containers/1510dc2d3475004aa8800b4d9a159c29d8c5881fcbc80cd6d94bef0c3e9c4f07/resolv.conf",
    "RestartCount": 0,
    "State": {
        "Dead": false,
        "Error": "",
        "ExitCode": 0,
        "FinishedAt": "2015-11-24T21:58:03.744536532Z",
        "OOMKilled": false,
        "Paused": false,
        "Pid": 0,
        "Restarting": false,
        "Running": false,
        "StartedAt": "2015-11-24T21:44:27.861748847Z"
    },
    "Volumes": {},
    "VolumesRW": {}
```

Vemos lo que nos interesa la ip de la máquina en el campo id:
```
 "HostnamePath": "/var/lib/docker/containers/1510dc2d3475004aa8800b4d9a159c29d8c5881fcbc80cd6d94bef0c3e9c4f07/hostname",
    "HostsPath": "/var/lib/docker/containers/1510dc2d3475004aa8800b4d9a159c29d8c5881fcbc80cd6d94bef0c3e9c4f07/hosts",
    "Id": "1510dc2d3475004aa8800b4d9a159c29d8c5881fcbc80cd6d94bef0c3e9c4f07",
    "Image": "ca4d7b1b9a51f72ff4da652d96943f657b4898889924ac3dae5df958dba0dc4a",
    "LogPath": "/var/lib/docker/containers/1510dc2d3475004aa8800b4d9a159c29d8c5881fcbc80cd6d94bef0c3e9c4f07/1510dc2d3475004aa8800b4d9a159c29d8c5881fcbc80cd6d94bef0c3e9c4f07-json.log",
```

Hacemos el commit:
```
sudo docker commit 1510dc2d3475004aa8800b4d9a159c29d8c5881fcbc80cd6d94bef0c3e9c4f07 commit_ubuntu
```
Para ver que se ha guardado comprobamos el estado de las máqinas con ps:
![imagen](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-11-25%20173541_zpsgv6umla6.png)

##Ejercicio 10. Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección

Como mi proyecto lo estoy reaizando en Ubuntu, usaré mi contenedor de docker de ubuntu para realizarlo.
Para esto simplemente lo que tenemos que hacer es como con python, un archivo de requerimientos llamado Dockerfile, donde configuramos el sistema.

Para editar el dockerfile he usado los siguiente tutoriales [dockerfile](https://docs.docker.com/v1.8/reference/builder/) y [dockerizing](https://docs.docker.com/engine/userguide/dockerizing/)

**Dockerfile**
```
FROM ubuntu:14.04

#Autor
MAINTAINER Rafel Lachica Garrido <rafaellg8@correo.ugr.es>

#Actualizamos e instalamos cosas
RUN sudo apt-get update
RUN sudo apt-get install -y git
RUN sudo apt-get install -y build-essential
RUN sudo apt-get install 
RUN sudo apt-get install -y git
RUN sudo apt-get install -y python-setuptools
RUN sudo git clone https://github.com/rafaellg8IV-PLUCO-RLG.git

#Ejecutamos la instalación de make que llama a requeriments.txt y ejecuta la app
RUN cd IV-PLUCO-RLG && git pull
RUN cd IV-PLUCO-RLG && make install
```

Generamos el build de docker:
```
rafaellg8@system32:~/Documentos/GII/Cuarto/IV/IV-PLUCO-RLG$ sudo docker build -t plucomachine_rlg ./
Sending build context to Docker daemon 36.23 MB
```

Y nos lo monta satisfactoriamente:
![imagen](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-11-26%20112727_zpshrleuhwo.png)

Comprobamos las imágenes de docker:

![imagen](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-11-26%20113152_zpskslvmeey.png)

Ejecutamos el contenedor plucomachine_rlg:
![imagen](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-11-26%20113427_zpsjsuye4sn.png)

Finalmente miramos la ip de nuestro docker:
```
root@adf25b2712af:/IV-PLUCO-RLG# ifconfig
eth0      Link encap:Ethernet  HWaddr 02:42:ac:11:00:1c  
          inet addr:172.17.0.31 
```
Y comprobamos en local con la ip de la máquina en docker:
![img](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-11-26%20114616_zpsxjntxtkb.png)

