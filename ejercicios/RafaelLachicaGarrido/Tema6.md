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
