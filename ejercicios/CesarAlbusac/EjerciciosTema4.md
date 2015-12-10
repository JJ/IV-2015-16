##Ejercicio 1:
Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub 
como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos
a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.

He instalado la versión que viene por defecto con la orden **sudo apt-get install lxc** , que en este caso
era la 1.0.7. 
![Ejercicio1](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios4/ej1_zpseev9vzy3.png)

Comprobamos la compatibilidad es correcta:
![Ejecicio1_2](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios4/ej1_2_zpsdunvzne0.png)


##Ejercicio 2:
Comprobar qué interfaces puente se han creado y explicarlos.

Para crear el contenedor , he ejecutado la orden **sudo lxc-create -t ubuntu -n my-container** .

Después de unos minutos, vemos que ya se ha instalado:
![Ejercicio2](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios4/ej2_zps5nilza68.png)

Para arrancar el contenedor con la orden **sudo lxc start -n my-container**.
Luego, tenemos que introducir el usuario y contraseña que viene por defecto, que en este caso es 'ubuntu' y la
contraseña 'ubuntu':
![Ejercicio2_2](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios4/ej2_2_zps0x1xekxc.png)
![Ejercicio2_3](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios4/ej2_3_zpsovo85iol.png)

Ahora, abrimos otro terminal y escribimos la orden **ifconfig -a** para ver las interfaces puentes que se han creado:
![Ejercicio2_4](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios4/ej2_4_zpskrdgulbx.png)

Como podemos ver, en mi caso se han creado las interfaces **lxcbr0** para que el contenedor tenga acceso a internet y **vethO4F9DJ** 
que permite la comunicación entre los diferentes contenedores.


##Ejercicio 3:
1.Crear y ejecutar un contenedor basado en Debian.

Al igual que en el ejercicio anterior, sólo que cambiando la distribución a Debian. Para ello, he escrito en el terminal
**sudo lxc-create -t debian -n contdebian** , y tras unos minutos, ya podemos acceder a él como en el ejercicio anterior.
![Ejercicio3](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios4/ej3_zpsdbtgs3zi.png)

Ahora el usuario y contraseña es 'root'. Para lanzar el contenedor, escribimos **sudo lxc start -n contdebian**  y obtengo 
el siguiente error:

![Ejercicio3_2](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios4/ej3_2_zpsky4ejymq.png)

2.Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor
basado en tu distribución y otro basado en otra que no sea la tuya. Fedora, al parecer, tiene problemas si estás en
Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro. Por ejemplo, Óscar Zafra ha logrado instalar
Gentoo usando un script descargado desde su sitio, como indica en este comentario en el issue.

Ahora voy a instalar un contenedor UbuntuCloud. Para ello, seguimos los mismos pasos que en los dos casos
anteriores. Para crearlo , escribimos en la consola:
```
lxc-create -t ubuntu-cloud -n cont_UbuntuCloud
```

La instalación la podemos ver en la siguiente imagen:
![Ejercicio3_3](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios4/ej4_4_zpsljr39zip.png)


##Ejercicio 4:
Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.

Para instalarlo he usado la siguiente orden:
```
wget https://lxc-webpanel.github.io/tools/install.sh -O - | bash
```

![ej4](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios4/ejercicio4_2_zpszbakihno.png)

Ahora, nos vamos al explorador y escribimos localhost:5000 para iniciar el panel de lxc. Introduciremos admin admin como
usuario y contraseña respectivamente:

![ej4_2](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios4/ej4_2_zpsbljrvqfv.png)

Una vez hemos iniciado sesión, podremos ver los contenedores que tenemos creados, sus características y podremos
hacer modificaciones:

![ej4_3](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios4/ej4_5_zps2zisfbch.png)

Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) 
o cantidad de memoria.

Para restringir los recursos, debemos detener la máquina, después modificar los parámetros que deseemos, y luego volver
a iniciarla:

![ej4_4](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios4/ej4_6_zps9r4yymos.png)


##Ejercicio 5:
Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor. Usar nginx.

##Ejercicio 6:
Instalar docker.

He insalado docker con el siguiente comando: ```sudo apt-get -y install docker.io```
![ej6_1](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/ej6_zpsmxdkpddq.png)

Ahora lo arrancamos con ``` sudo docker -d & ``` : 
![ej6_2](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/ej6_2_zpsxsh1xz9o.png)

Como podemos ver en la imagen anterior, debemos elimiar el archivo docker.pid , con la orden ```sudo rm /var/run/docker.pid```

Y cada vez que arranquemos haremos lo mismo.

##Ejercicio 7:
Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.
Buscar e instalar una imagen que incluya MongoDB.

He instalado ubuntu a partir de docker con ```sudo docker pull ubuntu``` : 
![ej7_1](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios4/ej7_1_zpsx4c5gxb0.png)

He comprobado las imágenes con ```sudo docker ps -a```
![ej7_2](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios4/ej7_3_zpsvbhvc709.png)

Para arrancar el contenedor escribimos ```sudo docker run -i -t ubuntu /bin/bash```
![ej7_3](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios4/ej7_4_zpscs1wgzgo.png)

Y ahora hacemos el mismo procedimiento pero para centos. Escribimos ```sudo docker pull centos```:
![ej7_4](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios4/ej7_5_zpssawe2vsz.png)

Ahora comprobamos las imágenes con ```sudo docker ps -a```:
![ej7_5](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios4/ej7_6_zpsg9k7assm.png)

