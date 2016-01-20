###Ejercicio 1: Instalar chef en la máquina virtual que vayamos a usar.


1. Descargamos el script de instalación de chef:

	```curl -L https://www.opscode.com/chef/install.sh | bash```

2. Comprobamos que se ha instalado chef correctamente:

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema6/chef.png)


###Ejercicio 2: Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.

1. Crear los directorios necesarios:

	- ```mkdir -p chef/cookbooks/nginx/recipes```
	- ```mkdir -p chef/cookbooks/nano/recipes```
	
2. Crear los ficheros de configuración con las recetas para instalar nginx y nano:

	- default.rb (nginx):
	
	```
	package 'nginx'
	directory "/home/nacho/Documentos/nginx"
	file "/home/nacho/Documentos/nginx/LEEME" do
    	owner "nacho"
    	group "nacho"
    	mode 00544
    	action :create
    	content "Directorio nginx"
	end
	```
	
	
	- default.rb (nano):
	
	
	```
	package 'nano'
	directory "/home/nacho/Documentos/nano"
	file "/home/nacho/Documentos/nano/LEEME" do
    	owner "nacho"
    	group "nacho"
    	mode 00544
    	action :create
    	content "Directorio nano"
	end
	```

3. Crear el archivo **node.json**:

	```
{
    "run_list":["recipe[nginx]", "recipe[nano]"]
}
	```

4. Crear el archivo **solo.rb** con las referencias a los otros archivos creados:

	```
file_cache_path "/home/nacho/chef" 
cookbook_path "/home/nacho/chef/cookbooks" 
json_attribs "/home/nacho/chef/node.json" 
	```

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema6/chef1.png)

5. Ejecutar la orden **chef**:
	```chef-solo -c solo.rb ```

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema6/chef2.png)



###Ejercicio 3: Escribir en YAML la siguiente estructura de datos en JSON


{ uno: "dos", tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }

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


###Ejercicio 4: Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.


1. Instalar Ansible:

	``` sudo pip install paramiko PyYAML jinja2 httplib2 ansible ```
	* En el caso de no tener previamente la herramienta pip instalada:
	```sudo apt-get install python-pip python-dev build-essential ```
	
2. Crear el fichero "inventario" añadiendo la máquina en Azure:

	```echo "maquina-nacho-ubu.cloudapp.net" > ~/ansible_hosts```

3. Definir la variable de entorno con la ubicación del fichero:

	```export ANSIBLE_HOSTS=~/ansible_hosts```
	
4. Iniciar la máquina virtual:

	```azure vm start dai-nacho```
	
5. Configurar ssh:

``` 
ssh-keygen -t dsa 
ssh-copy-id -i .ssh/id_dsa.pub nacho@maquina-nacho-ubu.cloudapp.net 
```
![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema6/ssh1.png)

6. Conexión con Ansible
``` ansible all -u nacho -i ansible_hosts -m ping ```

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema6/ansible.png)

7. Instalar dependencias necesarias en la máquina:

```
ansible all -u nacho -m command -a "sudo apt-get install python-setuptools python-dev build-essential git -y"

ansible all -u nacho -m command -a "sudo easy_install pip" 
```

8. Clonar el repositorio de git en la máquina de Azure:

```
ansible all -u nacho -m git -a "repo=https://github.com/nachobit/DAI_bares.git dest=~/prAnsible version=HEAD"
```
```
ansible all -u nacho -m command -a "sudo pip install -r prAnsible/requirements.txt"
```

---


###Ejercicio 5. 
####5.1.Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.

1. Definir el archivo anterior **ansible-hosts*:

```
[azure]maquina-nacho-ubu.cloudapp.net
```

2. Crear el **playbook** de Ansible (ansible.yml):

```
- hosts: azure  sudo: yes  remote_user: nacho  tasks:  - name: Instalar dependencias necesarias     apt: name=python-setuptools state=present    apt: name=build-essential state=present    apt: name=python-dev state=present    apt: name=git state=present  - name: Clonar repositorio de git    git: repo=https://github.com/nachobit/DAI_bares.git  dest=DAI_bares clone=yes force=yes  - name: Permisos de ejecucion    command: chmod -R +x DAI  - name: Instalar requisitos para la app    command: sudo pip install -r DAI_bares/requirements.txt  - name: Ejecutar app    command: nohup sudo python DAI_bares/manage.py runserver 0.0.0.0:80
```
3. Ejecutar el **playbook**:

```ansible-playbook -u nacho ansible.yml```

####Ejercicio 5.2: ¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?

