#Ejercicios - Jesús Prieto López
##TEMA 4

###Ejercicio 1:Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.

Para instalar **LXC**:

- `$ apt-get install lxc`

En caso de que no pudieramos instalarlo, tenemos que añadir el PPA que contiene la versión deseada. Desde el enlace de [descargas de la página oficial](https://linuxcontainers.org/lxc/downloads/) podemos seleccionar una versión.

En este caso he utilizado la versión *lxc-stable* y su ppa es: ppa:ubuntu-lxc/lxc-stable

Primero, añadimos el ppa con el siguiente comando:

`$ add-apt-repository ppa:ubuntu-lxc/lxc-stable`

![Añadiendo ppa al repositorio desde consola](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap1_zps6iqs6b4u.png)

Si sale algo parecido a la imagen quiere decir que se ha añadido sin problema. Instalamos la aplicación después de realizar un *update*.

`$ apt-get update`
`$ apt-get install lxc`

Comprobamos la versión y la configuración de **lxc**. 

`$ lxc-ls --version`

![Versión de lxc](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap5_zpsp9edb62z.png)

`$ lxc-checkconfig`

![Configuración de lxc](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap2_zpsqnlgvb6a.png)

Deberían aparecer las opciones en modo *enabled* (como en la imagen), que indican su instalación y configuración para el soporte y funcionamiento de esta tecnología.


###Ejercicio 2: Comprobar qué interfaces puente se han creado y explicarlos.

Para este ejercicio necesitamos crear un contenedor con la orden **lxc-create**. He creado un contenedor con *Ubuntu* instalando en él y lo he llamado *caja-ubuntu*.

`$ lxc-create -t ubuntu -n caja-ubuntu`

![Creación completa del contenedor con Ubuntu](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap3_zpstyjpy8ae.png)

> Como vemos en la captura, al completar la creación nos indica que por defecto el usuario predeterminado es "ubuntu" y la contraseña "ubuntu".

Es necesario poner el contenedor en funcionamiento iniciando este con la orden *lxc-start*. Una vez iniciado nos logueamos en el sistema.

`$ lxc-start -n caja-ubuntu`

![Lanzando el contenedor creado](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap4_zpsdu9ga1er.png)

Para ver las interfaces puente que se han creado ejecutamos fuera del contenedor (con el contenedor en marcha, ojo) el siguiente comando:

`$ ifconfig`

![Interfaces de red del sistema en el contenedor](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap6_zpsvjrtil9w.png)

Podemos ver que se han creado dos interfaces:

- **lxcbr0**: es la interfaz para proporcionar conexión a la red de internet al contenedor.
- **veth3E93TW**: sirve para comunicar entre sí los contenedores.


###Ejercicio 3: 
####3.1: Crear y ejecutar un contenedor basado en Debian.

Elijo para este caso la distribución de *Debian*. Creamos el contenedor.

`$ lxc-create -t debian -n caja-debian`

![Creación del contenedor con Debian](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap7_zpskpvvq5zw.png)

E iniciamos el contenedor que acabamos de crear.

`$ lxc-start -n caja-debian`

![Contenedor con Debian funcionando](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap8_zpssjfsexhk.png)

> Si nos aparece el error: "Failed to mount cgroup at /sys/fs/cgroup/systemd: Permission denied"; parece dar fallo con opciones de montaje. Necesitamos ir al archivo de configuración */var/lib/lxc/caja-debian/config* y añadir la línea `lxc.aa_profile = unconfined`.

####3.2: Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora.

He utilizado la distribución *Fedora* para el contenedor. Creando el contenedor con:

`$ lxc-create -t fedora -n caja-fedora`

![Creación del contenedor con Fedora](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap9_zpshtozqpjb.png)

Como nos indica al crearlo, podemos indicar la contraseña del usuario *root* con el comando `$ chroot /var/lib/lxc/caja-fedora/rootfs passwd`.

Una vez hecho esto, iniciamos el contenedor.

`$ lxc-start -n caja-fedora`

![Contenedor con Fedora arrancado](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap10_zps67z05y2o.png)


> Si nos aparece el error: "Failed to mount cgroup at /sys/fs/cgroup/systemd: Permission denied"; parece dar fallo con opciones de montaje. Necesitamos ir al archivo de configuración */var/lib/lxc/caja-fedora/config* y descomentar la línea `lxc.aa_profile = unconfined`.


###Ejercicio 4
####Ejercicio 4.1: Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.

Instalamos *lxc-webpanel* descargandonos un script del repositorio, como indica en el [siguiente enlace](https://lxc-webpanel.github.io/install.html).

`$ wget https://lxc-webpanel.github.io/tools/install.sh -O - | bash`

> Es posible que nos indique que lo instalemos desde el usuario *root*

Una vez instalado accedemos al panel desde el navegador con la dirección http://localhost:5000/. Los datos del login son para el username *admin* y password *admin* también.

Nos aparece la página principal de *lxc-webpanel* desde la cual nos permite realizar operaciones sobre los contenedores creados anteriormente.

![Página principal del lxc-webpanel](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap11_zpsqqhbjpzq.png)

Si se arranca un contenedor, por ejemplo *caja-debian*, desde el botón **Start**, nos aparecerá la siguiente notificación y el recuadro del contenedor cambiará de color y estado.

![Página principal de lxc-webpanel después de iniciar un contenedor](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap12_zpsvj8xssf0.png)

####Ejercicio 4.2: Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.

Desde el menú lateral izquierdo accedemos a los recursos del contenedor en los que queramos modificar estos. Tan solo hay que seleccionar el contenedor desde ese menú.

![Menú lxc-webpanel](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap13_zpsmnj0qhph.png)

Directamente nos aparecen las diferentes opciones del contenedor, en las que están también las referentes a los recursos del mismo.

![Configuración de recursos del contenedor](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap14_zpsujfchiti.png)


###Ejercicio 5: Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor. Usar nginx.

Para ver las prestaciones dentro de un contenedor voy a utilizar el contenedor con ubuntu, que había llamado *caja-ubuntu*.

Desde el contenedor instalo y arranco el servidor *nginx* siguiendo los siguientes pasos:

`$ sudo apt-get install nginx`
`$ sudo service start nginx`

Para comprobar que funciona, desde el contenedor obtener la ip mediante `$ ifconfig`. En mi caso es la 10.0.3.198. Desde fuera del contenedor, desde el navegador comprobamos si funciona el servidor o no.

![Página principal del servidor nginx en el contenedor ubuntu](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap15_zpsazlqrk0r.png)

Para instalar el servidor dentro de una jaula primero hay que crear esta y prepararla. Para esto he usado *debootstrap*.

`$ apt-get install debootstrap`

Creamos ahora la jaula con ubuntu, indicando la arquitectura, la versión de este, el directorio deseado y la web desde donde obtener el sistema. Este proceso tardará unos minutos.

`$ debootstrap --arch=amd64 lucid /home/jes/jaula-ubuntu/ http://archive.ubuntu.com/ubuntu`

![Directorio donde se ha creado la jaula](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap16_zpsdnjxubc3.png)

Accedemos a la jaula para comprobar que funciona (cambiará el prompt).

`$ chroot /home/jes/jaula-ubuntu/`

![Dentro de la jaula creada con ubuntu](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap17_zps9zkaxcn1.png)

Pasamos ahora a instalar el servidor *nginx* en la jaula.

`$ apt-get install nginx`

> Si nos da un error indicando `nginx: [emerg] bind() to 0.0.0.0:80 failed (98: Address already in use)` hay que liberar el puerto 80 desde el sistema fuera de la jaula. Esto se puede hacer con e comando `fuser -k 80/tcp`.

Y ahora iniciamos el servicio del servidor.

`$ service nginx start`

Ahora comprobamos que funciona correctamente desde el navegador insertando la dirección http://localhost/ .

![Página web del servidor nginx en la jaula](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap18_zpsnx6bbkik.png)

Ahora están los dos servidores listos para poder comparar sus prestaciones. Lo haremos sencillamente con la herramienta **apache benchmark** (ab). Para instalar la herramienta que he mencionado usamos:

`$ apt-get install apache2-utils`

Ejecutamos el comando con *ab*, seguido de los parámetros y la url. En este caso los parámetros que voy a usar son: **-n** para indicar el número de peticiones y **-c** para indicar el número de peticiones que se pueden aceptar al mismo tiempo.

- Jaula con Ubuntu -> `$ ab -n 5000 -c 1000 http://localhost/`

![Resultados del ab sobre la jaula](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap19_zpsdknoha02.png)

- Contenedor con ubuntu -> `$ ab -n 5000 -c 1000 http://10.0.3.198/`

![Resultados del ab sobre el contenedor](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap20_zpsyze6lbhc.png)

Se puede apreciar que desde el contenedor dan mejores resultados que la jaula, por ejemplo en el apartado **Request per second** vemos que el contenedor puede atender más peticiones por segundo y en **Time per request** que tarda menos para cada petición.


###Ejercicio 6: Instalar docker.

Es sencillo instalar esta herramienta para la gestión de contenedores.

`$ wget -qO- https://get.docker.com/ | sh`

Después de instalarlo es necesario iniciar el demonio de *docker*.

`$ service docker start`

Comprobamos que se ha instalado correctamente con:

`$ docker run hello-world`

![Ejecutando docker por primera vez](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap21_zps15plvlbf.png)


###Ejercicio 7
####Ejercicio 7.1: Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.

Si tenemos *docker* instalado y funcionando (con el demonio), podemos instalar imágenes mediante el comando **docker pull**.

`$ docker pull ubuntu`

`$ docker pull centos`

![Instalación de las imágenes para docker de ubuntu y centos](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap22_zpsnjztczic.png)

####Ejercicio 7.2: Buscar e instalar una imagen que incluya MongoDB.

Podemos utilizar el buscador de [este enlace](https://hub.docker.com/) para buscar imágenes, en este caso la de mongo. Hay una imagen del repositorio oficial, encontrado en [este enlace](https://hub.docker.com/_/mongo/), y podemos instalar la imagen con el siguiente comando:

`$ docker pull mongo`

![Instalación de la imagen para docker de mongo](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap23_zpsppnjbror.png)


###Ejercicio 8: Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.

Para este ejercicio voy a utilizar el contenedor con la imagen de ubuntu creado en el ejercicio 7. Para acceder a él y poder realizar todos los comandos utilizo la siguiente orden:

`$ docker run -i -t ubuntu /bin/bash`

Esto nos cambiará el prompt. Una vez dentro procedemos a crear el usuario y a instalar nginx. Me he creado un usuario llamado *jes*, asignándole una contraseña y logueandome después.

`$ useradd -m jes`
`$ passwd jes`
`$ login jes`

![Creación de usuario y login desde la imagen docker](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap24_zpsbsmftx03.png)

Nos pasamos al usuario *root* simplemente con la orden `$ exit` e instalamos el servidor nginx.

`$ apt-get install nginx`

Arrancamos el servicio del servidor.

`$ service nginx start`

Para probar que funciona correctamente, obtenemos la IP desde dentro del contenedor con `$ ifconfig`. En mi caso es 172.17.0.2. Ahora desde fuera del contenedor en el navegador introducimos esa dirección IP (http://172.17.0.2) y debería salir algo así:

![Página del servidor nginx en el contendor docker](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap25_zpshqxq8dby.png)


###Ejercicio 9: Crear a partir del contenedor anterior una imagen persistente con commit.

Voy a utilizar el contenedor docker que contiene ubuntu, utilizado en los ejercicios anteriores.

Para poder crear una imagen persistente de un contenedor tal como está, en un determinado momento, necesitamos la ID de ese contenedor. Estando en funcionamiento se puede mostrar su id con el comando:

`$ docker ps -a=false`

![Contenedores docker en funcionamiento](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap26_zpsddfrcrlz.png)

En este caso, para el contenedor de ubuntu, tengo la ID `e3ebe8693295`. Simplemente ahora podemos crear una imagen persistente con el estado del contenedor con *commit* y dándole un nombre.

`$ docker commit e3ebe8693295 ubuntu-actual`

Comprobamos que se ha creado la imagen persistente.

`$ docker images`

![Listado de contenedores docker](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap27_zpsomrapnqv.png)


###Ejercicio 10: Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección. 

El sistema operativo para la imagen que contiene las herramientas para mi proyecto será *ubuntu*. 

Para poder crear una imagen necesitamos crear un fichero, llamado **Dockerfile**, en el que indicamos algunas opciones para su configuración, tanto del sistema de la imagen como de la aplicación del proyecto. En este caso mi Dockerfile es este:

```
FROM ubuntu:14.04
MAINTAINER Jesus Prieto Lopez <jesusgorillo@gmail.com>

#Actualizar los repositorios
RUN sudo apt-get -y update

#Instalar la herramienta GIT
RUN sudo apt-get install -y git

#Descargamos el proyecto
RUN sudo git clone https://github.com/JesGor/Proyecto-IV-DAI.git

#Instalamos python3
RUN sudo apt-get install -y python3-setuptools python3-dev build-essential libpq-dev
RUN sudo easy_install3 pip
RUN sudo pip install --upgrade pip

#Instalar las dependencias
RUN cd Proyecto-IV-DAI && pip install -r requirements.txt

#Sincronización de la base de datos
RUN cd Proyecto-IV-DAI && python3 manage.py migrate --noinput
```

Ahora para crear la imagen a partir del **Dockerfile** ejecutamos la siguiente orden indicando el nombre del protecto con *-t* y el directorio donde se encuentra la app:

`$ docker build -t scrumpy .`

Si queremos comprobar que todo ha salido bien al crear la imagen podemos mirar en las imágenes de docker que disponemos en el sistema.

`$ docker images`

![Imagenes de docker](http://i1175.photobucket.com/albums/r628/jesusgorillo/28_zpsef6ucscb.png)

Podemos arrancar la imagen una vez creada como cualquier otra.

`$ docker run -i -t scrumpy /bin/bash`

Ya dentro del contenedor podemos ejecutar la aplicación del proyecto como si estuviésemos en el sistema anfitrión.

`$ cd Proyecto-IV-DAI`
`$ python3 manage.py runserver`

Podemos obtener la ip del contenedor con el comando `$ ifconfig` y desde un navegador del sistema anfitrión introducir la ip correspondiente para visualizar la aplicación (mientras está este arrancada). En mi caso la ip es 172.17.0.2, y hay que añadirle el puerto 8000. La dirección quedaría http://172.17.0.2:8000/ .

![Página principal del proyecto ejecutado desde el contenedor](http://i1175.photobucket.com/albums/r628/jesusgorillo/cap29_zpsdqzqw3bq.png)

> Si desde el navegador del sistema anfitrión no se pudiera acceder a la aplicación web, ejecute el comando `$ python3 manage.py runserver,`anteriormente mencionado, seguido de `0.0.0.0:8000`. 
