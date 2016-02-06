### Ejercicio 1 : Instalar chef en la m�quina virtual que vayamos a usar

Procedemos a su instalaci�n:
```
curl -L https://www.opscode.com/chef/install.sh | sudo bash
```
Comprobamos que todo se ha instalado correctamente.
```
chef-solo -v
```

![imagen](https://i.gyazo.com/ddc3050365fe41d86515efcf2172321a.png)


### Ejercicio 2: Crear una receta para instalar nginx, tu editor favorito y alg�n directorio y fichero que uses de forma habitual.

Creamos los directorios necesarios
```
mkdir -p chef/cookbooks/nginx/recipes
mkdir -p chef/cookbooks/nano/recipes
```
Creamos los archivos default.rb en cada uno de los directorios previamente creado. Cada archivo tendr� la "receta" p�ra instalar nginx y nano.

**Nginx**
```
package 'nginx'
directory "/home/snik/Documentos/nginx"
file "/home/snik/Documentos/nginx/LEEME" do
    owner "snik"
    group "snik"
    mode 00544
    action :create
    content "nginx"
end
```

**Nano**
```
package 'nano'
directory "/home/snik/Documentos/nano"
file "/home/snik/Documentos/nano/LEEME" do
    owner "snik"
    group "snik"
    mode 00544
    action :create
    content "nano"
end
```

Creamos el .json

```
{
    "run_list":["recipe[nginx]", "recipe[nano]"]
}
```
Despu�s, a�adiremos en el directorio chef creado en el punto 1 el arhivo solo.rb con el siguiente contenido.
- Adem�s en el directorio chef es necesario incluir el archivo **solo.rb** que incluye referencias a los archivos anteriores, este tiene el siguiente contenido:
```
file_cache_path "/home/snik/chef" 
cookbook_path "/home/snik/chef/cookbooks" 
json_attribs "/home/snik/chef/node.json" 
```

Ya podemos usar `sudo chef-solo -c chef/solo.rb` para realizarlo todo.

![ejecucion](https://i.gyazo.com/6987fbf096f1fd01ff4bd07540e5b436.png)



### Ejercicio 3: Escribir en YAML la siguiente estructura de datos en JSON
## `{ uno: "dos",`
## `tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }`
Quedar�a de tal forma

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

###	Ejercicio 4: Desplegar los fuentes de la aplicaci�n de DAI o cualquier otra aplicaci�n que se encuentre en un servidor git p�blico en la m�quina virtual Azure (o una m�quina virtual local) usando ansible.


### Ejercicio 6:Instalar una m�quina virtual Debian usando Vagrant y conectar con ella.

- Instalamos Vagrant:
```
sudo apt-get install vagrant
```

- Descargamos la imagen de Debian:
```
vagrant box add debian https://github.com/holms/vagrant-jessie-box/releases/download/Jessie-v0.1/Debian-jessie-amd64-netboot.box
```

![descimg](https://i.gyazo.com/43c6105629297df58e06717b26c4727f.png)

- Creamos el fichero Vagranfile e inicializamos la m�quina:
```
vagrant init debian
```
```
vagrant up
```

![vagrantup](http://i64.tinypic.com/6rov8i.png)

Para conectarnos a ella usamos
```
vagrant ssh
```

![ssh](https://i.gyazo.com/1cf82129883ad38cba9ce2edb653aedd.png)


### Ejercicio 7: Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser �til para alguna otra pr�ctica

Scrip de Vagrant para nginx:
```

#-*- mode: ruby -*-
#vi: set ft=ruby :

#Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    # All Vagrant configuration is done here. The most common configuration
    # options are documented and commented below. For a complete reference,
    # please see the online documentation at vagrantup.com.

    # Every Vagrant virtual environment requires a box to build off of.
config.vm.box = "debian"
config.vm.provision "shell",
inline: "sudo apt-get update && sudo apt-get install -y nginx && sudo service nginx start"

end
```

### Ejercicio 8: Configurar tu m�quina virtual usando vagrant con el provisionador ansible
