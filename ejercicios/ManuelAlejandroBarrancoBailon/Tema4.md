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
![LXCWebPanelGeneral](http://i1016.photobucket.com/albums/af281/raperaco/lxcWebpanelGeneral_zpsswh7gdkr.png)

Podemos arrancar por ejemplo el container de CentOS:
![LXCWebPanelStartCentosContainerStart](http://i1016.photobucket.com/albums/af281/raperaco/centosContainerStartLXCWebPanel_zpss497s5yu.png)

Podemos ver que recursos está usando el container y los ajustes que tiene:
![RecursosyAjustesCentosContainer](http://i1016.photobucket.com/albums/af281/raperaco/ajustesyrecursosCentosContainer_zpspjy9vafk.png)

Por último, podemos parar el container.

**2.Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.**
He restringido la cantidad de memoria que podrá usar el *container* a 1024 MB.
![usomemoriarestringidoCentosCContainer](http://i1016.photobucket.com/albums/af281/raperaco/usomemoriarestringidoCentosCContainer_zpsciylti9g.png)


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
![NginxContainer](http://i1016.photobucket.com/albums/af281/raperaco/NginxContainer_zpsgdcmvkwh.png)

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
![abContainer](http://i1016.photobucket.com/albums/af281/raperaco/abContainer_zpsarpxhmmf.png)

Ahora voy a realizar lo mismo en una **jaula** siguiendo el siguiente [tutorial](http://www.cyberciti.biz/faq/howto-run-nginx-in-a-chroot-jail/):

1. Definimos un directorio a enjaular:
~~~
# D=/nginx
# mkdir -p $D
~~~

2. Crear el entorno aislado:
~~~
# mkdir -p $D/etc
# mkdir -p $D/dev
# mkdir -p $D/var
# mkdir -p $D/usr
# mkdir -p $D/usr/local/nginx
# mkdir -p $D/tmp
# chmod 1777 $D/tmp
# mkdir -p $D/var/tmp
# chmod 1777 $D/var/tmp
# mkdir -p $D/lib64
~~~

3. Crear los dispositivos requeridos en $D/dev
Crear los siguientes tres dispositivos para que nginx pueda trabajar dentro de la jaula:
~~~
# ls -l /dev/{null,random,urandom}
~~~
lo que nos devuelve una salida del tipo: 
*crw-rw-rw- 1 root root 1, 3 Apr  5 11:03 /dev/null
crw-rw-rw- 1 root root 1, 8 Apr  5 11:03 /dev/random
cr--r--r-- 1 root root 1, 9 Apr  5 11:03 /dev/urandom*
Por tanto, ahora con *mknod* creamos dichos ficheros de caracteres:
~~~
# /bin/mknod -m 0666 $D/dev/null c 1 3
# /bin/mknod -m 0666 $D/dev/random c 1 8
# /bin/mknod -m 0444 $D/dev/urandom c 1 9
~~~

4. Copiar los ficheros Nginx
Es necesario copiar /usr/local/nginx/ a $D/usr/local/nginx
~~~
# /bin/cp -farv /usr/local/nginx/* $D/usr/local/nginx
~~~
En caso de que los ficheros de configuración de nginx no se encuentren en /usr/local/nginx, pueden estar en /usr/local/etc/nginx o /etc/nginx. En caso de que sea así, crear el directorio correspondiente en el entorno enjaulado:
* Si está en /etc/nginx:
~~~
# mkdir -p $D/etc/nginx
# cp -farv /etc/nginx/* $D/etc/nginx
~~~

* Si está en /usr/local/etc/nginx:
~~~
# mkdir -p $D/usr/local/etc/nginx
# cp -farv /usr/local/etc/nginx/* $D/usr/local/etc/nginx
~~~

5. Copiar las bibliotecas requeridas
Nginx depende de las librerias lib64 y /usr/lib64. Para mostrarlas, ejecutamos el siguiente comando (en mi caso /usr/sbin/nginx/):
~~~
# ldd /usr/sbin/nginx
~~~

Copiar todos los ficheros que se han mostrado a $D. Para ello utilizar un [script](http://bash.cyberciti.biz/web-server/nginx-chroot-helper-bash-shell-script/) que se provee desde el mismo tutorial que automatiza todo el proceso:
~~~
# cd /tmp
# wget http://bash.cyberciti.biz/dl/527.sh.zip
# unzip 527.sh.zip
# mv 527.sh /usr/bin/n2chroot
# chmod +x /usr/bin/n2chroot
# n2chroot /usr/sbin/nginx
# /bin/cp -fv /lib64/* $D/lib64
~~~

6. Copiar /etc a la jaula
~~~
# cp -fv /etc/{group,prelink.cache,services,adjtime,shells,gshadow,shadow,hosts.deny,localtime,nsswitch.conf,nscd.conf,prelink.conf,protocols,hosts,passwd,ld.so.cache,ld.so.conf,resolv.conf,host.conf} $D/etc
~~~
Tambien ejecutar:
~~~
# cp -avr /etc/{ld.so.conf.d,prelink.conf.d} $D/etc
~~~

7. Arrancar Nginx enjaulado
Matamos cualquier proceso de nginx:
~~~
# killall -9 nginx
~~~
Arrancamos nginx enjaulado:
~~~
# /usr/sbin/chroot /nginx /usr/sbin/nginx -t
# /usr/sbin/chroot /nginx /usr/sbin/nginx
~~~

(*En este punto obtengo un error, no pudiendo seguir. El tutorial es de 2010 y más enfocado a RedHat por lo que puede que algo sea diferente; 
Por tanto, falta acabar la jaula para poder comparar *)


###Ejercicio 6
**Instalar docker.**
Siguiendo el [tutorial de la página oficial](https://docs.docker.com/linux/step_one/) me dispongo a la instalación de Docker:

1. Comprobamos que tengamos wget instalado. En caso contrario, lo instalamos.

2. Descargamos el último paquete de Docker que lo instalará así como sus dependencias :
~~~
wget -qO- https://get.docker.com/ | sh
~~~
Tras finalizar la instalación, me dice que si quiero usar Docker con un usuario que no es root tengo que añadir dicho usuario al grupo *docker*. Por ejemplo en mi caso sería:
~~~
sudo usermod -aG docker alex
~~~

3. Comprobamos que Docker se ha instalado correctamente:
~~~
docker run hello-world
~~~
Si el usuario no lo añadimos al grupo *docker* como se dijo en el punto anterior, hay que ejecutar dicha orden con **sudo**.

![dockerFuncionando](http://i1016.photobucket.com/albums/af281/raperaco/dockerFuncionando_zpsau9trpop.png)


###Ejercicio 7
**1.Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.**
Siguiendo de nuevo, el [tutorial](https://docs.docker.com/linux/step_three/) de la página oficial, voy a instalar dichas imágenes:

* **Ubuntu**
1. Buscamos la imagen en el [buscador](https://hub.docker.com/?utm_source=getting_started_guide&utm_medium=embedded_Linux&utm_campaign=find_whalesay) de Docker. Introduzco la palabra Ubuntu.
![buscarUbuntu](http://i1016.photobucket.com/albums/af281/raperaco/buscarUbuntu_zpsrzvb6eim.png)

2. Por ejemplo, instalo la [imagen oficial](https://hub.docker.com/_/ubuntu/).


3. Ejecutamos el servicio docker :
~~~
sudo docker -d &
~~~

4. Lo instalamos con:
~~~
sudo docker pull ubuntu
~~~

5. Comprobamos que se ha instalado mostrando todos los containers que tenemos:
~~~
sudo docker images
~~~
![dockerImagesUbuntu](http://i1016.photobucket.com/albums/af281/raperaco/dockerImagesUbuntu_zpsrudzelty.png)

* **CentOS**
Se procede de manera similar que la que acabamos de instalar.
Busco la palabra centos, e instalo la [imagen oficial](https://hub.docker.com/_/centos/).

Lo instalo con:
~~~
sudo docker pull centos
~~~
![instalandoDockerCentos](http://i1016.photobucket.com/albums/af281/raperaco/instalandoDockerCentos_zpspusytt0a.png)

Volvemos a comrpobar que se ha instalado con:
~~~
sudo docker images
~~~
![dockerImagesCentos](http://i1016.photobucket.com/albums/af281/raperaco/dockerImagesCentos_zps8ky7tg6u.png)

**2.Buscar e instalar una imagen que incluya MongoDB.**
Instalo la [imagen oficial](https://hub.docker.com/_/mongo/) con:
~~~
sudo docker pull mongo
~~~

Comprobamos su instalación:
~~~
sudo docker images
~~~
![dockerImagesMongo](http://i1016.photobucket.com/albums/af281/raperaco/dockerImagesMongo_zpskip2d3sf.png)


###Ejercicio 8
**Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.**
Voy a hacerlo en la imagen de Ubuntu:

1. Arrancamos la imagen en modo terminal interactivo:
~~~
sudo docker run -i -t ubuntu /bin/bash
~~~
![bashUbuntu](http://i1016.photobucket.com/albums/af281/raperaco/bashUbuntu_zpsmystb9rf.png)

2. Creamos un usuario:
~~~
adduser alex
~~~
![creacionUsuarioUbuntu](http://i1016.photobucket.com/albums/af281/raperaco/creacionUsuarioUbuntu_zpspvfnszvz.png)

3. Instalamos nginx y lo iniciamos:
~~~
apt-get install nginx
service nginx start
~~~

4. Instalamos curl para poder solicitar la página de inicio de nginx:
~~~
apt-get install curl
curl 127.0.0.1
~~~
![PaginaNginxDocker](http://i1016.photobucket.com/albums/af281/raperaco/PaginaNginxDocker_zpsd4hoj77c.png)


###Ejercicio 9
**Crear a partir del contenedor anterior una imagen persistente con commit.**

1. Voy a hacer la imagen sobre el contenedor anterior (el de Ubuntu). Veo que lo tengo arrancado con los comandos ejecutados del ejercicio anterior y veo la ID del container:
~~~
sudo docker ps -a
~~~
![ubuntuIniciado](http://i1016.photobucket.com/albums/af281/raperaco/ubuntuIniciado_zpslyjo8m3i.png)

2. Creo la imagen persistente con el ID del container y el nuevo nombre que tendrá y compruebo que se ha realizado:
~~~
sudo docker commit b68c993bd419 ubualexnginx
sudo docker images
~~~
![imagenUbuNginxAlex](http://i1016.photobucket.com/albums/af281/raperaco/imagenUbuNginxAlex_zpslnuud30x.png)


###Ejercicio 10
**Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección.**

1. Creo en la carpeta raíz del proyecto un fichero **Dockerfile** de la siguiente manera con la ayuda de la [documentación oficial](http://docs.docker.com/engine/reference/builder/):
~~~
FROM ubuntu:latest

#Autor
MAINTAINER Manuel Alejandro Barranco Bailon <mabarranco@correo.ugr.es>

#Actualizar Sistema Base
RUN sudo apt-get -y update

# Instalar Python
RUN sudo apt-get -y install python-setuptools
RUN sudo apt-get -y install python-dev
RUN sudo apt-get -y install build-essential
RUN sudo apt-get -y install python-psycopg2
RUN sudo apt-get -y install libpq-dev
RUN sudo easy_install pip

#Descargar aplicacion
RUN sudo apt-get -y install git
RUN sudo git clone https://github.com/mabarrbai/TusPachangas.git

#Instalar aplicacion
RUN cd TusPachangas/ && pip install -r requirements.txt
RUN cd TusPachangas/ && python manage.py syncdb --noinput
~~~

2. Creamos la imagen a partir de este fichero:
~~~
sudo docker build -f Dockerfile -t ubuntuspachangas .
~~~

Tras crearse la imagen, comprobamos que se ha construido correctamente:
~~~
sudo docker images
~~~
![ubuntuspachangasCreada]()

3. Arrancamos la imagen:
~~~
sudo docker run -i -t ubuntuspachangas /bin/bash
~~~

4. Nos movemos a la carpeta de la aplicación y la ponemos en ejecución:
~~~
cd TusPachangas
python manage.py runserver 0.0.0.0:5500 &
~~~

5. Vemos cual es la IP del container, para utilizarla en una petición desde el navegador del SO anfitrión.
~~~
ifconfig
~~~
![IPubuntuspachangas](http://i1016.photobucket.com/albums/af281/raperaco/IPubuntuspachangas_zpsyklec2dp.png)

Vemos como en mi caso es la 172.17.0.2, a la cual realizaremos la petición al puerto 5500 que es el que indiqué al poner la aplicación en ejecución.
![APPUbuntuspachangas](http://i1016.photobucket.com/albums/af281/raperaco/APPUbuntuspachangas_zpsexlqvw52.png)



