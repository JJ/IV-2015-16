### Ejercicio 1 : Instalar chef en la máquina virtual que vayamos a usar

Tal y como se explica he decidido instalarlo de la forma rapida mediante:
```
curl -L https://www.opscode.com/chef/install.sh | sudo bash
```
Esto habrá descargado un script para la instalación de "chef-solo", puede comprobarse la instalación mediante:
```
chef-solo -v
```

![chef](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/instalarchef_zpsbsp7tppz.png)

![chefsolo](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/chefsolo_zps1sk0ogm7.png)

Otra manera de instalarlo es la siguiente:
```
sudo apt-get install ruby1.9.1 ruby1.9.1-dev rubygems
sudo gem install ohai chef
```

### Ejercicio 2: Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.

- Como primer paso he creado los directorios para mis recetas:
```
mkdir -p chef/cookbooks/nginx/recipes
mkdir -p chef/cookbooks/nano/recipes
```
- El siguiente paso es crear los ficheros que contienen las recetas para instalar **nginx** y **nano**.Estos son ficheros **default.rb** ubicados cada uno de ellos en los directorios creados en el paso anterior respectivamente.

**default.rb** para nginx:
```
package 'nginx'
directory "/home/javi/Documentos/nginx"
file "/home/javi/Documentos/nginx/LEEME" do
    owner "javi"
    group "javi"
    mode 00544
    action :create
    content "Directorio para nginx"
end
```

**default.rb** para nano:
```
package 'nano'
directory "/home/javi/Documentos/nano"
file "/home/javi/Documentos/nano/LEEME" do
    owner "javi"
    group "javi"
    mode 00544
    action :create
    content "Directorio para nano"
end
```
![default](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/defaultrb_zpsu6qkutwa.png)

- Hay que asegurarse que la carpeta Documentos existe sino hay que crearla, a continuación se crea el archivo **node.json** con el siguiente contenido:
```
{
    "run_list":["recipe[nginx]", "recipe[nano]"]
}
```

- Además en el directorio chef es necesario incluir el archivo **solo.rb** que incluye referencias a los archivos anteriores, este tiene el siguiente contenido:
```
file_cache_path "/home/javi/chef" 
cookbook_path "/home/javi/chef/cookbooks" 
json_attribs "/home/javi/chef/node.json" 
```

![estructura](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/estructura_zpszn5bwor7.png)

- Por ultimo se instala los paquetes ejecutando la orden `sudo chef-solo -c chef/solo.rb`

![ejecucion](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/ejecucuion_zps2vlqpgo2.png)

- Puede verse como efectivamente instala nginx y crea los archivos LEEME:

![comprobacion](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/comprobacion_zpsijvgs7n3.png)

![comprobacion2](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/leeme_zpskb4jlndn.png)


### Ejercicio 3: Escribir en YAML la siguiente estructura de datos en JSON
## `{ uno: "dos",`
## `tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }`

El resultado es el siguiente:
```
---
-uno:"dos"
 tres:
	- 4
	- 5
	- "Seis"
	-
		- siete: 8
		  nueve:
			- 10
			- 11
```

###	Ejercicio 4: Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.

El primer paso es instalar Ansible:
```
$ sudo pip install paramiko PyYAML jinja2 httplib2 ansible
```
El siguiente paso es crear el inventario añadiendo la máquina virtual Azure:
```
$ echo "maquina-javi-ubu5.cloudapp.net" > ~/ansible_hosts
```
Ahora se define la variable de entorno para que Ansible sepa donde se encuentra el fichero:
```
$ export ANSIBLE_HOSTS=~/ansible_hosts
```

![varansible](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/varansible_zpsrj43tixe.png)

A continuación, arranco la máquina que utilicé en el ejercicio 5 del tema anterior:
```
$ azure login
$ azure vm start maquina-javi-ubu5
```

![azurearranque](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/azurearranque_zpstgvnvgiy.png)

El siguiente paso es configurar SSH para poder conectar con la máquina:
```
ssh-keygen -t dsa 
ssh-copy-id -i .ssh/id_dsa.pub javi@maquina-javi-ubu5.cloudapp.net
```

![ssh](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/ssh_zps2hjbaghm.png)

Se comprueba que efectivamente ya no pide autenticación:

![ssh2](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/ssh2_zpskv3rpk3p.png)

El siguiente paso es comprobar que hay conexión con Ansible:
```
ansible all -u javi -i ansible_hosts -m ping
```

![pingansible](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/pruebaansible_zpsmpdomezy.png)

