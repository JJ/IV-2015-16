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


