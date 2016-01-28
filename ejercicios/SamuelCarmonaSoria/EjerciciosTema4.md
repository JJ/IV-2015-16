# Samuel Carmona Soria
# Tema

##Ejercicio 1:
Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub
como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos
a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.

Hemos usado Linux Debian para ésta prácatica.
Hemos instalado la versión que viene por defecto en la distribución, con la orden **sudo apt-get install lxc**
![Ejercicio1](http://i770.photobucket.com/albums/xx346/BkY_1234/Faculty/captura1_zpsydyxzo0l.jpg)

Ahora comprobamos que la compatibilidad es correcta:
![Ejecicio1_2](http://i770.photobucket.com/albums/xx346/BkY_1234/captura1_2_zpsmby6otx7.jpg)


##Ejercicio 2:
Comprobar qué interfaces puente se han creado y explicarlos.

Para crear el contenedor, instalamos la caja my-container, hemos usado la orden **sudo lxc-create -t ubuntu -n my-container** .

samu@samu: ~/IV-2015-16 on master
> sudo lxc-create -t ubuntu -n my-container
debootstrap is /usr/sbin/debootstrap
Checking cache download in /var/cache/lxc/ubuntu/rootfs-jessie-amd64 ...
Downloading ubuntu minimal ...
I: Retrieving Release
I: Retrieving Release.gpg
I: Checking Release signature
I: Valid Release signature (key id 75DDC3C4A499F1A18CB5F3C8CBF8D6FD518E17E1)
I: Retrieving Packages
I: Validating Packages
I: Resolving dependencies of required packages...
I: Resolving dependencies of base packages...
```
Tras instalarse (tarda un buen rato) nos proporciona los datos de usuario y contraseña, que por defecto son 'ubuntu' y 'ubuntu':
![Ejercicio2_1](http://i770.photobucket.com/albums/xx346/BkY_1234/captura2_1_zpsit8l6phb.jpg)

Ahora, con la siguiente orden arrancamos la caja:
```
sudo lxc-start -n my-container
```
Arrancamos el contenedor con la orden **sudo lxc start -n my-container**.
Ahora, introducimos el usuario y contraseña que viene por defecto:
![Ejercicio2_2](http://i770.photobucket.com/albums/xx346/BkY_1234/captura2_2_zpsvjxqlz5c.jpg)

Ahora, en otro terminal, escribimos la orden **ifconfig -a** para ver las interfaces que se han creado:
![Ejercicio2_3](http://i770.photobucket.com/albums/xx346/BkY_1234/captura2_3_zpskjvek4gz.jpg)
Como podemos observar, se han creado las interfaces **lxcbr0** para que el contenedor tenga acceso a internet y **vethLSKID7**
que permite la comunicación entre los diferentes contenedores.

##Ejercicio 3:
1.Crear y ejecutar un contenedor basado en Debian.

Hacemos los mismos pasos que en el ejercicio anterior, cambiando el template "ubuntu" por "debian".
Por tanto, el comando a escribir es:
**sudo lxc-create -t debian -n my-container-debian**
Tras otro buen rato, ya podemos acceder a él como en el ejercicio anterior.
![Ejercicio3_1](http://i770.photobucket.com/albums/xx346/BkY_1234/captura3_1_zpsageccyre.jpg)

Ahora el usuario y contraseña es 'root'. Pero al abrir el contenedor con **sudo lxc start -n my-container-debian** obtengo
el siguiente error:
![Ejercicio3_2](http://i770.photobucket.com/albums/xx346/BkY_1234/captura3_2_zpsljkhton5.jpg)

2.Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor
basado en tu distribución y otro basado en otra que no sea la tuya. Fedora, al parecer, tiene problemas si estás en
Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro. Por ejemplo, Óscar Zafra ha logrado instalar
Gentoo usando un script descargado desde su sitio, como indica en este comentario en el issue.

Vamos a instalar un contenedor basado en Cirros. Para ello, seguimos los mismos pasos que en los dos casos
anteriores. Para crearlo , escribimos en la consola:
```
lxc-create -t cirros -n cirros-container
```
Tras la instalación, podemos hacer login con los datos que se indican por defecto, como podemos ver en la siguiente imagen:
![Ejercicio3_3](http://i770.photobucket.com/albums/xx346/BkY_1234/captura3_3_zpsjlriqg4d.jpg)


##Ejercicio 4:
Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.

Para instalarlo he usado la siguiente orden:
```
wget https://lxc-webpanel.github.io/tools/install.sh -O - | bash
```

Ahora, abrimos el explorador y escribimos la dirección "localhost:5000" para abrir el panel de control de lxc. Introduciremos como usuario y contraseña: "admin" y "admin", que son los valores por defecto, y nos aparecerá el siguiente panel:
![Ejercicio4_1](http://i770.photobucket.com/albums/xx346/BkY_1234/ejercicio4_1_zps32qxyjwz.jpg)

Podemos ver los contenedores que tenemos creados, sus características y modificar valores de parámetros:
![Ejercicio4_2](http://i770.photobucket.com/albums/xx346/BkY_1234/ejercicio4_3_zpslazo79ca.jpg)

Con éste panel, podemos modificar el uso de los recursos que pueden usar el contenedor, tales como los cores, CPU shares, límite de cantidad de memoria, memoria + swap limit, etc.

2.Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.
Elegimos el contenedor de ubuntu y restringimos los siguientes datos:
![Ejercicio4_3](http://i770.photobucket.com/albums/xx346/BkY_1234/ejercicio4_2_zpskiclyqfx.jpg)


##Ejercicio 6:
Instalar docker.

He seguido el tutorial de la siguiente página para instalar Docker en Debian:
https://docs.docker.com/engine/installation/debian/

Tras instalarlo, he ejecutado el servicio y he realizado un "hello world":
![ejercicio_6_1](http://i770.photobucket.com/albums/xx346/BkY_1234/captura6_1su_zps7ss6tmjf.jpg)

##Ejercicio 7:
Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.
Buscar e instalar una imagen que incluya MongoDB.

He instalado primero una imagen de ubuntu a partir con docker con la orden:
 ```sudo docker pull ubuntu```

Ahora, comprobamos  las imágenes creadas con ```sudo docker ps -a``` y  arrancar el contenedor escribimos ```sudo docker run -i -t ubuntu /bin/bash```:
![ej7_1](http://i770.photobucket.com/albums/xx346/BkY_1234/captura7_1_zpswvdbcsou.jpg)


Y ahora hacemos el mismo procedimiento pero para centos. Escribimos ```sudo docker pull centos```:
Comprobamos  la imágen con ```sudo docker ps -a```
Y finalmente lo arrancamos con ```sudo docker run -i -t centos```:
![ej7_2](http://i770.photobucket.com/albums/xx346/BkY_1234/captura7_2_zps1hitghkn.jpg)


Para parar un docker, podemos ejecutar:
 ```sudo docker ps -a=false
sudo docker stop id```

Y si queremos borrarlo:
 ```sudo docker rmi -f id```

Ahora, vamos a instalar una imagen que incluya MongoDB:

Seguimos el mismo procedimiento usado previamente:
 ```
 sudo docker pull mongo
sudo docker run -i -t mongo
sudo docker ps -a
```
![ej7_3](http://i770.photobucket.com/albums/xx346/BkY_1234/captura7_3_zpsx9q7gtzl.jpg)







##Ejercicio 8:
Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.

He seguido un tutorial por internet que consta de los siguientes pasos:

Arrancamos el contenedor de Ubuntu con el comando:
 ```sudo docker run -i -t ubuntu```
Creamos un un usuario con el comando:
 ```useradd -d /home/usuario -m usuario```
Asignamos una contraseña al nuevo usuario:
 ```passwd usuario```
Añadimos privilegios al usuario creado:
 ```sudo adduser usuario sudo```
Hacemos login con el usuario creado:
 ```login us_docker```
Introducimos "usuario" y la contraseña,  y a continuación instalamos nginx:
 ```sudo apt-get install nginx```

![ej8_1](http://i770.photobucket.com/albums/xx346/BkY_1234/captura8_1_zpsrjsqzali.jpg)

Ahora instalamos curl:
 ```sudo apt-get install curl```
Corremos el servicio con "sudo service nginx start" y con **curl 127.0.0.1** podemos comprobamos que funciona.
![ej8_2](http://i770.photobucket.com/albums/xx346/BkY_1234/captura8_2_zps37es9c5t.jpg)





##Ejercicio 9:
Crear a partir del contenedor anterior una imagen persistente con commit.

Ejecutamos el siguiente comando para encontrar el id corto del docker que queremos ejecutar:
 ```sudo docker ps -a```):
Una vez encontrado escribimos:
``` sudo docker start f19339e01c5c```

![ej9_1](http://i770.photobucket.com/albums/xx346/BkY_1234/captura9_1_zpslqiydnzq.jpg)

Con el siguiente comando podemos ver el id largo del docker:
 ```sudo docker inspect f19339e01c5c```
![ej9_2](http://i770.photobucket.com/albums/xx346/BkY_1234/captura9_2_zpsguxfpogy.jpg)


Con el siguiente comando podemos ver el id de la imagen:
```sudo docker images -notrunc```
![ej9_3](http://i770.photobucket.com/albums/xx346/BkY_1234/captura9_3_zps0jorqyno.jpg)

Realizamos el commit:
```sudo docker commit  f19339e01c5c imagen_persistente```
![ej9_4](http://i770.photobucket.com/albums/xx346/BkY_1234/captura9_4_zpsgjqo1p8h.jpg)

Y ahora con el comando de antes, comprobamos que se ha realizado sin problemas:
```sudo docker images -notrunc```
![ej9_5](http://i770.photobucket.com/albums/xx346/BkY_1234/captura9_5_zpsgdwbdebf.jpg)




##Ejercicio 10:
Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección.

Este ejercicio lo he completado desde mi equipo de sobremesa con Debian como distribución.

Primero iniciamos Docker con el siguiente comando:
```docker con sudo docker -d &```.

Ahora, creamos un archivo **Dockerfile** dentro de la carpeta de mi proyecto:
```
FROM ubuntu:latest

#Autor
MAINTAINER Samuel Carmona Soria <samuelcarmona123@gmail.com>

#Actualizar Sistema Base
RUN sudo apt-get update
#Descargar aplicacion
RUN sudo apt-get install -y git
RUN sudo git clone https://github.com/Samuc/Proyecto-IV-modulo3

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
RUN cd Proyecto-IV-modulo3 && sudo pip install -r requirements.txt
```

En el directorio del repositorio, creamos una imagen con: (no olvidad el punto del final)
 ``` sudo  docker build -f Dockerfile -t samuel_iv .```
o
 ``` sudo  docker build -t samuel_iv .``` (cogerá por defecto el fichero con el nombre Dockerfile en caso de existir)
Como podemos ver en la siguiente captura:
![Ejercicio10_1](http://i770.photobucket.com/albums/xx346/BkY_1234/ejercicio10_1_zpskwwtrb3z.jpg)


Podemos ver que se ha creado ejecutando el comando ```sudo docker images``` :
![ej10_2](http://i770.photobucket.com/albums/xx346/BkY_1234/ejercicio10_2_zps4k074gqf.jpg)
(Las imagenes con nombre <none> son intentos fallidos, que borraré mas adelante)

Como podemos ver en la imagen anterior, la imagen se ha creado correctamente, y ocupa 466.1 MB.

Ahora, cargamos la imagen con:
 ```sudo docker run -t -i samuel_iv /bin/bash```

Una vez dentro, comprobamos la ip que tiene con **ifconfig** para después utilizarla:
![ej10_3](http://i770.photobucket.com/albums/xx346/BkY_1234/ejercicio10_3_zpsr9cgeggg.jpg)

Dentro de la imagen ejecutamos la aplicación:
```
root@594b9484609a:/# cd Proyecto-IV-modulo3/
root@594b9484609a:/Proyecto-IV-modulo3# python runserver.py
```

Ahora vamos al navegador, y en la dirección   **http://172.17.0.2:5000/** nos encontraremos con la aplicación funcionando correctamente:
![ej10_4](http://i770.photobucket.com/albums/xx346/BkY_1234/ejercicio10_4_zpscn7urqeb.jpg)

Ahora vamos a crear nuestra imagen en la página web de [docker](https://www.docker.com/):

Primero me he registrado [Aqui](https://hub.docker.com/?utm_source=getting_started_guide&utm_medium=embedded_MacOSX&utm_campaign=create_docker_hub_account)
Tras verificar la cuenta, creamos un repositorio con visibilidad pública:
![ej10_5](http://i770.photobucket.com/albums/xx346/BkY_1234/ejercicio10_5_zpse70a6vfs.jpg)

Ahora, introduzco el siguiente comando:
```
sudo docker build -f Dockerfile -t samucs/proyecto-iv:latest --no-cache=true ./
```

Hago login con las credenciales de Docker:
```
sudo docker login
```

Y finalmente hago el push al repositorio de Docker:
```
sudo docker push samucs/proyecto-iv:latest
```
Se puede ver la imagen subida a Docker [aquí](https://hub.docker.com/r/samucs/proyecto-iv/)

![ej10_6](http://i770.photobucket.com/albums/xx346/BkY_1234/captura10_6_zps1v4pzch2.jpg)



Para agilizar el uso de docker he creado el siguiente [script](https://github.com/Samuc/Proyecto-IV-modulo3/script/docker.sh)
