### Ejercicio 1
![10](https://www.dropbox.com/s/mz4uk48igv7dino/0.png?dl=1)
![11](https://www.dropbox.com/s/hkc5t564bup3kal/1.png?dl=1)


Como tenemos un missing, no vamos a poder seguir haciendo el resto de ejercicios, por lo que vamos a continuar haciéndolos en una máquina virtual Azure.

### Ejercicio 2
Una vez dentro de nuestra máquina Azure vamos a crear un contenedor ubuntu, para ello ponemos:

	sudo lxc-create -t ubuntu -n contenedor_lxc

Una vez creado, lo arrancamos ejecutando:

	sudo lxc-start -n contenedor_lxc

Entonces nos pedirá un usuario y contraseña, estos, a raíz de la salida de la creación, son:

	Usuario: ubuntu
	Contraseña: ubuntu

Una vez dentro nos logueamos como root y ejecutamos:
	ifconfig -a

Aquí podemos ver las interfaces de red de nuestra máquina:

![Interfaces](https://www.dropbox.com/s/x8liorm7mz15ppt/0.png?dl=1)


### Ejercicio 3
Repetimos los pasos del Ejercicio anterior aplicados a debian:
	sudo lxc-create -t debian -n contenedor_debian

y para entrar hacemos como antes:

	sudo lxc-start -n contenedor_debian

Esta vez el usuario y contraseña son:

	Usuario: root
	Contraseña: root

Para instalar centos aplicaré el siguiente [tutorial](http://www.bonusbits.com/wiki/HowTo:Setup_CentOS_LXC_Container_on_Ubuntu).

Una vez aplicado, volvemos a la misma tesitura:

	sudo lxc-create -t centos -n contenedor_debian


### Ejercicio 4
Para instalarlo empezaremos logueandonos como root:
	sudo su
Entonces ejecutamos:
	wget https://lxc-webpanel.github.io/tools/install.sh -O - | bash


![instaler4](https://www.dropbox.com/s/4uq25mz7rok00rz/0.png?dl=1)

Como podemos ver, funciona:

![web4](https://www.dropbox.com/s/zplwn21wg9mb64b/1.png?dl=1)

Una vez logueados podemos ver esto:

![ver_c4](https://www.dropbox.com/s/jyb96gmcav2hb2p/2.png?dl=1)

Desde aquí podemos ya decirle de parar los contenedores, arrancarlos, etc.

También he limitado la memoria como podemos ver a continuación:

![limit4](https://www.dropbox.com/s/evhxlz99dbpfcgg/3.png?dl=1)

### Ejercicio 6

Como docker sí funciona en mi máquina local, haré los ejercicios restantes en ella.

Dispongo de una distribución Antergos (basada en Arch Linux) por lo que mis comandos serán diferentes.

Para instalar docker en mi máquina ejecuto la orden:

	pacaur -S docker

Una vez se instala, en mi caso lo único que faltaría (de forma opcional), ejecutar:

	sudo usermod -aG docker username

y después reloguear el usuario.

Con esto conseguimos evitar tener que poner `sudo` en cada orden de docker.


### Ejercicio 7
Para Ubuntu:
	docker pull ubuntu 
En el caso de cent OS:
	docker pull centos
Para conseguir una imagen con mongoDB:
	docker pull mongo

### Ejercicio 10

Aquí podemos ver cómo lo he realizado:
	[Readme](https://github.com/neon520/SMS-BDyReplica/blob/master/README.md)
