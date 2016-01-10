### Ejercicio 1 : Instalar chef en la máquina virtual que vayamos a usar

Tal y como se explica he decidido instalarlo de la forma rapida mediante:
```
curl -L https://www.opscode.com/chef/install.sh | sudo bash
```
Esto habrá descargado un script para la instalación de "chef-solo", puede comprobarse la instalación mediante:
```
chef-solo -v
```

![chef](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/instalarchef_zpsbsp7tppz.png)

![chefsolo](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/chefsolo_zps1sk0ogm7.png)

Otra manera de instalarlo es la siguiente:
```
sudo apt-get install ruby1.9.1 ruby1.9.1-dev rubygems
sudo gem install ohai chef
```

### Ejercicio 2: Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.

- Como primer paso he creado los directorios para mis recetas:
```
mkdir -p chef/cookbooks/nginx/recipes
mkdir -p chef/cookbooks/nano/recipes
```
- El siguiente paso es crear los ficheros que contienen las recetas para instalar **nginx** y **nano**.Estos son ficheros **default.rb** ubicados cada uno de ellos en los directorios creados en el paso anterior respectivamente.

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
![default](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/defaultrb_zpsu6qkutwa.png)

- Hay que asegurarse que la carpeta Documentos existe sino hay que crearla, a continuación se crea el archivo **node.json** con el siguiente contenido:
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

![estructura](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/estructura_zpszn5bwor7.png)

- Por ultimo se instala los paquetes ejecutando la orden `sudo chef-solo -c chef/solo.rb`

![ejecucion](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/ejecucuion_zps2vlqpgo2.png)

- Puede verse como efectivamente instala nginx y crea los archivos LEEME:

![comprobacion](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/comprobacion_zpsijvgs7n3.png)

![comprobacion2](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/leeme_zpskb4jlndn.png)


### Ejercicio 3: Escribir en YAML la siguiente estructura de datos en JSON
### `{ uno: "dos",`
### `tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }`

El resultado es el siguiente:
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
