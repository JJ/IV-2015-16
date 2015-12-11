# Tema 4

### Ejercicio 1

**Instala LXC en tu versión de Linux favorita.**

Se puede descargar la version `1.1` con el comando `git clone git://github.com/lxc/lxc -b stable-1.1`y luego instalarlo manualmente. Otra alternativa es usar el comando `sudo apt-get install lxc`, el cual instalará la última versión estable, actualmente `1.0.8`. El comando `sudo apt-get -t trusty-backports install lxc` instala la última versión de desarrollo, actualmente `1.1.5`.
Podemos comprobar la versión que se ha instalado con el comando`$ lxc-ls --version`

![lxc version](https://www.dropbox.com/s/wuebskrdx3an65e/lxc-version.png?dl=1)

### Ejercicio 2

**Comprobar qué interfaces puente se han creado y explicarlos.**

Primero creamos el contenedor con el comando `sudo lxc-create -t ubuntu-cloud -n nubecilla`.

![list](https://www.dropbox.com/s/w9mvh7dr7058poq/lxc-list.png?dl=1)

Una vez descargada la imagen y configurado el contenedor, lo arrancamos con el comando `sudo lxc-start -n nubecilla`. Al comprobar las interfaces de red de la máquina anfitriona comprobamos que hay dos nuevas interfaces, una para que el contenedor tenga acceso a internet, y la otra para acceso local.

![ifconfig](https://www.dropbox.com/s/tpfmbadsnajcbwo/ifconfig.png?dl=1)

### Ejercicio 3.1

**Crear y ejecutar un contenedor basado en Debian.**

Creamos un contenedor con el comando `sudo lxc-create -t debian -n mylittledebian` y lo arrancamos con el comando `sudo lxc-start -n mylittledebian`

![littledebian](https://www.dropbox.com/s/17e6bz6d2krmzqr/lxclist-debian.png?dl=1)

### Ejercicio 3.2

**Crear y ejecutar un contenedor basado en otra distribución.**

Con el comando `sudo lxc-create -t centos -n centos` podemos crear un contenedor centos. Para eso, es necesario tener yum instalado en el sistema.

![centoscontainer](https://www.dropbox.com/s/nk54f1muecqlrt7/lxc-ej3.png?dl=1)





























