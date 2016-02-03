#Ejercicios tema 5

##Ejercicio 1

Volvemos a hacer lo mismo que hicimos en el primer tema, esto es, escribimos `sudo apt-get install cpu-checker` y luego: `sudo apt install qemu-kvm libvirt-bin`. Con esto ya tenemos instalado kvm en el equipo.

##Ejercicio 2

Ahora ejecutamos `sudo modprobe kvm-intel` para cargar el módulo de kvm. Ahora tenemos que descargar una imagen de [Minino](http://minino.galpon.org/es/descargas), en mi caso he escogido Ártabros. Esperamos a que se descargue y una vez descargada vamos a instalar un disco duro virtual con: `qemu-img create -f qcow2 disco.qcow2 3000M`.

Una vez hecho esto vamos a instalar la MV con la ISO descargada y el disco creado con: `qemu-system-x86_64 -hda disco.qcow2 -cdrom minino-artabros-2.1_full.iso`. Nada más escribirlo nos aparece la siguiente imagen, para que instalemos el SO:

![minino](http://i864.photobucket.com/albums/ab201/Santiago_de_Diego/Captura%20de%20pantalla%20de%202016-01-09%20165713_zpssagsij8h.png)

Para instalarlo en modo gráfico tenemos que entrar en la primera opción y una vez arranca la MV clicar en el instalador que aparece en el Escritorio.

Para la segunda parte del ejercicio, voy a utilizar VirtualBox,ya que estoy más familiarizado con él. Primero de todo lo instalamos desde la [página oficial](https://www.virtualbox.org/wiki/Downloads)

Una vez instalado VirtualBox voy a descargar una imagen de Ubuntu Desktop desde su [página oficial](http://www.ubuntu.com/download/desktop). Esperamos que se descargue y una vez hecho se lo asignamos a la Máquina virtual que hemos creado con VirtualBox clicando en Nueva. Ahora ya lo instalamos como si se tratase de instalarlo en nuestro propio ordenador y una vez instalado ya podemos entrar en nuestra MV.

##Ejercicio 3

Para este ejercicio voy a utilizar un Benchmark que desarrollé en la asignatura Ingeniería de servidores para comprobar diferentes sistemas de ficheros, aunque puede usarse para este propósito. Puede verse el benchmark [aquí](https://github.com/santidediego/Ingenieria-de-servidores/tree/master/Benchmark%20para%20medici%C3%B3n%20de%20velocidad%20de%20sistemas%20de%20ficheros). Lo único que he cambiado es que los resultados en lugar de exportarlos a un archivo .csv me los saque por terminal para mayor comodidad.

Teniendo el benchmark, arranco la máquina virtual con Minino que cree anteriormente con `qemu-system-x86_64 -hda disco.qcow2`. Copiamos el Benchmark con ssh.

Ahora hacemos lo mismo con la paravirtualización arrancando la máquina con `qemu-system-x86_64 -boot order=c -drive file=disco.qcow2,if=virtio`. Copiamos también el benchmark con ssh.

En mi caso, he obtenido tiempos muy similares con ambos, aunque algo mejores en la caso de la paravirtualización, aunque la verdad que la diferencia no es significativa, quizá realizando más intentos puedan apreciarse más diferencias.

##Ejercicio 4

En este ejercicio voy a crear una máquina virtual con Lubuntu con VirtualBox. He escogido esta distribución porque viene con el entorno gráfico LXDE instalado por defecto. Primero me descargo una imagen de Lubuntu de 32 bits de [aquí](https://help.ubuntu.com/community/Lubuntu/GetLubuntu) y una vez descargada creamos una MV en VirtualBox. En mi caso le he dado una capacidad de disco duro de 5GB como podemos ver abajo ya que se necesitan mínimo 4.4 GB para su correcto funcionamiento:

![disco duro](http://i864.photobucket.com/albums/ab201/Santiago_de_Diego/Captura%20de%20pantalla%20de%202016-01-09%20173647_zpsfchdpvey.png)

Una vez instalado vamos a conectarnos por ssh. Para ello, primero tenemos que añadir una nueva interfaz de red solo anfitrión para poder conectarnos a nuestra máquina:

![nueva interfaz de red](http://i864.photobucket.com/albums/ab201/Santiago_de_Diego/Captura%20de%20pantalla%20de%202016-01-09%20175021_zps8uer6ku1.png)

Ahora entramos en el archivo */etc/network/intefaces* y lo editamos como aparece en la siguiente imagen:

![interfaces](http://i864.photobucket.com/albums/ab201/Santiago_de_Diego/Captura%20de%20pantalla%20de%202016-01-09%20175556_zpsezdul17s.png)

Ahora ya solo queda conectarnos por ssh a la MV como podemos ver:

![ssh](http://i864.photobucket.com/albums/ab201/Santiago_de_Diego/Captura%20de%20pantalla%20de%202016-01-09%20175921_zpsg1mcuqsp.png)

#Ejercicio 5:

Primero de todo instalamos una máquina virtual con Ubuntu con VirtualBox. Seguimos los pasos de forma similar al ejercicio 4, Una vez instalada, vamos a configurar Nginx. Primero de todo lo instalamos con `sudo apt-get update && sudo apt-get install nginx`. En ubuntu, por defecto se arranca automáticamente sin tenerque hacer nada más. Por tanto ya lo tenemos

#Ejercicio 7:

Primero de todo creamos una máquina virtual en VirtualBox de la misma manera que antes, solo que ahora marcaremos Linux 2.6 y pondremos la versión de 32 bits para que sea más ligera. Después seleccionamos la imagen de Linux Mint descargada y arrancamos la MV. Nos aparece la siguiente pantalla:

![linux mint](http://i864.photobucket.com/albums/ab201/Santiago_de_Diego/Captura%20de%20pantalla%20de%202016-02-02%20152900_zps2qdsjkyi.png)

Podemos entrar en la primera opción y después clicar en el instalador para comenzar a instalar la distribución, de forma similar a como lo hacemos en Ubuntu.


