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
