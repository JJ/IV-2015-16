###Ejercicio 1: Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.

Tenemos que ver si hay compatibilidad con KVM, para ello ejecutamos ```sudo apt-get install cpu-checker```:
![Ejercicio1_1](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio1_zpsenasjta3.png)


Yo ya lo tengo instalado. Para comprobar que funciona correctamente, ejecuto la orden ```sudo kvm-ok``` :

![Ejercicio1_2](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio1_2_zpsyjdwiw9y.png)

He seguido los pasos de la página de Ubuntu para instalar KVM.
Instalamos los paquetes necesarios con ```sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils``:`

![Ejercicio1_3](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio1_3_zpsxtmscrqu.png)

Para poder crear máquinas virtuales desde la linea de comandos, ejecutamos ```sudo apt-get install virtinst```

![Ejercicio1_4](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio1_4_zpsv8d6juho.png)

Ahora es necesario añadir mi usuario a los grupos kvm y libvirtd. Lo hacemos con las siguientes órdenes:

```
sudo adduser cesar kvm
sudo adduser cesar libvirtd
```

![Ejercicio1_5](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio1_5_zps6bjkcnzv.png)

Cierro sesión y vuelvo a entrar.

Podemos comprobar que todo se ha hecho correctamente con la orden ```virsh -c qemu:///system list```:

![Ejercicio1_6](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio1_6_zpstep0f561.png)

Para instalar la interfaz gráfica, ```sudo apt-get install virt-manager```.

Ahora, en el buscador de nuestro sistema, introducimos gestor de máquinas virtuales, y arrancamos la interfaz del mismo:

![Ejercicio1_7](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio1_7_zpsuc8c5isc.png)

Y ya podemos comenzar a utilizar el gestor de máquinas virtuales correctamente.


###Ejercicio 2: Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).

Para CoreOS:

Para crear el disco duro necesario, escribimos en el terminal ```qemu-img create -f qcow2 coreos.qcow2 10G```:

![Ejercicio2_1](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio2_1_zpswbfdji8c.png)

![Ejercicio2_2](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio2_2_zpsp2xed88w.png)

![Ejercicio2_3](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio2_3_zpscdr3f2dy.png)

Para Debian Stable:

Para crear el disco duro, de nuevo, escribimos en el terminal ```qemu-img create -f qcow2 debian.qcow2 10G```:

