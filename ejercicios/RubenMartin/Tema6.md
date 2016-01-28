# Ejercicios de Rubén Martín Hidalgo
## Tema 6
### Ejercicio 1: Instalar chef en la máquina virtual que vayamos a usar.

Ejecutamos básicamente la orden `curl -L https://www.opscode.com/chef/install.sh | sudo bash` que descargará un script para la instalación de "chef-solo", que consiste en una versión aislada que permite trabajar en una máquina desde la misma.

![Instalación de Chef](https://www.dropbox.com/s/uis9d3tdhpk9rgj/instalacionChef.png?dl=1)

Si esta forma no funciona, también se puede instalar mediante gemas de Ruby Gems:

- `sudo apt-get install ruby1.9.1 ruby1.9.1-dev rubygems`
- `sudo gem install ohai chef`

### Ejercicio 2: Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.

Empezamos creando los directorios donde irán nuestras recetas. Uno para nginx y otro para mi editor, geany:

- `mkdir -p chef/cookbooks/nginx/recipes`
- `mkdir -p chef/cookbooks/geany/recipes`

El siguiente paso será configurar los ficheros que contendrán las recetas para instalar "nginx" y "geany". El fichero que contendrá la receta se llamará "default.rb" y habrá que crear uno en cada uno de los directorios creados anteriormente.

- **default.rb** para nginx:

```
package 'nginx'
directory "/home/romi/Documentos/nginx"
file "/home/romi/Documentos/nginx/LEEME" do
	owner "romi"
	group "romi"
	mode 00544
	action :create
	content "Directorio para nginx"
end
```

- **default.rb** para geany:

```
package 'geany'
directory "/home/romi/Documentos/geany"
file "/home/romi/Documentos/geany/LEEME" do
	owner "romi"
	group "romi"
	mode 00544
	action :create
	content "Directorio para geany"
end
```

Las órdenes de dichos archivos instalará el paquete especificado, crea un directorio para documentos y dentro de él un fichero que explica de qué se trata. Deberemos antes de asegurarnos que la carpeta "Documentos" está creada.

Ahora debemos crear un fichero llamado "node.json" que irá en el directorio chef y que contendrá la lista de recetas a ejecutar.

- **node.json**:

```
{
	"run_list":["recipe[nginx]", "recipe[geany]"]
}
```

Por último creamos el fichero de configuración "solo.rb" que incluirá referencias a los ficheros anteriores. Este también va en el directorio chef.

- **solo.rb**:

``` 
file_cache_path "/home/romi/chef" 
cookbook_path "/home/romi/chef/cookbooks" 
json_attribs "/home/romi/chef/node.json" 
```

Finalmente así es como quedaría la estructura de directorios Chef:

![Estructura Chef](https://www.dropbox.com/s/fs2f36jfhpuqdwg/directoriosChef.PNG?dl=1)

Ya solo nos falta comprobar que se instalan los paquetes con la siguiente orden:

 `sudo chef-solo -c chef/solo.rb`

![Ejecucion Chef](https://www.dropbox.com/s/nug7vya1lrh35h4/ejecucionChef.PNG?dl=1)

### Ejercicio 3: Escribir en YAML la siguiente estructura de datos en JSON "{ uno: "dos", tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }".

```
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
```

### Ejercicio 4: Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.

Empezamos instalando Ansible:

 `sudo pip install paramiko PyYAML jinja2 httplib2 ansible`
 
Creamos el fichero "inventario" añadiendo nuestra máquina de Azure:

 `echo "pruebaiv-romi.cloudapp.net" > ~/ansible_hosts`
 
Le decimos a Ansible donde está el fichero con la siguiente variable de entorno:

 `export ANSIBLE_HOSTS=~/ansible_hosts`

Arrancamos la máquina virtual:

 `azure vm start pruebaiv-romi`

Configuramos SSH para poder conectar con la máquina:

 `ssh-keygen -t dsa`
 `ssh-copy-id -i .ssh/id_dsa.pub romi@pruebaiv-romi.cloudapp.net`
 
![Configuración SSH](https://www.dropbox.com/s/cfc1nnuaa3w129j/configurarSSH.PNG?dl=1)
 
Ahora vamos a comprobar que tenemos acceso tanto por SSH como desde Ansible:

 `ssh romi@pruebaiv-romi.cloudapp.net`

![Conexión por SSH](https://www.dropbox.com/s/u8enzqjmjuizhqf/sshFunciona.PNG?dl=1)

 `ansible all -u romi -m ping`

![Conexión por Ansible](https://www.dropbox.com/s/6vb8a82v7dqme1d/ansiblePing.PNG?dl=1)

Ahora vamos a pasar a realizar el despliegue de la app. Primero instalamos los paquetes básicos para empezar:

 `ansible all -u romi -a "sudo apt-get install -y python-setuptools python-dev build-essential git"`

Y ahora clonamos el repositorio en la máquina de Azure:

 `ansible all -u romi -m git -a "repo=https://github.com/romilgildo/IV-PLUCO-RMH.git  dest=~/pruebaAnsible version=HEAD"`
 
Instalamos lo necesario para ejecutar la aplicación:

 `ansible all -m shell -a 'cd pruebaAnsible && make install'`
 
Como da un error al instalar la librería Pillow, tras buscar información se puede solucionar instalando lo siguiente:

 `ansible all -m shell -a 'sudo apt-get install -y libtiff4-dev libjpeg8-dev zlib1g-dev libfreetype6-dev liblcms1-dev libwebp-dev'`

Y volvemos a hacer "make install" para terminar la instalación de Pillow.

Por úlitmo, ejecutamos el servidor de Python:

 `ansible all -m shell -a 'cd pruebaAnsible && make run'`

![PLUCO desplegado con Ansible](https://www.dropbox.com/s/stvdx4ln1snvhsi/plucoenAnsible.PNG?dl=1)

### Ejercicio 5.1: Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.

Voy a empezar dándole un nombre a la máquina en el fichero "ansible_hosts":

![Hosts en Ansible](https://www.dropbox.com/s/a30vdeeudmyjks7/hostAnsible.PNG?dl=1)

Vamos a crear el playbook de Ansible llamado "desplieguePLUCO.yml" con el siguiente contenido:

```
---
- hosts: pruebaAzure
  sudo: yes
  remote_user: romi
  tasks:
  - name: Instalar paquetes necesarios
    apt: name=python-setuptools state=present
    apt: name=python-dev state=present
    apt: name=build-essential state=present
    apt: name=git state=present
    apt: name=libtiff4-dev state=present
    apt: name=libjpeg8-dev state=present
    apt: name=zlib1g-dev state=present
    apt: name=libfreetype6-dev state=present
    apt: name=liblcms1-dev state=present
    apt: name=libwebp-dev state=present
  - name: Clonando repositorio desde git
    git: repo=https://github.com/romilgildo/IV-PLUCO-RMH.git dest=IV-PLUCO-RMH clone=yes force=yes
  - name: Instalar requisitos para la app
    shell: cd IV-PLUCO-RMH && make install
  - name: Ejecutar aplicacion
    shell: cd IV-PLUCO-RMH && make run
```

Ejecutamos el playbook con:

 `ansible-playbook -u romi desplieguePLUCO.yml`

Y vemos que todo se ejecuta correctamente:

![Despliegue con playbook de Ansible](https://www.dropbox.com/s/1bb9h1u3cwlde39/despliegueAnsible.PNG?dl=1)

### Ejercicio 5.2: ¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?

Ansible es mucho más flexible que Chef, ya que pueden ejecutarse las configuraciones desde fuera de la máquina, es decir, remotamente, mientras que Chef requiere configurarse y ejecutarse dentro del servidor. Además los playbooks de Ansible son mucho más sencillos de configurar y entender que la recetas de Chef. Por otra parte, Chef es más rápido pero Ansible ofrece una muy fácil gestión en múltiples máquinas al mismo tiempo.

### Ejercicio 6: Instalar una máquina virtual Debian usando Vagrant y conectar con ella.

Primero instalamos Vagrant. Se puede hacer con:

 `sudo apt-get install vagrant`
 
Esto instala la versión 1.4.3. Pero para los ejercicios que hagamos con Azure, necesitaremos una versión posterior a las 1.6. 

Podemos descargar la última versión 1.8.1 de [aquí](https://releases.hashicorp.com/vagrant/) y luego instalar el deb:

 `sudo dpkg -i vagrant_1.8.1_x86_64.deb`
 
En mi caso he tenido que reiniciar el sistema operativo para que me reconozca vagrant:

![Version de Vagrant](https://www.dropbox.com/s/32xezyz1tmi8nz8/vagrantVersion.PNG?dl=1)
 
También instalaremos Virtualbox, ya que usaremos una máquina que use este hipervisor:

 `sudo apt-get install virtualbox virtualbox-dkms`

Ahora elegimos una distribución Debian de la siguiente [lista](http://www.vagrantbox.es/) y la descargamos:

 `vagrant box add debian http://static.gender-api.com/debian-8-jessie-rc2-x64-slim.box`
 
![Descargar máquina Vagrant](https://www.dropbox.com/s/lelinuaxaeuzwpv/vagrantAdd.PNG?dl=1)
 
Una vez termine la descarga, creamos un directorio donde vaya la máquina y dentro de ella hacemos lo siguiente:

 `vagrant init debian`
 
Esto crea el fichero "Vagrantfile" que permite trabajar y llevar a cabo cualquier configuración adicional. 

![Creacion fichero Vagrantfile](https://www.dropbox.com/s/c6npqqr043gchp4/vagrantInit.PNG?dl=1)

Ahora iniciamos la máquina:

 `vagrant up`
 
![Iniciamos la maquina Vagrant](https://www.dropbox.com/s/8rbnhfmo0ajoki2/vagrantUp.PNG?dl=1)
 
Y ya podemos conectar con la máquina por SSH:

 `vagrant ssh`

### Ejercicio 7: Crear un script para provisionar "nginx" o cualquier otro servidor web que pueda ser útil para alguna otra práctica.

Editamos el fichero Vagrantfile:

```
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "debian"

  config.vm.provision "shell",
	inline: "sudo apt-get update && sudo apt-get install -y nginx && sudo service nginx start"

end
```

Ejecutamos `vagrant provision` para recargar el nuevo Vagrantfile.

### Ejercicio 8: Configurar tu máquina virtual usando Vagrant con el provisionador Ansible.

Voy a configurar el Vagrantfile para crear una máquina de Azure y desplegar mi aplicación. 

Empezamos instalando "Vagrant Azure Provider":

 `vagrant plugin install vagrant-azure`
 
![Instalando Vagrant Azure Provider](https://www.dropbox.com/s/vadcj09qjm6jieu/vagrantAzure.PNG?dl=1)

Ya damos por hecho que además tenemos instalado VirtualBox, Vagrant, AzureCLI como hicimos en anteriores ejercicios.

Configuramos el acceso a nuestra cuenta de Azure como hice en los [ejercicios 5 y 6 del tema anterior](https://github.com/romilgildo/IV-2015-16/blob/master/ejercicios/RubenMartin/Tema5.md#ejercicio-5-crear-una-máquina-virtual-ubuntu-en-azure-e-instalar-en-ella-un-servidor-nginx-para-poder-acceder-mediante-web) si todavía no lo hemos hecho.

Conectamos a Azure con `azure login`:

![Login a cuenta Azure](https://www.dropbox.com/s/zbji3o97ifwv88x/azureLogin.PNG?dl=1)

Desde el Vagrantfile crearemos la máquina de Azure y usaremos el archivo desplieguePLUCO.yml que hicimos en el ejercicio 6 para realizar el despliegue de la app.

**Vagrantfile:**

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
    azure.mgmt_certificate = File.expand_path('~/azure.pem')
    azure.mgmt_endpoint = 'https://management.core.windows.net'
    azure.subscription_id = 'a5c45913-5302-4f3e-9ac2-77b0c0883196'
    azure.vm_image = 'b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04_3-LTS-amd64-server-20151218-en-us-30GB'
    azure.vm_name = 'pruebaiv-romi'
    azure.vm_user = 'romi'
    azure.vm_password = '***'
    azure.vm_location = 'Central US' 
    azure.ssh_port = '22'
    azure.tcp_endpoints = '8000:8000'
  end
  
  config.ssh.username = 'romi' 
  config.ssh.password = '***'

  config.vm.provision "ansible" do |ansible|
	ansible.sudo = true
    ansible.playbook = "desplieguePLUCO.yml"
	ansible.verbose = "v"
	ansible.host_key_checking = false 
  end
end

```

Editamos el nombre del host a localhost dentro del archivo ansible_hosts y lo llamaremos así en el playbook desplieguePLUCO.yml. Además le tenemos que añadir lo siguiente para que encuentre el host:

**ansible_hosts:**

```
[localhost]
127.0.0.1              ansible_connection=local
```

**desplieguePLUCO.yml:**

```
---
- hosts: localhost
  sudo: yes
  remote_user: romi
  tasks:
  - name: Actualizar sistema base
    apt: update_cache=yes upgrade=dist 
  - name: Instalar paquetes necesarios
    apt: name=python-setuptools state=present
    apt: name=python-dev state=present
    apt: name=build-essential state=present
    apt: name=git state=present
    apt: name=make state=present
  - name: Clonando repositorio desde git
    git: repo=https://github.com/romilgildo/IV-PLUCO-RMH.git dest=IV-PLUCO-RMH clone=yes force=yes
  - name: Instalar requisitos para la app
    shell: cd IV-PLUCO-RMH && make install
  - name: Ejecutar aplicacion
    shell: cd IV-PLUCO-RMH && make run
```

Exportamos la variable de entorno de Ansible para que reconozca el host:

 `export ANSIBLE_HOSTS=~/ansible_hosts`

Y ahora ejecutamos:

 `sudo vagrant up --provider=azure`
 
Esto crea la máquina virtual en Azure y posteriormente despliega la app.

![Ejecucion del comando Vagrant up](https://www.dropbox.com/s/xa4uj6ybnnczp9l/vagrantProvider.PNG?dl=1)
 
O si solo queremos ejecutar la parte de despliegue (si ya tenemos la máquina creada), hacemos:

 `sudo vagrant provision`
 
![Ejecucion del comando Vagrant provision](https://www.dropbox.com/s/hsawekz91afgj81/vagrantProvision.PNG?dl=1)
 
Aquí tenemos una prueba de la app desplegada en Azure usando Vagrant y funcionando:

![Captura de la app desplegada con Vagrant](https://www.dropbox.com/s/j3ztwtpvmpmxbpn/vagrantPluco.PNG?dl=1)
