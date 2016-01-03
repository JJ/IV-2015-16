# Tema 5. Uso de sistemas de virtualización. 

##Ejercicio 1: Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización
Podemos comprobar que nuestro sistema esta preparado para ejecutarlo mediante la orden

	kvm-ok

![imagen](https://www.dropbox.com/s/slhca4tlofunqpj/kvm.png?dl=1)

Es posible comprobarlo en procesadores Intel mediante la orden 

	grep --color vmx /proc/cpuinfo

Para instalar los paquetes necesarios, podemos hacerlo mediante la orden

	sudo apt-get install qemu-kvm libvirt-bin virtinst kvm virt-viewer

Una vez instalados, es necesario indicar el usuario que queremos que utilice la virtualización

	sudo adduser nombre_usuario kvm

Es recomendable cargar el modulo, en mi caso, para un procesador intel, puede realizarse mediante la instrucción

	sudo modprobe kvm-intel

##Ejercicio 2.1: Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).

Slitaz: 

Crear disco duro

	qemu-img create -f qcow2 slitaz.qcow2 2G

![imagen](https://www.dropbox.com/s/26fimpmrx361dvu/slitazD.png?dl=1)

Instalar imagen slitaz. Es necesario tener una iso del SO que vamos a instalar. Podemos encontrarla [aquí](http://www.slitaz.org/en/)

	qemu-system-x86_64 -machine accel=kvm -hda slitaz.qcow2 -cdrom slitaz-4.0.iso -m 1G -boot d

![imagen](https://www.dropbox.com/s/o4yg7s3fuyicx7d/slitazI.png?dl=1)


Debian:

Crear disco duro
	
	qemu-img create -f qcow2 debian.qcow2 10G

![imagen](https://www.dropbox.com/s/jlbq07lmtkd585x/discoD.png?dl=1)

Instalar imagen debian. Es necesario tener una iso del SO que vamos a instalar.

	qemu-system-x86_64 -machine accel=kvm -hda debian.qcow2 -cdrom debian-8.2.0-amd64-CD-1.iso -m 1G -boot d

![imagen](https://www.dropbox.com/s/cmsfrzeobpis9je/debianI.png?dl=1)

	

##Ejercicio 2.2: Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.

Voy a utilizar VirtualBox y voy a volver a instalar Slitaz por ser muy liviano (y por que ya tengo la ISO)

Paso 1: Abrir virtualBox y seleccionar NUEVA

![imagen](https://www.dropbox.com/s/vtgbp7se5cvpsfj/vb1.png?dl=1)

Paso 2: Seleccionar la memoria

![imagen](https://www.dropbox.com/s/say4jyw3dsdzlaq/vb2.png?dl=1)

Paso 3: Seleccionar el tipo de disco duro

![imagen](https://www.dropbox.com/s/gf0yegwzngj9w5l/vb3.png?dl=1)

Paso 4: Añadir al controlador la ISO de Slitaz

![imagen](https://www.dropbox.com/s/2p8ig9et9zr11wx/vb4.png?dl=1)

Paso 5: Arrancar e instalar el SO

![imagen](https://www.dropbox.com/s/jhtoguiq01173xf/vb5.png?dl=1)

##Ejercicio 3: Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con

He creado el siguiente [benchmark](https://github.com/hugobarzano/IV-2015-16/blob/master/ejercicios/HugoBarzano/bm2.cpp) utilizando la información que el sistema operativo almacena dentro del directorio /proc**
La función mem_total () devuelve la memoria total usada por el programa (memoria de datos + memoria de pila) en kilobytes. Utiliza la librería time.h para medir el tiempo. 

##Ejercicio 4: Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.

Para que el sistema unix tenga entorno gráfico LXDE, he decidido instalar Lubuntu. Podemos descargar la iso de [aqui](http://cdimage.ubuntu.com/lubuntu/releases/14.04/release/)

Crear almacenamiento
	
	qemu-img create -f qcow2 lubuntu.img 6G

Crear la maquina habilitando vnc

	qemu-system-x86_64 -cdrom lubuntu-14.04.3-desktop-amd64.iso -boot d -m 1G -vnc :1 lubuntu.img


Para conectar por vnc voy a utilizar vinagre. Podemos instalarlo mediante 

	sudo apt-get install vinagre

	vinagre localhost:5901

![imagen](https://www.dropbox.com/s/1e2k773w1ae7rp9/vinagre1.png?dl=1)

Para conectar por ssh he tenido problemas con quemu por lo que he instalado la imagen en VirtualBox tal y como he reflejado en el ejercicio 2.2
Adicionalmente, he creado una red solo-anfitrión para tener conexión con mi host

![imagen](https://www.dropbox.com/s/7b2xgkf02xne1tf/lubuntu2.png?dl=1)

He indicado en la configuración de red de la imagen que se conecte a dicha red por alguno de los adaptadores disponibles

![imagen](https://www.dropbox.com/s/5sg2actbaiyecv5/lubuntu3.png?dl=1)

Instalamos ssh en la maquina virtual y nos conectamos desde el anfitrión 

	sudo apt-get install openssh-server

![imagen](https://www.dropbox.com/s/pux0uz553ji51u7/lubuntu4.png?dl=1)



##Ejercicio 5: Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.

Lo primero es instalar azure-cli

	sudo apt-get install nodejs-legacy
	sudo apt-get install npm
	sudo npm install -g azure-cli

Debemos hacer login en azure

	azure login

Nos facilitará un enlace y un código. Debemos abrir el enlace con el navegador e introducir el código

![imagen](https://www.dropbox.com/s/grjusrkfn0m02q8/azure1.png?dl=1)

Tras esto, debemos facilitar nuestras credenciales (usuario contraseña) y automáticamente se completará el proceso de login

![imagen](https://www.dropbox.com/s/rnxej18vbrjkqhm/azure2.png?dl=1)

Voy a utilizar ubuntu-server 14.04. Podemos consultar las imágenes disponibles mediante 

	azure vm image list

Obtener información sobre la que vamos a utilizar

	azure vm image show b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04-LTS-amd64-server-20140414-en-us-30GB

![imagen](https://www.dropbox.com/s/o1auh09bqw11y2b/azure4.png?dl=1)

Ahora podemos crear la maquina virtual con la imagen

azure vm create maquina-hugo-ej5 b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04-LTS-amd64-server-20140414-en-us-30GB hugo Clave#Hugo#1 --location "Central US" --ssh

![imagen](https://www.dropbox.com/s/menasge58ap7qjj/azure5.png?dl=1)

Arrancamos la máquina virtual y nos conectamos por ssh

	azure vm start maquina-hugo-ej5
	ssh hugo@maquina-hugo-ej5.cloudapp.net

![imagen](https://www.dropbox.com/s/8zkbrkkb8rz3zz8/azure6.png?dl=1)

Actualizamos el sistema base e instalamos nginx

	sudo apt-get update
	sudo apt-get install nginx

Liberamos el puerto 80 e iniciamos el servicio

	sudo fuser -k 80/tcp
	sudo service nginx start


Por último, desconectamos ssh y abrimos el puerto 80 para nginx. Podemos comprobar mediante un navegador, que todo esta correcto. 

	azure vm endpoint create maquina-hugo-ej5 80 80

![imagen](https://www.dropbox.com/s/hxf478398xhw37f/azure7.png?dl=1)


##Ejercicio 7: Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.

Descarga de la imagen de [Linux Mint](http://www.linuxmint.com/download.php)

Crear disco duro
	
	qemu-img create -f qcow2 mint.qcow2 6G

Instalar imagen Linux Mint

	qemu-system-x86_64 -machine accel=kvm -hda mint.qcow2 -cdrom linuxmint-17.3-cinnamon-64bit.iso -m 1G -boot d

![imagen](https://www.dropbox.com/s/x6qtgb9329uuf4z/mint.png?dl=1)
