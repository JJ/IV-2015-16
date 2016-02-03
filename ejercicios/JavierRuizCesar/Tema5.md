# Tema 5. Uso de sistemas de virtualización. 

##Ejercicio 1: Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización
Comprobamos que nuestro sistema esta preparado para ejecutarlo mediante la orden

	kvm-ok

![imagen](http://i64.tinypic.com/2aadjcp.png)

Para instalar los paquetes:

	sudo apt-get install qemu-kvm libvirt-bin virtinst kvm virt-viewer

Indicamos el usuario que queremos que utilice la virtualización

	sudo adduser nombre_usuario kvm

Es recomendable cargar el modulo:

	sudo modprobe kvm-intel

##Ejercicio 2.1: Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).

Slitaz: 

Crear disco duro

	qemu-img create -f qcow2 slitaz.qcow2 2G

![imagen](http://i65.tinypic.com/25rmbv5.png)

Instalar imagen slitaz. Es necesario tener una iso del SO que vamos a instalar. Podemos encontrarla [aquí](http://www.slitaz.org/en/)

	qemu-system-x86_64 -machine accel=kvm -hda slitaz.qcow2 -cdrom slitaz-4.0.iso -m 1G -boot d

![imagen](http://i68.tinypic.com/10fdqm8.png)


*CoreOS:*

- Creamos el disco duro necesario:
```
$ qemu-img create -f qcow2 coreos.qcow2 10G
```

![discocoreos](http://i67.tinypic.com/28k3ml0.png)

- Iinstalamos una imagen [CoreOS](https://coreos.com/os/docs/latest/booting-with-iso.html) estable:
```
$ qemu-system-x86_64 -machine accel=kvm -hda coreos.qcow2 -cdrom coreos_production_iso_image.iso -m 1G -boot d
```

![instalacioncoreos](http://i68.tinypic.com/2jdklk5.png)



##Ejercicio 2.2: Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.

Voy a utilizar VirtualBox y voy a volver a instalar Slitaz por ser muy liviano (y por que ya tengo la ISO)

Paso 1: Abrir virtualBox y seleccionar NUEVA

![imagen](http://i64.tinypic.com/2w39ou9.png)

Paso 2: Seleccionar la memoria y el tipo de disco duro

![imagen](http://i67.tinypic.com/148jk92.png)

Paso 3: Añadimos al controlador la ISO de Slitaz

![imagen](http://i66.tinypic.com/v8dczq.png)

Paso 4: Arrancamos e instalamos

![imagen](http://i65.tinypic.com/28ajg53.png)


##Ejercicio 4: Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.

Para que el sistema unix tenga entorno gráfico LXDE, instalamos [Lubuntu](http://cdimage.ubuntu.com/lubuntu/releases/14.04/release/)

Creamos el almacenamiento
	
	qemu-img create -f qcow2 lubuntu.img 6G

Creamos la maquina habilitando vnc

	qemu-system-x86_64 -cdrom lubuntu-14.04.3-desktop-amd64.iso -boot d -m 1G -vnc :1 lubuntu.img


Para conectar por vnc instalamos vinagre: 

	sudo apt-get install vinagre

	vinagre localhost:5901

![imagen](http://i64.tinypic.com/2uyrcye.png)

Para conectar por ssh instalamos la imagen en VirtualBox creando una red solo-anfitrión para tener conexión con mi host

![imagen](http://i65.tinypic.com/330dbap.png)

Indicamos en la configuración de red de la imagen que se conecte a dicha red por alguno de los adaptadores disponibles

![imagen](http://i64.tinypic.com/afj0vt.png)

Instalamos ssh en la maquina virtual y nos conectamos desde el anfitrión 

	sudo apt-get install openssh-server

![imagen](http://i63.tinypic.com/e04d5c.png)



##Ejercicio 5: Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.

Podemos seguir los pasos para [crear una máquina virtual en Amazon](https://github.com/javiexfiliana7/submodulo-javi/blob/master/ec2.md)).

Para tener nginx, deberemos conectarnos a la máquina por ssh. Para poder conectarnos por ssh hay que tener atención con el último apartado de nuestro archivo. En ese apartado también podremos dar a nuestra máquina la capacidad de etender peticiones por http( tcp  puerto 80).

- Para instalar nginx bastará con realizar dentro de nuestra máquina en Amazon:
```
sudo apt-get update
sudo apt-get install nginx
```

- Posteriormente se arranca nginx, por defecto se abre por el puerto 80, abrimos nuestro servidor de ec2 y podemos ver que ya atiende peticiones http:
``` 
sudo service nginx start

```

![imagen](http://i63.tinypic.com/2017oh.png)

##Ejercicio 7: Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.

Descarga de la imagen de [Linux Mint](http://www.linuxmint.com/download.php)

Crear disco duro
	
	qemu-img create -f qcow2 mint.qcow2 6G

Instalar imagen Linux Mint

	qemu-system-x86_64 -machine accel=kvm -hda mint.qcow2 -cdrom linuxmint-17.3-cinnamon-64bit.iso -m 1G -boot d

![imagen](http://i64.tinypic.com/2yvniwo.png)
