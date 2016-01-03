#Ejercicio 1

Para instalar lxc:

	sudo apt-get install lxc

Una vez instalado, con la siguiente orden comprobamos si nuestro kernel soporta la virtualización:

	lxc-checkconfig

![](https://www.dropbox.com/s/brgt2ttox2o6b7t/Ejercicio1.png?dl=1)

EN nuestro caso, al estar todo en "Enabled", comprobamos que si que lo soporta.

#Ejercicio 2

SIguiendo los apuntes de la asignatura, vamos a crear un nuevo contenedor, llamado "contenedorprueba", con la siguiente orden:

	sudo lxc-create -t ubuntu -n pruebacontenedor
    
Esto montará un contenedor basado en Ubuntu, y para ello, tendrá que descargar dicha distribución, tal y como vemos en la imagen:

![](https://www.dropbox.com/s/u9vdgokouyvl0i6/Ejercicio2-1.png?dl=1)

Cuando se descargue y se cree el contenedor, entramos a él con la siguiente orden:

	sudo lxc-start -n pruebacontenedor

Puede pasar que aparentemente "no ocurra nada", ya que se ha creado el contenedor pero parece que no podemos interactuar con él. Debemos de abrir la consola con la siguiente orden:

	sudo lxc-console -n pruebacontenedor
    
Cuando pida usuario y contraseña, introduciremos "ubuntu" como ambas, y una vez dentro, comprobamos las interfaces con la siguiente orden:

	ifconfig -a

En nuestro caso, hay dos interfaces levantadas en el contenedor

![](https://www.dropbox.com/s/dfe3r00tgryke0x/Ejercicio2-2.png?dl=1)

#Ejercicio 3

Para crear un contenedor basado en Debian, la orden es la misma que en el ejercicio anterior, pero instalando debian en lugar de ubuntu:

	sudo lxc-create -t debian -n pruebadebian
    
Entramos a él con las órdenes:
	
    sudo lxc-start -n pruebadebian
    sudo lxc-console -n pruebadebian
    
Para instalar un contenedor basado en CentOS, primero instalamos las dependencias:

	sudo apt-get install librpm3 librpmbuild3 librpmio3 librpmsign1 libsqlite0 python-rpm python-sqlite python-sqlitecachec python-support python-urlgrabber rpm rpm-common rpm2cpio 
    
    yum debootstrap bridge-utils
    
Después descargamos la imagen de CentOS del siguiente enlace: [https://gist.github.com/hagix9/3514296#file-lxc-centos](https://gist.github.com/hagix9/3514296#file-lxc-centos)

Copiamos la descarga:

	    sudo cp ~/Downloads/lxc-centos /usr/share/lxc/templates/

Le damos permisos de ejecución:

		sudo chmod +x /usr/share/lxc/templates/lxc-centos
        
Y ya podemos crearlo con la orden:

	sudo lxc-create -t centos -n pruebacentos
    
#Ejercicio 4
#### 1. Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.

Para instalar lxc-webpanel, descargamos el fichero de instalación (que es un script), y lo ejecutamos con permisos de administrador:

	wget http://lxc-webpanel.github.io/tools/install.sh
    chmod +x install.sh
    sudo ./install.sh
    
Al instalarlo, nos dice como vemos en la imagen, que accedamos desde el navegador al panel de administración (localhost:5000):

![](Ejercicio4A.png)

##### 2.  Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.

En la lista de contenedores que hay dentro de la interfaz web, seleccionamos uno de ellos. Una vez seleccionado,vemos todas las opciones, entre las cuales se encuentran unos deslizadores para poder controlar la memoria utilizada, el total de CPU's compartidas, etc.

    
#Ejercicio 5

Para comparar los rendimientos entre una jaula (con chroot) y un contenedor, obviamente necesitamos ambas cosas montadas.

Para montar la jaula, necesitamos primero debootstrap:

	sudo apt-get install debootstrap

Ahora creamos la carpeta que será la raíz del punto de montaje de la jaula. En mi caso, la he puesto en el home

	cd $HOME
    mkdir jaula

Para abreviar las rutas, metemos este directorio en una variable:

	export jaula=/home/joseantonio/jaula
 
Ya está "el terreno" listo, ahora toca instalar el sistema de la jaula. En este caso, he decidido instalar ubuntu:

	sudo debootstrap --arch=amd64 lucid $jaula http://archive.ubuntu.com/ubuntu

Ahora nos aparecerá una imagen ya familiar: la descarga del sistema
![](https://www.dropbox.com/s/zqs2uuj6hskoog0/Ejercicio5.png?dl=1)

Mientras se instala Ubuntu en la jaula, ahorremos tiempo e instalemos Nginx en el contenedor que ya tenemos creado de los ejercicios anteriores. También en el de Ubuntu (recodremos que he nombrado como "pruebacontenedor" al contenedor que tiene Ubuntu instalado):

	sudo lxc-start -n pruebacontenedor 
    sudo lxc-console -n pruebacontenedor
    sudo apt-get install nginx
    
Ahora, vamos a instalarlo en la jaula (una vez se ha bajado Ubuntu). Para ello, entramos en la carpeta que hemos creado con chroot:

	sudo chroot jaula
    
Y nos topamos con el primer problema: no funciona apt-get para instalar nginx. Tampoco funciona si hacemos un update. Parece ser que la lista de repositorios está incompleta o no trae, para reducir al máximo el tamaño de la imagen del sistema.

Por tanto, toca añadirlo, haciendo lo siguiente:

	apt-get install -y wget
    wget http://nginx.org/keys/nginx_signing.key
    apt-key add nginx_signing.key
    echo "deb http://nginx.org/packages/ubuntu/ raring nginx" >> /etc/apt/sources.list
    
Ahora si podemos instalar nginx:

	apt-get update
	apt-get install nginx
    
Nos encontramos el segundo error: Nginx depende de libc6 , libpcre3  y libssl. Haciendo un apt-get install de las 3 dependencias, nos encontramos con que las dos primeras ya están instaladas por defecto, pero la última no lo está. Lo instalamos con:

	apt-get install libssl-dev
    
Nos percatamos ahora que el problema sigue persisitendo, y es que aunque las dos primeras dependencias están instaladas, no parece que cumplan el mínimo de versión.

Seguimos teniendo problemas de dependencias, y todo por no tener la lista de repositorios lo suficientemente consistente. Después de "googelar" unas cuantas soluciones y no funcionar, he optado por matar moscas a cañonazos, y copiar la lista de repositorios de la instalación de Ubuntu de mi portátil en la jaula. Para eso, salimos de la jaula, y hacemos:

	sudo cp /etc/apt/sources.list jaula/etc/apt/sources.list

Volvemos a entrar e instalamos nginx:

	sudo chroot jaula
    apt-get update
    apt-get install nginx

Una vez hecho esto, configuraremos ambos nginx (de la jaula y del contenedor) para que escuchen por el puerto 3000 y 3001 respectivamente. Esta configuracion se realiza editando el fichero etc/nginx/conf.d/dafault.conf, y acto seguido, reiniciamos nginx:
	
    service nginx restart

Ya tenemos las dos máquinas funcionando, ahora instalamos siege para poder medir los tiempos de respuesta:

	sudo apt-get install siege

Y probamos las respuestas:

	`siege -b -c 1000 -t 120 localhost:3001`
    `siege -b -c 1000 -t 120 127.0.0.1:3000`
    
El resultado es que el nginx instalado en la jaula responde en un tiempo mucho mejor que el que tiene el contenedor lxc.


#EJercicio 6

#### Instala docker

DOcker es una interfaz para los contenedores lxc, que es utilizada en el proyecto del año pasado. Existen algunos posts ([#1](http://freelinuxdistrodeployed.github.io/LDT/2014/12/01/Docker-Ansible/), [#2](http://freelinuxdistrodeployed.github.io/LDT/2014/12/11/Llave_publica/)) en la página del proyecto que tratan la instalación de Docker, además de [otro](http://freelinuxdistrodeployed.github.io/LDT/2014/12/11/ADD_Docker/) en el que hay algunas indicaciones sobre los DockerfiUntitledle.

Para instalar Docker, ejecutamos el siguiente script:

	#Añadir repositorio. 
	sudo sh -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"

	#Añadir la llave pública que verifica el repositorio (el repositorio no está verificado por defecto, omitir este paso
	#rompería la instalación desatendida, por no hablar del fallo de seguridad)
	
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D8576A8BA88D21E9

	#Actualizacion de la lista de repositorios	
	sudo apt-get update

	#Instalación de Docker
	sudo apt-get --assume-yes install lxc-docker

	#Activar demonio de Docker
	sudo docker -d &

	#Instalación de Ubuntu
	sudo docker pull ubuntu
    
![](https://www.dropbox.com/s/m82a77dmw3xorm6/Ejercicio6.png?dl=1)
#Ejercicio 7

#### 1. Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS

Al igual que en el ejercicio 10 introducimos la orden "sudo docker pull ubuntu", de forma análoga se hace con centos:

	sudo docker pull centos

#### 2. Buscar e instalar una imagen que incluya MOngoDB

En el repertorio de imágenes de Docker, hay una que incluye mongodb (aunque siempre podríamos instalarlo automáticamente desde un Dockerfile).

Para descargarla, tecleamos la orden:

	docker pull dockerfile/mongodb
    
    
#Ejercicio 10

#### Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección. 

EL enlace a mi repositorio [es este](https://github.com/JA-Gonz/SMS_Estadisticas), donde se trata el cuarto hito del proyecto y por tanto, este ejercicio.