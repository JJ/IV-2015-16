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

#Ejercicio 3

Igual que anteriormente con ubuntu, para instalar un contenedor basado en Debian escribimos: `sudo lxc-create -t debian -n contenedor_debian` y lo arrancamos con `sudo lxc-start -n contenedor_debian`

Para instalar uno basado en centos podemos entrar en [este tutorial](http://www.bonusbits.com/wiki/HowTo:Setup_CentOS_LXC_Container_on_Ubuntu).

Una vez seguido el tutorial anterior, sin más que ejecutar `lxc-create -t centos -n lxc_centos` ya lo tenemos instalado.


#Ejercicio 4

Ahora voy a instalar lxc-webpanel para poder acceder a los contenedores desde internet. Para ello ejecuto en la terminal `wget https://lxc-webpanel.github.io/tools/install.sh -O - | bash` y comienza la instalación. He tenido que hacer primero `sudo su` para logearme como usuario root ya que utilizando sudo tampoco tenía permisos.

Una vez instalado accedo a la dirección *127.0.0.1:5000* y entra en el login con las credenciales *admin*, *admin*:

![Login](http://i864.photobucket.com/albums/ab201/Santiago_de_Diego/panel_login_zpshmujasiy.png)

Aquí podemos ver el contenedor creado correctamente, además como podemos ver he arrancado la máquina desde el webpanel y aparece arrancada:

![Página de lxc-webpanel](http://i864.photobucket.com/albums/ab201/Santiago_de_Diego/webpanel_zpszwg3ak6b.png)

Además he restrigido los recursos de procesador y memoria que utilizará el contenedor, como se puede ver debajo:

![Restricción de recursos](http://i864.photobucket.com/albums/ab201/Santiago_de_Diego/restriccion_zps0vqiowda.png)

#Ejercicio 5

Primero de todo vamos a instalar debootstrap con `sudo apt-get install debootstrap`. Una vez instalado, vamos a crear la jaula con `sudo debootstrap --arch=amd64 lucid /home/jaula_ubuntu http://archive.ubuntu.com/ubuntu`

Una vez creada ejecutamos chroot y entramos en ella con `sudo chroot jaula_ubuntu`

Al instalar nginx he tenido un problema y es que no he podido instalarlo con apt, entonces he tenido que hacerlo manualmente con wget. Primero instalo wget con `apt-get install -y wget`. Ahora descargamos la clave con wget con `wget http://nginx.org/keys/nginx_signing.key`, la añadimos con `apt-key add nginx_signing.key`. Ahora añadimos el repositorio con `echo "deb http://nginx.org/packages/ubuntu/ raring nginx" >> /etc/apt/sources.list` y ya podemos instalar nginx con apt haciendo: `apt-get install nginx`

Ahora cambiamos el puerto por defecto para no tener ningún problema, en mi caso al 5000. Editamos el archivo *etc/nginx/conf.d/dafault.conf* y ahí ponemos el número de puerto que queramos. Ahora reiniciamos el servicio con `service nginx start`.

Ahora instalamos también curl con `apt-get install curl` para probar si nginx funciona. Esto lo hacemos con `curl 127.0.0.1:5000`.

Nos olvidamos ahora de la jaula creada con debootstrap y hacemos lo mismo con el contenedor creado con lxc, solo que esta vez instalar nginx es muy fácil, simplemente ejecutamos `sudo apt-get install nginx`.

Ya teniendo las dos partes a comparar, voy a probar el rendimiento con siege. Lo óptimo sería lanzar el test desde fuera de la jaula pero por facilidad voy a lanzarlo en ambos sitios desde dentro al localhost. Primero de todo instalar siege, que en ambos podemos hacerlo con `sudo apt-get install siege` y después vamos a ejecutarlo.

He realizado una prueba similar a la que ha realizado un compañero en su [repositorio](https://github.com/santidediego/IV-2015-16/blob/master/ejercicios/RafaelLachicaGarrido/Tema4.md) para no complicarme la vida demasiado probando la carga óptima y entonces he ejecutado:

- `siege -b -c 1000 -t 120 127.0.0.1:5000/` en el caso de la jaula con debootstrap
- `siege -b -c 1000 -t 120 localhost` en el caso del contenedor lxc


Los resultados salen similares a los que aparecen en el repositorio mencionado y es que la jaula creada con debootstrap responde mucho mejor a la prueba de carga que el contenedor, en concreto unas 8 veces mejor, lo cual me sorprende ya que pensé que iba ser al revés.

#Ejercicio 6
En este ejercicio nos pide instalar Docker. Yo ya lo he instalado para la realización de mi proyecto, se pueden ver los pasos en el [readme del proyecto](https://github.com/santidediego/Landscapes/blob/master/README.md)

#Ejercicio 7
Con `docker pull ubuntu` descargamos la imagen oficial de ubuntu para docker y si queremos la imagen de cent OS ejecutamos `docker pull centos` y nos descarga la imagen oficial también. Para conseguir una imagen con mongoDB, podemos encontrar una también en las imágenes oficiales de DockerHub, sin más que ejecutar `docker pull mongo`

#Ejercicio 8
Primero de todo entramos a nuestro contenedor con `docker run -t -i ubuntu /bin/bash`. Una vez dentro  ejecutamos `adduser santiago` para añadir un usuario nuevo. Una vez hecho esto, tenemos que instalar nginx y eso lo hacemos con `sudo apt-get install nginx` aunque antes he tenido que hacer `sudo apt-get update` para asegurarme de que tengo el sistema actualizado.

#Ejercicio 9
Ahora voy a crear una imagen persistente de la imagen anterior para que no me desinstale el nginx cuando salga de docker. En el tutorial de la asignatura pone que hay que usar la imagen que aparece con `docker images --notrunc` pero a mi este método no me ha funcionado ya que al hacer commit no me encontraba el id. Buscando he encontrado [esta respuesta](http://stackoverflow.com/questions/30541703/docker-commit-fails-with-no-such-id) en Stackoverflow que es la  solución al problema. Básicamente consiste en fijarse en el número que aparece en la terminal que hemos abierto dentro del docker y copiar el número que aparece al lado del usuario root, en mi caso 6593b3357afd. Ahora ya solamente he hecho `docker commit 6593b3357afd ubuntu_nginx` para crear una versión de la imagen anterior en la que he instalado nginx

#Ejercicio 10
Ver pasos seguidos en el [readme del proyecto](https://github.com/santidediego/Landscapes/blob/master/README.md)
