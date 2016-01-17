#Ejercicios tema 6


##Ejercicio 1
###Instalar chef en la máquina virtual que vayamos a usar

Primero he tenido que seleccionar la version 2.0.0 de ruby para poder instalar chef, para ello he hecho siguientes:

* \curl -L https://get.rvm.io | bash -s stable --ruby 

Cierro la terminal y la vuelvo a abrir para poder hacer uso de rvm

En el menú de la terminal entro en: edit/Profile Preferences  me voy a la pestaña Title and Command y selecciono la opción que pone "Run command as a login shell" como se puede ver en la captura

![selecciono la opción del menú de la terminal](ejr1.1)

Selecciono la versión de ruby 2.2.1 con el comando `rvm use 2.2.1 --default`

Una vez hecho esto ya tengo seleccionada la versión de ruby con la cual puedo instalar chef con el comando `curl -L https://www.opscode.com/chef/install.sh | sudo bash`

![version de chef](ejr1.2)


##Ejercicio 2
###Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.

Para este ejercicio empiezo creando la estructura necesaria para poder realizarlo. Esta estructura es la siguiente:

![estructura ejercicio 2](ejr2.1)

Ahora incluyo el código de los archivos incluidos en esta estructura:

* chef/cookbooks/nano/recipes/default.rb 

Receta para nano

```
package 'nano'directory '/home/parallels/Desktop/IV/nano' do   	owner"parallels"   	group"parallels"    mode 00544   	action :createendfile "/home/parallels/Desktop/IV/nano/LEEME" do   	owner"parallels"   	group"parallels"   	mode 00544   	action :create    content "Haciendo prueba con chef"end
```

* chef/cookbooks/nginx/recipes/default.rb (

Receta para nginx

```
package 'nginx'directory "/home/parallels/Desktop/IV/nginx"
```

* chef/node.json

Este archivo contiene una lista con las recetas que debe de ejecutar

```
{    "run_list":["recipe[nginx]", "recipe[nano]"]}
```

* chef/solo.rb

En este archivo se encuentran las rutas necesarias para ejecutar las recetas

```
file_cache_path "/home/parallels/chef" cookbook_path "/home/parallels/chef/cookbooks" json_attribs "/home/parallels/chef/node.json" 
```

Por último solo tengo que ejecutar el comando para que con el archivo solo.rb ejecute las recetas anteriormente descritas: `sudo chef-solo -c solo.rb` (estando situado dentro de la carpeta chef)

![comando que ejecuta las recetas](ejr2.2)

##Ejercicio 3
###Escribir en YAML la siguiente estructura de datos en JSON { uno: "dos",tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }

YAML es un formato para el intercambio de información  en la web, como JSON y XML. La estructura del enunciado escrita en YAML quedaría así:


	---
		uno: "dos"
		tres:
			4
			5
			"Seis"
			
				siete: 8
				nueve:
					10
					11
	



##Ejercicio 4
###Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.

Modifico el archivo /etc/ansible/hosts y le indico la direccion del hosts
```[azureubuntu]maquina-ubuntu.cloudapp.net```


Defino la variable de entorno para que Ansible `export ANSIBLE_HOSTS=~/ansible_hosts`

Arranco la máquina `azure vm start maquina-ubuntu`

Configuro la conexión ssh, para ello creo una clave `ssh-keygen -t dsa` 

![creo la clave](ejr4.1)

y la copio a mi máquina de azure ``

![añado la clave a mi máquina](ejr4.2)

Ahora ya puedo conectarme a mi máquina tanto por ssh `ssh 'nacho@maquina-azure-ubuntu-14-ejr5.cloudapp.net'` como por ansible `ansible azureubuntu -u nacho -m ping`

![ping con ansible](ejr4.3)

Para automatizar toda la configuración de mi máquina de azure utilizo playbook de ansible que resulta mucho más cómodo. Para ello creo un archivo que se llama gestionPedidos.yml y tiene el siguiente contenido

```
- hosts: azureubuntu
  sudo: yes
  remote_user: nacho
  tasks:
  - name: Instalar todos los paquetes necesarios para la aplicacion
    apt: name=python-setuptools state=present
    apt: name=build-essential state=present
    apt: name=python-dev state=present
    apt: name=git state=present
  - name: Clonar repositorio gestionPedidos de git
    git: repo=https://github.com/ignaciorecuerda/gestionpedidos_django.git  dest=gestionPedidos version=HEAD force=yes
  - name: Damos permisos de ejecucion a la carpeta gestionPedidos
    command: chmod -R +x gestionPedidos
  - name: Instala python-dev
    command: sudo apt-get install python-dev -y
  - name: Instala dependencias pillow
    command: sudo apt-get install libtiff5-dev libjpeg8-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev python-tk -y
  - name: instalo pip
    apt: name=python-pip state=present
  - name: instala pillow
    command: sudo pip install pillow 
  - name: Instalar todos los requeriments 
    command: sudo pip install -r gestionPedidos/tango_with_django_project/requirements.txt
  - name: lanzamos aplicacion
    command: nohup sudo python gestionPedidos/tango_with_django_project/manage.py runserver 0.0.0.0:80
```

Gracias a este playbooks instalo todas las dependencias, librerias necesarias y ejecuto la aplicación en el puerto 80.

A continuación abro mi navegador e introduzco la direccíon `http://maquina-ubuntu.cloudapp.net/gestionpedidos/` y en ella puedo ver mi aplicación desplegada.

![aplicación ejecutandose en azure](ejr4.4)




##Ejercicio 5
### 1.- Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.

Este es el mismo ejercicio que el anterior (ejercicio 4), ya que este directamente lo he hecho con playbook



### 2.- ¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?.

Pues por la experiencia que he tenido en estos días tanto con Chef como con Ansible me quedo claramente con Ansible. Me parece más cómodo de usar los playbooks de Ansible que las recetas de Chef.


##Ejercicio 6
###Instalar una máquina virtual Debian usando Vagrant y conectar con ella.
Instalo Vagrant descargándomelo con el comando `sudo apt-get install vagrant`

Con este comando se me instala la versión 1.4.3, pero necesito actualizarlo a la 1.8.1 . Para esto lo que hago es descarmarme el archivo vagrant_1.8.1_x86_64.deb de [aquí](https://releases.hashicorp.com/vagrant/1.8.1/) e instalarlo con el comando `sudo dpkg -i vagrant_1.8.1_x86_64.deb`

![verifico versión 1.8.1 de vagrant](ejr6.1)

Una vez tengo la version 1.8.1 de Vagrant me dispongo a bajar una de las máquina de la lista de [vagrantbox](http://www.vagrantbox.es) con el comando que se nos facilita en la práctica. Concretamente he ejecutado `vagrant box add debian https://github.com/holms/vagrant-jessie-box/releases/download/Jessie-v0.1/Debian-jessie-amd64-netboot.box`

![descarga caja vagrant](ejr6.2)

Antes de lanzar Vagrant tengo que instalar VirtualBox ya que me hace falta para ello. El comando que ejecuto es `sudo apt-get install virtualbox virtualbox-dkms`

Ahora ejecuto el comando `vagrant init debian` en la raiz del proyecto que me va a crear el archivo Vagrantfile. Y inmediatamente despues ejecuto `vagrant up`

![vagrant up](ejr6.3)

Y por último nos conectamos por ssh a la máquina ejecutando el comando `vagrant ssh`



