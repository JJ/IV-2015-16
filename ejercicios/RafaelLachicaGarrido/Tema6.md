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
root@prueba-iv-rlg:/home/pluco# mkdir -p chef/recetario/nginx/recetas
root@prueba-iv-rlg:/home/pluco# mkdir -p chef/recetario/nano/recetas
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
