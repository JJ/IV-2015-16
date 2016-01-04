# Tema 6. Gestión de configuraciones.

##Ejercicio 1: Instalar chef en la máquina virtual que vayamos a usar

He decidido instalarlo de la forma rápida mediante 

	curl -L https://www.opscode.com/chef/install.sh | sudo bash

Podemos comprobar que la instalación se ha realizado correctamente mediante

	chef-solo -v

![imagen](https://www.dropbox.com/s/ri9fq72hztdm7k3/chef.png?dl=1)
	

##Ejercicio 2: Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.
He decidico instalar nano como editor de texto. Para la receta, he creado la siguiente jerarquia de directorios:

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

Comprobamos que hay conexion

	ansible all -u hugo -i ansible_hosts -m ping

![imagen](https://www.dropbox.com/s/clf2u100lasyr5m/ansible.png?dl=1)

Ahora estamos en condiciones de desplegar la aplicación. 


	ansible all -u hugo -m command -a "sudo apt-get install python-dev python-setuptools git -y"
	ansible all -u hugo -m git -a "repo=https://github.com/hugobarzano/AplicacionDAI.git  dest=~/pruebaAnsible version=HEAD"
	ansible all -u hugo -m command -a "sudo python manage.py runserver 0.0.0.0:80 &"
	azure vm endpoint create -n http hugo 80 8080

Para detener la maquina

	 azure vm shutdown maquina-hugo-ej5

##Ejercicio 5.1: Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.

##Ejercicio 5.2: ¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?.

##Ejercicio 6: Instalar una máquina virtual Debian usando Vagrant y conectar con ella.

##Ejercicio 7: Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica

##Ejercicio 8: Configurar tu máquina virtual usando vagrant con el provisionador ansible

