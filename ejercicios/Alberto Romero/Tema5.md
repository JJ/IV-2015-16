# Tema 5. Uso de sistemas de virtualización. 

##Ejercicio 1: Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización
Comprobamos que nuestro sistema esta preparado para ejecutarlo mediante la orden

	kvm-ok

![imagen](https://i.gyazo.com/1dac26d1205865ffd2b5b7f0cd66dc91.png)

Necesitamos instalar los siguientes paquetes:
```
	sudo apt-get install qemu-kvm libvirt-bin virtinst kvm virt-viewer
```

Añadimos un usuario

	sudo adduser nombre_usuario kvm
	
	![imagen](https://i.gyazo.com/f92b12aac5f055a194b5576f8552e765.png)


##Ejercicio 2.1: Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).

Slitaz: 

Primero, crearemos el disco duro necesario
```
	qemu-img create -f qcow2 slitaz.qcow2 2G
```
![imagen](https://i.gyazo.com/04208d1f6718a5626f99632b14e8ae23.png)

Procedemos a instalar Slitaz. Antes de nada deberemos descargarnos su iso y la instalaremos con el siguiente comando.
```
	qemu-system-x86_64 -machine accel=kvm -hda slitaz.qcow2 -cdrom slitaz-4.0.iso -m 1G -boot d
```
![imagen](https://i.gyazo.com/8c43a115aad72e5cbd6d716fb0e355fc.png)

*CoreOS:*

- Creamos el disco duro necesario:
```
$ qemu-img create -f qcow2 coreos.qcow2 10G
```

![discocoreos](https://i.gyazo.com/2d7e0c761bd1b5989cc36234c1013792.png)

Procedemos a instalar CoreOS
```
$ qemu-system-x86_64 -machine accel=kvm -hda coreos.qcow2 -cdrom coreos_production_iso_image.iso -m 1G -boot d
```

![instalacioncoreos](https://i.gyazo.com/c640125e8bddc46c8ab271afb87608af.png)



##Ejercicio 2.2: Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.

Instalaremos Stilaz en VirtualBox

- Nueva instalación

![imagen](https://i.gyazo.com/f29b114a6671592a6c03d3d97914cfaa.png)

- Elegimos las caracteristicas del hardware

![imagen](https://i.gyazo.com/85bcf20198f1089a4dc1e4b33506c3f1.png)

- Seleccionamos tipo de disco duro

![imagen](https://i.gyazo.com/de9222014f0a21c815f285fcb3f9f3ea.png)

- Al final, seleccionamos crear.

![imagen](https://i.gyazo.com/71f2f40461f882df9893688659a61942.png)


##Ejercicio 4: Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.

Para que el sistema unix tenga entorno gráfico LXDE, instalamos [Lubuntu](http://cdimage.ubuntu.com/lubuntu/releases/14.04/release/)

Creamos el almacenamiento

	qemu-img create -f qcow2 lubuntu.img 6G

![imagen](https://i.gyazo.com/5e1867f0ae10cb80e4326aa294296d31.png)

Creamos la maquina habilitando vnc

	qemu-system-x86_64 -cdrom lubuntu-14.04.3-desktop-amd64.iso -boot d -m 1G -vnc :1 lubuntu.img

![imagen](https://i.gyazo.com/932c412ecf2c6deec92d457f061a2048.png)
		

Para conectar por vnc instalamos vinagre: 

	sudo apt-get install vinagre

	vinagre localhost:5901

![imagen](https://i.gyazo.com/2f0932e8eb5ad55200d598b6309e1d46.png)

Para conectar por ssh instalamos la imagen en VirtualBox creando una red solo-anfitrión para tener conexión con mi host



Indicamos en la configuración de red de la imagen que se conecte a dicha red por alguno de los adaptadores disponibles



Instalamos ssh en la maquina virtual y nos conectamos desde el anfitrión 

	sudo apt-get install openssh-server



##Ejercicio 5: Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.

Creamos una instancia en ec2 como hicimos previamente en el hito 4.
Conectamos a dicha instancia e instalamos nginx


- Para instalar nginx bastará con realizar dentro de nuestra máquina en Amazon:
```
sudo apt-get update
sudo apt-get install nginx
```
![imagen](https://i.gyazo.com/1df323f8c9999f4cf227207ef8fc480e.png)
Arrancamos nginx y ya podemos usarlo.
``` 
sudo service nginx start

```

![imagen](https://i.gyazo.com/fc7263b72732d9e7af72c288a720557e.png)

##Ejercicio 7: Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.


Creamos el disco duro que vamos a usar.

```	
	qemu-img create -f qcow2 mint.qcow2 6G
```

Procedemos a instalar Linux Mint.

```
	qemu-system-x86_64 -machine accel=kvm -hda mint.qcow2 -cdrom linuxmint-17.3-cinnamon-64bit.iso -m 1G -boot d
```
![imagen](https://i.gyazo.com/41eb56cb9f2fb7fe1f3bae39b9924241.png)
