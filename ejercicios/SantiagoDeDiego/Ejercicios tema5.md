#Ejercicios tema 5

##Ejercicio 1

Volvemos a hacer lo mismo que hicimos en el primer tema, esto es, escribimos `sudo apt-get install cpu-checker` y luego: `sudo apt install qemu-kvm libvirt-bin`. Con esto ya tenemos instalado kvm 3n el equipo.

##Ejercicio 2

Ahora ejecutamos `sudo modprobe kvm-intel` para cargar el módulo de kvm. Ahora tenemos que descargar una imagen de [Minino](http://minino.galpon.org/es/descargas), en mi caso he escogido Ártabros. Esperamos a que se descargue y una vez descargada vamos a instalar un disco duro virtual con: `qemu-img create -f qcow2 disco.qcow2 3000M`.

Una vez hecho esto vamos a instalar la MV con la ISO descargada y el disco creado con: `qemu-system-x86_64 -hda disco.qcow2 -cdrom minino-artabros-2.1_full.iso`. Nada más escribirlo nos aparece la siguiente imagen, para que instalemos el SO:

![minino](http://i864.photobucket.com/albums/ab201/Santiago_de_Diego/Captura%20de%20pantalla%20de%202016-01-09%20165713_zpssagsij8h.png)

Para instalarlo en modo gráfico tenemos que entrar en la primera opción y una vez arranca la MV clicar en el instalador que aparece en el Escritorio.

Para la segunda parte del ejercicio, voy a utilizar VirtualBox,ya que estoy más familiarizado con él. Primero de todo lo instalamos desde la [página oficial](https://www.virtualbox.org/wiki/Downloads)

Una vez instalado VirtualBox voy a descargar una imagen de Ubuntu Desktop desde su [página oficial](http://www.ubuntu.com/download/desktop). Esperamos que se descargue y una vez hecho se lo asignamos a la Máquina virtual que hemos creado con VirtualBox clicando en Nueva. Ahora ya lo instalamos como si se tratase de instalarlo en nuestro propio ordenador y una vez instalado ya podemos entrar en nuestra MV.

