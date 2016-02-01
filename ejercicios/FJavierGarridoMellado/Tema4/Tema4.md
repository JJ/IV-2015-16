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


###Ejercicio 4:
###1.Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.

- Con el siguiente comando instalo *lxc-webpanel*:
```
wget https://lxc-webpanel.github.io/tools/install.sh -O - | bash
```
- Pongo la dirección *http://localhost:5000* en el navegador y acto seguido introduzco el *user/password* que es *admin/admin*.En definitiva sigo la guia de la página [oficial](http://lxc-webpanel.github.io/install.html).

![pagina](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/paglxc_zps8i6nrixu.png)

![instalacion](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/instalacionlxcpanel_zpstvts3jv7.png)

![panel](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/lxcpanel_zps88itw4ab.png)

![arrancados](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/lxcarranc_zpso5a0fn0d.png)

###2.Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.

Marcando en alguna máquina de las que se dispone se accede al panel de configuración, y tal como se observa en las imágenes el ajuste de los parámetros es sumamente sencillo.

![centosconf](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/confcentos_zpsvhctm4hb.png)

![centosconf2](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/confcentos_zpscxyrcaor.png)

### Ejercicio 5: Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor. Usar nginx.

He procedido a crear en una máquina virtual un contenedor de *Ubuntu* llamado *my-container* y dentro del contenedor he instalado el servidor nginx. Para ello he seguido los siguientes pasos:

- Crear el contenedor mediante la orden **sudo lxc-create -t ubuntu -n my-container** ( tarda un ratito ).
- Arrancar el contenedor con el comando **sudo lxc-start -n my-container**.
- Actualizar los repositorios mediante **sudo apt-get update**.
- Instalar nginx con **sudo apt-get install nginx**. 
- Arrancar el servicio nginx con el comando **sudo service nginx start**.
- Instalar curl mediante **sudo apt-get install curl** ( no es necesario ).
- Probar que efectivamente se dispone de una página estatica  con **curl localhost**.

![curl](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/curlcontenedor_zpszgaa7doj.png)

- Instalar los paquetes necesarios para poder lanzar ab mediante **sudo apt-get install apache2-utils**
- Ejecutar **ifconfig -a** desde el contenedor.

![ifconfig](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/ifconfigcontenedor_zpsootj7ofm.png)

- Lanzar un ab, en mi caso **ab -n 1000 -c 1000 http://10.0.3.35/** desde otro terminal.

![resultado](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/abcontenedor_zps5boooz1r.png)


Para crear la jaula ( jail ) al igual que antes tambien he usado una máquina virtual.He seguido los siguientes pasos para su creación y posterior evaluación con *ab*:

- He creado la jaula mediante la orden **sudo debootstrap --arch=amd64 lucid /home/jaula/javi/ http://archive.ubuntu.com/ubuntu** ( tarda un ratito ).
- He ingresado en la ruta **/home/jaula/javi/** y dentro de ella he ejecutado **sudo chroot /home/jaula/javi** ( el prompt cambia al de root )
- He hecho un **ls** para ver que efectivamente la jaula se habia hecho correctamente.

![jaula](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/jaula_zpsxikqzvcp.png)

- He actualizado los repositorios mediante la orden **apt-get update**
- He instalado *nginx* y *curl* con la orden **apt-get install nginx curl**
- He arrancacado el servidor de *nginx* y he comprobado la página por defecto con **curl http://127.0.0.1**

![curl](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/curljaula_zpsc1rnd6ar.png)

- He montado el directorio **/proc** necesario para hacer **ifconfig -a**, para ello **mount -t proc proc /proc**
- Ejecuto **ifconfig -a** como mencioné en el paso anterior.

![](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/ifconfigjail_zpskoc9afyy.png)


- Tambien he instalado la paqueteria necesaria para *ab* con **apt-get install apache2-utils**
- Al igual que en el contenedor he lanzado la orden **ab -n 1000 -c 1000 http://localhost/** desde un terminal diferente.

![resultado](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/abjail_zpstfdqwkmj.png)

La conclusión es que los resultados son mejores en la jaula ( aunque en este caso el resultado es muy parecido por usar una página estatica de poco peso ) y esto es asi porque el contenedor lo hace a través de un puente ( bridge ).

### Ejercicio 6: Instalar docker.

Para la instalación de Docker he ejecutado el siguiente comando:
```
sudo apt-get install docker.io
```
![instalacion](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/installdocker_zps9uiv6qgz.png)

