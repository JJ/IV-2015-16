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

