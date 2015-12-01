#Ejercicios tema 4


##Ejercicio 1
###Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0
Para instalar LXC he utilizado el comando:
`sudo apt-get install lxc`

Seguidamente confirmo dos datos importantes:

* Por un lado que la versión es superior a la 1.0. Usando el comando: `lxc-monitor --version`

![versión LXC](https://www.dropbox.com/s/7f7zlshwif8xdhv/ejr1.2.png?dl=1)

* Y por otro lado comprobamos que el kernel soporta lxc-containers y que todo está bien configurado. Esto lo he hecho con el comando: `lxc-checkconfig`

![kernel soporta lxc-containers](https://www.dropbox.com/s/u25004f1v8k4er6/ejr1.1.png?dl=1)


##Ejercicio 2
###Comprobar qué interfaces puente se han creado y explicarlos.
Creo una caja para ubuntu con el nombre una-caja, con el comando: `sudo lxc-create -t ubuntu -n una-caja`

Una vez finaliza el proceso (el cual es bastante largo) nos muestra un mensaje con los datos necesarios para poder acceder 

![datos de acceso](https://www.dropbox.com/s/il93cl07uu99k8n/ejr2.1.png?dl=1)

Para arrancar el contenedor creado anteriormente uso el comando: `sudo lxc-start -n una-caja`, esto inicializa el contenedor y finalmente nos pide los datos que nos mostró al crearla para poder acceder. Una vez los introduzco termina de arrancar

![contenedor arrancado](https://www.dropbox.com/s/svej7pbnj0bupt7/ejr2.2.png?dl=1)

Para ver que interfaces puentes nos ha creado pongo tanto en la terminal de mi máquina como en el contenedor creado anteriormente el comando: `ifconfig` obteniendo los siguientes resultados:

![compruebo interfaces puentes](https://www.dropbox.com/s/f1is1lch0x0edhr/ejr2.3.png?dl=1)

Como podemos ver, en nuestra máquina, nos ha creado una nueva interfaz llamada lxcbr0.



##Ejercicio 3
###1.- Crear y ejecutar un contenedor basado en Debian.

###2.- Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya. Fedora, al parecer, tiene problemas si estás en Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro. Por ejemplo, Óscar Zafra ha logrado instalar Gentoo usando un script descargado desde su sitio, como indica en este comentario en el issue.



##Ejercicio 4
###

![]()

[]()