Realizo una instalación de una imagen [Debian](http://cdimage.debian.org/debian-cd/current/amd64/iso-cd/?C=N;O=D):

```
qemu-system-x86_64 -machine accel=kvm -hda debian.qcow2 -cdrom debian-8.3.0-amd64-CD-1.iso -m 1G -boot d
```

![Ejercicio2_4](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio2_4_zpsy36b78qo.png)

Y procedemos a la instalación como normalmente hacemos con cualquier otra distribución.
![Ejercicio2_6](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio2_6_zpsmm1gjx4j.png)

![Ejercicio2_7](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio2_7_zpswftvmxo2.png)

Ahora, para ejecutar la máquina virtual, podemos ejecutar en el terminal la siguiente orden:
```
qemu-system-x86_64 -boot order=c -drive file=debian.qcow2,if=virtio
```

![Ejercicio2_8](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio2_8_zpsniaoym4a.png)

##2.Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.

He utilizado VirtualBox para este ejercicio. Pinchamos en crear nueva, y escribimos el nombre de la misma que queramos:

![Ejercicio2_9](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio2_9_zps6bcbzbqg.png)

Nos pedirá que seleccionemos la ubicación de la imagen. La seleccionamos y le damos a continuar. Ahora ya podemos
instalarla correctamente.

![Ejercicio2_10](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/7d79ea1a-6346-4672-975b-a7a89856296d_zpsvgtwnlhi.png)

Y tras el período de instalación, ya está preparada para utilizarse:

![Ejercicio2_11](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio2_11_zpsgz1cdpjq.png)


###Ejercicio 3: Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con qemu-system-x86_64 -hda /media/Backup/Isos/discovirtual.img


###Ejercicio 4: Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.

El primer paso es crear el espacio de almacenamiento, como en los casos anteriores, escribimos en el 
terminal ``` qemu-img create -f qcow2 lubuntu.qcow2 8G ```

Me he descargado [Lubuntu](https://help.ubuntu.com/community/Lubuntu/GetLubuntu).
Ahora la instalamos:
```
$ qemu-system-x86_64 -machine accel=kvm -hda lubuntu.qcow2 -cdrom lubuntu-15.10-desktop-amd64.iso -m 1G -boot d
```

![Ejercicio4](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio4_zpsd0eebtrp.png)


Se accede a la máquina virtual escribiendo en el terminal:
```
$ qemu-system-x86_64 -machine accel=kvm -hda lubuntu.qcow2 -m 512M -vnc :1
```

Instalamos vinagre con la orden ```sudo apt-get install vinagre ```:

Puede verse el escritorio con vinagre con ```vinagre localhost:1```

![Ejercicio4_2](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio4_2_zpses1vk8jg.png)

A continuación instalo ssh en la máquina Lubuntu, con ```sudo apt-get install ssh```:

![Ejercicio4_3](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio4_3_zpspsfc56qk.png)


Apago la máquina y vuelvo a arrancar, para ello hago un NAT del puerto 2222 de la máquina host al puerto 22 de la invitada:
```
$ qemu-system-x86_64 -machine accel=kvm -hda lubuntu.qcow2 -m 512M -redir tcp:2222::22
```

Para entrar ejecutamos lo siguiente:
```
$ ssh cesar@localhost -p 2222
```

![Ejercicio4_5](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio4_5_zpsehmlarfk.png)



###Ejercicio 5: Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.

Tenemos que instalar algunas herramientas para usar azure mediante línea de órdenes. Así, escribimos lo siguiente
en la consola:
```
sudo apt-get install nodejs-legacy
sudo apt-get install npm
sudo npm install -g azure-cli
```
![Ejercicio5_1](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio5_zps1fpqz1kq.png)

Ahora, tenemos que hacer login con nuestra cuenta de Azure.
En primer lugar, escribimos en la consola: ``` azure login ``` , lo que nos mostrará un enlace a una página web y
un código que debemos de introducir en la misma, como podemos ver en las dos imágenes siguientes:

![Ejercicio5_2](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio5_2_zpsyca0sfej.png)

![Ejercicio5_3](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio5_3_zpstzljpqyp.png)

Hecho esto, nos pedirá que introduzcamos nuestra cuenta de Azure, y una vez que hayamos introducido la misma, ya
podremos cerrar la web y estaremos logeados correctamente:

![Ejercicio5_4](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio5_4_zps6vpbvfp9.png)

![Ejercicio5_5](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio5_5_zps8zhhbfni.png)


Podemos ver las imágenes que podemos utilizar. Nosotros usaremos Ubuntu.
Escribimos en el terminal: ```azure vm image list``` , y se nos muestran todas las distribuciones:

![Ejercicio5_6](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio5_6_zpsvtxt3zo4.png)

Seleccionamos una de ellas y vemos la información de la misma, ejecutando el siguiente comando:
```azure vm image show b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04-LTS-amd64-server-20140414-en-us-30GB```
![Ejercicio5_7](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio5_7_zpsreiihtnh.png)


Ahora vamos a pasar a crear la máquina virtual. 
Los parámetros que le pasamos son:
- El nombre de la máquina (maquina-cesar-ubu5)
- La distribución que vamos a usar (b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04-LTS-amd64-server-20140414-en-us-30GB)
- El nombre del usuario (cesar)
- La clave del usuario (Clave#Cesar#1)
- La localización de la misma (West Europe).

Así, escribimos en la consola lo siguiente y ejecutamos:
```
azure vm create maquina-cesar-ubu5 b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04-LTS-amd64-server-20140414-en-us-30GB cesar Clave#Cesar#1 --location "West Europe" --ssh
```
![Ejercicio5_8](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio5_8_zpscrie7rcz.png)

Podemos ver que la máquina se ha creado desde la página de Azure:
![Ejercicio5_8_2](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio5_8_2_zpshnb47hi1.png)

Ahora arrancamos la máquina con el comando ```azure vm start maquina-cesar-ubu5 ``` , y conectamos mediante ssh con
el comando ```ssh cesar@maquina-cesar-ubu5.cloudapp.net ``` :
![Ejercicio5_9](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio5_9_zpstp14nwol.png)

Ahora, actualizamos el sistema operativo con ```sudo apt-get update ``` :
![Ejercicio5_10](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio5_10_zps3fd5exb6.png)

E instalamos nginx con ```sudo apt-get install nginx```
![Ejercicio5_11](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio5_11_zpsnm3pjomx.png)


Ahora, arrangamos nginx con ```sudo service nginx start``` y abrimos el puerto 80 de la máquina con el 
comando ```azure vm endpoint create maquina-cesar-ubu5 80 80 ```.

Ahora, vamos al navegador y escribimos **maquina-cesar-ubu5.cloudapp.net**, y vemos que funciona correctamente:
![Ejercicio5_12](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio5_12_zps5uvod3nk.png)

Y, finalmente, apagamos la máquina con ```azure vm shutdown maquina-cesar-ubu5 ``` :
![Ejercicio5_13](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio5_13_zps5csrgg42.png)

###Ejercicio 6: Usar juju para hacer el ejercicio anterior.

En primer lugar instalamos **juju** con el comando ``` sudo apt-get install juju-core```.
Ahora, lo iniciamos con el comando  ``` juju init``` : 

![Ejercicio6_1](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio6_zpszrxz1juc.png)

Como vemos en la imagen anterior, nos ha creado el archivo **/home/cesar/.juju/environments.yaml.** , donde estará toda
la configuración.

He realizado la configuración siguiendo las instrucciones en esta [página](https://jujucharms.com/docs/stable/config-azure).
Ahora , tenemos que crear los certificados con los siguientes comandos(como indica en el enlace anterior):
```
openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout azure.pem -out azure.pem
openssl x509 -inform pem -in azure.pem -outform der -out azure.cer
chmod 600 azure.pem
```

![Ejercicio6_2](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio6_2_zps4bcrwxbl.png)
![Ejercicio6_3](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio6_3_zpsv6cxy4bo.png)

Ahora, tenemos que editar el archivo archivo **/home/cesar/.juju/environments.yaml** . De nuevo, en este
[enlace](https://jujucharms.com/docs/stable/config-azure) podemos ver qué debemos de poner en cada campo.

Resumiendo, debemos cambiar cuatro campos. En el campo **management-subscription-id** hay que poner el id que se obtiene de ejecutar ```azure account list```. En **management-certificate-path** se pone la ruta hasta el certificado que se obtuvo en el paso anterior. En mi caso, es ```/home/cesar/azure.pm```. En **storage-account-name** se pone el nombre de almacenamiento obtenido de ejecutar ```azure storage account list```. En **location** se pone la localización que hemos
usado antes, en mi caso, ```West Europe```. Así, los campos que hemos cambiado quedarán así:

![Ejercicio6_4](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio6_4_zpso7g0tqnb.png)

![Ejercicio6_5](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio6_5_zpsv6zu4eqa.png)

Ahora, tenemos que ir a nuestra página de Azure. Nos vamos a Configuración , y después vamos a Certificados de
Administración. Pinchamos en cargar un certificado de administración:
![Ejercicio6_6](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio6_6_zpsd4brdhcg.png)

Se nos abrirá el explorador de archivos, y vamos al lugar donde tengamos nuestro certificado **azure.cer** que
hemos creado anteriormente, y lo seleccionamos:
![Ejercicio6_7](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio6_7_zpsfhzbbmbt.png)

Podemos ver, que se ha cargado correctamente:
![Ejercicio6_8](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio6_8_zpsf33j90il.png)

Ahora, tenemos que ejecutar ```juju switch azure``` para trabajar sobre azure. Y luego, creamos el contenedor
con el comando ```juju bootstrap``` :
![Ejercicio6_10](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio6_10_zpsiomexn8b.png)

Ahora, instalamos nginx, como nos indica en este [enlace](https://jujucharms.com/u/imbrandon/nginx/precise/7):
Ejecutamos ````juju deploy cs:~imbrandon/precise/nginx-7``` :
![Ejercicio6_11](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio6_11_zpsgdbpmpvl.png)


Publicamos el servicio con ```juju expose nginx``` y comprobamos el estado:
![Ejercicio6_12](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio6_12_zpsc28gcczm.png)


Podemos ver en la imagen anterior que todavía no esta funcionando. Tras esperar unos 5 minutos, volvemos a comprobar 
el estado  y se nos motrará que ya sí está funcionando:
![Ejercicio6_13](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio6_13_zps538mtlpi.png)

También podemos ver que está funcionando desde nuestra página de Azure:
![Ejercicio6_14](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio6_14_zpslhwofgkc.png)

Y, si escribimos en el navegador la dirección que nos muestra en el terminal , **juju-azure-aij1arzfvk.cloudapp.net** podemos ver que funciona:

![Ejercicio6_15](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio6_15_zpson3wqqoo.png)


###Ejercicio 7: Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.

Descargamos Linux Mint de su [página oficial](http://www.linuxmint.com/download.php).
![Ejercicio7_1](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio7_1_zpshilvxho0.png)

Igual que en los ejercicios anteriores, tenemos que crear el espacio para almacenamiento:
```
qemu-img create -f qcow2 lmint.qcow2 10G
```
Y procedemos a instalar la imagen:
```
qemu-system-x86_64 -machine accel=kvm -hda lmint.qcow2 -cdrom linuxmint-17.3-cinnamon-64bit.iso -m 1G -boot d
```

![Ejercicio7_2](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio7_2_zpsjdcc7ljr.png)

![Ejercicio7_3](http://i1155.photobucket.com/albums/p543/cesypozo/Ejercicios%20Tema%205/ejercicio7_3_zps2h37djul.png)








