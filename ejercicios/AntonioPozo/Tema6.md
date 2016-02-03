### Ejercicio 1: Instalar chef en la máquina virtual que vayamos a usar.

He descargado el software de [aquí](https://downloads.chef.io/chef-server/ubuntu/).

Una vez descargado ejecutamos sudo dpkg -i chef-server-core_12.3.1-1_amd64.deb

### Ejercicio 2: Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.




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

Instalamos ansible en la máquina local:

```
sudo apt-get update 
sudo apt-get install ansible


```
Arrancamos la máquina virtual de azure y configuramos ssh:

```
azure vm start baresmachine
ssh-keygen -t dsa
ssh-copy-id -i .ssh/id_dsa.pub apozo@baresmachine.cloudapp.net
```

Probamos que todo lo anterior ha ido bien:
![todo ok](https://www.dropbox.com/s/guc98iymfqhoipo/ej4.png?dl=1)

Instalamos git y clonamos el repositorio:

```
ansible all -u apozo -a "sudo apt-get install git"
ansible all -u apozo -a "git clone https://github.com/AntonioPozo/Bares.git"
```

Instalamos las herramientas necesarias en la máquina ansible:

```
ansible all -u apozo -a "make install"
```
He utilizado la interfaz web para abrir el puerto 8000

Por último echamos a andar la aplicación:

```
ansible all -u apozo -a "make run"
```
![salida comando make run](https://www.dropbox.com/s/790we6y9c3xhfpp/ej4.1.png?dl=1)

![interfaz de la web](https://www.dropbox.com/s/pjp27ebwt8c8enn/4.2.png?dl=1)


###Ejercicio 5.1: Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.

Primero he editado el archivo ansible_hosts:

```
[baresmachine]baresmachine.cloudapp.net
```
A continuación he creado el playbook.yml, que tiene el siguiente aspecto:

```
---- hosts: baresmachine  sudo: yes  remote_user: apozo  tasks:  - name: Instalar paquetes necesarios    apt: name=python-setuptools state=present    apt: name=python-dev state=present    apt: name=build-essential state=present    apt: name=git state=present    apt: name=libtiff4-dev state=present    apt: name=libjpeg8-dev state=present    apt: name=zlib1g-dev state=present    apt: name=libfreetype6-dev state=present    apt: name=liblcms1-dev state=present    apt: name=libwebp-dev state=present  - name: Clonando repositorio desde git    git: repo=https://github.com/AntonioPozo/Bares.git dest=BaresDesarrollo version=HEAD force=yes  - name: Instalar requisitos para la app    shell: cd Bares && make install  - name: Ejecutar aplicacion    shell: cd Bares && make run
```

Por último he ejecutado el playbook como se muestra en la siguiente captura:

![ejecutando playbook](https://www.dropbox.com/s/dt5f4psw284cy53/ej5.1.png?dl=1)


### Ejercicio 5.2: ¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?

Ansible ofrece más posibilidades que Chef: pueden ejecutarse las configuraciones desde fuera de la máquina, es decir, remotamente, mientras que Chef requiere configurarse y ejecutarse dentro del servidor. 

Los playbooks de Ansible son mucho más sencillos de configurar y entender que la recetas de Chef. Por otra parte, Chef es más rápido pero Ansible ofrece una muy fácil gestión en múltiples máquinas al mismo tiempo.


### Ejercicio 6: Instalar una máquina virtual Debian usando Vagrant y conectar con ella.



### Ejercicio 7: Crear un script para provisionar "nginx" o cualquier otro servidor web que pueda ser útil para alguna otra práctica.

En el Vagrantfile añadimos lo siguiente:

```
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "debian"

  config.vm.provision "shell",
    inline: "sudo apt-get update && sudo apt-get install -y nginx && sudo service nginx start"

end
```



### Ejercicio 8: Configurar tu máquina virtual usando Vagrant con el provisionador Ansible.

