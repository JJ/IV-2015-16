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

![Página principal del lxc-webpanel](cap11)

Si se arranca un contenedor, por ejemplo *caja-debian*, desde el botón **Start**, nos aparecerá la siguiente notificación y el recuadro del contenedor cambiará de color y estado.

![Página principal de lxc-webpanel después de iniciar un contenedor](cap12)

####Ejercicio 4.2: Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.

Desde el menú lateral izquierdo accedemos a los recursos del contenedor en los que queramos modificar estos. Tan solo hay que seleccionar el contenedor desde ese menú.

![Menú lxc-webpanel](cap13)

Directamente nos aparecen las diferentes opciones del contenedor, en las que están también las referentes a los recursos del mismo.

![Configuración de recursos del contenedor](cap14)


###Ejercicio 5: Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor. Usar nginx.

Para ver las prestaciones dentro de un contenedor voy a utilizar el contenedor con ubuntu, que había llamado *caja-ubuntu*.

Desde el contenedor instalo y arranco el servidor *nginx* siguiendo los siguientes pasos:

`$ sudo apt-get install nginx`
`$ sudo service start nginx`

Para comprobar que funciona, desde el contenedor obtener la ip mediante `$ ifconfig`. En mi caso es la 10.0.3.198. Desde fuera del contenedor, desde el navegador comprobamos si funciona el servidor o no.

![Página principal del servidor nginx en el contenedor ubuntu](cap15)

Para instalar el servidor dentro de una jaula primero hay que crear esta y prepararla. Para esto he usado *debootstrap*.

`$ apt-get install debootstrap`

Creamos ahora la jaula con ubuntu, indicando la arquitectura, la versión de este, el directorio deseado y la web desde donde obtener el sistema. Este proceso tardará unos minutos.

`$ debootstrap --arch=amd64 lucid /home/jes/jaula-ubuntu/ http://archive.ubuntu.com/ubuntu`

![Directorio donde se ha creado la jaula](cap16)

Accedemos a la jaula para comprobar que funciona (cambiará el prompt).

`$ sudo chroot /home/jes/jaula-ubuntu/`

![Dentro de la jaula creada con ubuntu](cap17)

Pasamos ahora a instalar el servidor *nginx* en la jaula.

