### Ejercicio 1 : Instalar chef en la máquina virtual que vayamos a usar

Procedemos a su instalación:
```
curl -L https://www.opscode.com/chef/install.sh | sudo bash
```
Comprobamos que todo se ha instalado correctamente.
```
chef-solo -v
```

![imagen](https://i.gyazo.com/ddc3050365fe41d86515efcf2172321a.png)


### Ejercicio 2: Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.

Creamos los directorios necesarios
```
mkdir -p chef/cookbooks/nginx/recipes
mkdir -p chef/cookbooks/nano/recipes
```
Creamos los archivos default.rb en cada uno de los directorios previamente creado. Cada archivo tendrá la "receta" pàra instalar nginx y nano.

**Nginx**
```
package 'nginx'
directory "/home/snik/Documentos/nginx"
file "/home/snik/Documentos/nginx/LEEME" do
    owner "snik"
    group "snik"
    mode 00544
    action :create
    content "nginx"
end
```

**Nano**
```
package 'nano'
directory "/home/snik/Documentos/nano"
file "/home/snik/Documentos/nano/LEEME" do
    owner "snik"
    group "snik"
    mode 00544
    action :create
    content "nano"
end
```

Creamos el .json

```
{
    "run_list":["recipe[nginx]", "recipe[nano]"]
}
```
Después, añadiremos en el directorio chef creado en el punto 1 el arhivo solo.rb con el siguiente contenido.
- Además en el directorio chef es necesario incluir el archivo **solo.rb** que incluye referencias a los archivos anteriores, este tiene el siguiente contenido:
```
file_cache_path "/home/snik/chef" 
cookbook_path "/home/snik/chef/cookbooks" 
json_attribs "/home/snik/chef/node.json" 
```

Ya podemos usar `sudo chef-solo -c chef/solo.rb` para realizarlo todo.

![ejecucion](https://i.gyazo.com/6987fbf096f1fd01ff4bd07540e5b436.png)



### Ejercicio 3: Escribir en YAML la siguiente estructura de datos en JSON
## `{ uno: "dos",`
## `tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }`
Quedaría de tal forma

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


### Ejercicio 6:Instalar una máquina virtual Debian usando Vagrant y conectar con ella.

- Instalamos Vagrant:
```
sudo apt-get install vagrant
```

- Descargamos la imagen de Debian:
```
vagrant box add debian https://github.com/holms/vagrant-jessie-box/releases/download/Jessie-v0.1/Debian-jessie-amd64-netboot.box
```

![descimg](https://i.gyazo.com/43c6105629297df58e06717b26c4727f.png)

- Creamos el fichero Vagranfile e inicializamos la máquina:
```
vagrant init debian
```
```
vagrant up
```

![vagrantup](http://i64.tinypic.com/6rov8i.png)

Para conectarnos a ella usamos
```
vagrant ssh
```

![ssh](https://i.gyazo.com/1cf82129883ad38cba9ce2edb653aedd.png)


### Ejercicio 7: Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica

Scrip de Vagrant para nginx:
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

### Ejercicio 8: Configurar tu máquina virtual usando vagrant con el provisionador ansible

Con el vagrantfile y ansible en su lugar, usaremos el comando  

```
vagrant up --provider=aws
vagrantfile
```
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
        aws.keypair_name = "alberto"
        aws.ami = "ami-5189a661"
        aws.region = "us-west-2"
        aws.security_groups = "default"
        aws.instance_type = "t2.micro"
        override.ssh.username = "ubuntu"
        override.ssh.private_key_path = "/home/snik/Escritorio/alberto.pem"
    end

    config.vm.provision "ansible" do |ansible|
        ansible.sudo = true
        ansible.playbook = "aprovisionamiento.yml"
        ansible.verbose = "v"
        ansible.host_key_checking = false
  end
end
```

aprovisionamiento.yml

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
  - name: Obtener aplicacion de git
    git: repo=https://github.com/sn1k/submodulo-alberto.git  dest=submodulo-alberto clone=yes force=yes
  - name: Permisos de ejecucion
    command: chmod -R +x submodulo-alberto
  - name: Instalar requisitos
    command: sudo pip install -r submodulo-alberto/requirements.txt
  - name: ejecutar
    command: nohup sudo python submodulo-alberto/manage.py runserver 0.0.0.0:80
```

![img](https://i.gyazo.com/4420591fe16dcd63d2cf25848245f6de.png)

