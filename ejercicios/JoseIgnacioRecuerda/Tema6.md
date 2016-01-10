#Ejercicios tema 6


##Ejercicio 1
###Instalar chef en la máquina virtual que vayamos a usar

Primero he tenido que seleccionar la version 2.0.0 de ruby para poder instalar chef, para ello he hecho siguientes:

* \curl -L https://get.rvm.io | bash -s stable --ruby 

Cierro la terminal y la vuelvo a abrir para poder hacer uso de rvm

En el menú de la terminal entro en: edit/Profile Preferences  me voy a la pestaña Title and Command y selecciono la opción que pone "Run command as a login shell" como se puede ver en la captura

![selecciono la opción del menú de la terminal](ejr1.1)

Selecciono la versión de ruby 2.2.1 con el comando `rvm use 2.2.1 --default`

Una vez hecho esto ya tengo seleccionada la versión de ruby con la cual puedo instalar chef con el comando `curl -L https://www.opscode.com/chef/install.sh | sudo bash`

![version de chef](ejr1.2)


##Ejercicio 2
###Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.

Para este ejercicio empiezo creando la estructura necesaria para poder realizarlo. Esta estructura es la siguiente:

![estructura ejercicio 2](ejr2.1)

Ahora incluyo el código de los archivos incluidos en esta estructura:

* chef/cookbooks/nano/recipes/default.rb 

Receta para nano

```
package 'nano'directory '/home/parallels/Desktop/IV/nano' do   	owner"parallels"   	group"parallels"    mode 00544   	action :createendfile "/home/parallels/Desktop/IV/nano/LEEME" do   	owner"parallels"   	group"parallels"   	mode 00544   	action :create    content "Haciendo prueba con chef"end
```

* chef/cookbooks/nginx/recipes/default.rb (

Receta para nginx

```
package 'nginx'directory "/home/parallels/Desktop/IV/nginx"
```

* chef/node.json

Este archivo contiene una lista con las recetas que debe de ejecutar

```
{    "run_list":["recipe[nginx]", "recipe[nano]"]}
```

* chef/solo.rb

En este archivo se encuentran las rutas necesarias para ejecutar las recetas

```
file_cache_path "/home/parallels/chef" cookbook_path "/home/parallels/chef/cookbooks" json_attribs "/home/parallels/chef/node.json" 
```

Por último solo tengo que ejecutar el comando para que con el archivo solo.rb ejecute las recetas anteriormente descritas: `sudo chef-solo -c solo.rb` (estando situado dentro de la carpeta chef)

![comando que ejecuta las recetas](ejr2.2)

##Ejercicio 3
###Escribir en YAML la siguiente estructura de datos en JSON { uno: "dos",tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }

YAML es un formato para el intercambio de información  en la web, como JSON y XML. La estructura del enunciado escrita en YAML quedaría así:


	---
		uno: "dos"
		tres:
			4
			5
			"Seis"
			
				siete: 8
				nueve:
					10
					11
	



