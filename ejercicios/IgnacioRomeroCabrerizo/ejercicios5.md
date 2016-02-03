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

		
###Ejercicio 5: Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.

Se ha seguido el siguiente [tutorial](https://azure.microsoft.com/en-us/documentation/articles/virtual-machines-linux-tutorial/).

Instalar dependencias necesarias:

1.  sudo apt-get install nodejs-legacy
2.  sudo apt-get install npm
3.  sudo npm install -g azure-cli

Login en Azure, listado y creación de máquina virtual:

4.  azure login  (*) 
5.  azure vm image list westus ubuntuserver
7.  azure vm create maquina-nacho-ubu b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04_3-LTS-amd64-server-20151020-en-us-30GB nacho Nacho#16 --location "North Europe" --ssh

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema5/azure5.png)

Arrancar máquina virtual y conectar por ssh:

8.  azure vm start maquina-nacho-ubu
9.  ssh nacho@maquina-nacho-ubu.cloudapp.net

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema5/ssh.png)

Arrancar nginx y abrir puerto 80:

10. sudo service nginx start
11. azure vm endpoint create maquina-nacho-ubu 80 80

Para apagar la máquina virtual:

12. azure vm shutdown maquina-nacho-ubu


(*) En este punto se pedirá abrir un link web con un código e iniciar sesión en Azure:
	
![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema5/azure1.png)

La correcta configuración sería de la siguiente forma:

1. azure config mode asm
2. azure account download
3. Descargar el fichero tras iniciar sesión en el link mostrado en terminal
![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema5/azure4.png)
4. azure account import <archivo-descargado>
5. azure site create --location "West US" <nombre-web>
![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema5/azure2.png)

Tras estos pasos tendremos lista la máquina:
![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema5/azure3.png)
