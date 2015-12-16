###Ejercicio1: Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.

Lo he instalado introduciendo la terminal lo siguiente:

```
sudo apt-get install lxc debootstrap bridge-utils

```

Miro su compatibilidad con:

```
lxc-checkconfig

```

Imagen de ejecución de los dos comandos:

![instalacionlxc](https://www.dropbox.com/s/mkmh7syfr5rea6s/img1.png?dl=1)


###Ejercicio2: Comprobar qué interfaces puente se han creado y explicarlos.


Para crear el contenedor introduzco en la terminal:
```
sudo lxc-create -t ubuntu -n my-container

```

![creacioncontenedor](https://www.dropbox.com/s/wwd15u0tibzyhgn/img2.png?dl=1)


Para arrancar el contenedor indicamos en la terminal:
```
sudo lxc-start -n my-container
```
Después indicamos el usuario y password:

 - usuario = **ubuntu** 
 - password = **ubuntu**

- Abro otro terminal para ver las interfaces puentes que se han creado. Para verlas, pongo en la terminal:
```
ifconfig -a
```
A mi se me ha creado:
- **lxcbr0**: para el acceso a internet del los contenedores.
- **vethMD40WH**: para la comunicación entre los contenedores.

![puentes_ejecución](https://www.dropbox.com/s/t42w67o2bkgkeam/img3.png?dl=1)

###Ejercicio 3:
###1.Crear y ejecutar un contenedor basado en Debian.
Creo un contenedor denominado mydebian:

![creación_debian](https://www.dropbox.com/s/p4eaoc4oxe4fc80/img4.png?dl=1)


Y para su ejecución:
```
sudo lxc-start -n debianita
```

![ejecución_debian](https://www.dropbox.com/s/3vofy63whd099cm/img5.png?dl=1)

###2.Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya. Fedora, al parecer, tiene problemas si estás en Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro.

He creado un contenedor de centos(mycentos).

```
lxc-create -n mycentos -t centos
```


- La inicio indicando en la terminal:
```
lxc-start -n lxc-centos01 -d
```

![ejecución_centos](https://www.dropbox.com/s/vb05a9e6io5s07z/img6.png?dl=1)

### Ejercicio4

###1. Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.

- Instalación:
```
wget https://lxc-webpanel.github.io/tools/install.sh -O - | bash

```

![instlacion_lxc_webpannel](https://www.dropbox.com/s/jrkpjd9vtunich2/img7.png?dl=1)

- Ejecución(indicando en el navegador:**http://localhost:5000**,usuario=admin,password=admin):

![ejecucion_lxc_webpannel](https://www.dropbox.com/s/hr3re7tg85ana6t/img8.png?dl=1)

###2. Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.

Dirigiéndonos a las máquinas puedo modificar estos parámetros:

![parametros](https://www.dropbox.com/s/w13bkpxx63q6cjd/img9.png?dl=1)

### Ejercicio 5: Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor. Usar nginx.

He realizado lo siguiente:

- Crear el contenedor: 
```

sudo lxc-create -t ubuntu -n my-container 

```
- Inicialarlo: 
```
sudo lxc-start -n my-container.

```

- Instalación de  nginx:

```
sudo apt-get install nginx

```

- Iniciar servicio de nginx: 
```
sudo service nginx start.

```

- Instalar los paquetes de ab: 
```

sudo apt-get install apache2-utils

```
- Ejecutamos prueba del contenedor:
```

ab -n 1000 -c 1000 http://10.0.2.15/ 

```

![ab_contenedor](https://www.dropbox.com/s/boz55jf8xpahzgr/img10.png?dl=1)

- Creamos la jaula:

```

sudo debootstrap --arch=amd64 lucid /home/jaula/lorenmanu/ 

```

- Nos metemos dentro de la ella **cd /home/jaula/lorenmanu/** e metenemos en la terminal:

```

sudo chroot /home/jaula/lorenmanu

```

- Instalo nginx como he hecho anteriormente y lo inicio. También instalo las herramientas necesarias para ab.

- Introduzco en la terminal:

```

ab -n 1000 -c 1000 http://localhost/ 


```
![ab_jaula](https://www.dropbox.com/s/keqrrhpzn4lzm01/img11.png?dl=1)

**Razonamiento**:  Los resultados obtenidos en la jaula con ab son mejores que en el contenedor, esto se debe a que el contenedor usa un puente(**bridge**).


### Ejercicio 6: Instalar docker:

Bastará con poner en la terminal:


```

sudo apt-get install docker.io

```

Para ver la versión:



```

docker -v

```

![docker](https://www.dropbox.com/s/a89un02ohmy391w/img12.png?dl=1)


### Ejercicio 7:

###1. Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.

Para ubuntu realizo lo siguiente:

- Iniciamos servicio: **sudo docker -d &**
- Creamos la imagen con: **sudo docker pull ubuntu**
- Lo inicio: **sudo docker run -i -t ubuntu /bin/bash**

![docker_ubuntu](https://www.dropbox.com/s/1ees54lxs0fuzz8/img13.png?dl=1)

Para centos realizo lo siguiente:

- Iniciamos servicio: **sudo docker -d &**
- Creamos la imagen con: **sudo docker pull centos**
- Lo inicio: **sudo docker run -i -t centos /bin/bash**

![docker_centos](https://www.dropbox.com/s/5u0n1x0ppxokqmf/img14.png?dl=1)

###2. Buscar e instalar una imagen que incluya MongoDB:

![docker_centos](https://www.dropbox.com/s/42eqmv01xhb4gej/img15.png?dl=1)

###Ejercicio 8 : Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.

Debo realizar lo siguiente:

- Iniciar el contenedor: **sudo docker run -i -t ubuntu**.

- Crear el usuario: **useradd -d /home/us_docker -m us_docker*+.

- Crear la contraseña: **passwd us_docker**.

- Indicar privilegios del usuario:**sudo adduser us_docker sudo**.

- Nos logueamos con el usuario, instalamos nginx y curl:**login us_docker**, **sudo apt-get install nginx** y **sudo apt-get install curl**.

- Comprobamos que funciona:

curl 127.0.0.1

- Muestro imagenes de mi realización:

![docker_centos](https://www.dropbox.com/s/slhls9nzah7o9zr/img16.png?dl=1)

![docker_centos](https://www.dropbox.com/s/e6kylsl0c4w5iqu/img17.png?dl=1)

###Ejercicio 9: Crear a partir del contenedor anterior una imagen persistente con commit.

He seguido los siguientes pasos:

- Inicio el contenedor con la orden:**sudo docker start id_contenedor**.
- Realizo commit: **sudo docker commit  id_contenedor img_persistente**.
- Compruebo que se realiza el commit: **sudo docker images -notrunc**.

![ej9](https://www.dropbox.com/s/eqsv0m5fjf7ujfg/img18.png?dl=1)

###Ejercicio 10: Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección.

- Para descargar la imagen deberemos introducir en la terminal.
```
docker pull lorenmanu/submodulo-lorenzo

```

![img7](https://www.dropbox.com/s/yl4i0e5ft3lmpld/img7.png?dl=1)

- Para arrancar la imagen descargada en el paso anterior:

```
sudo docker run i -t lorenmanu/submodulo-lorenzo /bin/bash

```
![img8](https://www.dropbox.com/s/jdwqgser8f9ve5a/img8.png?dl=1)

- Nos vamos al directorio de la app, obtenemos su dirección ip con el comando **ifconfig**, y finalmente la lanzaremos pa visualizarla en nuestro ordenador:

![img9](https://www.dropbox.com/s/h9vb2a8jvsz83qg/xexo.png?dl=1)







