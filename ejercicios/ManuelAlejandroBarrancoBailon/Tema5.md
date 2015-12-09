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

1. Instalar los siguientes paquetes:
~~~
sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils
~~~
Una descripción sobre para qué sirve cada paquete se puede encontrar en las [intrucciones de la página de Ubuntu](https://help.ubuntu.com/community/KVM/Installation).
2. Como voy a crear máquinas virtuales desde linea de comandos, también hay que instalar **virtinst**.
~~~
sudo apt-get install virtinst
~~~
3. Para administrar máquinas virtuales con usuarios normales, hay que añadir estos usuarios a los grupos *kvm* y *libvirt*. En mi caso:
~~~
adduser alex kvm
adduser alex libvirtd
~~~
4. Para que el paso anterior tenga efecto, hay que *reloguearse* en el sistema con dicho usuario.
5. Verificamos la instalación:
~~~
virsh -c qemu:///system list
~~~

![verificarInstalacion](http://i1016.photobucket.com/albums/af281/raperaco/verificarInstalacion_zpsvva9gbnk.png)

*Si se tienen errores en este paso, en las [intrucciones de la página de Ubuntu](https://help.ubuntu.com/community/KVM/Installation) se recoge como solucionar algunos de los posibles errores.*
6. Si queremos tener una interfaz gráfica:
~~~
sudo apt-get install virt-manager
~~~
En las [intrucciones de la página de Ubuntu](https://help.ubuntu.com/community/KVM/Installation) también se recoge cómo usar dicha interfaz.

Tras abrirla, probablemente informe que necesita algunos paquetes adicionales por lo que los descargamos.

![virt-manager](http://i1016.photobucket.com/albums/af281/raperaco/virt-manager_zpssexgtazr.png)

Una vez finalizada la instalación, ya tenemos la interfaz lista para su uso:

![virt-manager1](http://i1016.photobucket.com/albums/af281/raperaco/virt-manager1_zps6o82yntt.png)
