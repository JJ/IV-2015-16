# Tema 6 Gestor de configuraciones
## Rafael Lachica Garrido

## Ejercicio 1: Instalar chef en la máquina virtual que vayamos a usar.

Instalamos descargando primero el archivo de instalación.:
```
oot@prueba-iv-rlg:/home/pluco# curl -L https://www.opscode.com/chef/install.sh | bash
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 19971  100 19971    0     0  37512      0 --:--:-- --:--:-- --:--:-- 37539
Getting information for chef stable  for ubuntu...
downloading https://omnitruck-direct.chef.io/stable/chef/metadata?v=&p=ubuntu&pv=14.04&m=x86_64
  to file /tmp/install.sh.4478/metadata.txt
trying wget...
url	https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/14.04/x86_64/chef_12.6.0-1_amd64.deb
md5	5cfc19d5a036b3f7860716bc9795a85e
sha256	e0b42748daf55b5dab815a8ace1de06385db98e29a27ca916cb44f375ef65453
version	12.6.0downloaded metadata file looks valid...
downloading https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/14.04/x86_64/chef_12.6.0-1_amd64.deb
  to file /tmp/install.sh.4478/chef_12.6.0-1_amd64.deb
trying wget...
Comparing checksum with sha256sum...

WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING

You are installing an omnibus package without a version pin.  If you are installing
on production servers via an automated process this is DANGEROUS and you will
be upgraded without warning on new releases, even to new major releases.
Letting the version float is only appropriate in desktop, test, development or
CI/CD environments.

WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING

Installing chef
installing with dpkg...
Selecting previously unselected package chef.
(Reading database ... 53694 files and directories currently installed.)
Preparing to unpack .../chef_12.6.0-1_amd64.deb ...
Unpacking chef (12.6.0-1) ...
Setting up chef (12.6.0-1) ...
Thank you for installing Chef!
```

Ya tenemos instalado Chef.
**NOTA**: he usado Azure porque en local, como tengo **Elementary OS**, dice que chef no tiene soporte.


## Ejercicio 2: Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.
Primero hay que que crear los directorios, para poder tener las "recetas" de nginx allí. Uno lo uso para **Nginx**, y otro directorio para mi editor,
**Atom**, el cual es libre y funciona bastante bien con los plugins que se pueden instalar. Pero en mi editor, como lo hago en azure, tendré que usarlo para "nano".

```
root@prueba-iv-rlg:/home/pluco# mkdir -p chef/cookbooks/nginx/recipes
root@prueba-iv-rlg:/home/pluco# mkdir -p chef/cookbooks/nano/recipes
```

Ahora necesitamos configurar los ficheros que contengan las recetas de nginx y atom. Cada uno será default.rb de ruby,y hay que crear uno para cada fichero de los que hemos hecho antes.

- Creamos el default.rb nginx:
```
package 'nginx'
directory "/home/pluco/nginx"
file "/home/pluco/nano/LEEME" do
	owner "pluco"
	group "pluco"
	mode 00544
	action :create
	content "Directorio nginx"
end

```

- Lo mismo, default.rb para nano:
```
package 'nano'
directory "/home/pluco/nano"
file "/home/pluco/nano/LEEME" do
	owner "pluco"
	group "pluco"
	mode 00544
	action :create
	content "Directorio nano"
end
```

Estos archivos nos van a instalar el paquete que hemos especificado, crea un directorio para nano o nginx, en cada caso, y dentro de él un fichero que contiene el Leeme.

Ahora necesitamos configurar con una archivo **JSON**, para que ejecute las recetas que hemos creado. Este archivo debe ir en el directorio que hemos creado de chef.

**node.json**:
```
{
    "run_list":["recipe[nginx]", "recipe[nano]"]
}

```

Por último creamos el archivo **solo.rb**, donde referenciamos a los archivos que hemos creado anteriormente:

**solo.rb**
```
file_cache_path "/home/pluco/chef"
cookbook_path "/home/pluco/chef/cookbooks"
json_attribs "/home/pluco/chef/node.json"
```

Ejecutamos tree para ver la estructura de los directorios sean correctos:
```
root@prueba-iv-rlg:/home/pluco/chef# tree
.
├── chef-client-running.pid
├── chef-stacktrace.out
├── cookbooks
│   ├── nano
│   │   └── recipes
│   │       └── default.rb
│   ├── nginx
│   │   └── recipes
│   │       └── default.rb
│   └── recipes
├── node.json
└── solo.rb
```

