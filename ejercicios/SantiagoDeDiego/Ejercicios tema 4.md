#Ejercicio 1

Para instalar lxc, tenemos que ejecutar `sudo apt-get install lxc`. Una vez instalado, tenemos que ejecutar `lxc-checkconfig` para comprobar si el kernel de nuestro equipo soporta este tipo de virtualización. En mi caso me encuentro con lo siguiente:
![Soporte de virtualización](http://i864.photobucket.com/albums/ab201/Santiago_de_Diego/Captura%20de%20pantalla%20de%202015-11-20%20105352_zps8kded4gf.png)

y por tanto ya se que soporta la virtualización.

#Ejercicio 2

Ahora vamos a crear un contenedor con la orden `sudo lxc-create -t ubuntu -n contenedor_lxc`.

Una vez creado, podemos conectarnos a este contenedor mediante `sudo lxc-start -n contenedor_lxc`

Nos pedirá un usuario y contraseña y tenemos que poner como usuario *ubuntu* y como contraseña igual. Entonces nos logeamos como root dentro del contenedor. Ahora para comprobar las interfaces de red escribimos `ifconfig -a`

Aquí podemos ver las interfaces de red de nuestra nueva máquina:

![Interfaces](http://i864.photobucket.com/albums/ab201/Santiago_de_Diego/Captura%20de%20pantalla%20de%202015-11-20%20121549_zpsemfqx1zc.png)

#Ejercicio 4

Ahora voy a instalar lxc-webpanel para poder acceder a los contenedores desde internet. Para ello ejecuto en la terminal `wget https://lxc-webpanel.github.io/tools/install.sh -O - | bash` y comienza la instalación. He tenido que hacer primero `sudo su` para logearme como usuario root ya que utilizando sudo tampoco tenía permisos.

Una vez instalado accedo a la dirección *127.0.0.1:5000* y entra en el login con las credenciales *admin*, *admin*:

![Login](http://i864.photobucket.com/albums/ab201/Santiago_de_Diego/panel_login_zpshmujasiy.png)

Aquí podemos ver el contenedor creado correctamente, además como podemos ver he arrancado la máquina desde el webpanel y aparece arrancada:

![Página de lxc-webpanel](http://i864.photobucket.com/albums/ab201/Santiago_de_Diego/webpanel_zpszwg3ak6b.png)

Además he restrigido los recursos de procesador y memoria que utilizará el contenedor, como se puede ver debajo:

![Restricción de recursos](http://i864.photobucket.com/albums/ab201/Santiago_de_Diego/restriccion_zps0vqiowda.png)

#Ejercicio 6
En este ejercicio nos pide instalar Docker. Yo ya lo he instalado para la realización de mi proyecto, se pueden ver los pasos en el [readme del proyecto](https://github.com/santidediego/Landscapes)

#Ejercicio 7
Con `docker pull ubuntu` descargamos la imagen oficial de ubuntu para docker y si queremos la imagen de cent OS ejecutamos `docker pull centos` y nos descarga la imagen oficial también. Para conseguir una imagen con mongoDB, podemos encontrar una también en las imágenes oficiales de DockerHub, sin más que ejecutar `docker pull mongo`