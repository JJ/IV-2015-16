#Ejercicios Tema 5

##Ejercicio 1

###Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.

Lo primero que debemos hacer es comprobar que nuestro sistema puede usar kvm, para ello usamos `kvm-ok`

![kvm](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%205/kvm_zpsf3e3fqez.png)

Una vez que sabemos que podemos usar kvm lo instalamos `sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils`

##Ejercicio 2

###Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).

* **SliTaz**

Comenzamos creando una unidad de disco `qemu-img create -f qcow2 slitaz.qcow2 2G`

![ejercicio2-1](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%205/ejercicio2-1_zps1svufj3y.png)

Ahora que ya tenemos el disco, creamos la máquina virtual `qemu-system-x86_64 -hda slitaz.qcow2 -cdrom slitaz-4.0.iso`

![ejercicio2-2](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%205/ejercicio2-2_zpsco3mlvqy.png)



* **GALPon Minino**

He usado la iso Ártabros 2.1, concretamente la versión minimal, que se encuentra [en](http://minino.galpon.org/en/descargas)

Para instalar la maquina:

* `qemu-img create -f qcow2 artabros.qcow2 10G`

* `qemu-system-x86_64 -hda artabros.qcow2 -cdrom minino-artabros-2.1_minimal.iso`

![ejercicio2-3](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%205/ejercicio2-3_zpsr2hn777x.png)


##Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels

En mi caso tengo instalado vmware, lo voy a usar para instalar slitaz ya que es liviano.

Comenzamos seleccionando la iso a instalar

![ejercicio2-4](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%205/ejercicio2-4_zpsd1khvx2x.png)

Una vez elegida la instalación resulta muy simple, básicamente darle a siguiente siguiente y editar algunas prestaciones de la máquina si se quiere. 

![ejercicio2-5](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%205/ejercicio2-5_zpslaijc2lt.png)


##Ejercicio 4

###Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh

He elegido lubuntu ya que viene con LXDE instalado de serie.

Para crear la máquina seguimos los pasos de los ejercicios anteriores

* `qemu-img create -f qcow2 lubuntu.qcow2 10G`s

* `qemu-system-x86_64 -machine accel=kvm -hda lubuntu.qcow2 -cdrom lubuntu.iso -m 1G -boot d`


Tenemos que descargar una herramienta para controlar el escritorio de la maquina recién creada de manera remota, en mi caso he elegido [vinagre](https://help.gnome.org/users/vinagre/stable/introduction.html.es), su instalación consiste en `sudo apt-get install vinagre`


Ahora arrancamos la máquina y ejecutamos vinagre:


* `qemu-system-x86_64 -machine accel=kvm -hda lubuntu.qcow2 -m 512M -vnc :1`

Con -m 512M le indicamos la memoria RAM a usar.

* `vinagre localhost:1`

![ejercicio4](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%205/ejercicio4_zpsun376xdd.png)


Instalamos en la máquina virtual ssh `sudo apt-get install ssh`

Una vez que tenemos ssh en la máquina virtual, la arrancamos de la siguiente manera:

* `qemu-system-x86_64 -machine accel=kvm -hda lubuntu.qcow2 -m 512M -redir tcp:8526::22`

Con -redir le indicamos que el puerto 8526 de la maquina anfitriona corresponde al 22 de la virtual

Para conectarnos usamos `ssh alex@localhost -p 8526`

![ejercicio4-2](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%205/ejercicio4-2_zpsemelazpl.png)



##Ejercicio 7 
###Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.

Como se ha mencionado anteriormente tengo instalado VMware como hypervisor por lo que voy a proceder a realizar la instalación de Linux Mint con el.

Para obtener la iso de Linux Mint he acudido a su [página web](http://www.linuxmint.com/download.php)

Lanzamos VMware y seleccionamos la iso de Linux Mint previamente descargada

![ejercicio7](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%205/ejercicio7_zpsuc3sple0.png)

Una vez seleccionada el proceso es muy sencillo, simplemente tenemos que seguir la interfaz.

![ejercicio7-2](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%205/ejercicio7-2_zpshv2qoyg5.png)


















