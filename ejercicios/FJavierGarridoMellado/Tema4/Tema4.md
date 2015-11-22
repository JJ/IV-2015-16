###Ejercicio1: Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.

He instalado la version 1.0.7 ( recomendable la siguiente instalación *sudo apt-get install lxc debootstrap bridge-utils*)

![instalacionlxc](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/Pantallazo_zps6s3u6afi.png)

Y se procede a probar su compatibilidad.

![compatibilidad](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/Pantallazo-1_zpsteh1crpp.png)

###Ejercicio2: Comprobar qué interfaces puente se han creado y explicarlos.

- A la hora de crear el contenedor daba un error *debootsrap is missing* , se ha solucionado con el siguiente comando( sacado de los comentarios del siguiente [enlace](http://www.stgraber.org/2012/05/04/lxc-in-ubuntu-12-04-lts/)):

```
apt-get install lxc debootstrap
```

- Puede verse los templates(*sudo apt-get install lxc lxctl lxc-templates*) de los que se dispone con el comando:
```
sudo ls /usr/share/lxc/templates/
```

- Para la creación del contenedor he ejecutado **sudo lxc-create -t ubuntu -n my-container**

![creacioncontenedor](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/creacioncontenedor_zpsdhqzda4x.png)

![creacioncontenedor2](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/creacioncont_zpsdjnejbly.png)

- Arranco el contenedor con el comando **sudo lxc-start -n my-container** y se observa como queda una pantalla negra y el cursor parpadeando, el siguiente paso es introducir el usuario que por defecto es **ubuntu** y pulsar enter, a continuaciòn pide el password a introducir que por defecto tambien es **ubuntu**.

![arrancarcontenedor](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/arrancarcontenedor_zpseexdtowf.png)

- Desde otro terminal ( fuera del contenedor ) ejecuto la orden **ifconfig -a** y se observa los interfaces puentes que se han creado.En mi caso se ha creado **lxcbr0** para que el contenedor tenga acceso a internet y **vethDNIYLW** que permite la comunicación entre diferentes contenedores.

![puentes](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/puentes_zpsxdcapnqp.png)

###Ejercicio 3:
###1.Crear y ejecutar un contenedor basado en Debian.
Mediante el siguiente comando creo un contendedor llamado **debianita**, tal y como se hizo en el apartado anterior:
```
sudo lxc-create -t debian -n debianita
```

![creardebianita](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/debianita_zpszvnsfbyr.png)


Y para su ejecución ( da un error *Failed to mount cgroup at /sys/fs/cgroup/systemd: Permission denied*):
```
sudo lxc-start -n debianita
```
[Enlace](http://blog.jorgeivanmeza.com/2015/10/los-primeros-10-minutos-con-lxc-en-ubuntu/) de interes.
###2.Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya. Fedora, al parecer, tiene problemas si estás en Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro.

Los pasos son los siguientes:

- He instalado *yum* que es necesario para *Fedora/CentOS*( *debootstrap* para *Debian/Ubuntu*) .
- En este caso he creado una *CentOS* ( sin ningun problema a diferencia del apartado anterior con *Debian*) con el comando:
```
lxc-create -n lxc-centos01 -t centos
```

![creacioncentos](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/creacioncentos_zpstttnt8pp.png)

- Antes de ingresar he ejecutado el comando ( mirar en captura anterior ):
```
sudo chroot /var/lib/lxc/lxc-centos01/rootfs passwd
``` 

- He arrancado con el comando:
```
lxc-start -n lxc-centos01 -d
```

![centosandando](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/centosandando_zpsd3qwozmx.png)

- Si surge algún problema puede consultarse la siguiente [guia](http://www.bonusbits.com/wiki/HowTo:Setup_CentOS_LXC_Container_on_Ubuntu).








