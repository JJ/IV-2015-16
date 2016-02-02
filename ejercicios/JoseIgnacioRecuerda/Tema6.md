#Ejercicios tema 6


##Ejercicio 1
###Instalar chef en la máquina virtual que vayamos a usar

Primero he tenido que seleccionar la version 2.0.0 de ruby para poder instalar chef, para ello he hecho siguientes:

* \curl -L https://get.rvm.io | bash -s stable --ruby 

Cierro la terminal y la vuelvo a abrir para poder hacer uso de rvm

En el menú de la terminal entro en: edit/Profile Preferences  me voy a la pestaña Title and Command y selecciono la opción que pone "Run command as a login shell" como se puede ver en la captura

![selecciono la opción del menú de la terminal](https://www.dropbox.com/s/s6dxufn7j8a3gfh/ejr1.1.png?dl=1)

Selecciono la versión de ruby 2.2.1 con el comando `rvm use 2.2.1 --default`

Una vez hecho esto ya tengo seleccionada la versión de ruby con la cual puedo instalar chef con el comando `curl -L https://www.opscode.com/chef/install.sh | sudo bash`

![version de chef](https://www.dropbox.com/s/rznx1anvfn1t862/ejr1.2.png?dl=1)


##Ejercicio 2
###Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.

Para este ejercicio empiezo creando la estructura necesaria para poder realizarlo. Esta estructura es la siguiente:

![estructura ejercicio 2](https://www.dropbox.com/s/psq702twsk7upxr/ejr2.1.png?dl=1)

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

![comando que ejecuta las recetas](https://www.dropbox.com/s/zrkrs27m1ir9pdm/ejr2.2.png?dl=1)

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

	[azureubuntu]
	maquina-ubuntu.cloudapp.net



Defino la variable de entorno para que Ansible `export ANSIBLE_HOSTS=/etc/ansible/hosts`

Arranco la máquina `azure vm start maquina-ubuntu`

Configuro la conexión ssh, para ello creo una clave `ssh-keygen -t dsa` 

![creo la clave](https://www.dropbox.com/s/3fohcr07yjjtf59/ejr4.1.png?dl=1)

y la copio a mi máquina de azure `ssh-copy-id -i ~/.ssh/id_dsa_vagrant.pub  nacho@maquina-ubuntu.cloudapp.net`

![añado la clave a mi máquina](https://www.dropbox.com/s/qs8j4o7c8u9or2n/ejr4.2.png?dl=1)

Ahora ya puedo conectarme a mi máquina tanto por ssh `ssh 'nacho@maquina-ubuntu.cloudapp.net'` como por ansible `ansible azureubuntu -u nacho -m ping`

![ping con ansible](https://www.dropbox.com/s/7umkv72uzshh8yh/ejr4.3.png?dl=1)

Para automatizar toda la configuración de mi máquina de azure utilizo playbook de ansible que resulta mucho más cómodo. Para ello creo un archivo que se llama gestionPedidos.yml y tiene el siguiente contenido


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
  		  git: repo=https://github.com/ignaciorecuerda/gestionpedidos_django.git dest=gestionPedidos version=HEAD force=yes
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
    		command: sudo pip install -r gestionPedidos/tango_with_django_project/		requirements.txt
  		- name: lanzamos aplicacion
   		 command: nohup sudo python gestionPedidos/tango_with_django_project/manage.py runserver 0.0.0.0:80


Gracias a este playbooks instalo todas las dependencias, librerias necesarias y ejecuto la aplicación en el puerto 80. Para ejecutar el playbook me situo en la carpeta donde se encuentra gestionPedidos.yml y ejecuto el comando `ansible-playbook -u azureubuntu gestionPedidos.yml`

A continuación abro mi navegador e introduzco la direccíon `http://maquina-ubuntu.cloudapp.net/gestionpedidos/` y en ella puedo ver mi aplicación desplegada.

![ejecutando playbook](https://www.dropbox.com/s/kfqft4k9xup44fv/ejr4.4.png?dl=1)
![aplicación ejecutandose en azure](https://www.dropbox.com/s/cv43pfqltfl0r47/ejr4.5.png?dl=1)




##Ejercicio 5
### 1.- Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.

Este es el mismo ejercicio que el anterior (ejercicio 4), ya que este directamente lo he hecho con playbook



### 2.- ¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?.

Pues por la experiencia que he tenido en estos días tanto con Chef como con Ansible me quedo claramente con Ansible. Me parece más cómodo de usar los playbooks de Ansible que las recetas de Chef.


##Ejercicio 6
###Instalar una máquina virtual Debian usando Vagrant y conectar con ella.
Instalo Vagrant descargándomelo con el comando `sudo apt-get install vagrant`

Con este comando se me instala la versión 1.4.3, pero necesito actualizarlo a la 1.8.1 . Para esto lo que hago es descarmarme el archivo vagrant_1.8.1_x86_64.deb de [aquí](https://releases.hashicorp.com/vagrant/1.8.1/) e instalarlo con el comando `sudo dpkg -i vagrant_1.8.1_x86_64.deb`

![verifico versión 1.8.1 de vagrant](https://www.dropbox.com/s/xyx4gyk31hnrt5j/ejr6.1.png?dl=1)

Una vez tengo la version 1.8.1 de Vagrant me dispongo a bajar una de las máquina de la lista de [vagrantbox](http://www.vagrantbox.es) con el comando que se nos facilita en la práctica. Concretamente he ejecutado `vagrant box add debian https://github.com/holms/vagrant-jessie-box/releases/download/Jessie-v0.1/Debian-jessie-amd64-netboot.box`

![descarga caja vagrant](https://www.dropbox.com/s/pvom7qmjo1x4uvd/ejr6.2.png?dl=1)

Antes de lanzar Vagrant tengo que instalar VirtualBox ya que me hace falta para ello. El comando que ejecuto es `sudo apt-get install virtualbox virtualbox-dkms`

Ahora ejecuto el comando `vagrant init debian` en la raiz del proyecto que me va a crear el archivo Vagrantfile. Y inmediatamente despues ejecuto `vagrant up`

![vagrant up](https://www.dropbox.com/s/4tecbxcnk0bv8z3/ejr6.3.png?dl=1)

Y por último nos conectamos por ssh a la máquina ejecutando el comando `vagrant ssh`



##Ejercicio 7
###Crear un script para provisionar nginx o cualquier otro servidor web que pueda ser útil para alguna otra práctica


##Ejercicio 8
###Configurar tu máquina virtual usando vagrant con el provisionador ansible

En primer lugar instalo los plugin necesarios para que vagrant pueda conectarse con azure. Para ello ejecuto el comando `vagrant plugin install vagrant-azure`

![plugin vagrant azure](https://www.dropbox.com/s/4uvf6ayptn1lmyd/ejr8.1.png?dl=1)

Nos logeamos en azure con `azure login` y después ejecutamos el comando `azure account download` que nos dará un enlace que cuando abramos desde el navegador nos descargará un archivo

![descargando archivo de suscripción azure](https://www.dropbox.com/s/sm1v2mie3l913en/ejr8.2.png?dl=1)

Importo el archivo de suscripción que se me acaba de descargar con el comando `azure account import /media/psf/Google\ Drive/universidad/4INFORMATICA/DAI/Practicas/practica4/practica4MAC/Pase\ para\ Azure-1-17-2016-credentials.publishsettings`

![importado archivo de suscripción azure](https://www.dropbox.com/s/z619fddeduqups4/ejr8.3.png?dl=1)

Ahora voy a generar un certificado que tendré que subir a Azure para poder interaccionar con el más adelante. Este lo genero ejecutando los siguientes comandos: 

* `openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ~/.ssh/azurevagrant.key -out ~/.ssh/azurevagrant.key`

* `chmod 600 ~/.ssh/azurevagrant.key`

* `openssl x509 -inform pem -in ~/.ssh/azurevagrant.key -outform der -out ~/.ssh/azurevagrant.cer`

Para subir el certificado tenemos que entrar en el [portal de azure](https://manage.windowsazure.com/) ir al menú "Setting" y a conticuación en la pestaña "Management certificates". Ahora pulsamos la opción "upload" y buscamos el certificado creado anteriormente 

![subo certificado a azure](https://www.dropbox.com/s/nkrbfh2b8uevvla/ejr8.4.png?dl=1)

![certificado subido](https://www.dropbox.com/s/8ahvbwb1oy2v6wz/ejr8.5.png?dl=1)

Ahora necesito un archivo .pem para autenticar la máquina de azure desde nuestro fichero Vagrantfile, para ello ejecutamos estos dos comandos:

* `openssl req -x509 -key ~/.ssh/id_rsa -nodes -days 365 -newkey rsa:2048 -out azurevagrant.pem` Generamos el archivo .pem
`cat ~/.ssh/azurevagrant.key > ~/azurevagrant.pem` Concatenamos la clave primaria con el certificado en el archivo .pem

Ahora es el momento de crear mi archivo Vagrantfile. El contenido de este archivo es el siguiente:


	# -*- mode: ruby -*-
	# vi: set ft=ruby :

	Vagrant.configure(2) do |config|
  		config.vm.box = "azure"
  		config.vm.network "public_network"
  		config.vm.network "private_network",ip: "192.168.56.10", virtualbox__intnet: "vboxnet0"
  		config.vm.network "forwarded_port", guest: 80, host: 80
  		config.vm.define "localhost" do |l|
          l.vm.hostname = "localhost"
  		end

  		config.vm.provider :azure do |azure, override| 
    		azure.mgmt_certificate = File.expand_path('~/azurevagrant.pem') 
    		azure.mgmt_endpoint = 'https://management.core.windows.net'
    		azure.subscription_id = 'f60975a6-5737-46e7-a356-fb22242d94aa'
    		azure.vm_image = 'b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04_2-LTS-amd64-server-20150506-en-us-30GB'
    		azure.vm_name = 'maquina-vagrant' 
    		azure.vm_password = 'Nacho@azure1'
    		azure.vm_location = 'Central US' 
    		azure.ssh_port = '22'
    		azure.tcp_endpoints = '80:80'
  		end

  		config.vm.provision "ansible" do |ansible|
        	ansible.sudo = true
        	ansible.playbook = "vagrant.yml"
        	ansible.verbose = "v"
        	ansible.host_key_checking = false
  		end
	end


En el archivo ansible_hosts tengo:


	[localhost]
	192.168.56.10


Y a continuación defino la variable de entorno necesaria para Ansible

`export ANSIBLE_HOSTS=/media/psf/Google\ Drive/universidad/4INFORMATICA/DAI/Practicas/practica4/practica4MAC/gestionpedidos_django/ansible_host`

Creo mi archivo *vagrant.yml* con todos los comandos necesarios para preparar el entorno donde se ejecutará mi aplicación. El contenido de este archivo es:

	- hosts: localhost
  		sudo: yes
  		remote_user: vagrant
  		tasks:
  		- name: apt-get update
    		command: sudo apt-get update
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


Una vez tengo el archivo preparado creo una box con una imagen de azure con el siguiente comando:

`vagrant box add azure https://github.com/msopentech/vagrant-azure/raw/master/dummy.box`
Para eliminar la maquina: vagrant box remove azure

![añado box azure](https://www.dropbox.com/s/4bjx309j8cafc9q/ejr8.6.png?dl=1)


Ahora crearemos la máquina con el comando `vagrant up --provider=azure`

Si por el contrario ya tenemos la máquina creada y lo único que queremos es realizar el despliegue tendremos que usar el comando `vagrant provision`

![aplicación ejecutandose con ansible y vagrant](https://www.dropbox.com/s/8y1d1dw48xdlmgz/ejr8.7.png?dl=1)


