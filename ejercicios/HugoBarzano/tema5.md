# Tema 5. Uso de sistemas de virtualización. 

##Ejercicio 1: Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización
Podemos comprobar que nuestro sistema esta preparado para ejecutarlo mediante la orden

	kvm-ok

![imagen](https://www.dropbox.com/s/slhca4tlofunqpj/kvm.png?dl=1)

Es posible comprobarlo en procesadores Intel mediante la orden 

	grep --color vmx /proc/cpuinfo

Para instalar los paquetes necesarios, podemos hacerlo mediante la orden

	sudo apt-get install qemu-kvm libvirt-bin virtinst kvm virt-viewer

Una vez intalados, es necesario indicar el usuario que queremos que utilize la virtualizacion

	sudo adduser nombre_usuario kvm

Es recomendable cargar el modulo, en mi caso, para un procesador intel, puede realizarse mediante la instrución

	sudo modprobe kvm-intel

##Ejercicio 2.1: Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).

Slitaz: 

Crear disco duro

	qemu-img create -f qcow2 slitaz.qcow2 2G

![imagen](https://www.dropbox.com/s/26fimpmrx361dvu/slitazD.png?dl=1)

Instalar imagen slitaz. Es necesario tener una iso del SO que vamos a instalar. Podemos encontrarla [aquí](http://www.slitaz.org/en/)

	qemu-system-x86_64 -machine accel=kvm -hda slitaz.qcow2 -cdrom slitaz-4.0.iso -m 1G -boot d

![imagen](https://www.dropbox.com/s/o4yg7s3fuyicx7d/slitazI.png?dl=1)


Debian:

Crear disco duro
	
	qemu-img create -f qcow2 debian.qcow2 10G

![imagen](https://www.dropbox.com/s/jlbq07lmtkd585x/discoD.png?dl=1)

Instalar imagen debian. Es necesario tener una iso del SO que vamos a instalar.

	qemu-system-x86_64 -machine accel=kvm -hda debian.qcow2 -cdrom debian-8.2.0-amd64-CD-1.iso -m 1G -boot d

![imagen](https://www.dropbox.com/s/cmsfrzeobpis9je/debianI.png?dl=1)

	





##Ejercicio 2.2: Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.

Voy a utilizar VirtualBox y voy a volver a instalar Slitaz por ser muy liviano (y por que ya tengo la ISO)

Paso 1: Abrir virtualBox y selecionar NUEVA

![imagen](https://www.dropbox.com/s/vtgbp7se5cvpsfj/vb1.png?dl=1)

Paso 2: Selecionar la memoria

![imagen](https://www.dropbox.com/s/say4jyw3dsdzlaq/vb2.png?dl=1)

Paso 3: Seleccionar el tipo de disco duro

![imagen](https://www.dropbox.com/s/gf0yegwzngj9w5l/vb3.png?dl=1)

Paso 4: Añadir al controlador la ISO de Slitaz

![imagen](https://www.dropbox.com/s/2p8ig9et9zr11wx/vb4.png?dl=1)

Paso 5: Arrancar e instalar el SO

![imagen](https://www.dropbox.com/s/jhtoguiq01173xf/vb5.png?dl=1)

##Ejercicio 3: Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con

He creado el siguiente [benchmark](https://github.com/hugobarzano/IV-2015-16/blob/master/ejercicios/HugoBarzano/bm2.cpp) utilizando la información que el sistema operativo almacena dentro del directorio /proc**
La funcion mem_total () devuelve la memoria total usada por el programa (memoria de datos + memoria de pila) en kilobytes. Utiliza la libreria time.h para medir el tiempo. 

##Ejercicio 4: Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.

Para que el sistema unix tenga entorno grafico LXDE, he decidido intalar Lubuntu. Podemos descargar la iso de [aqui](http://cdimage.ubuntu.com/lubuntu/releases/14.04/release/)

Crear disco duro
	
	qemu-img create -f qcow2 lubuntu.img 6G

Instalar imagen lubuntu

	qemu-system-x86_64 -hda lubuntu.img -cdrom lubuntu-14.04.3-desktop-amd64.iso -m 1G

Arrancar la máquina

	qemu-system-i386 -hda lubuntu.img vnc :1



##Ejercicio 5: Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.
----

##Ejercicio 6: Usar juju para hacer el ejercicio anterior.

---

##Ejercicio 7: Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.

Descarga de la imagen de [Linux Mint](http://www.linuxmint.com/download.php)

Crear disco duro
	
	qemu-img create -f qcow2 mint.qcow2 6G

Instalar imagen Linux Mint

	qemu-system-x86_64 -machine accel=kvm -hda mint.qcow2 -cdrom linuxmint-17.3-cinnamon-64bit.iso -m 1G -boot d

![imagen](https://www.dropbox.com/s/x6qtgb9329uuf4z/mint.png?dl=1)