Ejecutamos chef, con ``` chef-solo -c solo.rb```:
![chef](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202016-01-13%20122443_zpsg9momu0l.png)

## Ejercicio 3: Escribir en YAML la siguiente estructura de datos en JSON "{ uno: "dos", tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }".

```
---
- uno: "dos"
  tres:
    - 4
    - 5
    - "Seis"
    -
      - siete: 8
        nueve: [10,11]
```

## Ejercicio 4: Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.

Usaré mi proyecto de [IV-PLUCO-RLG](https://github.com/rafaellg8/IV-PLUCO-RLG).

- Primero vamos a proceder a instalar Ansible usando pip:
```
sudo apt-get install python-pip

sudo pip install paramiko PyYAML jinja2 httplib2 ansible
```

- Añadimos la máquina que vamos a usar de Azure, en el fichero **ansible_hosts**:
```
rafaellg8@system32:~/Desktop/varios$ echo "prueba-iv-rlg.cloudapp.net" > ~/ansible_hosts
rafaellg8@system32:~/Desktop/varios$ cat ~/ansible_hosts
prueba-iv-rlg.cloudapp.net

```
- Configuramos Ansible, y en la variable ANSIBLE_HOSTS le pasamos el fichero que acabamos de crear:
```
 export ANSIBLE_HOSTS=~/ansible_hosts
 ```

 - Nos logueamos y arrancamos la máquina virtual:
```
rafaellg8@system32:~/Desktop/varios$ azure login
info:    Executing command login
\info:    To sign in, use a web browser to open the page https://aka.ms/devicelogin. Enter the code DHMBBKD5W to authenticate. If you're signing in as an Azure AD application, use the --username and --password parameters.
\info:    Added subscription Azure Pass
+
info:    login command OK
rafaellg8@system32:~/Desktop/varios$ azure vm start prueba-iv-rlg
info:    Executing command vm start
+ Getting virtual machines                                                    + Starting VM                                                                  
info:    vm start command OK
```

- Probamos a hacerle ping a la máquina ahora a través de Ansible:
![azure](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202016-01-13%20131509_zpsiigu1zxs.png)

- Configuramos un password para que se conecte directamente por ssh, que creo que es el problema:
```
ssh-keygen -t dsa
```
![key](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202016-01-13%20132131_zpsm6vf371x.png)
Y ahora copiamos la clave:
```
ssh-copy-id -i ./clavePrueba.pub pluco@prueba-iv-rlg.cloudapp.net

```
![clave](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202016-01-13%20132243_zpszdosj9id.png)

- Probamos ahora a hacerle ping:
![imagen](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202016-01-13%20135546_zps1qwmdl9i.png)
**NOTA**: es importante que hayamos iniciado sesión por ssh en la máquina de Azure, sino da error.

- Procedemos ahora a realizar el despliegue de la app de PLUCO.
Como necesitaremos algunas cosas extras, como python, git y los paquetes básicos, los instalamos primero con Ansible.

```
ansible all -u pluco -a "sudo apt-get install -y python-setuptools python-dev build-essential python-pip git"

```

- Si todo ha sido instalado de forma correcta, procedemos a clonar la app en la máquina de azure:
```
ansible all -u pluco -m git -a "repo=https://github.com/rafaellg8/IV-PLUCO-RLG.git dest=~/plucoAnsible version=HEAD"
```

![resultado](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202016-01-13%20164013_zps0bvtqol1.png)

[Fuente Asible con git](http://docs.ansible.com/ansible/git_module.html)

- Ahora realizamos el Make install del repositorio que hemos clonado en la máquina de Azure en el paso anterior:
```
ansible all -m shell -a 'cd plucoAnsible && make install'
```

- Ejecutamos por último el servidor de Django a través del makefile:
```
ansible all -u pluco -m shell -a 'cd plucoAnsible && make run'
```

- Por último accedemos a través del navegador:
![img](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202016-01-13%20180111_zpsxk6nsh3b.png)

Incluso si no tenemos ningún servicio en el puerto 80,(y si lo tenemos lo cerramos), nos funciona a través del puerto 80.

## Ejercicio 5.1: Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.

Creamos el archivo **ansible_hosts**:
```
[plucoPlayBook]
prueba-iv-rlg.cloudapp.net
```
Donde añadimos el host de Azure.

Ahora creamos el playbook de Ansible, y lo guardamos en el fichero deployBook.yml:

```
---
- hosts: plucoPlayBook
  sudo: yes
  remote_user: pluco
  tasks:
  - name: Install
    apt: name=python-setuptools state=present
    apt: name=python-dev state=present
    apt: name=build-essential state=present
    apt: name=git state=present
  - name: Git clone, pluco
    git: repo=https://github.com/rafaellg8/IV-PLUCO-RLG.git dest=IV-PLUCO-RLG clone=yes force=yes
  - name: Make install
    shell: cd IV-PLUCO-RLG && make install
  - name: Make run
    shell: cd IV-PLUCO-RLG && make run

```

Ejecutamos ahora con ansible:
```
rafaellg8@system32:~$ ansible-playbook -u pluco -K deployBook.yml
SUDO password:
```


## Ejercicio 5.2: ¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?
Ansible para mi es mucho más sencillo y flexible, necesitamos menos archivos para la configuración, y da menos problemas. Además las estructuras de archivos de recetas de chef es un poco más engorrosa.
Por comodidad y facilidad de uso prefiero Ansible.

## Ejercicio 6: Instalar una máquina virtual Debian usando Vagrant y conectar con ella.

Primero de todo, tenemos que tener vagrant en nuestra máquina local:
```
sudo apt-get install vagrant
```

Ahora descargamos una máquina de las "Vagrant box", en mi caso he elegido esta Debian : ![http://www.emken.biz/vagrant-boxes/debsqueeze64.box](http://www.emken.biz/vagrant-boxes/debsqueeze64.box)

![img](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202016-01-16%20181125_zps4srpfwwt.png)

Antes de arrancarla, tenemos que tener instalado **Virtual Box DKMS**. Lo hacemos también:
```
rafaellg8@system32:~$ sudo apt-get install virtualbox-dkms
```

Ahora la arrancamos, con vagrant init primero y vagrant up después:
```
rafaellg8@system32:~$ vagrant init debian-local
A `Vagrantfile` has been placed in this directory. You are now
ready to `vagrant up` your first virtual environment! Please read
the comments in the Vagrantfile as well as documentation on
`vagrantup.com` for more information on using Vagrant.
```
Aquí nos informa de que sea a creado un archivo de configurción **Vagrantfile**, y que ya podemos arrancar la máquina.
```
vagrant up
```
![img](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202016-01-16%20185403_zpskxjz0vtt.png)

Aquí vemos que nos abre el puerto 22 que es el de ssh, por lo que podemos conectarnos ahora a través de él.
Lo comprobamos conectándonos:
![vagrant ssh](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202016-01-16%20192728_zps2idjxheh.png)


## Ejercicio 7: Crear un script para provisionar "nginx" o cualquier otro servidor web que pueda ser útil para alguna otra práctica.
Modificamos el VagrantFile:
```
# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "debian-local"

config.vm.provision "shell",
inline: "sudo apt-get update && sudo apt-get install -y nginx && sudo service nginx start"
end
```

Ahora ejecutamos **vagrant provision**:
![img](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202016-01-16%20195347_zpsg4slfh9u.png)

Y ya tenemos Nginx funcionando.

## Ejercicio 8: Configurar tu máquina virtual usando Vagrant con el provisionador Ansible.

Para este ejercicio he usado el siguiente [tutorial](http://stapp.space/setup-vagrant-with-azure/) que me ha resultado bastante bueno para usarlo con Azure y Vagrant.

- Instalamos el plugin de vagrant-azure:
```
 vagrant plugin install vagrant-azure
```

Nos da un error, debido a que necesita una versión superior a la 1.7.
Desde el link anterior podemos acceder a una nueva versión. La instalamos y ahora funciona todo correctamente:

```
rafaellg8@system32:~/Documentos/GII/Cuarto/IV/IV-2015-16$ vagrant plugin install vagrant-azure
Vagrant is upgrading some internal state for the latest version.
Please do not quit Vagrant at this time. While upgrading, Vagrant
will need to copy all your boxes, so it will use a considerable
amount of disk space. After it is done upgrading, the temporary disk
space will be freed.

Press ctrl-c now to exit if you want to remove some boxes or free
up some disk space.

Press the Enter or Return key to continue.
Installing the 'vagrant-azure' plugin. This can take a few minutes...
Installed the plugin 'vagrant-azure (1.3.0)'!
```

Nos logueamos ahora, si no lo hemos hecho aún, en nuestra cuenta de azure a través de la terminal con **azure login**, que usaremos después para levantar las máquinas.

Creamos el Vagrant File con nuestras necesidades. **NOTA** como indica el tutorial, hay que añadir nuestra cuenta de Azure y sus ficheros pem con el que usamos para el certificado y loguearnos:
```
VAGRANTFILE_API_VERSION = '2'
  Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'azure'
  config.vm.network "public_network"
  config.vm.network "private_network",ip: "192.168.56.10", virtualbox__intnet: "vboxnet0"
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  config.vm.define "localhost" do |l|
    l.vm.hostname = "localhost"
  end

  config.vm.provider :azure do |azure|
    azure.mgmt_certificate = File.expand_path('~/clavesAzure/azure.pem')
    azure.mgmt_endpoint = 'https://management.core.windows.net'
    azure.subscription_id = '2cc2475d-2e3d-4d07-b873-e46b595373f7'
    azure.vm_image = 'b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04_3-LTS-amd64-server-20151218-en-us-30GB'
    azure.vm_name = 'pluco'
    azure.vm_user = 'pluco'
    azure.vm_password = '***********'
    azure.vm_location = 'Japan West'
    azure.ssh_port = '22'
    azure.tcp_endpoints = '8000:8000'
    azure.tcp_endpoints = '80:80'
  end

  config.ssh.username = 'pluco'
  config.ssh.password = '***********'

  config.vm.provision "ansible" do |ansible|
    ansible.sudo = true
    ansible.playbook = "deployBook.yml"
    ansible.verbose = "v"
    ansible.host_key_checking = false
  end
end
```

Para el tema de la localización, la podemos seleccionar de aquí:
![localizacion](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202016-01-17%20100102_zpswxc4agio.png)

Aquí vemos el private network, será la interfaz que nos conectará con la máquina virtual.
La id de la suscripción  de Azure la podemos encontrar simplemente haciendo ```azure account show```, o en la configuración de Azure:
![azureaccount](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202016-01-17%20082950_zpstrzoxrfl.png)

La azure.vm_image es la imagen que elegimos, mostrando la lista de máquinas de vagrant, como hicimos en los ejercicios anteriores.
La demás configuración, son los nombres de usuario, los puertos que nos abrimos, y por último la configuración del deployBook que creamos antes.

Ahora solo nos falta añadir en los ansible_hosts,el localhost, ya que se conectara dentro del mismo servidor a nuestra app de DJANGO, y crear nuestro deployBook, que en mi caso ya lo tengo.

**ansible_hosts**:

```

[localhost]
127.0.0.1       ansible_connection=local

[plucoPlayBook]
prueba-iv-rlg.cloudapp.net
```

Editamos el deployBook para que encuentre el localhost que hemos configurado:
```
---
- hosts: localhost
  sudo: yes
  remote_user: pluco
  tasks:
  - name: Actualizar sistema base
    apt: update_cache=yes upgrade=dist
  - name: Instalar paquetes necesarios
    action: apt pkg={{ item }} state=installed
    with_items:
      - python-setuptools
      - python-dev
      - build-essential
      - git
      - make
  - name: Git clone, pluco
    git: repo=https://github.com/rafaellg8/IV-PLUCO-RLG.git dest=IV-PLUCO-RLG clone=yes force=yes
  - name: Make install
    shell: cd IV-PLUCO-RLG && make install
  - name: Make run
    shell: cd IV-PLUCO-RLG && make run
```

Ahora simplemente nos queda exportar las variables de nuestro fichero de ansible_hosts a  **ANSIBLE_HOSTS**:
```
export ANSIBLE_HOSTS=~/ansible_hosts
```

Solo nos falta añadir una caja de azure para que no nos de error, tenemos una caja de pruebas que será donde instalaremos la de azure:
```
vagrant box add azure https://github.com/msopentech/vagrant-azure/raw/master/dummy.box
```
Y ya podemos levantar nuestro servidor con:
```
sudo vagrant up --provider=azure
```
![imagen](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202016-01-17%20104151_zpsgjms1ejz.png)

**NOTA**: en el momento de la creación, tenía otro servicio en la nube llamado *pluco* de ahí que le llame después en el momento de la creación pluco-service-....

Aquí vemos nuestro servidor creado:
![img](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202016-01-17%20110255_zpsewvppjdu.png)

Y nos podemos conectar a él por ssh:
![img](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202016-01-17%20110944_zpsm1mcsbac.png)

Una vez ha terminado el aprovisionamiento de vagranty y el despliegue de ansible, tenemos ya nuestro servidor pluco:
![pluco](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202016-01-17%20120716_zps1ad6ijgw.png)

**NOTA**: lo voy a borrar, para realizar el despliegue correctamente con Pluco, a secas, borrando y limpiando cosas de azure.

Si todo va bien, estará todo en [pluco.cloudapp.net](https://pluco.cloudapp.net)
