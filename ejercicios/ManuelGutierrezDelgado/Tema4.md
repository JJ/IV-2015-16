#Tema 4
###Ejercicio1: Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.

La instalación la realizamos con la orden: **apt-get install lxc**.

Después comprobamos que todo esta correcto con: **lxc-checkconfig**.

![Ejercicio1](https://i.gyazo.com/2e955fe07c5e9f7779b31eae193bb2f6.png)

###Ejercicio2: Comprobar qué interfaces puente se han creado y explicarlos.

Nos hacemos **root** para realizar las siguientes ordenes.
Creamos un contenedor llamado caja con la orden: **lxc-create -t ubuntu -n caja**

![Ejercicio2a](https://i.gyazo.com/7536462896aa9453d2253dcf68b17754.png)

Arrancamos el contenedor con la siguiente orden **lxc-start -n caja** y nos conectamos a él.
Si hacemos un **ifconfig**, podemos ver como se ha creado una nueva interfaz de red, para que el contenedor pueda tener acceso a internet.

![Ejercicio2c](https://i.gyazo.com/47d532357217c30da0d05711ea15296b.png)

###Ejercicio3: 

####3.1 Crear y ejecutar un contenedor basado en Debian.

Creamos el contenedor **LXC** con la siguiente orden: **lxc-create -t debian -n caja-debian**.

![Ejercicio3.1a](https://i.gyazo.com/8e0aa41120e19adfd069ee35abe1d093.png)

####3.2 Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya. Fedora, al parecer, tiene problemas si estás en Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro.

Como mi distribución es Ubuntu 15.10 LTS, creo un contenedor basacon en **CentOS**:

CentOS utiliza **yum** para instalar paquetes, por tanto vamos a instalarlo con la orden: **apt-get install yum**.

![Ejercicio3.2](https://i.gyazo.com/4f6e872253c965dd6fc4cdb9490e1440.png)

![Ejercicio3.2](https://i.gyazo.com/fd1087cc7b9579caf414603b9875ad15.png)

Antes de ingresar he ejecutado el comando (mirar en captura anterior): **sudo chroot /var/lib/lxc/centos/rootfs passwd**
He arrancado con el comando: **lxc-start -n centos**

![Ejercicio3.2](https://i.gyazo.com/1d10e6d95068ab86a0fbd7c7558d875d.png)

###Ejercicio4:
####4.1 Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.

Para instalar lxc-webpanel, lo hacemos con la siguiente orden: **wget http://lxc-webpanel.github.io/tools/install.sh -O - | sudo bash**

![Ejercicio4.1](https://i.gyazo.com/ae270bd33dabe0d096433d3596e87d7e.png)

####4.2 Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.

En el navegador ponemos http://localhost:5000/ y nos sale el **LXC Web Panel**. Hacemos login con el usuario y contraseña **admin**. Y ya podemos ver los contenedores que hemos creado:

![Ejercicio4.2a](https://i.gyazo.com/970f1f43713e4d23df6219e7ad7c998c.png)

Ahora seleccionamos el contenedor al que queremos restringir los recursos, y lo configuramos a nuestro gusto:

![Ejercicio4.2b](https://i.gyazo.com/c719448837a4233d1715fd3b5df3eb35.png)

###Ejercicio6: Instalar docker.

Para la instalación seguimos el siguiente tutorial: [tutorial](http://docs.docker.com/engine/installation/ubuntulinux/).

Instalamos **Docker** con la siguiente orden: **apt-get install docker.io**

Instalamos **transport-https**: **apt-get install apt-transport-https**

Añadimos la llave del repositorio Docker: **apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9**

Añadimos el repositorio a nuestra lista **apt** y actualizmos los repositorios: **sh -c "echo deb https://get.docker.com/ubuntu docker main\/etc/apt/sources.list.d/docker.list"**

Vemos su versión con: **docker -v**.

![Ejercicio6](https://i.gyazo.com/b7f61c071e557967d528ef0164bdef85.png)

Para comprobar que efectivamente se ha instalado correctamente se ejecuta: **sudo docker run hello-world**.

![Ejercicio6a](https://i.gyazo.com/00b4dd44ac4e17c614c196f481669265.png)

###Ejercicio7:

####7.1 Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.

Para instalar cualquier imagen podemos hacerlo de dos formas diferentes, yo voy a usar la siguiente:
 - Ejecutamos: **docker pull imagen** para descargar la imagen y para instalarla ejecutamos: **docker run -i -t imagen**. 

![Ejercicio7.1a](https://i.gyazo.com/d0ea35a6db6237d41d407a5469ecbc1e.png)

![Ejercicio7.1b](https://i.gyazo.com/1e85b90979cdcaef3445144ceb0a05fb.png)

####7.2 Buscar e instalar una imagen que incluya MongoDB.

Para realizar este apartado utilizamos la siguiente orden: **docker pull hairmare/mongodb**
 
![Ejercicio7.2](https://i.gyazo.com/3040c32aed8af7ce3c51e61eaaea84ab.png)

Y finalmente podemos ver las imágenes que tenemos ejecutando: **docker images**

![Ejercicio7.3](https://i.gyazo.com/af1c4a116f800a4c70b5ee0e6ea895dd.png)

###Ejercicio8: Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.

Para este ejercicio voy a utilizar el contenedor con la imagen de Ubuntu creado en el ejercicio anterior:

Creación del usuario:
    
![Ejercicio8a](https://i.gyazo.com/b073e11a55ef0bcc6005c4f836902906.png)

Hacemos **login** con el usuario creado, e instalamos nginx:

![Ejercicio8b](https://i.gyazo.com/de0a728c2919501e59f09750b2eb65bd.png)

![Ejercicio8c](https://i.gyazo.com/dea517381f302ec0d49293d2bdd00b4f.png)

###Ejercicio9: Crear a partir del contenedor anterior una imagen persistente con commit. 

Para poder realizar este ejercicio tenemos que seleccionar un contenedor de los creados anteriormente e iniciarlo.
Con la orden **docker ps** obtenemos el ID del contenedor que acabos de iniciar:

![Ejercicio9a](https://i.gyazo.com/1128681888e319b8839d5ecb9a0620d4.png)

Ahora guardamos el estado actual del contenedor con un **commit**, con el ID del contenedor obtenido. Y vemos que efectivamente se ha creado la imagen:

![Ejercicio9b](https://i.gyazo.com/9ade947e63116d69aabe44e03ed21ea7.png)
