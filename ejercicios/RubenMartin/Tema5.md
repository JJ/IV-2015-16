# Ejercicios de Rubén Martín Hidalgo
## Tema 5
### Ejercicio 1: Instalar los paquetes necesarios para usar KVM. Ya lo hicimos en el primer tema, pero vamos a volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.

1. Primero instalamos el paquete kvm-ok con el comando: `sudo apt-get install cpu-checker`

2. Ejecutamos `sudo kvm-ok` ó `egrep -c '(vmx|svm)' /proc/cpuinfo` para averiguar si está instalado el módulo.

![Comprobación módulo kvm](https://www.dropbox.com/s/7snrxi4sweozfkg/kvm-ok.PNG?dl=1)

![Comprobación en /proc/cpuinfo](https://www.dropbox.com/s/igxc4zryo1uezn3/Comprobar%20KVM.PNG?dl=1)

Como podemos ver nos sale 0, lo cual significa que nuestra CPU no soporta virtuación de KVM.

### Ejercicio 2.1: Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS, GALPon Minino, Damn Small Linux, SliTaz y ttylinux.

Comenzamos activando KVM con: `sudo modprobe kvm-intel`

Primero vamos a crear una máquina virtual con [SliTaz](http://www.slitaz.org/en/):

- Descargamos una imagen estable de la [página web oficial](http://www.slitaz.org/en/get/#stable).

- Creamos un disco duro virtual en formato QCOW2: `qemu-img create -f qcow2 fichero-cow.qcow2 200M` 

![Creacion del fichero QCOW2](https://www.dropbox.com/s/b0mmrhvlc9cikus/ficheroQcow2.PNG?dl=1)

- Instalamos el sistema con el fichero de almacenamiento virtual creado y la ISO descargada, usando KVM mediante: `qemu-system-x86_64 -hda fichero-cow.qcow2 -cdrom slitaz-4.0.iso`

![Instalando Slitaz](https://www.dropbox.com/s/rehtkqqnj5145eq/InstalandoSlitaz.PNG?dl=1)

- Una vez instalado, esta se ejecuta automáticamente. En caso de necesitar iniciarlo en cualquier otro momento, deberemos hacer `qemu-system-x86_64 -hda fichero-cow.qcow2`. En mi caso al ser una versión "Live", no podremos arrancarlo ya que no se instala. 

![Slitaz funcionando](https://www.dropbox.com/s/jmo0zfe3b7minn4/Slitaz_funcionando.PNG?dl=1)

Del resto de opciones que tenemos, CoreOs se instala sobre contenedor DOcker o en una máquina virtual de Amazon EC2. TtyLinux ya no ofrece soporte. Me he decantado por probar [GALPon Minino](http://minino.galpon.org/en):

- Descargamos la imagen de la [página web oficial](http://minino.galpon.org/es/descargas), en mi caso la versión "Ártabros 2.1 minimal".

![Descargar versión Artabros](https://www.dropbox.com/s/6grj8n4bijtcc32/MVGalpon.PNG?dl=1)

- En este caso necesitamos crear un fichero de almacenamiento más grande: `qemu-img create -f qcow2 fichero-cow2.qcow2 1G`

- Ahora instalamos el sistema operativo en la máquina virtual: `qemu-system-x86_64 -hda fichero-cow2.qcow2 -cdrom minino-artabros-2.1_minimal.iso`

![Instalando Artabros](https://www.dropbox.com/s/ic9j647ji53ec1b/ArtabrosInstalando.PNG?dl=1)

Este es el sistema de Artabros funcionando:

![Artabros funcionando](https://www.dropbox.com/s/b5vmmdwyfmacmqg/minino%20Funcionando.PNG?dl=1)

### Ejercicio 2.2: Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.

Yo suelo utilizar [VirtualBox](https://www.virtualbox.org/) como hipervisor. Para ello debes seguir los siguientes pasos:

1. Descargamos el programa de su [web oficial](https://www.virtualbox.org/wiki/Downloads).

2. También podemos instalarlo directamente sobre Linux con el comando: `sudo apt-get install virtualbox-5.0 dkms`

3. Abrimos el programa, y esta es la pantalla principal que nos encontramos:

![Pantalla inicio VirtualBox](https://www.dropbox.com/s/2yflzouol1w2jyu/Virtualbox-Interfaz.PNG?dl=1)

4. Para crear una máquina virtual, damos en "Nueva" y luego configuraremos algunos parámetros como los siguientes:

- Memoria RAM:

![Memoria RAM en VirtualBox](https://www.dropbox.com/s/2gv6oi81acmimjj/virtualBox-Memoria.PNG?dl=1)

- Procesadores:

![Procesadores en VirtualBox](https://www.dropbox.com/s/mhv70fceopzdgtp/Virtualbox-Procesadores.PNG?dl=1)

- Almacenamiento: 

![Almacenamiento en VirtualBox](https://www.dropbox.com/s/dye92zi95lm7psc/Virtualbox-Discoduro.PNG?dl=1)

Y esta es mi máquina de Ubuntu Server funcionando:

![VirtualBox funcionando con Ubuntu Server](https://www.dropbox.com/s/rsfn7v96lzosfbj/virtualBox_Funcionando.PNG?dl=1)
