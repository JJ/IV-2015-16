### Ejercicio 1 : Instalar chef en la máquina virtual que vayamos a usar

Lo instalamos mediante:
```
curl -L https://www.opscode.com/chef/install.sh | sudo bash
```
Podemos comprobar la instalación mediante:
```
chef-solo -v
```

![chef](ejer1)


### Ejercicio 2: Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.

- Creamos los directorios para mis recetas:
```
mkdir -p chef/cookbooks/nginx/recipes
mkdir -p chef/cookbooks/nano/recipes
```
- Ahora creamos los ficheros que contienen las recetas para instalar **nginx** y **nano**.Estos son ficheros **default.rb** ubicados cada uno de ellos en los directorios creados en el paso anterior respectivamente.

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

- A continuación se crea el archivo **node.json** con el siguiente contenido:
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

- Por ultimo se instala los paquetes ejecutando la orden `sudo chef-solo -c chef/solo.rb`

![ejecucion](ejer2)



### Ejercicio 3: Escribir en YAML la siguiente estructura de datos en JSON
## `{ uno: "dos",`
## `tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }`

Resultado:
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