Según la literatura puede instalarse tambien ejecutando:
```
curl -sSL https://get.docker.com/ | sudo sh
```

Para comprobar la versión instalada basta con ejecutar:
```
docker -v
```

![versiondocker](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/versiondocker_zpsdpshhwex.png)

Puede comprobarse el estado del servicio y arrancarse mediante:
```
sudo service docker status
sudo service docker start
```

Para comprobar que efectivamente se ha instalado correctamente se ejecuta:
```
sudo docker run hello-world
```

![comprobaciondocker](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/comprobaciondocker_zpshejdvypn.png)


Es importante borrar el archivo **docker.pid** cada vez que se vaya a ejecurar docker.
```
sudo rm /var/run/docker.pid
```

### Ejercicio 7: 

### 1.Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.

Para instalar la imagen alternativa de Ubuntu he seguido los siguientes pasos:

- He arrancado el servicio mediante:

```
sudo docker -d &
```
- He creado la imagen con el siguiente comando:

```
sudo docker pull ubuntu
```

![creacionubuntu](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/installubuntu_zpsfieaf0rd.png)

- He comprobado los tapers instalado con la orden:

```
sudo docker ps -a
```
![contenedoresdisponibles](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/contenedoresdisponibles_zpsi48ads6h.png)

- Para comprobar los tapers ejecutandose basta con:
```
sudo docker ps
```
ó
```
sudo docker images
```
![contenedoresejecutando](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/contenedoresejecucion_zpsx0z76kw0.png)

- Para arrancar el contenedor:
```
sudo docker run -i -t ubuntu /bin/bash
```

![ejecucion](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/contenedorfuncionando_zpsb3xagvxw.png)

Para **CentOS** se procede de la misma manera:

![instalacioncentos](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/installcentos_zpstvvoxben.png)

![contenedoresejecucion](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/contenedoresejecucion2_zpsucv13gjc.png)

![centosejecucion](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/contenedorfuncionando2_zpsu20jmtje.png)

Si se quiere para un docker la manera de obtener el **id** es ejecutando:
```
sudo docker ps -a=false
```
Y para pararlo se ejecuta:
```
sudo docker stop id
```
Para borrar un contenedor usar:
```
sudo docker rmi -f c753c7d40294
```
Por ejemplo:

![stopdocker](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/dockerstop_zpsgkyrbmev.png)

### 2.Buscar e instalar una imagen que incluya MongoDB.

Se procede de igual manera que en el apartado anterior, lo instalo y compruebo que se ha hecho correctamente.

- Instalación:

![instalacion](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/installmongo_zpshrhp2rzr.png)

- Imagenes disponibles (mirar imagen siguiente).

- Ejecución imagen mongo.

![ejecmongo](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/imagesmongo_zpsvjtpyq1g.png)

### Ejercicio 8 : Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.

Los pasos son los siguientes:
- Arrancar el contenedor Ubuntu mediante el comando:
```
sudo docker run -i -t ubuntu
```
- Una vez dentro se crea un usuario, por ejemplo:
```
useradd -d /home/us_docker -m us_docker
```
- Se introduce una pass para el usuario:
```
passwd us_docker
```
- Se añade privilegios para el usuario:
```
sudo adduser us_docker sudo
```
- Me logueo con dicho usuario y procedo a instalar nginx:
```
login us_docker
```
- Instalo nginx
```
sudo apt-get install nginx
```
- Instalo curl:
```
sudo apt-get install curl
```
- Procedo a verificar que funciona mediante:
```
curl 127.0.0.1
```

A continuación dos imágenes que ilustran lo realizado:

![creacuser](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/creacionusuario_zpsity6kwlw.png)

![curl](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/curl_zpszvbxmpye.png)

### Ejercicio 9: Crear a partir del contenedor anterior una imagen persistente con commit.

Los pasos para crear una imagen persistente con commit han sido los siguientes:
- Arrancar el contenedor mediante la orden (he usado el id corto ya que el largo da error, tambien sirve usar run como se hizo en el ejercicio anterior, la ID corta se obtiene ejecutando **sudo docker ps -a**):
```
sudo docker start 40bf706e7e44
```
- Localizar la ID del contenedor:
```
sudo docker ps -a=false
```
![obtenerid](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/obtenerid_zps07umlagg.png)

- Comprobar las ID largas para verificar que se esta trabajando con la imagen correcta(este paso puede obviarse):
```
sudo docker inspect 40bf706e7e44
```

![comprobarid](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/comprobarid_zpsxhb78m7c.png)

```
sudo docker images -notrunc
```

