### Ejercicio 1 : Instalar chef en la máquina virtual que vayamos a usar

Lo instalamos mediante:
```
curl -L https://www.opscode.com/chef/install.sh | sudo bash
```
Podemos comprobar la instalación mediante:
```
chef-solo -v
```

![chef](http://i63.tinypic.com/2rc9xeh.png)


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

![ejecucion](http://i63.tinypic.com/11764ps.jpg)



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

![varansible](http://i64.tinypic.com/amax5c.png)

Ahora configuro la conexión ssh con mi máquina de Amazon:
```

ssh-add "ruta-archivo.pem"

```
Compruebo la conexión:

![comprobacion](http://i65.tinypic.com/fc4qhs.png)

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

![ejecucion](http://i66.tinypic.com/vspabm.png)


### Ejercicio 6:Instalar una máquina virtual Debian usando Vagrant y conectar con ella.

- Instalamos Vagrant:
```
sudo apt-get install vagrant
```

- Descargamos la imagen de Debian:
```
vagrant box add debian https://github.com/holms/vagrant-jessie-box/releases/download/Jessie-v0.1/Debian-jessie-amd64-netboot.box
```

![descimg](http://i68.tinypic.com/4hph4x.png)

- Creamos el fichero Vagranfile e inicializamos la máquina:
```
vagrant init debian
```
```
vagrant up
```

![vagrantup](http://i64.tinypic.com/6rov8i.png)

- Nos conectamos con ella para trabajar:
```
vagrant ssh
```

![ssh](http://i64.tinypic.com/snjn2o.png)


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

![img](http://i65.tinypic.com/2quhk5h.png)

![img](http://i65.tinypic.com/mrqqd.png)



### Ejercicio 8: Configurar tu máquina virtual usando vagrant con el provisionador ansible

Nuestro VangrantFile es el siguiente:

```

#-*- mode: ruby -*-
#vi: set ft=ruby :

Vagrant.require_plugin 'vagrant-aws'
Vagrant.require_plugin 'vagrant-omnibus'


Vagrant.configure('2') do |config|
    config.vm.box = "dummy"
    config.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"
    config.vm.network "public_network"
    config.vm.network "private_network",ip: "192.168.56.10", virtualbox__intnet: "vboxnet0"
    config.vm.network "forwarded_port", guest: 80, host: 80
    config.vm.define "localhost" do |l|
            l.vm.hostname = "localhost"
    end

    config.vm.provider :aws do |aws, override|
        aws.access_key_id = ""
        aws.secret_access_key = ""
        aws.keypair_name = ""
        aws.ami = ""
        aws.region = "us-west-2"
        aws.security_groups = ""
        aws.instance_type = "t2.micro"
        override.ssh.username = "ubuntu"
    end

    config.vm.provision "ansible" do |ansible|
        ansible.sudo = true
        ansible.playbook = "playbook.yml"
        ansible.verbose = "v"
        ansible.host_key_checking = false
  end
end


```


- Para desplegar la aplicación estamos usuando **ansible**, que se encargará de instalar todos los paquetes necesarios, descargar nuestra aplicación de nuestro repositorio y ejecutarla.
Nuestro archivo **.yml** es el siguiente:

```
- hosts: localhost
  sudo: yes
  remote_user: vagrant
  tasks:
  - name: Actualizar sistema
    apt: update_cache=yes upgrade=dist
  - name: Instalar python-setuptools
    apt: name=python-setuptools state=present
  - name: Instalar build-essential
    apt: name=build-essential state=present
  - name: Instalar pip
    apt: name=python-pip state=present
  - name: Instalar git
    apt: name=git state=present
  - name: Ins Pyp
    apt: pkg=python-pip state=present
  - name: Instalar python-dev
    apt: pkg=python-dev state=present
  - name: Instalar libpq-dev
    apt: pkg=libpq-dev state=present
  - name: Obtener aplicacion de git
    git: repo=https://github.com/javiexfiliana7/proyectoDAI-IV.git  dest=proyectoDAI-IV clone=yes force=yes
  - name: Permisos de ejecucion
    command: chmod -R +x proyectoDAI-IV
  - name: Instalar requisitos
    command: sudo pip install -r proyectoDAI-IV/requirements.txt
  - name: ejecutar
    command: nohup sudo python proyectoDAI-IV/manage.py runserver 0.0.0.0:80

```

- Procedemos a desplegar nuestra aplicación, para ello pondremos en nuestra terminal en el directorio donde está el **Vagrantfile** (en **--provider** estamos indicando el proveedor, en nuestro caso Amazon)

```

vagrant up --provider=aws

```


- Vemos que funciona:

![img](http://i65.tinypic.com/mrzqad.png)

