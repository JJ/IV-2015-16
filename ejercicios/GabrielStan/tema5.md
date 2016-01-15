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






















