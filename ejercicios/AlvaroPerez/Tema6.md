#Tema 6
###Ejercicio1: Instalar chef en la máquina virtual que vayamos a usar.

Instalamos chef con la siguiente orden:

sudo curl -L https://www.opscode.com/chef/install.sh | sudo bash

![Ejercicio1](https://www.dropbox.com/s/kog0e76zfzne7zh/Ejercicio1.png?dl=1)

###Ejercicio2: Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.

* Creamos la siguiente estructura para nuestras recetas:

![Ejercicio2.1](https://www.dropbox.com/s/smg17a2aldnoymc/Ejercicio2.1.png?dl=1)

* Ahora toca crear las recetas:

Ejemplo de un fichero **metadata.rb**:

![Ejercicio2.2](https://www.dropbox.com/s/0kqsthgif0yochy/Ejercicio2.2.png?dl=1)

Ficheros **default.rb**:

![Ejercicio2.3](https://www.dropbox.com/s/dozp0ee0x5zsmyo/Ejercicio2.3.png?dl=1)

![Ejercicio2.4](https://www.dropbox.com/s/56j8gkf7nc2t6kd/Ejercicio2.4.png?dl=1)

![Ejercicio2.5](https://www.dropbox.com/s/e9j8uks0dktp5il/Ejercicio2.5.png?dl=1)

Ahora dentro de chef creamos los ficheros **solo.rb** y **node.json**:

![Ejercicio2.6](https://www.dropbox.com/s/ukfu3k6wwd0echn/Ejercicio2.6.png?dl=1)

![Ejercicio2.7](https://www.dropbox.com/s/q1fgaik89luimu1/Ejercicio2.7.png?dl=1)

* Por último ejecutamos la siguiente desde le dirtorio chef: **sudo chef-solo -c solo.r**


###Ejercicio3: Escribir en YAML la siguiente estructura de datos en JSON.{ uno: "dos", tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }.

![Ejercicio3](https://www.dropbox.com/s/bfpvqrutx1u7xhp/Ejercicio3.png?dl=1)

###Ejercicio6: Instalar una máquina virtual Debian usuando Vagrant.

* Lo primero es instalar **Vagrant**:

sudo apt-get install vagrant

* En **www.vagrantbox.es** descargamos una máquina de la lista, en mi caso esta:  Ubuntu 14.04 32bit.

![Ejercicio6.1](https://www.dropbox.com/s/ljn28mpoclag9py/Ejercicio6.1.png?dl=1)

* Ahora ejecutamos la siguiente orden que se ve en el pantallazo, esto crea el **Vagrantfile**:

![Ejercicio6.2](https://www.dropbox.com/s/54j7hv765jez3xo/Ejercicio6.2.png?dl=1)

* Inicializamos la máquina con la orden: **vagrant up**.

* Nos conectamos a la máquina con la orden: **vagrant ssh**, con esta orden estamos dentro ya de la máquina y con el usuario vagrant que tiene permisos de root.

![Ejercicio6.3](https://www.dropbox.com/s/h7gi5p0xf8t8r8q/Ejercicio6.3.png?dl=1)

###Ejercicio7: Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica.

Para este ejercicio voy a usar el servidor web **Apache** por que me servira para el último hito del proyecto.

* Primero he creado un script llamado **install_apache.sh** cuyo contenido es este:

![Ejercicio7.1](https://www.dropbox.com/s/cgoo4k5z19wd5yg/Ejercicio7.1.png?dl=1)

* Ahora con la orden **vagrant init**, se crea el **Vangrantfile** y hago las modificaciones necesarias para que ejecute el script:

![Ejercicio7.2](https://www.dropbox.com/s/3o55a8r6tfqyfc3/Ejercicio7.2.png?dl=1)

* Después de hacer **vagrant up** nos conectamos a la máquina con **vagrant ssh** y comprobamos que efectivamente apache se ha instalado y esta corriendo en la máquina:

![Ejercicio7.3](https://www.dropbox.com/s/rwqc4qg07q7dnpv/Ejercicio7.3.png?dl=1)





 