Y finalmente lo arrancamos con ```sudo docker run -i -t centos /bin/bash```:
![ej7_6](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios4/ej7_7_zpsmonbj0j9.png)

Si queremos parar un docker, tenemos que ejecutar ```sudo docker ps -a=false``` 
Para pararlo ejecutaremos ```sudo docker stop id```
Y si queremos borrarlo ejecutaremos la orden ```sudo docker rmi -f id```

Ahora, para instalar una imagen que incluya MongoDB:
Hacemos el mismo procedimiento que anteriormente:
![ej7_7](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios4/ej7_mongo_zpslyugffu1.png)

Y vemos en las imágenes que ya está la imagen con Mongo:
![ej7_8](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios4/ej7_images_zpsthk93pyz.png)


##Ejercicio 8:
Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.

He realizado los siguientes pasos:

He arrancado el contenedor de Ubuntu con ```sudo docker run -i -t ubuntu```
Ahora, he creado un usuario con el siguiente comando ```useradd -d /home/usuario -m usuario```
Para signar una contraseña al nuevo usuario escribimos ```passwd usuario```
Añadimos privilegios al usuario que hemos creado con ```sudo adduser usuario sudo```
Iniciamos con el usuario que hemos creado con ```login us_docker```
Y pasamos a instalar nginx con ```sudo apt-get install nginx```
E instalamos curl con ```sudo apt.get install curl```
Si escribimos **curl 127.0.0.1** en el terminal podemos comprobar que funciona.

![ej8_1](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios4/ej8_zpsmczwjkqg.png)
![ej8_2](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios4/ej8_2_zpsmuieop0c.png)


##Ejercicio 9:
Crear a partir del contenedor anterior una imagen persistente con commit.

He realizado los siguientes pasos:

Arrancar el contenedor mediante la orden (he usado el id corto que obtenemos ejecutando ```sudo docker ps -a```):

``` sudo docker d10a943a446f```

Para localizar el ID de nuestro contenedor:

``` sudo docker ps -a=false ```

![ej9_1](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios4/ej9_1_zpswsdoevqa.png)

Comprobar las ID con ```sudo docker inspect d10a943a446f``` :

![ej9_2](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios4/ej9_2_zpslj3kgios.png)

```sudo docker images -notrunc```

![ej9_3](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios4/ej9_3_zpsygx1ieif.png)

Realizamos el commit: 
```sudo docker commit  d10a943a446f imgagen_persistente```

![ej9_4](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios4/ej9_4_zpsmokzcwx2.png)

Y ahora comprobamos que hemos realizado el commit correctamente:
```sudo docker images -notrunc```
![ej9_5](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Ejercicios4/ej9_6_zpsrmsyxziz.png)



##Ejercicio 10:
Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección.

Este ejercicio lo he realizado desde mi máquina de ubuntu.
Primero iniciamos sesion con ```docker con sudo docker -d &```.

En primer lugar, he creado un archivo **Dockerfile** dentro de la carpeta de mi proyecto:
```
FROM ubuntu:latest

#Autor
MAINTAINER Cesar Albusac Jorge <cesypozo@gmail.com>

#Actualizar Sistema Base
RUN sudo apt-get -y update

#Descargar aplicacion 
RUN sudo apt-get install -y git
RUN sudo git clone https://github.com/cesar2/Proyecto-IV.git

#Instalar Python y PostgreSQL
RUN sudo apt-get install -y python-setuptools
RUN sudo apt-get -y install python-dev
RUN sudo apt-get -y install build-essential
RUN sudo apt-get -y install python-psycopg2
RUN sudo apt-get -y install libpq-dev
RUN sudo easy_install pip
RUN sudo pip install --upgrade pip

#Instalar la app
RUN cd Proyecto-IV && make install
```

En el directorio del proyecto, tenemos que crear la imagen con ``` sudo  docker build -f Dockerfile -t iv_cesar .``` 

Podemos ver que se ha creado ejecutando el comando ```sudo docker images``` :

Imagen en local: 

![ej10_1](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/ej10_2_zpsfhgygypd.png)
Como podemos ver en la imagen anterior, la imagen se ha creado correctamente.
Ahora, arrancamos la imagen con ```sudo docker run -t -i iv_cesar /bin/bash```
Una vez dentro de la imagen, comprobamos la ip que tiene con **ifconfig** para después utilizarla:
![ej10_2](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/ej10_zps7lll6oxi.png)

Y ejecutamos y vamos al navegador, a la direccion  **172.17.0.21:2222** y como podemos ver funciona correctamente:

![ej10_3](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/Captura%20de%20pantalla%20de%202015-12-10%20112715_zpsjt00fi6f.png)


Imagen en [docker](https://www.docker.com/):

Los comandos que he utilizado han sido: 
```
sudo docker build -f Dockerfile -t proyecto-iv --no-cache=true ./
```
```
sudo docker push cesar2/proyecto-iv
```

Y automáticamente, tras registrarnos en  [docker](https://www.docker.com/), dar permisos para usar nuestro repositorio
del proyecto de Github,se nos habrá creado nuestra imagen, como podemos ver en las siguientes imágenes:


![ej10_4](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/docker_1_zpsqb8ls5wf.png)
![ej10_5](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/docker_5_zpseufyxakm.png)

Puedes ver el enlace a mi imagen den docker en el siguiente [enlace](https://hub.docker.com/r/cesar2/proyecto-iv/)




