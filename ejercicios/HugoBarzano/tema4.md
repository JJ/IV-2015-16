# Tema 4. Virtualización ligera usando contenedores

##Ejercicio 1:Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.

Ubuntu 14.04 ofrece LXC 1.0.3, que es la última versión. Podemos instalarlo mediante la orden 

	sudo apt-get install lxc

Podemos crear un contenedor con privilegios de manera interactiva, esta forma solicitará el tipo de contenedor y el sistema de archivos raíz para descargar - en particular, la distribución, la liberación y la arquitectura mediante la instrución:

	sudo lxc-create --template download --name nombre1

o de forma más abreviada: 

	sudo lxc-create -t download -n nombre1

Considero que las siguientes ordenes, pueden ser de utilidad:

	 lxc-ls 	-> Lista de contenedores

	 lxc-info 	-> Información sobre el contenedor

	 lxc-start	-> Iniciar contenedor

	 lxc-stop	-> Detener contenedor

	 lxc-attach	-> Acceder contendor

	 lxc-console	-> Acceder contenedor
	
	 lxc-destroy	-> Eliminar contenedor

Mediante **lxc-checkconfig** podemos comprobar que efectivamete LXC esta correctamente instalado y listo para funcionar:

![lxc_check](https://www.dropbox.com/s/fk2231a093s0vs8/checkconfig.png?dl=1)

##Ejercicio 2: Comprobar qué interfaces puente se han creado y explicarlos.

Para comprobar las interfaces, vamos a seguir los pasos del tema 4 y crear 2 contenedores. En el primero vamos a instalar Ubuntu:

	sudo lxc-create -t ubuntu -n caja1

Una vez creada, podemos iniciarla mediante 

	sudo lxc-start -n caja1

Para conectarnos a la máquina, debemos introducir **ubuntu** como usuario y contraseña.
![caja1_login](https://www.dropbox.com/s/lzjvw1ato90so7e/caja1_log.png?dl=1)

Para detener la máquina:

	sudo lxc-stop -n caja1

El contenedor tiene acceso a internet a travez del anfitrión. Podemos consultar los puentes creados en el archivo **/var/lib/lxc/caja1/config**
![caja1_config](https://www.dropbox.com/s/yozwhfin50r2twh/caja1_config.png?dl=1)

Podemos observar que se han creado los puentes lxcbr0 y veth, una red ethernet virtual linkada a lxcbr0.

Mediante **ifconfig** podemos comprobar que se trata de redes tipo  MULTICAST. 

![ifconfig](https://www.dropbox.com/s/pz4r7opwwm9c63c/ifconfig.png?dl=1)
	

En el segundo, vamos a instalar una imagen similar a la que se usa en EC2 de Amazon:

	sudo lxc-create -t ubuntu-cloud -n nube1

Efectivamente en la creación podemos observar que el funcionamiento es ligeramente diferente, porque se descarga un fichero .tar.gz usando wget.

![nube1](https://www.dropbox.com/s/qv8x3484lozmp2v/nube1.png?dl=1)

Las interfaces puente creadas, son similares a las de nube1

##Ejercicio 3:

###3.1:Crear y ejecutar un contenedor basado en Debian.

Para crear un contenedor basado en Debian podmeos utilizar:

	 sudo lxc-create -t debian -n caja_debian


###3.2:Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya. Fedora, al parecer, tiene problemas si estás en Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro. Por ejemplo, Óscar Zafra ha logrado instalar Gentoo usando un script descargado desde su sitio, como indica en este comentario en el issue.



##Ejercicio 4:

###4.1: Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.

###4.2: Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.



##Ejercicio 5: Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor. Usar nginx.

##Ejercicio 6: Instalar docker.

##Ejercicio 7: 

###7.1:Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.

###7.2:Buscar e instalar una imagen que incluya MongoDB.

##Ejercicio 8: Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.

##Ejercicio 9: Crear a partir del contenedor anterior una imagen persistente con commit.

##Ejercicio 10: Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección. 






 

