# Tema 6. Gestión de configuraciones.

##Ejercicio 1: Instalar chef en la máquina virtual que vayamos a usar

He decidido instalarlo de la forma rápida mediante 

	curl -L https://www.opscode.com/chef/install.sh | sudo bash

Podemos comprobar que la instalación se ha realizado correctamente mediante

	chef-solo -v

![imagen](https://www.dropbox.com/s/ri9fq72hztdm7k3/chef.png?dl=1)
	

##Ejercicio 2: Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.
He decidido instalar nano como editor de texto. Para la receta, he creado la siguiente jerarquía de directorios:

![imagen](https://www.dropbox.com/s/2hteq1ky8kj4bm2/chef2.png?dl=1)

Contenido de la receta default.rb para nano

	package 'nano'
	directory '/home/hugo/directorioPruebasChef' do
		owner"hugo"
		group"hugo"
		mode 00544
		action :create
	end
	file "/home/hugo/directorioPruebasChef/LEEME_chef" do
		owner"hugo"
		group"hugo"
		mode 00544
		action :create
		content "Probando chef"
	end

Contenido de la receta default.rb para nginx

	package 'nginx'

Contenido de node.json

	{
		"run_list":["recipe[nano]", "recipe[nginx]"]
	}
	
Contenido de solo.rb

	file_cache_path "/home/hugo/chef"
	cookbook_path "/home/hugo/chef/cookbooks"
	json_attribs "/home/hugo/chef/node.json"

Podemos comprobar que funciona ejecutando 
	
	sudo chef-solo -c solo.rb

![imagen](https://www.dropbox.com/s/2vd1745ipi93475/chef3.png?dl=1)

##Ejercicio 3: Escribir en YAML la siguiente estructura de datos en JSON

	{ uno: "dos",tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] } 

	---
		- uno: "dos"
  		tres:
    			- 4
    			- 5
   			- "Seis"
    			-
      			- siete: 8
        		  nueve:
          			- 10
          			- 11


##Ejercicio 4: Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.

Lo primero es instalar ansible

	sudo pip install paramiko PyYAML jinja2 httplib2 ansible

Añadir la maquina de azure al control de ansible, es decir, al inventario

	 echo "maquina-hugo-ej5.cloudapp.net" > ~/ansible_hosts

Utilizar una variable de entorno, para decirle a ansible, donde esta el fichero

	export ANSIBLE_HOSTS=~/ansible_hosts

Voy a utilizar la máquina azure creada en el ejercicio 5 del tema 5: maquina-hugo-ej5.cloudapp.net
Me logueo y arranco la maquina

	azure login
	azure vm start maquina-hugo-ej5

Configuro ssh

	ssh-keygen -t dsa 
	ssh-copy-id -i .ssh/id_dsa.pub hugo@maquina-hugo-ej5.cloudapp.net

Comprobamos que hay conexión

	ansible all -u hugo -i ansible_hosts -m ping

![imagen](https://www.dropbox.com/s/clf2u100lasyr5m/ansible.png?dl=1)

Ahora estamos en condiciones de desplegar la aplicación. Debemos de:

Instalar dependencias. En mi caso, el sistema base esta actualizado, pero si no también seria recomendable hacerlo.

	ansible all -u hugo -m command -a "sudo apt-get install python-setuptools python-dev build-essential git -y"
	ansible all -u hugo -m command -a "sudo easy_install pip" 

Descargar la aplicación de git e instalar requisitos

	ansible all -u hugo -m git -a "repo=https://github.com/hugobarzano/AplicacionDAI.git  dest=~/pruebaAnsible version=HEAD"
	ansible all -u hugo -m command -a "sudo pip install -r pruebaAnsible/requirements.txt"
	
Ejecutamos la aplicación

	 ansible all -u hugo -m command -a "sudo python pruebaAnsible/manage.py runserver 0.0.0.0:80"

![imagen](https://www.dropbox.com/s/dqfflqfkxvrk4oy/ansible2.png?dl=1)

	
###Cosas utiles


Liberar el puerto 80

	ansible all -u hugo -m command -a "sudo fuser -k 80/tcp"

Administrar nginx

	ansible all -u hugo -m command -a "sudo service nginx start"
	ansible all -u hugo -m command -a "sudo service nginx stop"

Abrir trafico de azure

	azure vm endpoint create -n http hugo 80 8080

Apagar la máquina

	 azure vm shutdown maquina-hugo-ej5

##Ejercicio 5.1: Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.

El playbook que he usado es el siguiente:

	- hosts: azure
  	  sudo: yes
  	  remote_user: hugo
  	  tasks:
  	  - name: Instalar paquetes necesarios
    	    apt: name=python-setuptools state=present
    	    apt: name=build-essential state=present
    	    apt: name=python-dev state=present
    	    apt: name=git state=present
  	  - name: Obtener aplicacion de git
    	    git: repo=https://github.com/hugobarzano/AplicacionDAI.git  dest=~/pruebaAnsible clone=yes force=yes
  	  - name: Dar permisos de ejecucion
    	    command: chmod -R +x ~/pruebaAnsible
  	  - name: Instalar requisitos
    	    command: sudo pip install -r pruebaAnsible/requirements.txt
  	  - name: ejecutar
    	    command: nohup sudo python pruebaAnsible/manage.py runserver 0.0.0.0:80

Podemos desplegar la aplicación con el mediante

	 ansible-playbook -i inventario dai.yml

nohup permite mantener la ejecución de un comando pese a salir de la terminal, ya que hace que se ejecute de forma independiente a la sesión. Por lo tanto al terminar el proceso con el que desplegamos el playbook, la ejecución se mantiene persistente. 

![imagen](https://www.dropbox.com/s/qfpk2po2p7pcoui/ansible3.png?dl=1)

##Ejercicio 5.2: ¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?.

Ansible, la forma de clasificar las tareas y el no necesitar como chef una jeraquía de directorios para las recetas lo hacen mas cómodo. 

##Ejercicio 6: Instalar una máquina virtual Debian usando Vagrant y conectar con ella.

Lo primero es instalar Vagrant

	sudo apt-get install vagrant

Lo siguiente es descargar la imagen que vamos a utilizar 
	
	vagrant box add debian https://github.com/holms/vagrant-jessie-box/releases/download/Jessie-v0.1/Debian-jessie-amd64-netboot.box

Crear un fichero Vagrant

	vagrant init debian

![imagen](https://www.dropbox.com/s/ykq02qq34lgjflg/vagrant.png?dl=1)

Iniciar la máquina

	vagrant up 

![imagen](https://www.dropbox.com/s/e3g1dby8qeg6537/vagrant2.png?dl=1)

Conectar con la máquina

	vagrant ssh

![imagen](https://www.dropbox.com/s/m6o52i4w3sdtzui/vagrant3.png?dl=1)

##Ejercicio 7: Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica

He modificado el Vagrantfile generado en el ejercicio anterior para que aprovisione nginx

 	#-*- mode: ruby -*-
 	#vi: set ft=ruby :

 	#Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
	VAGRANTFILE_API_VERSION = "2"

	Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  		# All Vagrant configuration is done here. The most common configuration
  		# options are documented and commented below. For a complete reference,
  		# please see the online documentation at vagrantup.com.

  		# Every Vagrant virtual environment requires a box to build off of.
  	config.vm.box = "debian"
  	config.vm.provision "shell",
  	inline: "sudo apt-get update && sudo apt-get install -y nginx && sudo service nginx start"

	end

Aprovisionamos la maquina y comprobamos el estado de nginx

	vagrant provision
	vagrant ssh
	sudo service nginx status

![imagen](https://www.dropbox.com/s/ar13kecmxkiwo96/vagrant4.png?dl=1)

##Ejercicio 8: Configurar tu máquina virtual usando vagrant con el provisionador ansible

Voy a configurar una máquina virtual azure usando vagrant y después aprovisionarla de la aplicación de Dai con ansible. Ya que esto mismo me
será útil en la práctica final. Para llevarlo acabo, he combinado ideas de los siguientes tres enlaces:

[Configuración de host como localhost](http://renemoser.net/blog/2014/03/27/using-vagrant-for-ansible-roles/)

[Povisionamiento azure con vagrant](https://unindented.org/articles/provision-azure-boxes-with-vagrant/)

[Plugin Vagrant Azure Provider](https://github.com/Azure/vagrant-azure)


Partiendo de que tenemos instalado vagrant y azure-cli , lo primero que tenemos que hacer es instalar es el provisionador azure para vagrant

	vagrant plugin install vagrant-azure

![imagen](https://www.dropbox.com/s/z8pwe08h8npu79o/va.png?dl=1)

Para poder toquetear las maquinas azure, tendremos que descargar el archivo de Configuración de publicación, que contiene credenciales seguras e información adicional acerca de nuestra suscripción Azure

	azure login
	azure account download 

Debemos de abrir el enlace y descargar el archivo

![imagen](https://www.dropbox.com/s/4wrainq0e9w9aid/va2.png?dl=1)

Una vez que lo tengamos, debemos importarlo

	 azure account import Pase\ para\ Azure-1-8-2016-credentials.publishsettings 

Lo siguiente es obtener archivos PEM con las claves públicas y privadas, y los certificados X509

	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ~/.ssh/azurevagrant.key -out ~/.ssh/azurevagrant.key
	chmod 600 ~/.ssh/azurevagrant.key
	openssl x509 -inform pem -in ~/.ssh/azurevagrant.key -outform der -out ~/.ssh/azurevagrant.cer

Una vez creados, es necesario subir el certificado.cer al portal de azure 

![imagen](https://www.dropbox.com/s/nwjahryrdqu5506/va3.png?dl=1)

Para autenticar la maquina azure desde el Vagrantfile, necesitamos un archivo.pem. Para generarlo necesitamos hacer un truco, primero ejecutar 

	openssl req -x509 -key ~/.ssh/id_rsa -nodes -days 365 -newkey rsa:2048 -out azurevagrant.pem

para generarlo y después concatenarle el fichero.key. Esto es necesario para que el fichero.pem contenga tanto la clave publica como la privada.  
	
	cat azurevagrant.key > azurevagrant.pem 


Lo siguiente es crear el Vagrantfile

	Vagrant.configure('2') do |config|
 		config.vm.box = 'azure'
		config.vm.network "public_network"
 		config.vm.network "private_network",ip: "192.168.56.10", virtualbox__intnet: "vboxnet0"
 		config.vm.network "forwarded_port", guest: 80, host: 80
 		config.vm.define "localhost" do |l|
    			l.vm.hostname = "localhost"
  		end

 
 	config.vm.provider :azure do |azure, override| 
 		azure.mgmt_certificate = File.expand_path('~/.ssh/azurevagrant.pem') 
 		azure.mgmt_endpoint = 'https://management.core.windows.net'
 		azure.subscription_id = 'b0eda1f9-f644-4cfd-bc55-29015eed62c9'
 		azure.vm_image = 'b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04_2-LTS-amd64-server-20150506-en-us-30GB'
 		azure.vm_name = 'maquinahugoej8' 
 		azure.vm_password = 'Clave#Hugo#1'
 		azure.vm_location = 'Central US' 
 		azure.ssh_port = '22'
 		azure.tcp_endpoints = '80:80'
 	end

 	config.vm.provision "ansible" do |ansible|
    		ansible.sudo = true
    		ansible.playbook = "playbook.yml"
    		ansible.verbose = "v"
    		ansible.host_key_checking = false
  	end
	end

El Vagrantfile se caracteriza en 3 bloques principales, el primero:

	Vagrant.configure('2') do |config|
 		config.vm.box = 'azure'
		config.vm.network "public_network"
 		config.vm.network "private_network",ip: "192.168.56.10", virtualbox__intnet: "vboxnet0"
 		config.vm.network "forwarded_port", guest: 80, host: 80
 		config.vm.define "localhost" do |l|
    			l.vm.hostname = "localhost"
  	end 

En el configuro propiedades de la maquina virtual como son su nombre, su red(privada y publica) los puertos y defino el localhost.
En el segundo bloque

	config.vm.provider :azure do |azure, override| 
 		azure.mgmt_certificate = File.expand_path('~/.ssh/azurevagrant.pem') 
 		azure.mgmt_endpoint = 'https://management.core.windows.net'
 		azure.subscription_id = 'b0eda1f9-f644-4cfd-bc55-29015eed62c9'
 		azure.vm_image = 'b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04_2-LTS-amd64-server-20150506-en-us-30GB'
 		azure.vm_name = 'maquinahugoej8' 
 		azure.vm_password = 'Clave#Hugo#1'
 		azure.vm_location = 'Central US' 
 		azure.ssh_port = '22'
 		azure.tcp_endpoints = '80:80'
 	end

Configuro las propiedades, por decirlo de alguna manera, relativas al proveedor de servicio. En mi caso azure. En este bloque indico
el archivo de autenticación, el id de mi subscripción azure, la imagen que va a ser instalada, nombre y contraseña de la maquina, localización y puertos para ssh y tcp. Por último, en el tercer bloque:

	config.vm.provision "ansible" do |ansible|
    		ansible.sudo = true
    		ansible.playbook = "playbook.yml"
    		ansible.verbose = "v"
    		ansible.host_key_checking = false
  	end

Configuro todo lo relativo al aprovisionamiento mediante la herramienta ansible, indicándole el playbook que va a ejecutar: 

	- hosts: localhost
  	  sudo: yes
  	  remote_user: vagrant
   	  tasks:
  	- name: Actualizar sistema base
    	  apt: update_cache=yes upgrade=dist 
  	- name: Instalar paquetes necesarios
    	  apt: name=python-setuptools state=present
    	  apt: name=build-essential state=present
    	  apt: name=python-dev state=present
    	  apt: name=python-pip state=present
    	  apt: name=git state=present
  	- name: Install Python Pip
    	  action: apt pkg=python-pip
  	- name: Obtener aplicacion de git
    	  git: repo=https://github.com/hugobarzano/AplicacionDAI.git  dest=~/pruebaAnsible clone=yes force=yes
  	- name: Dar permisos de ejecucion
    	  command: chmod -R +x ~/pruebaAnsible
  	- name: Instalar requisitos de la aplicacion
    	  pip: requirements=~/pruebaAnsible/requirements.txt
  	- name: ejecutar
    	  command: nohup sudo python ~/pruebaAnsible/manage.py runserver 0.0.0.0:80

El playbook se encarga de actualizar el sistema base, instalar dependencia, descargar la aplicación de git, instalar los requisitos necesario y ejecutarla. Es aconsejable pero no necesario tener en el mismo nivel un archivo al que he llamado ansible_host que contiene

	[localhost]
	192.168.56.10

Si nos fijamos, esta ip privada es la establecida para la maquina virtual en el Vagrantfile. Para crear la maquina con vagrant, debemos ejecutar

	vagrant up --provider=azure

![imagen](https://www.dropbox.com/s/v8dtc28xemx2jow/ej8.png?dl=1)


==> localhost: Machine reached state ReadyRole nos indica que la máquina esta funcionando. El aprovisionamiento se lleva acabo también en esta ejecución, pero si queremos hacerlo después, podemos utilizar 

	vagrant provision

Podemos comprobar que efectivamente el despliegue de la aplicación similar a la del ejercicio 5 se ha llevado a cabo correctamente con un navegador, visitando el dns del cloud-service que Vagrant a creado y asociado a la máquina de manera automática. 

	http://maquinahugoej8-service-tvvyo.cloudapp.net/bares/

![imagen](https://www.dropbox.com/s/c972prq1ej67xhz/ej8_2.png?dl=1)
