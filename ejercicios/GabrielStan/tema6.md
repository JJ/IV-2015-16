# Tema 6

### Ejercicio 1

**Instalar chef en la máquina virtual que vayamos a usar**

Para instalar chef, se ejecuta el comando

	curl -L https://www.opscode.com/chef/install.sh | sudo bash

Para comprobar que se ha instalado correctamente, comprobamos la versión que se ha instalado.

![chef](https://www.dropbox.com/s/3od0f3es4dnezov/chef-version.png?dl=1)


### Ejercicio 2

**Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.**

He creado una receta para instalar gedit y nginx. A continuación se muestra el contenido de los ficheros creados.

![ficheros](https://www.dropbox.com/s/gc2t2vwcqahp860/contenidos.png?dl=1)

Para ejecutar las recetas, se ejecuta el comando

	sudo chef-solo -c solo.rb

desde el directorio que contiene el archivo `solo.rb`. A continuación podemos ver el resultado.

![ejec_chef](https://www.dropbox.com/s/n1wtopn4dgxkp6w/exec-chef.png?dl=1)

A continuación comprobamos, por ejemplo, que `nginx` se ha instalado correctamente.

![check](https://www.dropbox.com/s/n8g4bae0wqz4wdh/check_chef.png?dl=1)

### Ejercicio 4

**Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.**

Para empezar, vamos a configurar el archivo de hosts para ansible.

![hosts](https://www.dropbox.com/s/oa6ku8mszo7lfwl/ansible-hosts.png?dl=1)

He agrupado las máquinas con las que voy a trabajar en 2 grupos, máquinas en azure y máquinas locales (virtualbox). De momento voy a trabajar con las máquinas locales.

Para poder continuar, he tenido que asegurarme de que la clave ssh de mi cuenta está permitida en las máquinas remotas.

	ssh-copy-id gaby@192.168.56.101

A continuación, probamos hacer un ping.

![ping](https://www.dropbox.com/s/o9j80it54m0lkv9/ansible-ping.png?dl=1)

La conexión es correcta, por tanto podemos continuar desplegando las fuentes de nuestro proyecto en la máquina local.

Para empezar, apagamos el servicio `nginx` que instalamos en el tema anterior.

![sudostop](https://www.dropbox.com/s/06tj33ta7km0knm/sudo-stop.png?dl=1)

A continuación, instalamos las dependencias y fuentes desde git en la máquina virtual. Para ello, se puede usar el siguiente comando:

	ansible local -u gaby -m command -a "apt-get install python-setuptools python-dev build-essential git -y" --sudo --ask-become-pass

o mejor todavía, usando el módulo `apt` de ansible:

	ansible local -u gaby -m apt -a "name=python-setuptools state=present" --sudo --ask-become-pass

	ansible local -u gaby -m apt -a "name=python-dev state=present" --sudo --ask-become-pass

	ansible local -u gaby -m apt -a "name=build-essential state=present" --sudo --ask-become-pass

	ansible local -u gaby -m apt -a "name=git state=present" --sudo --ask-become-pass

y pip:

	ansible local -u gaby -m command -a "easy_install pip" --sudo --ask-become-pass

![apt](https://www.dropbox.com/s/7gloqae9iwtewen/apt.png?dl=1)

Y a continuación podemos usar el módulo git para desplegar el proyecto y ejecutar la instalación..

	ansible local -u gaby -m git -a "repo=https://github.com/gabriel-stan/gestion-tfg dest=~/despliegue version=HEAD"

![git](https://www.dropbox.com/s/orve3rermnyxbkv/git.png?dl=1)

	ansible local -u gaby -m command -a "chdir=/home/gaby/despliegue make install" --sudo --ask-become-pass

	ansible local -u gaby -m command -a "chdir=/home/gaby/despliegue make runserver" --sudo --ask-become-pass

![runserver](https://www.dropbox.com/s/n2zoqwlneee88xn/runserver.png?dl=1)

![curl](https://www.dropbox.com/s/b84ce7ed7a4hl52/curl.png?dl=1)

### EJercicio 5.1

**Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.**

Para ese ejercicio he creado un playbook de ansible que hace todos los pasos necesarios para desplegar la aplicación en un servidor.

``` yaml
---
- hosts: local
  remote_user: gaby
  become: yes
  become_method: sudo
  tasks:

  - name: Instalar dependencias
    apt: package={{ item }}  update_cache=yes
    with_items:
      - python-setuptools
      - build-essential
      - python-dev
      - make
      - git
    tags:
      - dependencias

  - name: Descargar fuentes
    git: repo=https://github.com/gabriel-stan/gestion-tfg  dest=~/despliegue clone=yes force=yes
    become_user: gaby
    tags:
      - git

  - name: Make install-dependencias
    command: chdir=/home/gaby/despliegue make install
    tags:
      - install

  - name: Make install
    command: chdir=~/despliegue make install
    become_user: gaby
    tags:
      - install

  - name: Make runserver
    shell: chdir=/home/gaby/despliegue nohup make runserver
    tags:
      - runserver
...
```

Este playbook se puede ejecutar con el comando 

	ansible-playbook gestfg.yml --ask-become-pass

y el resultado es el siguiente.

![playbook](https://www.dropbox.com/s/kp9yytbnvhphi6s/playbook.png?dl=1)

### Ejercicio 5.2

**¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?.**

Ansible, claramente. La flexibilidad y robustez de sus playbooks es indiscutible. Además, cuenta con Ansible Tower, interfaz gráfica para la administración de los diferentes nodos (gratuita hasta 10 nodos).


### Ejercicio 6

**Instalar una máquina virtual Debian usando Vagrant y conectar con ella.**

Para empezar, tenemos que instalar vagrant. Se puede hacer mediante `apt`

	sudo apt-get install vagrant

Indicaciones:

- Tener instalada una versión de VirtualBox 4.x
- Instalar el plugin de Guest Additions de VirtualBox en vagrant. 

Se puede hacer con el comando

	vagrant plugin install vagrant-vbguest


A continuación tenemos que descargar la imagen que vamos a utilizar para crear la máquina virtual, en este caso `Debian 7.8.0 amd64 netinst`.

	vagrant box add debian https://github.com/kraksoft/vagrant-box-debian/releases/download/7.8.0/debian-7.8.0-amd64.box

![boxadd](https://www.dropbox.com/s/3u8vh60400zvoi3/box-add.png?dl=1)

Una vez descargada la imagen, podemos crear el fichero de configuración `Vagrantfile` con el comando

	vagrant init debian

que creará el fichero en el directorio en el que estamos, e iniciar la máquina virtual con

	vagrant up

![vagrant](https://www.dropbox.com/s/epyyylmpo4agdlb/up.png?dl=1)

Y para conectarnos remotamente mediante ssh, podemos utilizar el comando

	vagrant ssh

![upandssh](https://www.dropbox.com/s/y0szx6upbtslsck/ssh.png?dl=1)

Para finalizar, podemos apagar la máquina virtual con el comando

	vagrant halt

### Ejercicio 7

**Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica**

Para provisionar la máquina con el servidor web nginx, he añadido al Vagrantfile lo siguiente:

```bash
  # Provision via script
  config.vm.provision "shell",
    inline: "apt-get install nginx && service nginx start"
```

Y a continuación se ejecuta el provisionamiento con el comando

	vagrant provision

y se comprueba que el servicio se está ejecutando correctamente.

![provision](https://www.dropbox.com/s/erewnyk9yf2unkm/provision.png?dl=1)


### Ejercicio 8

**Configurar tu máquina virtual usando vagrant con el provisionador ansible**

Para configurar Vagrant para que use ansible como provisionador, he tenido que modificar el Vagrantfile y el playbook segun se muestra:

Vagrantfile

```bash
# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "debian"

  config.vm.network :private_network, ip: "192.168.56.150"

  config.ssh.private_key_path = "~/.ssh/id_rsa"
  config.ssh.forward_agent = true

  config.vm.provision "file", source: "/home/gaby/.ssh/id_rsa.pub", destination: "/home/vagrant/.ssh/me.pub"
  config.vm.provision "shell", inline: "cat /home/vagrant/.ssh/me.pub >> /home/vagrant/.ssh/authorized_keys"

  # Provision with Vagrant
  config.vm.provision "ansible" do |ansible|
    ansible.sudo = true
    ansible.playbook = "gestfg-playbook.yml"
    ansible.inventory_path = "/home/gaby/ansible/ansible_hosts"
    ansible.verbose = "v"
    ansible.host_key_checking = false
  end
end

```

playbook:

```bash
---
- hosts: test

  vars:
    usuario_remoto: vagrant

  remote_user: vagrant
  become: yes
  become_method: sudo
  tasks:

  - name: Test vars
    command: echo un/{{ usuario_remoto }}/directorio
    become_user: "{{ usuario_remoto }}"
    tags:
      - test

  - name: Instalar dependencias
    apt: package={{ item }}  update_cache=yes
    with_items:
      - python-setuptools
      - build-essential
      - python-dev
      - make
      - git
    tags:
      - dependencias

  - name: Descargar fuentes
    git: repo=https://github.com/gabriel-stan/gestion-tfg  dest=~/despliegue clone=yes force=yes
    become_user: "{{ usuario_remoto }}"
    tags:
      - git

  - name: Make install-dependencias
    command: chdir=/home/{{ usuario_remoto }}/despliegue make install-packages
    tags:
      - install

  - name: Make install
    command: chdir=/home/{{ usuario_remoto }}/despliegue make install
    become_user: "{{ usuario_remoto }}"
    tags:
      - install

  - name: Make run
    shell: chdir=/home/{{ usuario_remoto }}/despliegue nohup make run
    tags:
      - runserver
...
```


















