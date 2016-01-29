# Tema 5

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


### Ejercicio 2.1

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


### Ejercicio 2.2

**Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.**

Para este ejercicio vamos a instalar **slitaz** en una máquina virtual usando **VirtualBox**. Las siguientes imágenes muestran el proceso.

![vb](https://www.dropbox.com/s/ayhbulx5u7dw8zx/vb_1.png?dl=1)

![vb](https://www.dropbox.com/s/2mq4d8f9wu7bp3x/vb_2.png?dl=1)

![vb](https://www.dropbox.com/s/7ubgmsz5s4x6ls0/vb_3.png?dl=1)

![vb](https://www.dropbox.com/s/bnt57v9aqm8b4d4/vb_4.png?dl=1)

![vb](https://www.dropbox.com/s/46vmwo0g3fa9g6k/vb_5.png?dl=1)


### Ejercicio 4

**Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.**

Para este ejercicio vamos a instalar `lubuntu`, una distribución de ubuntu que viene con LXDE preinstalado como gestor de ventanas por defecto.

Igual que en el ejercicio anterior, creamos un disco duro para instalar ubuntu.

	qemu-img create -f qcow2 lubuntu.img 4G

Y a continuación se instala lubuntu con el comando

	qemu-system-x86_64 -hda ~/vmachines/ej4/lubuntu.img -cdrom ~/Downloads/lubuntu-14.04.3-desktop-amd64.iso -boot d -vnc :1 -m 512M

y nos podemos conectar a la máquina con vinagre

	vinagre localhost:5901

Para instalar vinagre se puede ejecutar el comando

	sudo apt-get install vinagre

![vinagre](https://www.dropbox.com/s/cem3duh553wj3ae/vinagre.png?dl=1)

### Ejercicio 5

**Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.**

Empezamos instalando [**Azure CLI**](https://github.com/Azure/azure-xplat-cli) en nuestra máquina con los siguientes comandos (válidos para Ubuntu 14.04):

	sudo apt-get install nodejs-legacy
    sudo apt-get install npm
    sudo npm install -g azure-cli

Una vez instalados todos los paquetes, procedemos a autenticarnos con la cuenta Azure, con el comando `azure login` y seguimos las instrucciones que aparecen.

![login](https://www.dropbox.com/s/muhx4v0up6bnn24/azure_login.png?dl=1)

Con el comando `azure vm image list` podemos listar todas las imágenes disponibles en azure para crear una máquina virtual. Con el comando `azure vm image show azure vm image show b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04_3-LTS-amd64-server-20160119-en-us-30GB` podemos ver más información sobre la imagen respectiva.

![list](https://www.dropbox.com/s/4lwv865b13j5fcq/show.png?dl=1)

A continuación, ya que tenemos más detalles sobre la imagen, procedemos a crear una máquina virtual en nuestra cuenta azure a partir de dicha imagen, con el comando `azure vm create`.

![create](https://www.dropbox.com/s/dpi6wdcrba3xbo1/create.png?dl=1)

Una vez tenemos la confirmación de que la máquina se ha creado correctamente, probamos a ver si la conexión a través de ssh funciona.

![ssh](https://www.dropbox.com/s/klgh630cduf9ioh/ssh.png?dl=1)

A continuación instalamos el servicio `nginx` en la máquina virtual con `sudo apt-get install nxginx` y comprobamos que funciona correctamente.

![curl](https://www.dropbox.com/s/yjbqnijggt8el68/curl.png?dl=1)

Para permitir la conexión desde el exterior, se tiene que abrir el puerto 80, con el siguiente comando

	azure vm endpoint create iv-t5-ej5 80 80

![endpoint](https://www.dropbox.com/s/nisyl76lw8ojix3/endpoint.png?dl=1)

Para ver que realmente funciona, accedemos a la máquina a través de un navegador.

![nginx](https://www.dropbox.com/s/t1joebsg2l884r5/nginx.png?dl=1)

Ya que hemos acabado con el ejercicio, procedemos a apagar la máquina para ahorrar recursos.

	azure vm shutdown iv-t5-ej5

![shutdown](https://www.dropbox.com/s/iuyp4jve2g2aorl/shutdown.png?dl=1)

