#Ejercicios tema 5


##Ejercicio 1
###Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.
En primer lugar instalo KVM con el comando `sudo apt-get install cpu-checker` y después lo compruebo de las dos formas posibles:

* `sudo kvm-ok`
* `egrep -c '(vmx|svm)' /proc/cpuinfo`

y obtenemos los siguientes resultados:
![KVM](1.1)



##Ejercicio 2
###1.- Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).
modprobe: ERROR: could not insert 'kvm_intel': Operation not supported
me da este error tanto en mac como en ubuntu

###2.- Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.
He usado parallels para instalar Slitaz-4.0 que previamente me he descargado del [Sitio oficial de Slitaz](http://www.slitaz.org/en/)

En primer lugar le he dado la configuracion de tamaño de disco y de número de procesadores que se puede ver en la imagen

![Slitaz con parallels](2.2.1)

Y aqui tenemos la máquina de Slitaz arrancada

![Slitaz con parallels](2.2.2)






