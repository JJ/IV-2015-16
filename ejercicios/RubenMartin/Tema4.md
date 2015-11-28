# Ejercicios de Rubén Martín Hidalgo
## Tema 4
### Ejercicio 1: Instala LXC en tu versión de Linux favorita. Conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.

Para la versión 1.07 instalamos con: `sudo apt-get install lxc`

Si queremos la úlitma versión: `sudo apt-get -t trusty-backports install lxc`

Comprobamos que la versión por tanto es posterior a la 1.0:

![Version LXC](https://www.dropbox.com/s/uyyks3k8314l73v/versionLXC.PNG?dl=1)

### Ejercicio 2: Comprobar qué interfaces puente se han creado y explicarlos.

Creamos el contenedor con: `sudo lxc-create -t ubuntu -n una-caja`

Lo arrancamos con la orden: `sudo lxc-start -n una-caja`

Y entramos con "ubuntu" como usuario y password.

Ejecutamos `ifconfig -a` fuera del contenedor, y podremos ver las siguientes interfaces que se acaban de añadir:

![Puentes Red](https://www.dropbox.com/s/esetwirycpa16q3/puentesRed.PNG?dl=1)

La primera es usada para tener acceso a internet desde el contenedor. La segunda se usa para la comunicación entre los distintos contenedores. 

### Ejercicio 3: Crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya.

En el ejercicio anterior creé un contenedor con Ubuntu, que es la distribución que suelo usar habitualmente.

Ahora voy a crear otro con Debian: 

```
sudo lxc-create -t debian -n debianita
```

### Ejercicio 4.1: Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.

Instalar con `sudo wget https://lxc-webpanel.github.io/tools/install.sh -O - | sudo bash`

Y accedemos al panel mediante la dirección "http://localhost:5000/" en el navegador web, introduciendo 'admin' como usuario y contraseña.

![LXC Web Panel](https://www.dropbox.com/s/ofr24yj3ho1yeco/lxcwebpanel.PNG?dl=1)

Arrancamos los contenedores desde el panel de control con éxito.

![Contenedores en marcha](https://www.dropbox.com/s/8i28vtg8jho6kd9/contenedoresArrancados.PNG?dl=1)

### Ejercicio 4.2: Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.

Accedemos a la pantalla de configuración de recursos del contenedor, que por defecto viene así:

![Recursos iniciales](https://www.dropbox.com/s/06n42r6ylh2g9n1/configuracionDefectoLXC.PNG?dl=1)

Para modificar los recursos, primero debemos parar la ejecución del contenedor, para poder aplicar los cambios. Luego se podrá volver a arrancar sin problemas.

![Recursos cambiados](https://www.dropbox.com/s/wfz2hjitrwtcbwp/recursosLXC.PNG?dl=1)

### Ejercicio 5: Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor usando nginx.

Para el análisis en contenedor, usamos el contenedor creado de ubuntu creado con *LXC* en el ejercicio 2. Solo necesitamos entrar en él.

Para crear la jaula, también con ubuntu, he usado *debootstrap*. Se deben seguir los siguientes pasos:

- `sudo apt-get install debootstrap`
- `sudo debootstrap --arch=amd64 lucid /home/jaulas/lucid/ http://archive.ubuntu.com/ubuntu`

Una vez creada la jaula, entramos en ella y la preparamos para poder usarla correctamente:

- `sudo chroot /home/jaulas/lucid`
- `mount -t proc proc /proc`
- `apt-get install language-pack-es`

Con las opciones anteriores estamos montando el filesystem virtual /proc e instalando el paquete de idioma español, que corregiran algunos errores dentro de la jaula.

![Muestra jaula Chroot](https://www.dropbox.com/s/cbmiub6ieostkzw/jaulaChroot.PNG?dl=1)

Ya se puede pasar a instalar *Nginx* tanto en el contenedor como en la jaula. Para instalar en nuestro contenedor hacemos lo siguiente:

- `sudo apt-get update`
- `sudo apt-get install nginx`
- `sudo fuser -k 80/tcp` # esto se hace fuera de la jaula para dejar libre el puerto de nginx 
- `sudo service nginx start`
- `sudo apt-get install curl`
- `curl localhost` # comprobamos que funciona

![Nginx funcionando correctamente en contenedor LXC](https://www.dropbox.com/s/pxj4xrg3vkov57c/nginxLXC.PNG?dl=1)

Para hacerlo en la jaula, es algo más trabajoso:

```
* echo "deb http://nginx.org/packages/ubuntu/ lucid nginx" >> /etc/apt/sources.list 
* echo "deb-src http://nginx.org/packages/ubuntu/ lucid nginx" >> /etc/apt/sources.list 
* apt-get install wget 
* wget http://nginx.org/keys/nginx_signing.key 
* apt-key add nginx_signing.key 
* apt-get update 
* apt-get install nginx 
* sudo fuser -k 80/tcp  # esto se hace fuera de la jaula para dejar libre el puerto de nginx 
* service nginx start 
* apt-get install curl 
* curl localhost # comprobamos que funciona
```

![Nginx funcionando correctamente en jaula Chroot](https://www.dropbox.com/s/c1fx63x4pyloo78/nginxChroot.PNG?dl=1)

Ahora pasamos a ejecutar *Apache Benchmark* para comparar las prestaciones de un servidor y otro:

- `sudo apt-get install apache2-utils`
- `ab -n 1000 -c 1000 http://localhost/`

* En la jaula:

![Apache Benchmark en Chroot](https://www.dropbox.com/s/yd46cl1t5rcpywq/ABchroot.PNG?dl=1)

* En el contendor:

![Apache Benchmark en LXC](https://www.dropbox.com/s/thtvz30ntsl0d5k/ABlxc.PNG?dl=1)

Vemos que la jaula puede manejar un mayor número de peticiones que los contenedores. 

### Ejercicio 6: Instalar docker.

Se puede instalar con `curl -sSL https://get.docker.com/ | sudo sh` ó `sudo apt-get -y install docker.io`

Cada vez que vayamos a ejecutar debemos borrar el archivo *docker.pid* con: `sudo rm /var/run/docker.pid` 

Y ejecutamos el daemon con: `sudo docker -d &`

### Ejercicio 7.1: Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.

Con el servicio docker arrancado, ya podemos instalar los contenedores.

Ubuntu: `sudo docker pull ubuntu`

CentOS: `sudo docker pull centos`

### Ejercicio 7.2: Buscar e instalar una imagen que incluya MongoDB.

En este [enlace](https://github.com/dockerfile/mongodb) he encontrado como instalar una imagen Docker con MongoDB, pero debemos cambiar donde pone "dockerfile/mongodb" por "library/mongo": 

```
sudo docker pull library/mongo
```

Ya podemos ver que tenemos las tres imagenes instaladas:

![Imagenes instaladas con Docker](https://www.dropbox.com/s/s97ca5qgl19wjas/imagenesDocker.PNG?dl=1)

### Ejercicio 8: Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.

Arrancamos el contenedor y accedemos a él por terminal.

- `sudo docker run -i -t ubuntu /bin/bash`

![Imagen de Ubuntu en Docker corriendo](https://www.dropbox.com/s/97rwwatu28kdi1b/dockerCorriendo.PNG?dl=1)

Creamos un usuario, le asignamos contraseña, añadimos privilegios de superusuario y por último nos logueamos con dicho usuario.

- `useradd -d /home/usudocker -m usudocker`
- `passwd usudocker`
- `sudo adduser usudocker sudo`
- `login usudocker`

![Usuario creado y funcionando](https://www.dropbox.com/s/n12wui1fu2xervj/loginUserDocker.PNG?dl=1)

Ahora vamos a instalar *nginx* dentro del contenedor.
 
- `sudo apt-get install software-properties-common` 
- `sudo add-apt-repository ppa:nginx/stable`
- `sudo apt-get install nginx`
- `sudo nginx; service nginx status`    

![Nginx funcionando en Docker](https://www.dropbox.com/s/vyljvkkrvawf3ef/nginxDocker.PNG?dl=1)

Como podemos ver a lo largo de este tema, existen diversas formas de instalar, arrancar y comprobar el funcionamiento de nginx.

### Ejercicio 9: Crear a partir del contenedor anterior una imagen persistente con commit.

Las siguientes órdenes se deben ejecutar en la máquina anfitriona mientras se está ejecutando el contenedor.

Obtenemos el ID del contenedor: `sudo docker ps -a=false`

![Obtenemos ID del contendor](https://www.dropbox.com/s/oopydv85xcwzp0d/obtenerIDDocker.PNG?dl=1)

Guardamos el estado actual del contenedor haciendo un commit: `sudo docker commit <id obtenida> <comentario commit>`

Y comprobamos que se ha creado la nueva imagen: `sudo docker images`

![Commit realizado en Docker](https://www.dropbox.com/s/adcl8nnfq3nb1ei/commitDocker.PNG?dl=1)

### Ejercicio 10: Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección.

Primero creamos el fichero *Dockerfile* con el siguiente contenido:

```
FROM ubuntu:14.04
MAINTAINER Ruben Martin Hidalgo <rubenmartin1991@gmail.com>

RUN sudo apt-get update
RUN sudo apt-get install -y git
RUN sudo apt-get install -y build-essential
RUN sudo git clone https://github.com/romilgildo/IV-PLUCO-RMH.git
RUN cd IV-PLUCO-RMH && git pull
RUN cd IV-PLUCO-RMH && make install
```

Y ejecutamos la orden `sudo docker build -t pluco-db .` dentro del proyecto, que creará la imagen a partir del Dockerfile. Este es el resultado:

![Resultado orden docker build](https://www.dropbox.com/s/7dx40tk80n2hv3t/imagenDockercrada.PNG?dl=1)

Ya tenemos nuestra imagen creada, como podemos ver en la siguiente captura:

![Imagen Docker creada](https://www.dropbox.com/s/1uddh8jg6kzu9a4/imagenDockercrada2.PNG?dl=1)

Ya se puede probar la ejecución del contenedor con `sudo docker run -t -i pluco-db /bin/bash` y dentro, podremos ejecutar nuestra app como si estuviera localmente: `make run`

Aquí una muestra del funcionamiento de nuestra app dentro del contenedor, donde accedemos introduciendo la IP del contenedor Docker en el navegador del sistema anfitrión:

![Pluco funcionando en Docker](https://www.dropbox.com/s/ibfqh4rl7f0ggfo/plucoenDocker.PNG?dl=1)
