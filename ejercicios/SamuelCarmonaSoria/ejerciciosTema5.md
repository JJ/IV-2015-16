# Tema 5
## Ejercicio 1
**Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.**

Siguiendo la [página oficial de instalación de KVM en Debian](https://www.howtoforge.com/virtualization-with-kvm-on-a-debian-squeeze-server), vamos a seguir los siguientes pasos para instalar KVM en nuestra máquina:

Se puede comprobar si los paquetes están instalados con la orden
```
	egrep '(vmx|svm)' --color=always /proc/cpuinfo
```
o
```
	egrep -c '(vmx|svm)' /proc/cpuinfo
```

Para la segunda opción, un valor mayor que 0 indica que la virtualización está soportada por la CPU.

![KVM](http://i.cubeupload.com/AVEBQg.jpg)

Para instalar los paquetes necesarios en Debian, se puede ejecutar la siguiente orden.
```
     sudo apt-get install kvm qemu-kvm libvirt-bin virtinst
```


A continuación, añadimos el usuario a los grupos `libvirtd` y `kvm` con los siguientes comandos.
```
	sudo adduser `id -un` libvirtd
	sudo adduser `id -un` kvm
```

Reiniciamos los módulos de KVM:
```
	rmmod kvm
	modprobe -a kvm
```

Comprobamos que la siguiente línea no nos muestra ningún error:
```
virsh -c qemu:///system list
```


## Ejercicio 2.1
**Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).**

**SLiTaz**

Vamos a hacer una instalación de SLiTaz con Quemu. Para ello crearemos una imagen de disco virtual:
```
samu@samu: ~
 > qemu-img create -f qcow2 slitaz.qcow2 2G
            Formatting 'slitaz.qcow2', fmt=qcow2 size=2147483648 encryption=off cluster_size=65536 lazy_refcounts=off
```

A continuación, descargaremos la ISO de ésta distribución, descargándola de [aquí](http://www.slitaz.org/en/).
Y ejecutamos la siguiente línea para la instalación:
```
qemu-system-x86_64 -machine accel=kvm -hda slitaz.qcow2 -cdrom slitaz-5.0-rc3.iso -m 1G -boot d                                        (19:23)

```
Y aquí podremos observar a la máquina virtual corriendo:
![SLiTaz](http://i.cubeupload.com/20iGAN.jpg)


**Debian**

Con Debian, vamos a seguir el mismo proceso.

Descargamos de [aquí](https://www.debian.org/index.es.html) la ISO de Debian.

```
 qemu-img create -f qcow2 ~/vmachines/ej1/debian.qcow 2G
 qemu-system-x86_64 -machine accel=kvm -hda debian.qcow2 -cdrom debian-8.3.0-amd64-CD-1.iso -m 1G -boot d
```

![Debian](http://i.cubeupload.com/4pPFg8.jpg)


## Ejercicio 2.2
**Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.**

Vamos vamos a instalar uno de los instalados previamente en KVM,  **SLliTaz**, que es muy ligero, en una máquina virtual usando **VirtualBox**.
Detallaré con imágenes el proceso:
![SLiTaz VirtualBox](http://i.cubeupload.com/vOn4xQ.jpg)
![SLiTaz VirtualBox](http://i.cubeupload.com/GF20TA.jpg)
![SLiTaz VirtualBox](http://i.cubeupload.com/Uo1lWs.jpg)
![SLiTaz VirtualBox](http://i.cubeupload.com/tcjfWi.jpg)
![SLiTaz VirtualBox](http://i.cubeupload.com/n5Ixrx.jpg)

## Ejercicio 3
**Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual **

El benchmark que he creado consiste en una serie de operaciones logarítimcas:
```
import math
d = {}
for i in range(1, 9999999):
        d[i] = math.log(i)
```

He alojado el algoritmo en la máquina de Debian y he hecho las pruebas.
He ejecutado el algoritmo primero con el modo normal:
```
qemu-system-x86_64 -hda slitaz.qcow2
```
Y luego usando la paravirtualización indicandole la opción "virtio":
```
 emu-system-x86_64 -boot order=c -drive file=disco.qcow2,if=virtio
```

En cada uno he realizado lo siguiente, utilizando la librería "time" de python:
```
import time
start_time = time.time()
python benchmark.py
print("--- %s seconds ---" % (time.time() - start_time))
```

He obtenido tiempos parecidos, aunque algo mejores en la opción de arrancar normalmente la máquina virtual.


## Ejercicio 4
**Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.**

Para que el sistema unix tenga entorno gráfico LXDE, vamos a instalar la distrubución Lubuntu. Hemos descargado la ISO de [aquí](http://cdimage.ubuntu.com/lubuntu/releases/14.04/release/).

Primero creamos el disco virtual: qemu-img create -f qcow2 lubuntu.qcow2 5G
E instlaremos la iso con:
```
qemu-system-x86_64 -hda lubuntu.qcow2 -cdrom ./lubuntu-14.04.3-desktop-i386.iso -m 512M
```

Ahora vamos a configurar el acceso VNC, vamos a instalar "vinagre":
```
sudo apt-get install vinagre
```

Para acceder utilizamos la siguiente línea:
```
vinagre localhost:1
```

Ahora instalamos y configuramos SSH:
```
sudo apt-get install ssh
```

Arrancamos la máquina lubuntu con puerto 2150:
```
qemu-system-x86_64 -hda lubuntu.qcow2 -m 512M -redir tcp:2150::22
```
*Nota*: el 22 del final es el puerto por defecto de SSH.

Ahora podremos acceder por ssh a la máquina con:
```
ssh samu@localhost -p 2121
```

![Lubuntu - SSH](http://i.cubeupload.com/i8IxJG.jpg)


## Ejercicio 5
**Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.**

Vamos a utilizar Azure, para ello vamos a instalar el cliente y las dependencias necesarias en nuestra máquina con los siguientes comandos:
```
    sudo apt-get install nodejs-legacy
    sudo apt-get install npm
    sudo npm install -g azure-cli
```


Tras instalar todos los paquetes, vamos a autenticarnos con la cuenta Azure, con el comando `azure login` y seguimos las instrucciones que aparecen.
![login](http://i.cubeupload.com/qMCJLH.jpg)


Con el comando
 ```azure vm image list```
podemos listar todas las imágenes disponibles en azure para crear una máquina virtual.
Con
 ```azure vm image show b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04_3-LTS-amd64-server-20160119-en-us-30GB```
podemos ver más información sobre la imagen respectiva.

![vm image show](http://i.cubeupload.com/AXc2Fd.jpg)


A continuación, ahora que tenemos información detallada de la imagen, procedemos a crear una máquina virtual en nuestra cuenta azure a partir de dicha imagen, con el comando siguiente:
```azure vm create iv-ej5-ubuntuserver b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04_3-LTS-amd64-server-20160119-en-us-30GB samu --location "North Europe" --ssh ```

![create](http://i.cubeupload.com/mDmVRT.jpg)

Una vez tenemos la confirmación de que la máquina se ha creado correctamente, probamos a ver si la conexión a través de ssh funciona, con el comando:
```
 ssh samu@iv-ej5-ubuntuserver.cloudapp.net
```

![ssh](http://i.cubeupload.com/Sn6VW0.jpg)


Ahora, vamos a instalar el servicio *nginx* en la máquina virtual con
```sudo apt-get install nginx```
Y comprobamos que se ha instalado y está funcionando correctamente.

![curl](http://i.cubeupload.com/ZvJIDk.jpg)

Vamos a abrir el puerto 80, para que se pueda realizar conexión desde el exterior:
```
	azure vm endpoint create iv-ej5-ubuntuserver 80 80
```

Para comprobar que está funcionando en su página web, accedemos a la máquina a través de un navegador.

![nginx working](http://i.cubeupload.com/qLLD98.jpg)

Una vez finalizado el uso de la máquina, vamos a apagarla para ahorrar recursos.
```
	azure vm shutdown iv-ej5-ubuntuserver
```
