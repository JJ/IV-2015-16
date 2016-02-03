#Tema 6.

###Ejercicio 1: Instalar chef en la máquina virtual que vayamos a usar.

He instalado chef ejecutando el comando: **curl -L https://www.opscode.com/chef/install.sh | sudo bash**.

Podemos comprobar que la instalación se ha realizado correctamente ejecutando: **chef-solo -v**.

![imagen](https://i.gyazo.com/822e101a5a02c6fec9cdd81f6c20889f.png)

###Ejercicio 2: Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.

Ahora vamos a escribir una receta para instalar Nginx mediante Chef. La receta queda como sigue:

```
package 'nginx'
package 'gedit'
directory '/home/manolo/directorioChef'
file "/home/manolo/directorioChef/Chef" do
	owner "manolo"
	group "manolo"
	mode 00544
	action :create
	content "Probando chef"
end
```

###Ejercicio 3: Escribir en YAML la siguiente estructura de datos en JSON.

En este ejercicio vamos a traducir una estructura de datos escrito en JSON a una estructura en YAML. La estructura de datos en YAML queda como sigue:

```
uno:"dos"
tres:
  -4
  -5
  -"Seis"
  -:
      "siete":8
      "nueve":[10,11]
```

###Ejercicio 6: Instalar una máquina virtual Debian usando Vagrant y conectar con ella.

Lo primero es instalar Vagrant: **sudo apt-get install vagrant**.

Lo siguiente es descargar la imagen que vamos a utilizar: **vagrant box add debian https://github.com/holms/vagrant-jessie-box/releases/download/Jessie-v0.1/Debian-jessie-amd64-netboot.box**.

Crear un fichero Vagrant: **vagrant init debian**.

![vagrant](https://i.gyazo.com/0cda82ccdde62305c94635daffafb46d.png)

Iniciar la máquina: **vagrant up**. 

![up](https://i.gyazo.com/58ffd6e1f3f835c89dba3f4f07e80655.png)

Conectar con la máquina: **vagrant ssh**.

![ssh](https://i.gyazo.com/30c4e7739530f757e2eedb0965ba7896.png)

###Ejercicio 7: Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica

```
# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "debian"
  config.vm.provision "shell",
  inline: "sudo apt-get update && sudo apt-get install -y nginx && sudo service nginx start"

end
```

Aprovisionamos la máquina y comprobamos el estado de nginx:
```
vagrant provision
vagrant ssh
sudo service nginx status
```
![imagen](https://i.gyazo.com/12a3d601766e4301d5dadd45e4a303cc.png)

###Ejercicio 8: Configurar tu máquina virtual usando vagrant con el provisionador ansible.

Para añadir el provisionamiento con ansible, abrimos el Vagrantfile que se ha creado en el ejercicio 6 y añadimos lo siguiente al final del archivo, como dice en la [guía oficial de ansible](http://docs.ansible.com/ansible/guide_vagrant.html)

```
  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "playbook.yml"
  end
```
De esta manera en el archivo playbook.yml se escribe la receta para el provisionamiento de la MV.

Además, en dicho arvhivo tenemos que incluir al principio la dirección de la MV para poder hacer el provisionamiento, en mi caso:

 `-hosts: 10.0.2.15`
 
 De esta manera ansible se conecta a la MV en vagrant y permite provisionarla.
