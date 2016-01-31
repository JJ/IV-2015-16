#Tema 5
###Ejercicio1: Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.

Como ya hicimos en los ejercicios del tema1 volvemos a comprobar con la orden **kvm-ok**:

![Ejercicio1](https://www.dropbox.com/s/do7gi1jo9z0p9nx/Ejercicio1.png?dl=1)


###Ejercicio2:
####2.1 Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).

Distribuciones que voy a utilizar para este ejercicio: **SliTaz** y **Damn Small Linux**.

En primer lugar creamos las particiones virtuales para las máquinas:

![Ejercicio2.1](https://www.dropbox.com/s/983n8a5ny5ajz3t/Ejercicio2.1.png?dl=1)

Para la instalación de SliTaz utilizamos la orden : **qemu-system-x86_64 -hda SliTaz.qcow2 -cdrom slitaz-4.0.iso &**

![Ejercicio2.2](https://www.dropbox.com/s/esotz8x3wqsb20c/Ejercicio2.2.png?dl=1)

Para la instalación de Damn Small Linux utilizamos la orden: **qemu-system-x86_64 -hda dsl.qcow2 -cdrom damnsmall-0.4.10.iso &**

![Ejercicio2.3](https://www.dropbox.com/s/67crrv62y1xd6m0/Ejercicio2.3.png?dl=1)


####2.2 Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.

Utilizo el hipervisor VirtualBox.

Para SliTaz:

![Ejercicio2.4](https://www.dropbox.com/s/0o9bvlcaala37sw/Ejercicio2.4.png?dl=1)

![Ejercicio2.5](https://www.dropbox.com/s/htq939bk7i9v1rc/Ejercicio2.5.png?dl=1)

Para Damn Small Linux:

![Ejercicio2.6](https://www.dropbox.com/s/ay16wi2x2ep15um/Ejercicio2.6.png?dl=1)

![Ejercicio2.7](https://www.dropbox.com/s/bkk6k83aofa18pz/Ejercicio2.7.png?dl=1)


###Ejercicio4: Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.

La distribución que voy a utilizar para realizar este ejercicio es **lubuntu**.

Creamos partición virtual: **qemu-img create -f qcow2 LUbuntu.qcow2 8096M**.

Lanzamos la máquina virtual para la instalación de lubuntu: **qemu-system-x86_64 -hda LUbuntu.qcow2 -cdrom lubuntu-15.10-desktop-amd64.iso -m 512M**

![Ejercicio4](https://www.dropbox.com/s/f5g2c4zcmcrad1c/Ejercicio4.1.png?dl=1)

Para utilizar **vinagre**, primero los instalamos con la orden: **apt-get install vinagre**, y para acceder usamos **vinagre ip_maquina** .


###Ejercicio5: Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.

Para utilizar azure-cli lo que hago es lanzar un contenedor de docker donde ya viene instalado todo: 

Hacemos login en azure:

![Ejercicio5.1](https://www.dropbox.com/s/zpbohcqwmkgwdju/Ejercicio5.1.png?dl=1)

Creamos la máquina virtual con la orden:  **azure vm create maquinangix b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu_DAILY_BUILD-trusty-14_04_3-LTS-amd64-server-20151119-en-us-30GB alvaro clave --location "West Europe" --ssh**

Vemos que se ha creado la máquina y ya podemos acceder a ella por ssh e instalar ngix:

![Ejercicio5.2](https://www.dropbox.com/s/mw9nhs4q3cdm78d/Ejercicio5.2.png?dl=1)

![Ejercicio5.3](https://www.dropbox.com/s/2xw371rjwnditrm/Ejercicio5.3.png?dl=1)


###Ejercicio7: Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.

Primero descargamos la imagen de Linux Mint. Voy a utilizar el hipervisor VirtualBox que el que tengo instalado.

Creación de la máquina virtual:

![Ejercicio7.1](https://www.dropbox.com/s/m01gr7j43vx7jth/Ejercicio7.1.png?dl=1)

Máquina virtual corriendo con **Linux Mint**:

![Ejercicio7.2](https://www.dropbox.com/s/now2kl2ftl07wxs/Ejercicio7.2.png?dl=1)







