#Ejercicio 1

Empezaremos por el principio, y comprobaremos si nuestra CPU soporta la tecnología KVM.Para saber si tenemos KVM activado, utilizamos la orden

	egrep -c "vmx" /proc/cpuinfo
    
En nuestro caso, nos devuelve 4, que son el número de procesadores que tienen la tecnología KVM activada.

Al ser compatible, vamos a instalar los paquetes necesarios, siguiendo los pasos de [este enlace](https://wiki.debian.org/KVM#Installation)

	sudo apt-get install qemu-kvm

	sudo apt-get install libvirt-bin
    
#Ejercicio 2

Primero creamos el disco duro virutal, de tipo QCOW2. Lo haremos de 6 gigas aproximadamente (6.000 MB):

	qemu-img create -f qcow2 fichero-cow.qcow2 6000M

Después, bajamos la imagen de una distribución, como por ejemplo Debian, desde [este enlace](cdimage.debian.org/debian-cd/8.2.0/i386/iso-cd/debian-8.2.0-i386-netinst.iso).

Cargamos el módulo kernel KVM, mediante la siguiente orden (ya que el equipo en el que se realizan estas prácticas, cuenta con un procesador Intel):

	sudo modprobe kvm-intel

Y levantado el módulo, y con todo listo, lanzamos la máquina virtual con el archivo de disco duro virtual creado y la imagen descargada:

	qemu-system-x86_64 -hda fichero-cow.qcow2 -cdrom ./Descargas/debian-8.2.0-i386-netinst.iso 


![](Ejercicio2)

Seguimos las instrucciones que aparecen en pantalla para completar la instalación de Debian

De esta forma, hemos instalado Debian usando QEMU en una máquina virtual.

#### 2.2

Podemos replicar el ejercicio anterior usando virtualbox. Lo instalamos y lanzamos mediante:
	sudo apt-get install virtualbox-qt
    virtualbox
 
Hecho eso, seguimos el asistente de nueva creación de máquina vritual. Por intentar hacerlo lo más parecido posible, se escoge como tipo de archivo de disco duro firtual QCOW, como en la imagen se ve:

![](Ejercicio2-2)

Una vez finalizado el asistente,  configuramos la máquina para que el CD sea la imagen descargada de Debian.

![](EJercicio2-3)

GUardamos, lanzamos la máquina, y seguimos el asistente de instalación igual que en el apartado 2.1


#Ejercicio 4

Descargaremos la imagen de Lubuntu, que cumple los requisitos del enunciado, del siguiente [enlace](cdimage.ubuntu.com/lubuntu/releases/14.04/release/lubuntu-14.04-desktop-i386.iso)

DEspués, crearemos el fichero de disco duro virtual:

	qemu-img create -f qcow2 hdd_lubuntu.qcow2 6000M
    
Instalamos Lubunu:
	qemu-system-x86_64 -hda hdd_lubuntu.qcow2 -cdrom ./Descargas/lubuntu-14.04-desktop-i386.iso -m 512M
    
Con la máquina ya creada y con el SO instalado, necesitaremos descargar un cliente VNC. Ya que los apuntes del temario recomiendan Vinagre, vamos a seguir el ejemplo:

	sudo apt-get install vinagre
    
Una vez instalada la máquina, la apagamos, y la volvemos a encender, ésta vez con una opción de sevidor VNC:

	qemu-system-i386 -hda hdd_lubuntu.qcow2 vnc :1

Con esto, podemos conectarnos con vinagre a nuestra máquina, con la siguiente orden:

	vinagre localhost:5901

El puerto 5901 viene del puerto estandar (5900) +1 por enumerarla con un 1 en nuestro servidor VNC (opción vnc: 1 al arrancar la máquina)

Si quisieramos conectar mediante SSH a nuestra máquina, debemos de modificar las opciones de lanzamiento de la misma, añadiendo un puerto de conexión, y un nombre:

	qemu-system-x86_64 -boot order=c -drive file=hdd_lubuntu.qcow2,if=virtio -m 512M -name usuario -redir tcp:3000::22
    
Lo que decimos con las últimas opciones de la órden, es que exista un usuario llamado "usuario", y que redirija las peticiones tcp que se hagan por el puerto 3000 de la máquina anfitrión, al puerto 22 de la máquina anfitrion (recordemos que el puerto 22 es el utilizado por defecto para las conexiones SSH)

De esta forma, nos conectamos a la máquina mediante la órden:
	
    ssh -p 3000 usuario@localhost