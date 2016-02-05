#Tema 6

##Ejercicios

###Ejercicio 1
**Instalar chef en la máquina virtual que vayamos a usar**
1. He procedido descargándolo directamente de la página web:
~~~
curl -L https://www.opscode.com/chef/install.sh | sudo bash
~~~
![ChefLinuxMint](http://i1016.photobucket.com/albums/af281/raperaco/ChefLinuxMint_zpshvbevwah.png)


###Ejercicio 2
**Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.**
1. Crear los directorios para las recetas:
~~~
mkdir -p chef/cookbooks/nginx/recipes
mkdir -p chef/cookbooks/geany/recipes
~~~

2. Crear los ficheros para las recetas en su correspondiente directorio. Estos serán los ficheros **default.rb**:
- Para NGINX
En chef/cookbooks/nginx/recipes/default.rb:
~~~
package 'nginx'
~~~
    
- Para Geany
En chef/cookbooks/geany/recipes/default.rb:
~~~
package 'geany'
directory '/home/alex/Documentos/geany'
file "/home/alex/Documentos/geany/LEEME" do
	owner "alex"
    group "alex"
    mode 00644
    action :create
    content "Directorio para documentos diversos de Geany"
end
~~~

3. Crear el fichero **node.json** con las recetas a ejecutar (en mi caso lo creo en la ruta /home/alex/chef):
~~~
{
	"run_list":["recipe[nginx]", "recipe[geany]"]
}
~~~

4. En el directorio chef (en mi caso /home/alex/chef) incluimos el fichero de configuración **solo.rb** que incluye referencias a los ficheros de recetas y al fichero de recetas a ejecutar (node.json):
~~~
file_cache_path "/home/alex/chef"
cookbook_path "/home/alex/chef/cookbooks"
json_attribs "/home/alex/chef/node.json"
~~~

5. Ejecutamos chef para que lleve a cabo sus tareas (en este caso instalación de nginx, emacs y creación de directorio y fichero):
~~~
sudo chef-solo -c chef/solo.rb
~~~
![ChefSolo](http://i1016.photobucket.com/albums/af281/raperaco/ChefSolo_zpsvwdydnur.png)

6. Comprobamos el estado de nginx y la creación del fichero LEEME abriéndolo con el editor Geany:
![ChefSoloNginx](http://i1016.photobucket.com/albums/af281/raperaco/ChefSoloNginx_zps9lowtnfg.png)
![ChefSoloGeany](http://i1016.photobucket.com/albums/af281/raperaco/ChefSoloGeany_zpsh3h7sbuv.png)


###Ejercicio 3
**Escribir en YAML la siguiente estructura de datos en JSON**
~~~
{ uno: "dos",
  tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }
~~~

En YAML, sería:
~~~
-uno : "dos"
-tres :
	- 4
	- 5
	- "Seis"
	- 
		-siete : 8
        -nueve :
        	- 10
        	- 11
~~~


###Ejercicio 4
**Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.**
1. Instalar Ansible:
~~~
sudo pip install paramiko PyYAML jinja2 httplib2 ansible
~~~

2. Añadir la máquina sobre la que desplegaremos la aplicación, en mi caso una máquina virtual de Azure, al fichero inventario:
~~~
echo "azurevm-ubuntu14-alex.cloudapp.net" > ~/ansible_hosts
~~~

3. Indicar la ubicación del fichero inventario mediante una variable de entorno:
~~~
export ANSIBLE_HOSTS=~/ansible_hosts
~~~

4. Me identifico en azure para arrancar mi máquina virtual sobre la que desplegaré la aplicación:
~~~
azure login
azure vm start azureVM-ubuntu14-alex
~~~
![azureStart](http://i1016.photobucket.com/albums/af281/raperaco/azureStart_zpsjnzt5qdw.png)

5. Creo el par clave pública/privada para poder acceder por SSH sin necesidad de introducir cada vez la contraseña:
~~~
ssh-keygen -t dsa 
ssh-copy-id -i ~/.ssh/id_dsa.pub alex@azurevm-ubuntu14-alex.cloudapp.net
~~~
![azureKeySSH](http://i1016.photobucket.com/albums/af281/raperaco/azureKeySSH_zps4ov8ycj5.png)

6. Compruebo que tengo conexión con la máquina Azure a traves de Ansible con el comando ping:
~~~
ansible all -u alex -m ping
~~~
![ansiblePing](http://i1016.photobucket.com/albums/af281/raperaco/ansiblePing_zpsdbbtqqhb.png)

7. Instalo los paquetes necesarios en la máquina:
~~~
ansible all -u alex -m command -a "sudo apt-get -y install python-setuptools python-dev build-essential python-psycopg2 git"
ansible all -u alex -m command -a "sudo easy_install pip"
~~~
![ansibleDependencias](http://i1016.photobucket.com/albums/af281/raperaco/ansibleDependencias_zpslvhhsh6q.png)
![ansibleDependenciaPIP](http://i1016.photobucket.com/albums/af281/raperaco/ansibleDependenciaPIP_zps1z8xpiwy.png)

8. Descargo la aplicación del repositorio de GitHub:
~~~
ansible all -u alex -m git -a "repo=https://github.com/mabarrbai/TusPachangas.git  dest=~/appDAI"
~~~
![ansibleGitClone](http://i1016.photobucket.com/albums/af281/raperaco/ansibleGitClone_zps2sbtjkxo.png)

9. Instalar los requisitos de la app:
~~~
ansible all -u alex -m command -a "sudo pip install -r ~/appDAI/requirements.txt"
~~~
![ansibleRequirements](http://i1016.photobucket.com/albums/af281/raperaco/ansibleRequirements_zpsq5jw6rxt.png)

10. Saber que puerto vamos a usar para lanzar la aplicación. Yo usaré el puerto 80 (que ya lo abrí en el ejercicio 5 del tema 5) y además asegurarse de que no esté el puerto en uso (por el servidor nginx del ejercicio 5 del tema 5, por ejemplo; si es así, parar el servicio nginx). Lanzar la aplicación (lo haré con el servidor de desarrollo de Django el cual se queda ocupado y no muestra mensaje por pantalla. Otra opción será lanzarlo en segundo plano con &):
~~~
ansible all -u alex -m command -a "sudo python ~/appDAI/manage.py runserver 0.0.0.0:80"
~~~

11. Comprobamos que se ha desplegado la app correctamente:
![ansibleAppDesplegada](http://i1016.photobucket.com/albums/af281/raperaco/ansibleAppDesplegada_zps5agmlryv.png)


###Ejercicio 5
####1. Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.
El playbook que he creado para el despliegue de mi aplicación ha sido:
~~~
- hosts: azure
  remote_user: alex
  become: yes
  become_method: sudo
  tasks:
  - name: Actualizar repositorios
    apt: update_cache=yes
    tags: 
    - apt-update
        
  - name: Instalar dependencias
    apt: name={{ item }}
    with_items:
      - python-setuptools
      - python-dev
      - build-essential
      - python-psycopg2
      - git
    tags:
    - dependencias
    
  - name: easy_install
    easy_install: name=pip
    tags:
    - pip
    
  - name: Descargar fuentes
    git: repo=https://github.com/mabarrbai/TusPachangas.git dest=~/appDAI force=yes
    tags:
    - fuentes
    
  - name: Instalar requirements
    pip: requirements=~/appDAI/requirements.txt
    tags:
    - requirements
    
  - name: Lanzar app
    command: nohup python ~/appDAI/manage.py runserver 0.0.0.0:80
    tags:
    - app
~~~

Para ejecutarlo:
~~~
ansible-playbook playbookTusPachangas.yml
~~~
*No hace falta que indique el usuario puesto que ya se lo he indicado en el playbook (remote_user).*

![ansiblePlaybook](http://i1016.photobucket.com/albums/af281/raperaco/ansiblePlaybook_zps75il8nmt.png)

Y se puede comprobar como la aplicación está desplegada
![ansibleAppDesplegada](http://i1016.photobucket.com/albums/af281/raperaco/ansibleAppDesplegada_zps5agmlryv.png)

####2. ¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?.
Aunque las dos tienen funcionalidades similares y fáciles de comprender, personalmente me ha gustado más Ansible, ya que veo una mejor estructura y un mejor control desde un único fichero **playbook** que desde múltiples recetas en Chef. Además Ansible se conecta a los nodos mediante SSH para realizar las configuraciones teniendo la posibilidad de organizar los nodos en grupos y dirigirte a unos específicos, a un grupo o a todos, mientras que con Chef, la estructura de directorios y las recetas tienen que estar en las máquinas a configurar.
Por tanto, **Ansible**.
