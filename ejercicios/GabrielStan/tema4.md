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

### Ejercicio 4.1

Instalamos `lxc-webpanel` con el comando 
```bash
wget https://lxc-webpanel.github.io/tools/install.sh -O - | sudo bash
```

![webpanel](https://www.dropbox.com/s/ypmdpikoquclksk/webpanel_install.png?dl=1)

Tras la instalación, accedemos a `localhost:5000` y podemos ver e interactuar con los contenedores.

![webpanel](https://www.dropbox.com/s/9licpzw5efkalyd/webpanelview.png?dl=1)

### Ejercicio 4.2

**Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.**

![limits](https://www.dropbox.com/s/ojsc9qz125r9biw/limits.png?dl=1)

### Ejercicio 6

**Instalar docker.**

Lo instalamos con el comando `sudo apt-get install docker.io`. Una vez instalado, lo podemos arrancar con el comando `sudo docker -d &`

![docker](https://www.dropbox.com/s/nqx6ap9cujwdm60/run_docker.png?dl=1)


### Ejercicio 7.1

**Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.**

Lo podemos conseguir ejecutando los comandos 
`sudo docker pull ubuntu` y 
`sudo docker pull centos`.


### Ejercicio 7.2

**Buscar e instalar una imagen que incluya MongoDB.**

Podemos buscar imagenes con docker, usando la opcion `search`, por tanto ejecutamos el comando `sudo docker search mongodb` y vemos la lista de resultados.

![dockersearch](https://www.dropbox.com/s/7g6op82fvdsakxa/searchmongo.png?dl=1)

Para descargar la imagen que buscamos, ejecutamos `sudo docker pull mongo`, y por último, comprobamos que todas las imágenes están correctamente instaladas.

![docker images](https://www.dropbox.com/s/plt715ulvretzuv/docker_images.png?dl=1)

### Ejercicio 8

**Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.**

Para este ejercicio usaremos el contenedor 'ubuntu'. Emprezamos creando el usuario:

![dockeruser](https://www.dropbox.com/s/a7nak62ed12b1ob/ej81.png?dl=1)

Y a continuación instalamos nginx. Actualizamos con `sudo apt-get update` e instalamos nginx con `sudo apt-get install nginx` y comprobamos que funciona.

![nginx](https://www.dropbox.com/s/ar8x3ckt2qss20u/nginx.png?dl=1)


### Ejercicio 9

**Crear a partir del contenedor anterior una imagen persistente con commit.**

Ejecutando el comando `sudo docker ps -a=false` podemos ver el id de los contenedores que se están ejecutando.

![dockerps](https://www.dropbox.com/s/3nd6tfr1445kqoh/dockerps.png?dl=1)

Con ese id, podemos hacer un commit y guardar el estado del contenedor en otra imagen con el comando `sudo docker commit <id> <nombre>`.

![commit](https://www.dropbox.com/s/c802ysd14isgvx9/commit.png?dl=1)

Comprobamos que la imagen se ha creado correctamente.

![images](https://www.dropbox.com/s/v5e9n7geaajfget/dockerimages.png?dl=1)


### Ejercicio 10

**Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección.**

Para crear una imagen para alojar el proyecto, he seguido los siguientes pasos.

- Creamos el fichero `Dockerfile` con los comandos necesarios.

```bash
FROM ubuntu:latest
MAINTAINER Gabriel Stan

RUN sudo apt-get update
RUN sudo apt-get install -y git
RUN sudo apt-get install -y build-essential

RUN git clone https://github.com/gabriel-stan/gestion-tfg.git

RUN cd gestion-tfg && make install-docker

CMD cd gestion-tfg && make run
```

- Ejecutamos el comando build: `sudo docker build -t gestfg .` para que docker cree la imagen a partir del fichero Dockerfile y esperamos a que termine, indicando "Successfully built".

![build1](https://www.dropbox.com/s/evi338enqfhw4cb/docker_start_buil.png?dl=1)
![build2](https://www.dropbox.com/s/cq7wdovs75d33hz/docker_end_build.png?dl=1)

- Comprobamos que la imagen se ha creado correctamente con el comando `sudo docker images`

![img](https://www.dropbox.com/s/72ayan4hthouynp/docker_images_complete_build.png?dl=1)

- Ejecutamos la imagen para comprobar que no hay fallos con el comando `sudo docker run gestfg`.

![run](https://www.dropbox.com/s/zeuvso90aw0gce0/docker_run.png?dl=1)

- Ya que no sabemos que IP tiene ese contenedor en concreto, podemos comprobar que funciona lanzando manualmente desde un contenedor el comando CMD del Dockerfile y comprobamos desde otra terminal que el servidor se está ejecutando correctamente.

![check](https://www.dropbox.com/s/tly44jts1cj3ipt/docker_run_check.png?dl=1)

![curl](https://www.dropbox.com/s/qq7jrxq7nqdybmv/curl.png?dl=1)

- Para subir la imagen a dockerhub, necesitamos crear un repositorio para albergar la imagen.

![repositorio](https://www.dropbox.com/s/4vmzuxoxd7vbtwx/contenedor1.png?dl=1)

- Creamos un tag para la imagen y comprobamos que se ha creado correctamente.

![tag](https://www.dropbox.com/s/w493vrrrtizhklb/tag.png?dl=1)

- Subimos la imagen a DockerHub con `sudo docker push gabrielstan/gestfg`.

![push](https://www.dropbox.com/s/uon5xo1zigiohfg/push.png?dl=1)

La imagen se puede ver [aqui](https://hub.docker.com/r/gabrielstan/gestfg/) y se puede descargar con el comando `sudo docker pull gabrielstan/gestfg`.
















