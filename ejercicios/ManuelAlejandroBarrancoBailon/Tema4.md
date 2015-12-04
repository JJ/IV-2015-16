#Tema 4

##Ejercicios

###Ejercicio 1
**Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.**
He instalado la versión 1.0.7 de LXC a través del gestor de paquetes apt-get en Linux Mint con la orden:
~~~
sudo apt-get install lxc
~~~

###Ejercicio 2
**Comprobar qué interfaces puente se han creado y explicarlos.**

* Tras instalar lxc, para poder crear el container de Ubuntu he tenido que instalar **debootstrap** y **lxc-templates** de donde obtenderemos el template de Ubuntu para instalar en nuestro container.
~~~
sudo apt-get install debootstrap
sudo apt-get install lxc-templates
~~~

* A continuación he procedido a la instalación del container con la orden:
~~~
sudo lxc-create -t ubuntu -n UbuContainer
~~~
![Creacion UbuContainer](http://i1016.photobucket.com/albums/af281/raperaco/CracionUbuContainer_zpsyai3op1l.png)

* Una vez creado el container, lo iniciamos.
~~~
sudo lxc-start -n UbuContainer
~~~
![Inicio UbuContainer](http://i1016.photobucket.com/albums/af281/raperaco/startUbuContainer_zpsadwafkhq.png)
(Tener en cuenta, que por defecto se tiene el user ubuntu y el password ubuntu.)

* Para ver los puentes que se han creado usamos la orden **ifconfig** tanto en el container como en el anfitrión. De esta manera, en el container vemos que IP's tienen las dos interfaces (eth0: 10.0.3.141 y lo: 127.0.0.1) y en el anfitrión buscamos esta IP 10.0.3.141 entre sus interfaces de red, y vemos que pertenece a **lxcbr0** y que la otra interfaz creada es **veth84B5SR**.
![InterfacesRed UbuContainer](http://i1016.photobucket.com/albums/af281/raperaco/InterfacesRedUbuContainer_zpsibvfx8iy.png)

Consultando la [documentación de LXC](https://linuxcontainers.org/lxc/manpages/man5/lxc.container.conf.5.html) , se recoge que se crea este par de interfaces donde una está asignada al container y la otra encargada de hacer un bridge con la máquina anfitriona. Es decir, la interfaz **lxcbr0** es el puente que hace NAT para tener conexión a Internet a través del anfitrión y la interfaz **veth84B5SR** es la interfaz local correspondiente a localhost(127.0.0.1).

###Ejercicio 3
**1. Crear y ejecutar un contenedor basado en Debian.**

En lugar de Debian, lo he creado basado en Ubuntu que es sobre la distribución que uso en el anfitrión, el cual me funcionó en los pasos anteriores sin problemas.

* Creamos el contenedor basado en Ubuntu con la orden:
~~~
sudo lxc-create -t debian -n UbuContainer
~~~

* Ejecutamos el contenedor
~~~
sudo lxc-start -n UbuContainer
~~~

Las capturas de pantalla que demuestran ambos procesos se pueden consultar en el ejercicio 2.


**2. Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. **

Me decido por la distribución CentOS. Para ello se procede de forma similar al apartado anterior. La única diferencia es que hay que establecer la password del usuario root tras la creación del container. Además al tratarse de CentOS hay que instalar el paquete **yum**.

~~~
sudo apt-get install yum
sudo lxc-create -t centos -n CentosContainer
sudo chroot /var/lib/lxc/CentosContainer/rootfs passwd
sudo lxc-start -n CentosContainer
~~~

Creando CentosContainer:
![CreateCentosContainer](http://i1016.photobucket.com/albums/af281/raperaco/CreateCentosContainer_zpsvdn4xd8f.png)

Estableciendo la password del usuario root:
![SetRootPasswordCentosContainer](http://i1016.photobucket.com/albums/af281/raperaco/SetRootPasswordCentosContainer_zpsu4yzuxbc.png)

Inicio de CentosContainer:
![Inicio CentosContainer](http://i1016.photobucket.com/albums/af281/raperaco/InicioCentosContainer_zpsfboz0crr.png)

###Ejercicio 4
**1.Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.**
Para ello, seguimos las instrucciones de su [página oficial](https://lxc-webpanel.github.io/install.html).
Ejecutamos como usuario **root** en un terminal:
~~~
wget https://lxc-webpanel.github.io/tools/install.sh -O - | bash
~~~

A continuación, nos vamos en el navegador a la URL *http://127.0.0.1:5000/* e introducimos como usuario *admin* y password *admin*. 
![LXCWebPanelGeneral]()

Podemos arrancar por ejemplo el container de CentOS:
![LXCWebPanelStartCentosContainerStart]()

Podemos ver que recursos está usando el container y los ajustes que tiene:
![RecursosyAjustesCentosContainer]()

Por último, podemos parar el container.

**2.Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.**
He restringido la cantidad de memoria que podrá usar el *container* a 1024 MB.
![usomemoriarestringidoCentosCContainer]()


###Ejercicio 5
**Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor. Usar nginx.**
Primero voy a instalar nginx en el **container UbuContainer**.
Tras arrancarlo con **sudo lxc-start -n UbuContainer** me dispongo a instalar nginx.
~~~
sudo apt-get update
sudo apt-get install nginx
~~~
Finalizado el proceso, arrancamos el servicio nginx:
~~~
sudo service nginx start
~~~
Tras comprobar con **ifconfig** que la IP es 10.0.3.141, en el navegador, introducimos dicha dirección y comprobamos cómo el servidor está funcionando sirviendo la página de bienvenida de NGINX.
![NginxContainer]()

Ahora instalamos en nuestra máquina anfitrión el paquete apache2-utils para poder usar apache benchmark con el que evaluar las prestaciones.
~~~
sudo apt-get update
sudo apt-get install apache2-utils
~~~
Ya podemos lanzar unos test de carga con apache benchmark:
~~~
ab -n 2500 -c 1000 http://10.0.3.141/
~~~
Con lo que obtenemos de salida:
![abContainer]()

Ahora voy a realizar lo mismo en una **jaula**.

