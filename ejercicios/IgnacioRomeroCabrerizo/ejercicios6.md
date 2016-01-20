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








###Ejercicio 2.1: Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS, GALPon Minino, Damn Small Linux, SliTaz y ttylinux.


- Activamos (en caso de que no lo esté) KVM en la CPU Intel:

	```sudo modprobe kvm-intel ```

- Creamos y configuramos un disco duro virtual para la imagen:

	```qemu-img create -f qcow2 imagen-cow.qcow2 250M ```

- Instalamos qemu:
	```sudo apt-get install qemu-system ```
	
- Instalamos la iso descargada:
	
	```qemu-system-x86_64 -hda imagen-cow.qcow2 -cdrom ~/Documentos/minino-artabros-2.1_full.iso```
	
![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema5/mini0.png)


###2.2: Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.

Mediante **Parallels** tengo virtualiza la última versión de Ubuntu:

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema5/para.png)


###Ejercicio 3 Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con qemu-system-x86_64 -hda /media/Backup/Isos/discovirtual.img.

Haremos uso del siguiente benchmark escrito en **Python** que realiza una operación matemática:

```
import math
d = {}
for i in range(1, 5000000):
        d[i] = math.log(i)
```

###Ejercicio 4: Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.

- Añadimos disco virtual:
	```qemu-img create -f qcow2 lubuntu.qcow2 5G```
	
- Instalamos lubuntu:
	
	```qemu-system-x86_64 -hda lubuntu.qcow2 -cdrom ~/Documentos/lubuntu-15.10-desktop-amd64.iso -m 512M```

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema5/lubuntu.png)

- Para el acceso VNC:
	1. Instalamos la utilidad *Vinagre*:
	```sudo apt-get install vinagre ```
	
	2. Accedemos mediante: ```vinagre localhost:1```
	
- Para el acceso SSH:
 
	1. Instalaremos la herramienta:
	```sudo apt-get install ssh```
	
	2. Ejecutaremos **Qemu** con el puerto de acceso redireccionado: 
	```qemu-system-x86_64 -hda lubuntu.qcow2 -m 512M -redir tcp:2121::22```
	
	3. Entraremos con: ``` ssh nacho@localhost -p 2121 ```

	
	
	
	https://github.com/JJ/IV-2015-16/blob/master/ejercicios/FJavierGarridoMellado/Tema5/Tema5.md
	
	https://github.com/JJ/IV-2015-16/blob/master/ejercicios/RafaelLachicaGarrido/Tema5.md
