# Tema 6

### Ejercicio 1

**Instalar chef en la máquina virtual que vayamos a usar**

Para instalar chef, se ejecuta el comando

	curl -L https://www.opscode.com/chef/install.sh | sudo bash

Para comprobar que se ha instalado correctamente, comprobamos la versión que se ha instalado.

![chef](https://www.dropbox.com/s/3od0f3es4dnezov/chef-version.png?dl=1)


### Ejercicio 2

**Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.**

He creado una receta para instalar gedit y nginx. A continuación se muestra el contenido de los ficheros creados.

![ficheros](https://www.dropbox.com/s/gc2t2vwcqahp860/contenidos.png?dl=1)

Para ejecutar las recetas, se ejecuta el comando

	sudo chef-solo -c solo.rb

desde el directorio que contiene el archivo `solo.rb`. A continuación podemos ver el resultado.

![ejec_chef](https://www.dropbox.com/s/n1wtopn4dgxkp6w/exec-chef.png?dl=1)

A continuación comprobamos, por ejemplo, que `nginx` se ha instalado correctamente.

![check](https://www.dropbox.com/s/n8g4bae0wqz4wdh/check_chef.png?dl=1)

### Ejercicio 4

**Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.**

Para empezar, vamos a configurar el archivo de hosts para ansible.

![hosts](https://www.dropbox.com/s/oa6ku8mszo7lfwl/ansible-hosts.png?dl=1)

He agrupado las máquinas con las que voy a trabajar en 2 grupos, máquinas en azure y máquinas locales (virtualbox). De momento voy a trabajar con las máquinas locales.

Para poder continuar, he tenido que asegurarme de que la clave ssh de mi cuenta está permitida en las máquinas remotas.

	ssh-copy-id gaby@192.168.56.101

A continuación, probamos hacer un ping.

![ping](https://www.dropbox.com/s/o9j80it54m0lkv9/ansible-ping.png?dl=1)

La conexión es correcta, por tanto podemos continuar desplegando las fuentes de nuestro proyecto en la máquina local.

Para empezar, apagamos el servicio `nginx` que instalamos en el tema anterior.

![sudostop](https://www.dropbox.com/s/06tj33ta7km0knm/sudo-stop.png?dl=1)

A continuación, instalamos las dependencias y fuentes desde git en la máquina virtual. Para ello, se puede usar el siguiente comando:

	ansible local -u gaby -m command -a "apt-get install python-setuptools python-dev build-essential git -y" --sudo --ask-become-pass

o mejor todavía, usando el módulo `apt` de ansible:

	ansible local -u gaby -m apt -a "name=python-setuptools state=present" --sudo --ask-become-pass

	ansible local -u gaby -m apt -a "name=python-dev state=present" --sudo --ask-become-pass

	ansible local -u gaby -m apt -a "name=build-essential state=present" --sudo --ask-become-pass

	ansible local -u gaby -m apt -a "name=git state=present" --sudo --ask-become-pass

y pip:

	ansible local -u gaby -m command -a "easy_install pip" --sudo --ask-become-pass

![apt](https://www.dropbox.com/s/7gloqae9iwtewen/apt.png?dl=1)

Y a continuación podemos usar el módulo git para desplegar el proyecto y ejecutar la instalación..

	ansible local -u gaby -m git -a "repo=https://github.com/gabriel-stan/gestion-tfg dest=~/despliegue version=HEAD"

![git](https://www.dropbox.com/s/orve3rermnyxbkv/git.png?dl=1)

	ansible local -u gaby -m command -a "chdir=/home/gaby/despliegue make install" --sudo --ask-become-pass

	ansible local -u gaby -m command -a "chdir=/home/gaby/despliegue make runserver" --sudo --ask-become-pass

![runserver](https://www.dropbox.com/s/n2zoqwlneee88xn/runserver.png?dl=1)

![curl](https://www.dropbox.com/s/b84ce7ed7a4hl52/curl.png?dl=1)

### EJercicio 5.1

**Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.**


### Ejercicio 5.2

**¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?.**


