El siguiente paso es instalar las dependencias necesarias en la máquina:
```
ansible all -u javi -m command -a "sudo apt-get install python-setuptools python-dev build-essential git -y"
ansible all -u javi -m command -a "sudo easy_install pip" 
```
El siguiente paso es descargar la aplicación e instalar los requisitos:
```
ansible all -u javi -m git -a "repo=https://github.com/javiergarridomellado/DAI4.git  dest=~/pruebaDAI version=HEAD"
ansible all -u javi -m command -a "sudo pip install -r pruebaDAI/requirements.txt"
```

![pruebaansible2](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/pruebaansible2_zpsll3wx6hn.png)

Por último se procede a ejecutar la aplicación:
```
ansible all -u javi -m command -a "sudo python pruebaDAI/manage.py runserver 0.0.0.0:80"
```

Es necesario hacer una serie de cosas para poder visualizarlo desde nuestro navegador.Liberar el puerto 80:
```
ansible all -u javi -m command -a "sudo fuser -k 80/tcp"
```

Comprobar el estado del servidor nginx( tiene que estar parado ):
```
ansible all -u javi -m command -a "sudo service nginx status"
```
Abrir trafico de azure(se hizo en el ejercicio 5 del tema anterior):
```
azure vm endpoint create maquina-javi-ubu5 80 80
```
Apagar la máquina(el crédito es limitado):
```
 azure vm shutdown maquina-javi-ubu5
```

Y el proyecto de DAI funcionando:

![pagfunc](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/pagfuncionando_zpshvqhfhpa.png)

### Ejercicio 5: 
### 1.Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.

El primer paso es definir el host, para ello en el archivo **ansible_hosts** se define lo siguiente:

![ansible_hosts](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/ansiblehosts_zps5q8u3t5i.png)

Posteriormente se define el archivo **.yml**, en mi caso lo he llamado **daiansible.yml** con el siguiente contenido:
```
- hosts: azure
  sudo: yes
  remote_user: javi
  tasks:
  - name: Instalar paquetes 
    apt: name=python-setuptools state=present
    apt: name=build-essential state=present
    apt: name=python-dev state=present
    apt: name=git state=present
  - name: Obtener aplicacion de git
    git: repo=https://github.com/javiergarridomellado/DAI.git  dest=DAI clone=yes force=yes
  - name: Permisos de ejecucion
    command: chmod -R +x DAI
  - name: Instalar requisitos
    command: sudo pip install -r DAI/requirements.txt
  - name: ejecutar
    command: nohup sudo python DAI/manage.py runserver 0.0.0.0:80
```

Lo he ejecutado con la orden `ansible-playbook -u javi daiansible.yml`

![ansibleplaybook](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/ansibleplaybook_zps7dsjypvz.png)

Y el resultado es el mismo que en el ejercicio anterior con la salvedad de la automatización de ejecutar un solo script.

![resultado](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/ansibleplaybook2_zps6qojylas.png)

A tener en cuenta que el comando **nohup**  permite la ejecución de un comando pese a salir del terminal, ya que se ejecuta de manera independiente.Segun [linux.die](http://linux.die.net/man/1/nohup) -->**run a command immune to hangups, with output to a non-tty**

### 2.¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?.

La respuesta claramente es Ansible ya que permite ejecutarse desde fuera del servidor, por otra parte los **playbooks** de Ansible son más faciles de configurar que las recetas de Chef donde es necesario una jerarquización de directorios.

### Ejercicio 6:Instalar una máquina virtual Debian usando Vagrant y conectar con ella.

Estos son los pasos que se han seguido:
- El primer paso es instalar Vagrant(este paso solo lo recomiendo si se tiene VirtualBox 4.0,4.1,4.2 o 4.3 sino como explico en el posterior paso):
```
sudo apt-get install vagrant
```
- Si se tiene la versión 5.0.x de VirtualBox hay que descargar el archivo [vagrant_1.8.1_x86_64.deb](https://releases.hashicorp.com/vagrant/1.8.1/) e instalar ejecutando:
```
sudo dpkg -i vagrant_1.8.1_x86_64.deb
```


- Ahora descargo la imagen de Debian tal y como se explica en los apuntes(he elegido una de 400MB,la primera que sale ocupa más):
```
vagrant box add debian https://github.com/holms/vagrant-jessie-box/releases/download/Jessie-v0.1/Debian-jessie-amd64-netboot.box
```

![descimg](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/descargaimg_zpsuc50tczo.png)

- Creo el fichero Vagranfile:
```
vagrant init debian
```

- Se inicializa la máquina:
```
vagrant up
```

![vagrant](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/vagrant_zpsyphtsjx3.png)

![vagrantup](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/vagrantup_zpslwkhwr90.png)

- Y por ultimo se conecta con ella para trabajar:
```
vagrant ssh
```

![ssh](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/ssh_zpshm7obabi.png)     
