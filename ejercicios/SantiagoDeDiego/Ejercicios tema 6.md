#Ejercicios tema 6

##Ejercicio 1:

Para instalar Chef en el equipo, basta ejecutar `sudo apt-get install ruby1.9.1 ruby1.9.1-dev ruby` y luego ejecutamos `sudo gem install ohai chef`

##Ejercicio 2:

Ahora vamos a escribir una receta para instalar Nginx mediante Chef. La receta queda como sigue:

```

package 'nginx'
package 'gedit'
directory 'IV/'
file "IV/fichero" do
	owner "santiago"
	group "santiago"
	mode 00544
	action :create
	content "Directorio para la asignatura de IV"
end

```

##Ejercicio 3:

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

##Ejercicio 4:

En mi caso he utilizado Ansible como provisionador de mi proyecto, por tanto se pueden ver los pasos necesarios, así como el archivo yml correspondiente al playbook en [mi repositorio](https://github.com/santidediego/Landscapes). En este caso lo he hecho combinado con vagrant, de forma que creo la MV desde cero con vagrant en Azure y luego la provisiono con Ansible, por eso es el propio Vagrantfile el que llama al playbook de configuración de ansible.

##Ejercicio 5:

Es lo mismo que el ejercicio 4.

##Ejercicio 6:

Lo primero de todo es buscar una box para Vagrant, con la única restricción de que tiene que ser una box de Debian. En mi caso he escogido la que parecía más pequeña de todas, ya que no voy a necesitar muchas cosas. Una vez escogida la agregamos a vagrant con `vagrant box add https://github.com/holms/vagrant-jessie-box/releases/download/Jessie-v0.1/Debian-jessie-amd64-netboot.box --name debian`

Una vez descargada creamos un directorio para almacenar el Vagrantfile y dentro ejecutamos `vagrant init debian`. De esta manera se crea el Vagrantfile. Ahora ejecutamos `vagrant up` y comienza a instalarse toda MVc. Una vez hecho esto podemos entrar a nuestra máquina virtual con `vagrant ssh` y configurar en ella lo que queramos:

![imagen](http://i864.photobucket.com/albums/ab201/Santiago_de_Diego/Captura%20de%20pantalla%20de%202016-01-05%20184912_zps5w07pota.png)

#Ejercicio 7:

En este ejercicio voy a realizar un script sencillo para instalar nginx. La utilidad real de este script es que luego puede incluirse en el Vagrantfile para poder provisionarlo. El script es para utilizar con SO Ubuntu y resulta muy sencillo ya que el gestor de paquetes apt ya dispone del paquete de nginx por defecto para poder instalarlo, así como todas las librerías necesarias automáticamente.  Allá va:

```
#!/bin/bash

sudo apt-get update
sudo apt-get install -y nginx

```

#Ejercicio 8:

Para añadir el provisionamiento con ansible, abrimos el Vagrantfile que se ha creado en el ejercicio 6 y solo tenemos que incluir lo siguiente al final, tal y como dice en la [guía oficial de ansible](http://docs.ansible.com/ansible/guide_vagrant.html)

```

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "playbook.yml"
  end

```
De esta manera en el archivo playbook.yml se escribe la receta para el provisionamiento de la MV.

Además, en dicho arvhivo tenemos que incluir al principio la dirección de la MV para poder hacer el provisionamiento, en mi caso:

 `-hosts: 10.0.2.2`
 
 De esta manera ansible se conecta a la MV en vagrant y permite provisionarla.