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

Cuando pida usuario y contraseña, introduciremos "ubuntu" como ambas, y una vez dentro, comprobamos las interfaces con la siguiente orden:

	ifconfig -a

En nuestro caso, hay dos interfaces levantadas en el contenedor

![](Ejercicio2-2)