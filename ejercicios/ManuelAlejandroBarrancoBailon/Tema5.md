#Tema 5

##Ejercicios

###Ejercicio 1
**Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.**
Compruebo que mi sistema está preparado para virtualizar a nivel de hardware.
El modelo de mi procesador es el [Intel Core i5 M430 @2.27GHz](http://ark.intel.com/products/43537/Intel-Core-i5-430M-Processor-3M-Cache-2_26-GHz). Lo he consultado con el comando *cat /proc/cpuinfo*, el cual muestra la siguiente información:

![Modelo de procesador](http://i1016.photobucket.com/albums/af281/raperaco/cpuinfo_zpsjbqaxxjk.png)

La salida que aparece al ejecutar la orden egrep '^flags.*(vmx|svm)' /proc/cpuinfo es:
![Orden flags virtualización](http://i1016.photobucket.com/albums/af281/raperaco/salidaFlagsVirtualizacion_zpscl5z8qgh.png)

*Aparece la misma salida repetida cuatro veces, porque es la recogida en cada uno de los "cores"*.
Vemos como efectivamente aparece el flag **vmx**, por lo que indica que mi procesador está preparado para la virtualización hardware.
Otra opción para saber si nuestro procesador soporta virtualización hardware es:
~~~
kvm-ok
~~~

![kvm-ok](http://i1016.photobucket.com/albums/af281/raperaco/kvm-ok_zpsqnlggvxm.png)


Para instalar KVM he seguido las [intrucciones de la página de Ubuntu](https://help.ubuntu.com/community/KVM/Installation) actualizada a día 20-9-2015.

* Instalar los siguientes paquetes:
~~~
sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils
~~~
Una descripción sobre para qué sirve cada paquete se puede encontrar en las [intrucciones de la página de Ubuntu](https://help.ubuntu.com/community/KVM/Installation).

* Como voy a crear máquinas virtuales desde linea de comandos, también hay que instalar **virtinst**.
~~~
sudo apt-get install virtinst
~~~

* Para administrar máquinas virtuales con usuarios normales, hay que añadir estos usuarios a los grupos *kvm* y *libvirt*. En mi caso:
~~~
adduser alex kvm
adduser alex libvirtd
~~~

* Para que el paso anterior tenga efecto, hay que *reloguearse* en el sistema con dicho usuario.

* Verificamos la instalación:
~~~
virsh -c qemu:///system list
~~~

![verificarInstalacion](http://i1016.photobucket.com/albums/af281/raperaco/verificarInstalacion_zpsvva9gbnk.png)

*Si se tienen errores en este paso, en las [intrucciones de la página de Ubuntu](https://help.ubuntu.com/community/KVM/Installation) se recoge como solucionar algunos de los posibles errores.*

* Si queremos tener una interfaz gráfica:
~~~
sudo apt-get install virt-manager
~~~
En las [intrucciones de la página de Ubuntu](https://help.ubuntu.com/community/KVM/Installation) también se recoge cómo usar dicha interfaz.

Tras abrirla, probablemente informe que necesita algunos paquetes adicionales por lo que los descargamos.

![virt-manager](http://i1016.photobucket.com/albums/af281/raperaco/virt-manager_zpssexgtazr.png)

Una vez finalizada la instalación, ya tenemos la interfaz lista para su uso:

![virt-manager1](http://i1016.photobucket.com/albums/af281/raperaco/virt-manager1_zps6o82yntt.png)


###Ejercicio 2
**1. Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar [CoreOS](https://coreos.com/) (que sirve como soporte para Docker), [GALPon Minino](http://minino.galpon.org/en), hecha en Galicia para el mundo, [Damn Small Linux](http://www.damnsmalllinux.org/download.html), [SliTaz](http://www.slitaz.org/en/) (que cabe en 35 megas) y [ttylinux](http://ttylinux.net/) (basado en línea de órdenes solo).**
* **SliTaz**
	* Creo el disco duro:
	~~~
    $ qemu-img create -f qcow2 slitaz.qcow2 8G
    ~~~

	* Creo la máquina virtual con la imagen de SliTaz:
	~~~
    $ qemu-system-x86_64 -hda slitaz.qcow2 -cdrom /home/alex/Escritorio/slitaz-4.0.iso
    ~~~
    ![slitaz_install](http://i1016.photobucket.com/albums/af281/raperaco/slitaz_install_zpse5npnmnb.png)
    ![slitaz_install_finish](http://i1016.photobucket.com/albums/af281/raperaco/coreos_install_finish_zpsjhgdmgxm.png)
    
* **CoreOS**
	* Creo el disco duro:
	~~~
    $ qemu-img create -f qcow2 coreos.qcow2 8G
    ~~~
    
    * Creo la máquina virtual con la imagen de CoreOS e indicarle que tiene una memoria de 1G:
	~~~
    $ qemu-system-x86_64 -hda coreos.qcow2 -cdrom /home/alex/Escritorio/coreos_production_iso_image.iso -m 1G
    ~~~
    ![coreos_install](http://i1016.photobucket.com/albums/af281/raperaco/coreos_install_zps8tfbnfmq.png)
    ![coreos_install_finish](http://i1016.photobucket.com/albums/af281/raperaco/coreos_install_finish_zpsjhgdmgxm.png)
    
**2. Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o
Parallels.**
Usaré VirtualBox e instalaré una imagen de SliTaz:
![slitaz_virtualbox](http://i1016.photobucket.com/albums/af281/raperaco/slitaz_virtualbox_zps0xgjnghz.png)
![slitaz_virtualbox_finish](http://i1016.photobucket.com/albums/af281/raperaco/slitaz_virtualbox_finish_zpslgcyams6.png)


