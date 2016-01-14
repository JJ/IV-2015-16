###Ejercicio1: Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.

Instalamos la version 1.0.7 (sudo apt.get install lxc)

Procedemos a probar su compatibilidad.

![compatibilidad](http://i64.tinypic.com/2yx3xvl.png)

###Ejercicio2: Comprobar qué interfaces puente se han creado y explicarlos.

- Ejecutamos para la creación del contenedor: **sudo lxc-create -t ubuntu -n my-container**

![creacioncontenedor](http://i64.tinypic.com/zn7a4p.png)

- Arrancamos el contenedor con el comando **sudo lxc-start -n my-container** y vemos como queda una pantalla negra y el cursor parpadeando, el siguiente paso es introducir el usuario que por defecto es **ubuntu** y pulsar enter, a continuaciòn pide el password que por defecto tambien es **ubuntu**.

![arrancarcontenedor](http://i68.tinypic.com/2q2gwhj.png)

- Desde otro terminal ejecutamos la orden **ifconfig -a** y observamos los interfaces puentes que se han creado. Se ha creado **lxcbr0** para que el contenedor tenga acceso a internet y **vethYA61AP** que permite la comunicación entre diferentes contenedores.

![puentes](http://i68.tinypic.com/fqnmh.png)

###Ejercicio 3:
###1.Crear y ejecutar un contenedor basado en Debian.
Creamos un contendedor llamado **debianita**:
```
sudo lxc-create -t debian -n debianita
```

![creardebianita](http://i63.tinypic.com/r9pylh.png)


Ejecutamos:
```
sudo lxc-start -n debianita
```

###2.Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya. Fedora, al parecer, tiene problemas si estás en Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro.

- En este caso creamos una *CentOS* con el comando:
```
lxc-create -n lxc-centos01 -t centos
```

![creacioncentos](http://i65.tinypic.com/35c33pt.png)

- Antes de ingresar ejecutamos el comando siguiente para cambiar la pass:
```
sudo chroot /var/lib/lxc/lxc-centos01/rootfs passwd
``` 

- Arrancamos con el comando:
```
lxc-start -n lxc-centos01 -d
```


###Ejercicio 4:
###1.Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.

- Instalamos *lxc-webpanel*:
```
wget https://lxc-webpanel.github.io/tools/install.sh -O - | bash
```
- Ponemos la dirección *http://localhost:5000* en el navegador y ponemos el *user/password* que es *admin/admin*.En definitiva vamos a seguir la guia de la página [oficial](http://lxc-webpanel.github.io/install.html).

![instalacion](http://i66.tinypic.com/1zpi3kh.png)

![arrancados](http://i65.tinypic.com/u98bb.png)

###2.Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.

Marcando en alguna máquina de las que tenemos accedemos al panel de configuración, y tal como se observa en la imágen el ajuste de los parámetros es sumamente sencillo.

![centosconf](http://i63.tinypic.com/w8uovn.png)

### Ejercicio 5: Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor. Usar nginx.

Creamos un contenedor de *Ubuntu* llamado *my-container* y dentro del contenedor instalamos el servidor nginx:

- Creamos el contenedor: **sudo lxc-create -t ubuntu -n mi-contenedor** .
- Arrancamos el contenedor: **sudo lxc-start -n mi-contenedor**.
- Actualizamos los repositorios mediante **sudo apt-get update**.
- Instalamos nginx con **sudo apt-get install nginx**. 
- Arrancamos el servicio nginx con el comando **sudo service nginx start**.
- Probamos que disponemos de una página estatica con **curl localhost**.

![curl](http://i67.tinypic.com/pya1v.png)

- Instalamos los paquetes necesarios para poder lanzar ab mediante **sudo apt-get install apache2-utils**
- Ejecutamos **ifconfig -a** desde el contenedor.

![ifconfig](http://i64.tinypic.com/mkemf9.png)

- Lanzamos un ab, **ab -n 1000 -c 1000 http://10.0.3.235/** desde otro terminal.

![resultado](http://i65.tinypic.com/20r48s1.png)


Para crear la jaula seguimos los siguientes pasos para su creación y posterior evaluación con *ab*:

- Creamos la jaula mediante la orden **sudo debootstrap --arch=amd64 lucid /home/jaula/javi/ http://archive.ubuntu.com/ubuntu**.
- Ingresamos en la ruta **/home/jaula/javi/** y dentro de ella ejecutamos **sudo chroot /home/jaula/javi** ( el prompt cambia al de root )
- Hacemos un **ls** para ver que la jaula se ha creado correctamente.

![jaula](http://i63.tinypic.com/2rw6g5i.png)

- Actualizamos los repositorios: **apt-get update**
- Instalamos *nginx* y *curl* con la orden **apt-get install nginx curl**
- Arrancamos el servidor de *nginx* comprobamos la página por defecto con **curl http://127.0.0.1**

- Montamos el directorio **/proc** necesario para hacer **ifconfig -a**, para ello **mount -t proc proc /proc**
- Ejecutamos **ifconfig -a**.
![mount](http://i64.tinypic.com/5b46dg.png)

- Al igual que en el contenedor lanzamos la orden **ab -n 1000 -c 1000 http://localhost/** desde un terminal diferente.

![resultado]()

Como podemos ver los resultados son mejores en la jaula ( aunque en este caso el resultado es parecido por usar una página estatica pequeña), esto es debido a que el contenedor lo hace a través de un puente.

### Ejercicio 6: Instalar docker.

Usamos el siguiente comando para la instalación:
```
sudo apt-get install docker.io
```
![instalacion](http://i68.tinypic.com/2psep6t.png)

Para comprobar la versión instalada ejecutamos:
```
docker -v
```

![versiondocker](http://i63.tinypic.com/2821fv9.png)

Puede comprobarse el estado del servicio y arrancarse mediante:
```
sudo service docker status
sudo service docker start
```

Para ver que se ha instalado correctamente ejecutamos:
```
sudo docker run hello-world
```

![comprobaciondocker](http://i63.tinypic.com/2nlrfab.png)


Debemos borrar el archivo **docker.pid** cada vez que se vaya a ejecutar docker.
```
sudo rm /var/run/docker.pid
```

### Ejercicio 7: 

### 1.Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.

Instalamos la imagen alternativa de Ubuntu:

- Arrancamos el servicio mediante:

```
sudo docker -d &
```
- Creamos la imagen:

```
sudo docker pull ubuntu
```

![creacionubuntu](http://i68.tinypic.com/ngodv7.png)

- Comprobamos los tapers instalado con la orden:

```
sudo docker ps -a
```
![contenedoresdisponibles](http://i68.tinypic.com/30kvjfs.png)

- Comprobamos los tapers ejecutandose con:
```
sudo docker ps
```

![contenedoresejecutando](http://i63.tinypic.com/vrvxq8.png)

- Para arrancar el contenedor:
```
sudo docker run -i -t ubuntu /bin/bash
```

Para **CentOS** se procede de la misma manera:

![instalacioncentos](http://i65.tinypic.com/347csuv.png)

![contenedoresejecucion](http://i68.tinypic.com/2gxrbc6.png)

![centosejecucion](http://i65.tinypic.com/71o2le.jpg)


### 2.Buscar e instalar una imagen que incluya MongoDB.

Lo instalamos y comprobamos que funciona:

- Instalación:

![instalacion](http://i68.tinypic.com/30048c4.png)

- Ejecución:

![ejecmongo](http://i68.tinypic.com/4sgq5j.png)

### Ejercicio 8 : Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.

- Arrancamos el contenedor Ubuntu:
```
sudo docker run -i -t ubuntu
```
- Una vez dentro creamos un usuario:
```
useradd -d /home/us_docker -m us_docker
```
- Introducimos una pass para el usuario:
```
passwd us_docker
```
- Añadimos privilegios para el usuario:
```
sudo adduser us_docker sudo
```
- Me logueo con dicho usuario e instalamos nginx:
```
login us_docker
```
![pasos_anteriores](http://i66.tinypic.com/ng1po6.png)

- Instalo nginx
```
sudo apt-get install nginx
```
- Instalo curl:
```
sudo apt-get install curl
```
- Verificamos que funciona:
```
curl 127.0.0.1
```

A continuación dos imágenes que ilustran lo realizado:

![curl]()

### Ejercicio 9: Crear a partir del contenedor anterior una imagen persistente con commit.

- Arrancamos el contenedor mediante la orden (la ID corta se obtiene ejecutando **sudo docker ps -a**):
```
sudo docker start 40bf706e7e44
```
- Localizamos la ID del contenedor:
```
sudo docker ps -a=false
```
![obtenerid](http://i63.tinypic.com/214qqop.png)

- Comprobamos las ID largas para verificar que se esta trabajando con la imagen correcta:
```
sudo docker inspect ea67ad9b0eee
```
```
sudo docker images -notrunc
```

![comprobarid](http://i65.tinypic.com/2yy6w09.png)


- Realizamos el commit:

```
sudo docker commit  ea67ad9b0eee img_persistente
```

- Comprobamos que se ha realizado el commit:
```
sudo docker images -notrunc
```
![commit](http://i64.tinypic.com/29zac68.png) 

### Ejercicio 10: Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección.

- Creamos un archivo **Dockerfile** dentro de la carpeta del proyecto:
```
FROM ubuntu:latest

#libro
MAINTAINER Javier Ruiz Cesar <javiexfiliana@gmail.com>


#Actualizar el Sistema Base
RUN sudo apt-get -y update


#Descargar aplicacion
RUN sudo apt-get install -y git
RUN sudo git clone https://github.com/javiexfiliana7/submodulo-javi.git


# Instalar Python y PostgreSQL
RUN sudo apt-get install -y python-setuptools
RUN sudo apt-get -y build-dep python-imaging --fix-missing
RUN sudo apt-get -y install python-dev
RUN sudo apt-get -y install build-essential
RUN sudo apt-get -y install python-psycopg2
RUN sudo apt-get -y install libpq-dev
RUN sudo apt-get install python2.7
RUN sudo easy_install pip
RUN sudo easy_install Pillow


#Instalar la app
RUN ls
RUN cd submodulo-javi/ && ls -l
RUN cd submodulo-javi/ && cat requirements.txt
RUN cd submodulo-javi/ && sudo pip install -r requirements.txt


#Migraciones
RUN cd submodulo-javi/ && python manage.py syncdb --noinput
```
- Dentro del directorio del proyecto creamos la imagen:
```
 sudo  docker build -t submodulo-javi .
```

- Comprobamos que efectivamente se ha construido la imagen:
```
sudo docker images
```

- Arrancamos la imagen mediante:
```
 sudo docker run -t -i submodulo-javi /bin/bash
```
![imagen](http://i63.tinypic.com/21ky1w6.png)

- Entramos dentro del directorio de la aplicación y la lanzamos:
```
python manage.py runserver 172.17.0.1:2222 &
```

- Comprobamos que la app esta disponible:

![appnavegador](http://i66.tinypic.com/qs6nx4.png)


