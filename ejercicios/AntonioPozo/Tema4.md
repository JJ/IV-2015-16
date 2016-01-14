###Ejercicio 1
**Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.**

Instalamos la última versión disponible con: sudo apt-get -t trusty-backports install lxc
Para comprobar la versión instalada tecleamos lxc-ls --version. 
En mi caso, tengo instalada la versión 1.1.5

###Ejercicio 2
**Comprobar qué interfaces puente se han creado y explicarlos.**

Creamos un contenedor: 

```
sudo lxc-create -t ubuntu -n caja-ubuntu
```
![exito instalacion](http://s2.subirimagenes.com/imagen/previo/thump_9491377success.png)

Una vez creado, lo iniciamos: 

```
sudo lxc-start -n caja-ubuntu
```
Vemos las interfaces creadas:

La siguiente interfaz es la que conecta el contenedor con Internet.
![salida ifconfig interfaz1](http://s2.subirimagenes.com/imagen/previo/thump_9491378ifconfig.png)

Y ésta la que se utiliza para conexión entre contenedores.
![salida ifconfig interfaz2](http://s2.subirimagenes.com/imagen/previo/thump_9491379ifconfig2.png)




###Ejercicio 3
**1. Crear y ejecutar un contenedor basado en Debian.**

Lo creamos con: 

```
sudo lxc-create -t debian -n caja-debian
```
**2. Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya. Fedora, al parecer, tiene problemas si estás en Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro. Por ejemplo, Óscar Zafra ha logrado instalar Gentoo usando un script descargado desde su sitio, como indica en este comentario en el issue.**

Lo creamos con: 

```
sudo lxc-create -t centos -n caja-centos
```

###Ejercicio 4
**1. Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.**

Lo instalamos con:

```
sudo wget https://lxc-webpanel.github.io/tools/install.sh -O - | sudo bash
```
Una vez finalizado el proceso de instalación se nos facilita cómo acceder a dicho panel, en mi caso con http://localhost:5000 (usuario: "admin", contraseña: "admin")

![panel principal lxc](http://s2.subirimagenes.com/imagen/previo/thump_9495845lxcwebpanel.png)

Arrancamos por ejemplo el contenedor basado en centos y el basado en debian haciendo click en start

![panel principal lxc](http://s2.subirimagenes.com/imagen/previo/thump_9495846lxcwebpanelarrancada.png)


**2. Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.**

Para hacer esto hacemos click en los contenedores en el menú de la izquierda, y ahí seleccionamos las opciones hardware para nuestros contenedores. Hay que tener en cuenta que para modificar los valores de los contenedores, tienen que estar parados; en cualquier otro caso, las opciones aparecerán deshabilitadas.

###Ejercicio 5
**Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor. Usar nginx.**

Voy a comparar las prestaciones del contenedor basado en ubuntu (el del ejercicio 2) con otro también basado en ubuntu pero "enjaulado"
Para crear la jaula se ha utilizado debootstrap:

```
sudo debootstrap --arch=amd64 lucid /home/jaulas/lucid/ http://archive.ubuntu.com/ubuntu
sudo chroot /home/jaulas/lucid
mount -t proc proc /proc
apt-get install language-pack-es
```

Ahora instalamos Ngingx en el contenedor y lo iniciamos:

```
sudo lxc-start -n caja-ubuntu
sudo apt-get install nginx
sudo fuser -k 80/tcp # lo hacemos para dejar libre el puerto 80 para nginx
sudo service nginx start
```
Probamos que realmente está funcionando:

```
curl localhost
```
Si encontramos en el html de curl "Welcome to nginx!" es que el servicio está funcionando.

Es tiempo de instalar Nginx en la caja:

```
echo "deb http://nginx.org/packages/ubuntu/ lucid nginx" >> /etc/apt/sources.list 
echo "deb-src http://nginx.org/packages/ubuntu/ lucid nginx" >> /etc/apt/sources.list 
apt-get install wget 
wget http://nginx.org/keys/nginx_signing.key 
apt-key add nginx_signing.key 
apt-get update 
apt-get install nginx 
sudo fuser -k 80/tcp  # esto se hace fuera de la jaula para dejar libre el puerto de nginx 
service nginx start 
apt-get install curl 
curl localhost # comprobamos que funciona
```
Con ambas cosas preparadas, instalamos Apache Benchmark en cada una de ellas:

```
sudo apt-get install apache2-utils
```
Y por ejemplo, ejecutaríamos la prueba:

```
ab -n 1000 -c 1000 http://localhost/
```
en el contenedor y en la jaula.

###Ejercicio 6
**Instalar docker.**
Instalamos Docker con la siguiente orden:

```
sudo apt-get -y install docker.io
```
###Ejercicio 7
**1. Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.**
Arrancamos Docker:

```
curl -sSL https://get.docker.com/ | sudo sh
```
Instalamos ubuntu

```
sudo docker pull ubuntu
```
Instalamos centos

```
sudo docker pull centos
```

**2. Buscar e instalar una imagen que incluya MongoDB.**

Lo he econtrado en la siguiente [referencia](https://hub.docker.com/_/mongo/)

```
sudo docker pull library/mongo
```
###Ejercicio 8
**Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.**

Para resolver el ejercicio, de los contenedores instalados, voy a escoger ubuntu:

```
sudo docker run -i -t ubuntu /bin/bash
useradd -d /home/apozodocker -m apozodocker
passwd apozodocker
sudo adduser apozodocker sudo
login apozodocker
```
La siguiente captura muestra el proceso en terminal:

![añadiendo usuario en docker-ubuntu](http://s2.subirimagenes.com/imagen/previo/thump_9495872addingdockeruser.png)


###Ejercicio 9
**Crear a partir del contenedor anterior una imagen persistente con commit.**
Mientras el contenedor está corriendo, en la máquina anfitriona ejecutamos:

```
sudo docker ps -a=false
```
Esto nos muestra información sobre los contenedores que se están ejecutando. Entre dicha información el ID del contenedor. Anotamos la ID (en mi caso 1b8da176fa8b) del contenedor deseado y ejecutamos:

```
sudo docker commit 1b8da176fa8b nuevaimagenpersistente
```
Para comprobar que se ha creado la nueva imagen ejecutamos:

```
sudo docker images
```
El resultado se muestra en la siguiente captura:

![imagenes docker](http://s2.subirimagenes.com/imagen/previo/thump_9495880imagenesdocker.png)

###Ejercicio 10
**Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección.**