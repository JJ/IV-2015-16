# Tema 6. Gestión de configuraciones.

##Ejercicio 1: Instalar chef en la máquina virtual que vayamos a usar

He decidido instalarlo de la forma rápida mediante 

	curl -L https://www.opscode.com/chef/install.sh | sudo bash

Podemos comprobar que la instalación se ha realizado correctamente mediante

	chef-solo -v

![imagen](https://www.dropbox.com/s/ri9fq72hztdm7k3/chef.png?dl=1)
	

##Ejercicio 2: Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.

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

##Ejercicio 5.1: Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.

##Ejercicio 5.2: ¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?.

##Ejercicio 6: Instalar una máquina virtual Debian usando Vagrant y conectar con ella.

##Ejercicio 7: Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica

##Ejercicio 8: Configurar tu máquina virtual usando vagrant con el provisionador ansible

