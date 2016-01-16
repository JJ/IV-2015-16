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
- El primer paso es instalar Vagrant( este paso solo lo recomiendo si se tiene VirtualBox 4.0,4.1,4.2 o 4.3,para una version posterior seguir el siguiente paso):
```
sudo apt-get install vagrant
```
- Si se tiene la versión 5.0.x de VirtualBox hay que descargar el archivo [vagrant_1.8.1_x86_64.deb](https://releases.hashicorp.com/vagrant/1.8.1/) e instalar ejecutando:
```
sudo dpkg -i vagrant_1.8.1_x86_64.deb
```


- Ahora descargo la imagen de Debian tal y como se explica en los apuntes( he elegido una de 400MB,la primera que sale ocupa más ):
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

### Ejercicio 7: Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica

- El primer paso es definir el archivo **Vagranfile**, para ello se le indica la máquina que se va a usar, en mi caso la Debian anterior y el provisionamiento:

![provisionamiento](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/vagrantfile_zpsgxc4hcz1.png)

- Se arranca la máquina mediante `vagrant up` ( no instala el provisionamiento como pensaba, hay que hacerlo a posteriori) y se ejecuta la provisión mediante:
```
vagrant provision
```

![prov](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/vagrantprovision_zpsbflbv7hx.png)


- A continuación se conecta por ssh:
```
vagrant ssh
```
- Una vez conectado se comprueba que efectivamente se ha instalado y ha arrancado el servicio:
```
$ sudo service nginx status
```

![compro](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/vagrantnginx_zpsgbgykmnt.png)

### Ejercicio 8: Configurar tu máquina virtual usando vagrant con el provisionador ansible

Este ejercicio lo he realizado tanto para local(VirtualBox) como para desplegar la aplicación en Azure.

- Local:

El primer paso es instalar la box de Ubuntu mediante el siguiente comando:
```
vagrant box add ubuntu tps://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box
```

El segundo paso es crear el Vagranfile:
```
Vagrant.configure('2') do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = 'ubuntu'
  config.vm.network "forwarded_port", guest: 22, host:2222, id: "ssh", auto_correct: true
  config.vm.network "forwarded_port", guest: 80, host:8080, id: "web", auto_correct: true
  config.vm.define "localhost" do |l|
          l.vm.hostname = "localhost"
   end

   config.vm.provision "ansible" do |ansible|
      ansible.sudo = true
      ansible.playbook = "iv.yml"
      ansible.verbose = "v"
      ansible.host_key_checking = false
  end
end
```

Donde se le indica que se la caja será una Ubuntu, que las redirecciones SSH de la máquina virtual se producen por el puerto 2222, que las redirecciones del puerto 80 se van a realizar por el puerto 8080(estas redirecciones se explican en el tema anterior), se define el nombre de la máquina como localhost.El siguiente bloque es el de provisionamiento, ahí le indico que con ansible provea la máquina segun lo especificado en el archivo **iv.yml**.

El tercer paso es definir el archivo **iv.yml**:
```
- hosts: localhost
  sudo: yes
  remote_user: vagrant
  tasks:
  - name: Actualizar sistema 
    apt: update_cache=yes upgrade=dist  
  - name: Instalar paquetes
    apt: name=python-setuptools state=present
    apt: name=build-essential state=present
    apt: name=python-dev state=present
    apt: name=python-pip state=present
    apt: name=git state=present
  - name: Ins Pyp
    action: apt pkg=python-pip
  - name: Obtener aplicacion git
    git: repo=https://github.com/javiergarridomellado/DAI.git  dest=DAI clone=yes force=yes
  - name: Permisos de ejecucion
    command: chmod -R +x DAI
  - name: Instalar requisitos
    command: sudo pip install -r DAI/requirements.txt
  - name: ejecutar
    command: nohup sudo python DAI/manage.py runserver 0.0.0.0:80
```
Puede verse que le indico que actualice el sistema, instale los paquetes necesarios, baje la aplicación y arranque la aplicación.

El archivo ansible_host lo he definido de la siguiente manera:
```
localhost ansible_ssh_host=127.0.0.1 ansible_ssh_port=2222
``` 

Ya solo basta ejecutar el vagrant mediante( no es necesario `vagrant provision`):
```
vagrant up
```

![vagrantup](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/vagrantup_zpsnkjr43ry.png)

Puede verse la aplicación ejecutada en local.

![appdesplegada](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/appdesplegada_zpsoijkga53.png)

- Para Azure:
El primer paso es instalar el provisionador de azure para vagrant
```
vagrant plugin install vagrant-azure
```

![installvagrantazure](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/installvagranazure_zpsad7pzrjg.png)

El siguiente paso es loguearse y conseguir información de las credenciales de Azure( al ejecutar **azure account download** hay que acceder al enlace que nos facilita):
```
azure login
azure account download
```

Acto seguido importo a mi CLI de Azure mis credenciales:
```
azure account import Azure\ Pass-1-15-2016-credentials.publishsettings
```

![importarcredenciales](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/azureimport_zpsfwwiqjcc.png)


El siguiente paso es generar los certificados que se van a subir a Azure y nos va a permitir interaccionar con el:
```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout azurevagrant.key -out azurevagrant.key
chmod 600 ~/.ssh/azurevagrant.key
openssl x509 -inform pem -in azurevagrant.key -outform der -out azurevagrant.cer
```

El siguiente paso es subir el archivo **.cer** a [Azure](https://manage.windowsazure.com/@franciscojaviergarmelhotmai.onmicrosoft.com#Workspaces/AdminTasks/ListManagementCertificates):


![certificado](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/subircredencial_zpshfktx7xg.png)

Para poder autenticar Azure desde Vagrantfile es necesario crear un archivo **.pem** y concatenarle el archivo **.key**, para ello:
```
openssl req -x509 -key ~/.ssh/id_rsa -nodes -days 365 -newkey rsa:2048 -out azurevagrant.pem
cat azurevagrant.key > azurevagrant.pem
```

El siguiente paso es crear el archivo **Vagrantfile**:
```
# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.configure('2') do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = 'azure'
  config.vm.network "public_network"
  config.vm.network "private_network",ip: "192.168.56.10", virtualbox__intnet: "vboxnet0"
  config.vm.network "forwarded_port", guest: 80, host: 80
  config.vm.define "localhost" do |l|
          l.vm.hostname = "localhost"
   end

  config.vm.provider :azure do |azure, override|
      azure.mgmt_certificate = File.expand_path('/home/javi/Escritorio/VagrantIV/azurevagrant.pem') 
      azure.mgmt_endpoint = 'https://management.core.windows.net'
      azure.subscription_id = '477d87d6-b8d0-4025-8c1f-a3de5c520c99'
      azure.vm_image = 'b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04_2-LTS-amd64-server-20150506-en-us-30GB'
      azure.vm_name = 'apuestas' 
      azure.vm_password = 'Clave#Javi#1'
      azure.vm_location = 'Central US' 
      azure.ssh_port = '22'
      azure.tcp_endpoints = '80:80'
  end	

  config.vm.provision "ansible" do |ansible|
      ansible.sudo = true
        ansible.playbook = "iv.yml"
        ansible.verbose = "v"
        ansible.host_key_checking = false
  end
end
```

Principalmente se compone de 3 bloques importantes:

En el primer bloque se indica que la *box* que se va a usar es la de azure, que va a tener una red pública y una privada( la cual se define ), y ademas los puertos de redirección que va a usar.

En el segundo bloque se procede a definir diferentes caracteristicas para usar el proveedor de servicios azure.

En el tercer bloque procedo a indicarle que provisione la máquina mediante ansible, el cual usa un archivo llamado **iv.yml**.

Antes de ejecutar **vagrant provider** es necesario definir la variable de entorno, en mi caso, ya que lo he hecho en el directorio **VagrantIV** lo defino de la siguiente manera:
```
$ export ANSIBLE_HOSTS=~/Escritorio/VagrantIV/ansible_hosts
```
Se define el archivo **iv.yml** que es el provee a la máquina Azure:
```
- hosts: localhost
  sudo: yes
  remote_user: vagrant
  tasks:
  - name: Actualizar sistema 
    apt: update_cache=yes upgrade=dist    
  - name: Instalar paquetes
    apt: name=python-setuptools state=present
    apt: name=build-essential state=present
    apt: name=python-dev state=present
    apt: name=python-pip state=present
    apt: name=git state=present
  - name: Ins Pyp
    action: apt pkg=python-pip
  - name: Obtener aplicacion git
    git: repo=https://github.com/javiergarridomellado/DAI.git  dest=DAI clone=yes force=yes
  - name: Permisos de ejecucion
    command: chmod -R +x DAI
  - name: Instalar requisitos
    command: sudo pip install -r DAI/requirements.txt
  - name: ejecutar
    command: nohup sudo python DAI/manage.py runserver 0.0.0.0:80
```

A continuacion en el archivo ansible_host se le indica que se va a trabajar como una máquina localhost:
```
[localhost]
192.168.56.10
``` 

El siguiente paso es proveerse de la box de [Azure](https://github.com/Azure/vagrant-azure/blob/master/README.md), para ello:
```
vagrant box add azure https://github.com/msopentech/vagrant-azure/raw/master/dummy.box
```
Ahora si puede procederse a ejecutar **provider** de la siguiente manera(puede hacerse un siguiente paso de provisionamiento con `vagrant provision` aunque en este caso no ha sido necesario):
```
vagrant up --provider=azure
```

![provider](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/provider_zpsygselitu.png)

![provider2](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/provider2_zpsjbspbrsb.png)

Con esto, puede verse que ya se puede acceder a la aplicación a traves de la url que genera este paso.

![desplegado](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/desplegado_zpseqavxjp3.png)



