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







