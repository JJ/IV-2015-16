#Tema 5
###Ejercicio 1: Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.

Volvemos a hacer lo mismo que hicimos en el primer tema, esto es, escribimos **sudo apt-get install cpu-checker** y luego ***sudo apt install qemu-kvm libvirt-bin**. Con esto ya tenemos instalado kvm 3n el equipo.

Podemos comprobar que nuestro sistema esta preparado para ejecutarlo mediante la orden: **kvm-ok**.

![kvm-ok](https://i.gyazo.com/f7dfe9b295be29923e0284acda75f68a.png)

###Ejercicio 2:
####Ejercicio 2.1: Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).

Vamos a crear alguna de las que pone en el enunciado ya que ocupan poco espacio.

**Slitaz**: 

Crear disco duro: **qemu-img create -f qcow2 slitaz.qcow2 2G**.

![DiscoDuro](https://i.gyazo.com/dfc6c5271a9d1febaf383a37d1c66852.png)

Instalar imagen slitaz, es necesario tener una iso del SO que vamos a instalar.Podemos encontrarla [aquí](http://www.slitaz.org/en/get/).
Ahora ejecutamos: **qemu-system-x86_64 -machine accel=kvm -hda slitaz.qcow2 -cdrom slitaz-4.0.iso -m 1G -boot d**.

![slitaz](https://i.gyazo.com/e9110d3cb82baa8e45cfc1d7e831ab48.png)

**Debian**:

Crear disco duro: **qemu-img create -f qcow2 debian.qcow2 10G**.

![DiscoDuro](https://i.gyazo.com/1b0f743853c5e6d9f3d351cdd3217a4d.png)

Instalar imagen debian. Es necesario tener una iso del SO que vamos a instalar. Podemos encontrarla [aquí](http://cdimage.debian.org/debian-cd/8.2.0/amd64/iso-cd/).
Ahora ejecutamos: **qemu-system-x86_64 -machine accel=kvm -hda debian.qcow2 -cdrom debian-8.2.0-amd64-CD-1.iso -m 1G -boot d**.

![debian](https://i.gyazo.com/9fe04a3382a2d9feff460741ab6e70f5.png)

####Ejercicio 2.2: Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.

Voy a utilizar VirtualBox y voy a volver a instalar Slitaz por ser muy poco pesado y porque ya tengo la ISO descargada.

Paso 1: Abrir virtualBox y seleccionar **NUEVA**.

![imagen](https://i.gyazo.com/8286570b17aef69e96d60128d09cebb4.png)

Paso 2: Seleccionar la memoria

![imagen](https://i.gyazo.com/c48d20726ec7e4af025599f826c48b09.png)

Paso 3: Seleccionar el tipo de disco duro

![imagen](https://i.gyazo.com/5f02daa5a39caee8676086859297c4cd.png)

Paso 4: Añadir al controlador la ISO de Slitaz

![imagen](https://i.gyazo.com/4cd28acf03b8c5c198c0af1305454c67.png)

Paso 5: Arrancar e instalar el SO

![imagen](https://i.gyazo.com/39223a82a4c4b6acc964d4eefac4cfae.png)

###Ejercicio 3: Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con (qemu-system-x86_64 -hda /media/Backup/Isos/discovirtual.img).

He creado el siguiente [benchmark](https://github.com/manolotello7/IV-2015-16/blob/master/ejercicios/ManuelGutierrezDelgado/benchmark.cpp) utilizando la información que el sistema operativo almacena dentro del directorio **/proc**.
La función **mem_total ()** devuelve la memoria total usada por el programa en kilobytes. Utiliza la librería **time.h** para medir el tiempo. 

###Ejercicio 4: Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.

Para que el sistema unix tenga entorno gráfico LXDE, he decidido instalar Lubuntu. Podemos descargar la iso de [aquí](http://cdimage.ubuntu.com/lubuntu/releases/14.04/release/).

Crear almacenamiento: **qemu-img create -f qcow2 lubuntu.img 6G**.

Crear la maquina habilitando vnc: **qemu-system-x86_64 -cdrom lubuntu-14.04.3-desktop-amd64.iso -boot d -m 1G -vnc :1 lubuntu.img**.

Para conectar por vnc voy a utilizar vinagre. Podemos instalarlo mediante: **sudo apt-get install vinagre**, **vinagre localhost:5901**.

![imagen](https://i.gyazo.com/be1407b0ea1c9f09f845cb4b4b20776c.png)

![imagen](https://i.gyazo.com/99e4095a10caec43d86b51eb8096af73.png)

Instalamos ssh en la maquina virtual y nos conectamos desde el anfitrión: **sudo apt-get install openssh-server**.

![imagen](https://i.gyazo.com/97b694c1b4d7538c7ea4be163d288ac1.png)

###Ejercicio 7: Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.

Descarga de la imagen de [Linux Mint](http://www.linuxmint.com/download.php)

Crear disco duro: **qemu-img create -f qcow2 mint.qcow2 4G**.

Instalar imagen Linux Mint: **qemu-system-x86_64 -machine accel=kvm -hda mint.qcow2 -cdrom linuxmint-17.3-cinnamon-64bit.iso -m 1G -boot d**

![imagen](https://i.gyazo.com/68d53ab8ed5fc2b11d78df8dd27dc38b.png)
