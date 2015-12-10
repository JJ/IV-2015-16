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

Este contenedor lo he instalado en el ejercicio anterior usando el comando: `sudo lxc-start -n una-caja` y se me instalo sin problema.

###2.- Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya. Fedora, al parecer, tiene problemas si estás en Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro. Por ejemplo, Óscar Zafra ha logrado instalar Gentoo usando un script descargado desde su sitio, como indica en este comentario en el issue.


He optado por instalar cirros. 
He instalado el contenedor de cirros con el comando:`sudo lxc-create -t cirros -n cirrosBox`

![instalación cirros](https://www.dropbox.com/s/y1h4suww7cyrtn6/ejr3.1.png?dl=1)


##Ejercicio 4
###Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.

Sigo los pasos del [tutorial](http://lxc-webpanel.github.io) que se nos facilita para instalar lxc-webpanel.
En primer lugar me identifico como root, ya que sino no me lo instalaba correctamente, y una vez hecho esto ejecuto el comando: `wget https://lxc-webpanel.github.io/tools/install.sh -O - | bash`

![instalo lxc-webpanel](https://www.dropbox.com/s/r36y1kadpegn5lj/ejr4.1.png?dl=1)

Como podemos ver en la pantalla nos indica que esta se está ejecutando en la `http://your-ip-address:5000/` con lo que nos vamos a nuestro navegador e introducimos la dirección `http://localhost:5000/` en la que podemos ver lo siguiente:

![http://localhost:5000/](https://www.dropbox.com/s/swpkgzh9xgmmm1g/ejr4.2.png?dl=1)

Introducimos username: `admin` y password: `admin` tal y como se nos indica en el [tutorial](http://lxc-webpanel.github.io)

Y ya podemos ver y gestionar los contenedores que tenemos instalados

![contenedores instalados](https://www.dropbox.com/s/vw256vqc3zgocjq/ejr4.3.png?dl=1)



###Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.

Para gestionar desde lxc-webpanel un contenedor, basta con seleccionarlo y configurarlo a nuestro gusto. Yo he configurado el contenedor de ubuntu creado en el ejercicio 2. Le he limitado la memoria a 1386 MB, memoria + Swap a 2048 MB y el número de CPU´s entre 0 y 1.

![configuración contenedor linux](https://www.dropbox.com/s/mr3nmyc7kudj54h/ejr4.4.png?dl=1)


##Ejercicio 5
###Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor. Usar nginx.

Para hacer este ejercicio voy a usar el contenedor ubuntu creado para el ejercicio 2. 

En primer lugar instalo  debootstrap con el comando: `sudo apt-get install debootstrap`

Seguidamente creo la jaula con el comando: `sudo debootstrap --arch=amd64 lucid /home/jaulas/lucid/ http://archive.ubuntu.com/ubuntu`

Una vez creada la jaula vamos a configurarla con los siguientes comandos:

* `sudo chroot /home/jaulas/lucid/` con lo que cambia de usuario como podemos ver en la captura

![cambio de usuario](https://www.dropbox.com/s/czgvb9ehtwbzdzd/ejr5.1.png?dl=1)

* Montamos el fichero proc con el comando: `mount -t proc proc /proc` 

* Instalamos este paquete para añadir el idioma español con el comando: `apt-get install language-pack-es` 

![instalamos el paquete de lenguaje en español](https://www.dropbox.com/s/6lqq9et4ed6efkl/ejr5.2.png?dl=1)

Me he ayudado de esta [web](https://www.nginx.com/resources/wiki/start/topics/tutorials/install/) para añadir el repositorio donde se encuentra nginx, ya que sin esto no he podido instalarlo.
He usado los siguientes comandos:

* `echo "deb http://nginx.org/packages/ubuntu/ raring nginx" >> /etc/apt/sources.list`
* `echo "deb-src http://nginx.org/packages/ubuntu/ raring nginx" >> /etc/apt/sources.list`
* `sudo apt-get update`
* `sudo apt-get install nginx`

Descargo la clave con el comando: `wget http://nginx.org/keys/nginx_signing.key`

![descargo el archivo](https://www.dropbox.com/s/7squbzrqw4898c0/ejr5.3.png?dl=1)

Añado la clave descargada anteriormente con el comando: `apt-key add nginx_signing.key` 

![añado el archivo descargado](https://www.dropbox.com/s/kyxem7ugsxvljlj/ejr5.4.png?dl=1)

Ejecuto el comando`service nginx start` y me da un error en el que dice que el puerto 80 ya esta en uso

![puerto ya en uso](https://www.dropbox.com/s/m14o9mi831stz2b/ejr5.5.png?dl=1)

Para arreglarlo lo que hago es modificar el archivo de configuración (con el comando `nano /etc/nginx/conf.d/default.conf`) de nginx para que use otro puerto que no sea el puerto 80. Al configurarlo he puesto que use el puerto 8081, como se puede ver en la captura de pantalla

![nginx use puerto 8081](https://www.dropbox.com/s/lcgq0n8etwyzpfs/ejr5.7.png?dl=1)

Lanzo nginx: `service nginx start`

Compruebo que está ejecutandose: `service nginx status`

![compruebo que nginx esta arrancado](https://www.dropbox.com/s/3rlyvcomukw42ew/ejr5.6.png?dl=1)

Instalo el software curl necesario para ver páginas web desde línea de comando: `sudo apt-get install curl`

Desde otra terminal, fuera de la jaula ejecuto el comando `curl http://localhost:8081/` y obtengo el código de la web de que nginx esta bien instalado. Lo muestro en la siguiente captura de pantalla

![curl http://localhost:8081/](https://www.dropbox.com/s/clbw7fjuojxwfkx/ejr5.8.png?dl=1)

Para verlo desde la propia jaula uso el comando: `curl 127.0.0.1:8081`

![curl http://localhost:8081/](https://www.dropbox.com/s/dhxlql8oax50sjo/ejr5.9.png?dl=1)

Ya esta todo preparado para poder comprobar el rendimiento que tienen ambos. Para comprobar el rendimiento voy a usar Apache Benchmark ya que lo he usado alguna vez en otras asignaturas. Este se instala con el comando `sudo apt-get install apache2-utils`

Para las **pruebas en la jaula** ejecuto el comando:`ab -n 1000 -c 5 http://127.0.0.1:8081/` y los resultados que obtengo son los siguientes:

![curl http://localhost:8081/](https://www.dropbox.com/s/qvmyapjzp5xucfz/ejr5.10.png?dl=1)

Para las **pruebas en el contenedor** ejecuto el comando:`ab -n 1000 -c 5 http://localhost:8081/` y los resultados que obtengo son los siguientes:

![curl http://localhost:8081/](https://www.dropbox.com/s/nizqr31urqvzxfx/ejr5.11.png?dl=1)



##Ejercicio 6
###Instalar docker.

He podido instalar docker únicamente haciendo uso del comando `sudo apt-get install docker.io`

![instalando docker](https://www.dropbox.com/s/v2hul68qyxgm7np/ejr6.1.png?dl=1)

y lo ejecuro para probar su correcto funcionamiento con el comando `sudo docker -d`

![ejecutando docker](https://www.dropbox.com/s/15fq330s0pzm4d2/ejr6.2.png?dl=1)



##Ejercicio 7
###1.-Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.

Para instalar a partir de docker una imagen de ubuntu he ejecutado los siguientes comandos:

* `sudo docker -d &`
* `sudo docker pull ubuntu`

![instalando ubuntu con docker](https://www.dropbox.com/s/xa7fnqbhpgpf29t/ejr7.1.png?dl=1)

Y para instalar CentOS con docker he ejecutado el siguiente comando:

* `sudo docker pull centos`

![instalando centOS con docker](https://www.dropbox.com/s/tkk4fetk9n6n6yx/ejr7.2.png?dl=1)


###2.-Buscar e instalar una imagen que incluya MongoDB.

Y para instalar una imagen que incluya Mongo con docker he ejecutado el siguiente comando:

* `sudo docker pull library/mongo`

![instalando imagen con mongo](https://www.dropbox.com/s/2m98ffquqp4p5ol/ejr7.3.png?dl=1)

Finalmente muestro todas las imágenes que tengo creadas con docker usando el comando: `sudo docker images`

![imagenes instaladas con docker](https://www.dropbox.com/s/if1hwmadd332szg/ejr7.4.png?dl=1)


##Ejercicio 8
###Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.

Para realizar este ejercicio voy a usar la imagen de ubuntu creada con docker en el ejercicio anterior. Para ello en primer lugar voy a arrancar dicha imagen con el comando: `sudo docker run -i -t ubuntu`

Ahora creo un usuario con los siguientes comandos: 

* `useradd -d /home/usuario -m usuario`
* `passwd usuario` he introduzco la contraseña que quiero

![creo usuario](https://www.dropbox.com/s/mf8ll736x8obclw/ejr8.1.png?dl=1)

Y lo hago usuario sudo con el comando: `adduser usuario sudo`

![hago el ususario sudo](https://www.dropbox.com/s/wd2pc5a2i4izqq6/ejr8.2.png?dl=1)

Me logeo con el comando: `login usuario`

Ahora instalo nginx en la imagen con el comando: `sudo apt-get install nginx` y compruebo que esta ejecutandose con el comando: `sudo apt-get install status`

![instalo xginx y compruebo que esta ejecuntandose](https://www.dropbox.com/s/ueqllyze2tvds5e/ejr8.3.png?dl=1)



##Ejercicio 9
###Crear a partir del contenedor anterior una imagen persistente con commit.

En primer lugar ejecuto el comando `sudo docker ps -a=false` para así poder conocer el ID del contenedor y así poder hacer el commit. Podemos ver el ID en la siguiente captura

![id](https://www.dropbox.com/s/x0bpekg1aolapci/ejr9.1.png?dl=1)

Ahora hago el commit con el comando: `sudo docker commit 166b09c69bf4 primer_commit`

![hago el commit](https://www.dropbox.com/s/bj3qgjfarnyvxjy/ejr9.2.png?dl=1)

Por último compruebo que se ha añadido correctamente a las que ya habia existentes con el comando: `sudo docker images`

![compruebo que se ha añadido](https://www.dropbox.com/s/l4z9jd4m6q4alo4/ejr9.3.png?dl=1)


##Ejercicio 10
###Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección.

En primer lugar lo que hago es crear mi archivo Dockerfile, para ver el contenido pinche en el  [enlace](https://github.com/ignaciorecuerda/gestionPedidos/blob/master/Dockerfile)

Ahora ejecuto el comando `sudo docker build -f Dockerfile -t gestionpedidos3 .` que me creará la imagen.

Como se puede ver en la captura ha creado la imagen satisfactoriamente

![crea imagen gestionpedidos](https://www.dropbox.com/s/zfktdnd8xos147i/ejr10.1.png?dl=1)

Compruebo que la imagen se ha creado con el comando `sudo docker images`

![compruebo que la imagen se ha creado](https://www.dropbox.com/s/48h4s91q5qxvxzm/ejr10.2.png?dl=1)

Inicio el contenedor ejecutando el comando: `sudo docker run -t -i gestionpedidos /bin/bash`

![docker run](https://www.dropbox.com/s/jpvwfujhlh7jyo0/ejr10.3.png?dl=1)

Compruebo la ip que tiene dicho contenedor y arranco  la aplicacion con `npm start` o con `make run`

![ejecuto aplicacion](https://www.dropbox.com/s/v8wk8gh209zpy54/ejr10.4.png?dl=1)

Y por último, abro mi navegador, me voy a la dirección ip que tiene la imagen en el puerto 3000 y compruebo que la aplicación se esta ejecuntando correctamente.

![ejecuto aplicacion](https://www.dropbox.com/s/p3bbh1x7fqysbiy/ejr10.5.png?dl=1)






