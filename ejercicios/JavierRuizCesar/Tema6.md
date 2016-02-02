### Ejercicio 1 : Instalar chef en la máquina virtual que vayamos a usar

Lo instalamos mediante:
```
curl -L https://www.opscode.com/chef/install.sh | sudo bash
```
Podemos comprobar la instalación mediante:
```
chef-solo -v
```

![chef](ejer1)


### Ejercicio 2: Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.

- Creamos los directorios para mis recetas:
```
mkdir -p chef/cookbooks/nginx/recipes
mkdir -p chef/cookbooks/nano/recipes
```
- Ahora creamos los ficheros que contienen las recetas para instalar **nginx** y **nano**.Estos son ficheros **default.rb** ubicados cada uno de ellos en los directorios creados en el paso anterior respectivamente.

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

- A continuación se crea el archivo **node.json** con el siguiente contenido:
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

- Por ultimo se instala los paquetes ejecutando la orden `sudo chef-solo -c chef/solo.rb`

![ejecucion](ejer2)



### Ejercicio 3: Escribir en YAML la siguiente estructura de datos en JSON
## `{ uno: "dos",`
## `tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }`

Resultado:
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

Instalamos Ansible:
```
$ sudo pip install paramiko PyYAML jinja2 httplib2 ansible
```
El siguiente paso es crear el inventario añadiendo la máquina virtual Amazon EC2:
```
$ echo "ec2-52-25-51-241.us-west-2.compute.amazonaws.com" > ~/ansible_hosts
```
Definimos la variable de entorno para que Ansible sepa donde se encuentra el fichero:
```
$ export ANSIBLE_HOSTS=~/ansible_hosts
```

![varansible](ejer4a)

Ahora configuro la conexión ssh con mi máquina de Amazon:
```

ssh-add "ruta-archivo.pem"

```
Compruebo la conexión:

![comprobacion](ejer4b)

Instalamos las librerias:
```
ansible all -u javi -m command -a "sudo apt-get install python-setuptools python-dev build-essential git -y"
ansible all -u javi -m command -a "sudo easy_install pip" 
```
Descargamos la aplicación e instalamos los requisitos:
```
ansible all -u ubuntu -m git -a "repo=https://github.com/javiexfiliana7/submodulo-javi.git  dest=~/submodulo-javi version=HEAD"
ansible all -u ubuntu -m command -a "sudo pip install -r submodulo-javi/requirements.txt"
```

Ejecutamos la aplicación:

```
ansible all -u ubuntu -m command -a "sudo python submodulo-javi/manage.py runserver 0.0.0.0:80"
```

![ejecucion](ejer4c)


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

- Instalamos Vagrant:
```
sudo apt-get install vagrant
```

- Descargamos la imagen de Debian:
```
vagrant box add debian https://github.com/holms/vagrant-jessie-box/releases/download/Jessie-v0.1/Debian-jessie-amd64-netboot.box
```

![descimg]()

- Creamos el fichero Vagranfile e inicializamos la máquina:
```
vagrant init debian
```
```
vagrant up
```

![vagrantup]()

- Nos conectamos con ella para trabajar:
```
vagrant ssh
```

![ssh]()


### Ejercicio 7: Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica
- Cambiamos el Vagrantfile para nginx:

```

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
```

- Levantamos y ponemos en amrcha la máquina y comprobamos la instalación de nginx:

![img]()

![img]()



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



![jaula](http://i63.tinypic.com/2rw6g5i.png)

- Actualizamos los repositorios: **apt-get update**
- Instalamos *nginx* y *curl* con la orden **apt-get install nginx curl**
- Arrancamos el servidor de *nginx* comprobamos la página por defecto con **curl http://127.0.0.1**

- Montamos el directorio **/proc** necesario para hacer **ifconfig -a**, para ello **mount -t proc proc /proc**
- Ejecutamos **ifconfig -a**.
![mount](http://i64.tinypic.com/5b46dg.png)

- Al igual que en el contenedor lanzamos la orden **ab -n 1000 -c 1000 http://localhost/** desde un terminal diferente.

![resultado]()

Como podemos ver los resultados son mejores en la jaula ( aunque en este caso el resultado es parecido por usar una página estatica pequeña), esto es debido a que el contenedor lo hace a través de un puente.


