##Ejercicios 1: Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.
He instalado LXC y como se puede comprobar en la siguiente captura la versión que he instalado ha sido 1.0.6:
![lxc](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/Captura%20de%20pantalla%20de%202015-11-27%20104136_zpskoyc7qst.png)


##Ejercicios 2: Comprobar qué interfaces puente se han creado y explicarlos.
He creado un contenedor debian y lo he arrancado:
```
sudo lxc-create -t debian -n contdebian
sudo lxc-start -n contdebian
```
Y estas son las interfaces que se han creado:
![inter](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/Captura%20de%20pantalla%20de%202015-12-04%20130519_zpsgk2tq5eb.png)

##Ejercicios 3: 1. Crear y ejecutar un contenedor basado en Debian. 2. Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya. Fedora, al parecer, tiene problemas si estás en Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro. Por ejemplo, Óscar Zafra ha logrado instalar Gentoo usando un script descargado desde su sitio, como indica en este comentario en el issue.
El contenedor basado en debian es el creado anteriormente contdebian. El contenedor creado y ejecutado basado en otra distrubución que he creado ha sido un contenedor de ubuntu-cloud que he creado como se puede ver en la siguiente imagen:
![contUC](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/Captura%20de%20pantalla%20de%202015-12-05%20120121_zpsxkzvgtbl.png)

##Ejercicios 4: 1. Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas. 
He instalado lxc-webpanel con el siguiente comando:
```
wget https://lxc-webpanel.github.io/tools/install.sh -O - | bash
```
Introducimos nuestra IPlocal:5000 y como usuario y contraseña una vez en lxc-webpanel ponemos admin en los dos campos:
![login](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/Captura%20de%20pantalla%20de%202015-12-05%20122648_zpsj9dmo2d7.png)
Se puede ver algunas máquinas paradas y otras que están arrancadas:
![maquinas](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/Captura%20de%20pantalla%20de%202015-12-05%20124242_zpseyotrrgf.png)
##4:2. Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.
Para restringir los recursos de una máquina primero la paramos, y cambiamos el valor por defecto de CPU shares y CPUs:
![recursos](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/Captura%20de%20pantalla%20de%202015-12-05%20124503_zpsl2p2xrha.png)
Por último arrancamos la máquina y usará los recursos tal y como hemos especificado.


##Ejercicios 5: Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor. Usar nginx.


##Ejercicios 6: Instalar docker.
He instalado docker con el siguiente comando:
```
sudo apt-get -y install docker.io
```
Una vez instalado lo he arrancado con **sudo docker -d &**:
![docker](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/Captura%20de%20pantalla%20de%202015-12-05%20132804_zpslmy5q29a.png)

Cada vez que arranquemos debemos borrar el archivo **docker.pid** con:
```
sudo rm /var/run/docker.pid
```

##Ejercicios 7: 1. Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS. 2. Buscar e instalar una imagen que incluya MongoDB.
He instalado ubuntu a partir de docker con **sudo docker pull ubuntu**:
![dockUb](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/Captura%20de%20pantalla%20de%202015-12-05%20133647_zpshhqmufwo.png)

Y he hecho lo mismo para centos usando **sudo docker pull centos**

He buscado y he encontrado [aquí](https://github.com/dockerfile/mongodb): lo he instalado con **sudo docker pull library/mongo**.
Y aquí se puede ver que la imagen se ha instalado correctamente: 

![mongodb](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/Captura%20de%20pantalla%20de%202015-12-08%20192716_zpszpdzsrh9.png)


##Ejercicios 8: Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.
Para esto lo primero que he hecho ha sido arrancar el docker de ubuntu con **sudo docker run -i -t ubuntu /bin/bash**.
Posteriormente creamos un usuario, le asignamos una contraseña, le asignamos permisos de superusuario y entramos en él:

![imagenNginx](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/Captura%20de%20pantalla%20de%202015-12-08%20195031_zpsczcbzbpa.png)

Por último hacemos lo siguiente para instalar nginx:
```
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:nginx/stable
sudo apt-get install nginx
```
Y comprobamos que está correctamente instalado con **service nginx status**
##Ejercicios 9: Crear a partir del contenedor anterior una imagen persistente con commit.


##Ejercicios 10: Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección.

