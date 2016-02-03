#Ejercicios Tema 6

##Ejercicio 1
###Instalar chef en la máquina virtual que vayamos a usar

En mi caso voy a instalar chef en una máquina virtual Ubuntu.
Una posibilidad para instalar chef es la siguiente:

`curl -L https://www.opscode.com/chef/install.sh | bash`

![ejercicio1](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/tema%206/ejercicio6_zps9nfurups.png)

##Ejercicio 2
###Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual

Voy a instalar nginx y como editor de texto vim

Comenzamos generando el directorio donde irán las recetas.

* mkdir -p chef/cookbooks/nginx/recipes
* mkdir -p chef/cookbooks/vim/recipes

Una vez creados los directorios el siguiente paso es crear las recetas en ellos.

Esta sería la receta para nginx

~~~
package 'nginx'
directory '/home/alejandro/Nginx'
file "/home/alejandro/Nginx/LEEME" do
owner "alejandro"
group "alejandro"
mode 00544
action :create
content "Directorio para nginx"
end
~~~

Y en el caso de vim es

~~~
package 'vim'
directory '/home/alejandro/vim'
file "/home/alejandro/vim/LEEME" do
owner "alejandro"
group "alejandro"
mode 00544
action :create
content "Directorio para vim"
end
~~~

Ahora hay que crear el fichero `json` incluyendo en él las referencias a las recetas, este fichero debe guardarse en `/home/alejandro/chef`

~~~
{
"run_list": [ "recipe[nginx]", "recipe[vim]" ]
}
~~~

Para terminar los preparativos necesitamos el fichero de configuración, que ha de guardarse en `home/alejandro/chef/solo.rb

~~~
file_cache_path "/home/alejandro/chef"
cookbook_path "/home/alejandro/chef/cookbooks"
json_attribs "/home/alejandro/chef/node.json"
~~~

Finalmente hemos de ejecutar

`sudo chef-solo -c chef/solo.rb`

![ejercicio2](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/tema%206/ejercicio2_zps34d54tsi.png)


##Ejercicio 3
###Escribir en YAML la siguiente estructura de datos en JSON `{ uno: "dos",tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }`

Para asegurarme de que he escrito la sintaxis de JSON correctamente he usado [jsonlint](jsonlint.com)

La representación correcta de la estructura de datos en JSON es:

~~~

{
"uno": "dos",
"tres": [4, 5, "Seis", {
"siete": 8,
"nueve": [10, 11]
}]
}

~~~

Y para pasarla a YAML he usado un convertidor online llamado [jsontoyaml](http://jsontoyaml.com/)

Esta es la estructura de datos representada en YAML

~~~
---
uno: "dos"
tres: 
- 4
- 5
- "Seis"
- 
siete: 8
nueve: 
- 10
- 11

~~~


##Ejercicio 4
###Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.

Voy a desplegar los fuentes de mi aplicación [bares](https://github.com/acasadoquijada/IV) en una máquina virtual local con ubuntu 14.

Lo primero es instalar el software necesario en caso de que no dispongamos de él

`sudo pip install paramiko PyYAML jinja2 httplib2 ansible`

Después, generar el llamado fichero `inventario`

`echo "172.16.248.130" > ~/ansible_hosts`

Indicamos a Ansible que se trata de una variable de entorno

`export ANSIBLE_HOSTS=~/ansible_hosts`

Una vez hecho lo anterior comprobamos si Ansible funciona

`ansible all -u alejandro -m ping`

[ejercicio6-1](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/tema%206/ejercicio4-1_zpsuuimoubn.png)

Tras las configuraciones iniciales iniciamos el proceso de aprovisionamiento:

* ansible all -u alejandro -m command -a "sudo apt-get install -y python3-setuptools"

* ansible all -u alejandro -m command -a "sudo apt-get -y install python3-dev"

* ansible all -u alejandro -m command -a "sudo apt-get -y install python-psycopg2"

* ansible all -u alejandro -m command -a "sudo apt-get -y install libpq-dev"

* ansible all -u alejandro -m command -a "sudo easy_install3 pip"

* ansible all -u alejandro -m command -a "sudo pip install --upgrade pip"

* ansible all -u alejandro -m command -a "sudo apt-get install git"

Descargamos la app del repositorio

* ansible all -u alejandro -m git -a "repo=https://github.com/acasadoquijada/IV.git dest=~/prueba"

![ejercicio6-2](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/tema%206/ejercicio6-2_zpspe9h0hvw.png)

Instalamos la app

* ansible all -u alejandro -m command -a "sudo pip install -r prueba/requirements.txt"

La lanzamos

* ansible all -u alejandro -m command -a "sudo python3 prueba/manage.py runserver 0.0.0.0:80"

![ejercicio6-3](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/tema%206/ejercicio6-3_zpskcjacwcu.png)































