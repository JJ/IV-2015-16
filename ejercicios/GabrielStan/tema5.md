# Tema 4

### Ejercicio 1

**Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.**

Según la [página de instalación de KVM](https://help.ubuntu.com/community/KVM/Installation), para instalar KVM se tienen que seguir los siguientes pasos.

Se puede comprobar si los paquetes están instalados con la orden

	kvm-ok

o

	egrep -c '(vmx|svm)' /proc/cpuinfo

Un valor mayor que 0 indica que la virtualización está soportada.

![kvm](https://www.dropbox.com/s/yg1wdltq1qqztuu/ej1.png?dl=1)

Para instalar los paquetes necesarios en Ubuntu >= 10.04, se puede ejecutar la siguiente orden.

	sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils

A continuación se tiene que añadir el usuario a los grupos `libvirtd` y `kvm` con los siguientes comandos.

	sudo adduser `id -un` libvirtd

y

	sudo adduser `id -un` kvm

Para comprobar que el usuario pertenece a los grupos, se puede ejecutar el comando `groups`. Después de añadir el usuario a los grupos, el usuario se tiene que desconectar y volvera conectar, para hacer efectivo el cambio.

![addgroups](https://www.dropbox.com/s/3cmeku980lutfrw/ej1_addgroups.png?dl=1)

Y por último, se han de reiniciar los módulos del kernel

	rmmod kvm
	modprobe -a kvm


### Ejercicio 2

**Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).**

**Debian**

Vamos a hacer una instalación de Debian con Quemu. Para ello necesitamos crear una imagen de disco virtual.

	qemu-img create -f qcow2 ~/vmachines/ej1/debian.qcow 2G

Y a continuación proceder a la instalación de Debian sobre el disco creado.

	qemu-system-x86_64 -hda ~/vmachines/ej1/debian.qcow -cdrom ~/Downloads/debian-8.2.0-amd64-netinst.iso


![quemu](https://www.dropbox.com/s/m7ktosbcwpppeol/qemu_debian.png?dl=1)

A partir de este punto se puede seguir con la instalación como siempre.

**CoreOS**

Además de Debian, vamos a hacer una instalación de CoreOS, un SO diseñado para la contenerización.

De nuevo, los comandos son muy parecidos:

	qemu-img create -f qcow2 ~/vmachines/ej1/coreos.qcow 4G

para crear el disco y

	qemu-system-x86_64 -hda ~/vmachines/ej1/coreos.qcow -cdrom ~/Downloads/coreos_production_iso_image.iso -m 1G

para proceder a la instalación. Si da un error relacionado con la memoria, se deberá asignar manualmente un tamaño de memoria virtual con el parámetro `-m`.

![qemu_coreos](https://www.dropbox.com/s/wpqzso5vzv0ctmx/qemu_coreos.png?dl=1)

![coreos](https://www.dropbox.com/s/96fjol62ge0i2oh/coreos.png?dl=1)

