![comprobarid2](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/comprobarid2_zpst1nnbf0h.png)

- Realizar el commit:
```
sudo docker commit  40bf706e7e44 img_persistente
```

- Comprobar que se ha realizado el commit:
```
sudo docker images -notrunc
```
![commit](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/commitimagen_zpshw00evem.png) 958243136

### Ejercicio 10: Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección.

Este ejercicio lo he realizado desde una máquina virtual sin obtener ningun tipo de error de conexión con Internet a la hora de construir la imagen.Los pasos han sido los siguientes:
- Crear un archivo **Dockerfile** dentro de la carpeta del proyecto, por ejemplo(no olvidar iniciar servicio docker con *sudo docker -d &*):
```
FROM ubuntu:latest

#Autor
MAINTAINER Francisco Javier Garrido Mellado <franciscojaviergarridomellado@gmail.com>

#Actualizar Sistema Base
RUN sudo apt-get -y update

#Descargar aplicacion
RUN sudo apt-get install -y git
RUN sudo git clone https://github.com/javiergarridomellado/IV_javiergarridomellado.git

# Instalar Python y PostgreSQL
RUN sudo apt-get install -y python-setuptools
RUN sudo apt-get -y install python-dev
RUN sudo apt-get -y install build-essential
RUN sudo apt-get -y install python-psycopg2
RUN sudo apt-get -y install libpq-dev
RUN sudo easy_install pip
RUN sudo pip install --upgrade pip

#Instalar la app
RUN ls
RUN cd IV_javiergarridomellado/ && ls -l
RUN cd IV_javiergarridomellado/ && cat requirements.txt
RUN cd IV_javiergarridomellado/ && sudo pip install -r requirements.txt

#Migraciones
RUN cd IV_javiergarridomellado/ && python manage.py syncdb --noinput
```
- Dentro del directorio del proyecto crear la imagen mediante el comando(no olvidar el punto que hay al final del comando):
```
 sudo  docker build -t iv_javier .
```
Tambien es válido el siguiente comando:
```
sudo docker build -f Dockerfile -t nombre_imagen . 
```

![construirimagen](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/contruirimagen_zpsiom2cqek.png)

- Comprobar que efectivamente se ha construido la imagen mediante:
```
sudo docker images
```

![imagen](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/imagen_zpso1zgeqg0.png)

- Arrancar la imagen mediante(en mi caso):
```
 sudo docker run -t -i iv_javier /bin/bash
```
- Entrar dentro de la aplicación que se ha generado y arrancarla(antes es necesario hacer *ifconfig* para saber la ip del container):
```
python manage.py runserver 0.0.0.0:2222 &
```

![appfuncionando](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/appfuncionando_zpsvkvsho54.png)

- Comprobar desde el navegador que efectivamente la app esta disponible:

![appnavegador](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/appfuncionando2_zpsjlrpwanh.png)

- En la máquina anfitrión he procedido de la misma manera con la salvedad de que para crearlo he usado el comando:
```
sudo docker build -f Dockerfile -t iv_javiergarrido --no-cache=true ./
```

Añadir *--no-cache=true* hace que no utilice la caché de un contenedor anterior (sin usar esta opción obtenia problemas al instalar librerías)

- El resto de los pasos es exactamente igual.

![crearimagen](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/crearimagen_zpsm1hnuzom.png)

![imagen](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/images_zpsdd87vd9m.png)

![contenedor](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/contenedorapp_zpsrxmc15nw.png)

![ifconf](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/ifconfig_zpsmc9uvwlg.png)

![app](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/appfuncionando_zpswyheqevq.png)

![app2](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/appfuncionando2_zpshnh4chn8.png)

Importante: tuve problemas de conexión del contenedor con Internet que misteriosamente he resuelto ejecutando *sudo rm /var/run/docker.pid* y volviendo a reiniciar con *sudo docker -d &*, otra posible solución es la que aporta [hugobarzano](https://github.com/hugobarzano/IV-2015-16/blob/master/ejercicios/HugoBarzano/tema4.md) donde se realiza lo siguiente en la máquina anfitriona(la nuestra):
**Si al arrancar el docker, este no tiene conexión a internet, podemos resolverlo editando /etc/NetworkManager/NetworkManager.conf y comentando la línea dns=dnsmask y tras esto, reiniciar el servicio con:**
```
sudo restart network-manager
```


##Con el siguiente comando limpiamos todos los contenedores en estado Exited:
```
docker rm $(sudo docker ps -a | grep Exit | cut -d ' ' -f 1)
```
