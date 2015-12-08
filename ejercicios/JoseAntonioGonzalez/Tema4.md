#Ejercicio 1

Para instalar lxc:

	sudo apt-get install lxc

Una vez instalado, con la siguiente orden comprobamos si nuestro kernel soporta la virtualización:

	lxc-checkconfig

![](EJercicio1)

EN nuestro caso, al estar todo en "Enabled", comprobamos que si que lo soporta.

#Ejercicio 2

SIguiendo los apuntes de la asignatura, vamos a crear un nuevo contenedor, llamado "contenedorprueba", con la siguiente orden:

	sudo lxc-create -t ubuntu -n pruebacontenedor
    
Esto montará un contenedor basado en Ubuntu, y para ello, tendrá que descargar dicha distribución, tal y como vemos en la imagen:

![](EJercicio2-1)

Cuando se descargue y se cree el contenedor, entramos a él con la siguiente orden:

	sudo lxc-start -n pruebacontenedor

Puede pasar que aparentemente "no ocurra nada", ya que se ha creado el contenedor pero parece que no podemos interactuar con él. Debemos de abrir la consola con la siguiente orden:

	sudo lxc-console -n pruebacontenedor
    
Cuando pida usuario y contraseña, introduciremos "ubuntu" como ambas, y una vez dentro, comprobamos las interfaces con la siguiente orden:

	ifconfig -a

En nuestro caso, hay dos interfaces levantadas en el contenedor

![](Ejercicio2-2)

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
    
    
