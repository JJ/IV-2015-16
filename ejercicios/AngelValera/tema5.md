# **Ejercicios Tema 5**

###**Ejercicio 1:**Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.

Lo primero es comprobar la compatibilidad con KVM, para ello se ejecuta lo siguiente:
```
**sudo apt-get install cpu-checker**
**sudo kvm-ok**
```
![](http://i666.photobucket.com/albums/vv21/angelvalera/Ejercicios%20tema%205/Seleccioacuten_010_zpsgfrv6ryi.png)

Hecho esto debemos seguir los pasos de la página oficial de [Ubuntu](https://help.ubuntu.com/community/KVM/Installation) para instalar KVM:

* **Paso 1:** Instalamos los paquetes necesarios.
```
**sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils**
```
* **Paso 2:** Para crear máquinas virtuales desde la linea de comandos, necesitamos instalar:
```
**sudo apt-get install virtinst**
```
* **Paso 3:**Añadimos nuestro usuario a los grupos kvm y libvirtd.
```
**sudo adduser angel kvm**
**sudo adduser angel libvirtd**
```
* **Paso 4:**Relogueamos.

* **Paso 5:**Comprobamos que la instalación mediante el siguiente comando:
```
**virsh -c qemu:///system list**
```
![](http://i666.photobucket.com/albums/vv21/angelvalera/Ejercicios%20tema%205/Seleccioacuten_011_zpsljo5fmlc.png)

* **Paso 6:** Ahora si queremos podemos añadir una interfaz gráfica, lo cual no es necesario.

**sudo apt-get install virt-manager**

Cuando abrimos el gestor de maquinas virtuales desde inicio, nos indica que debemos instalar mas paquetes.

![](http://i666.photobucket.com/albums/vv21/angelvalera/Ejercicios%20tema%205/Seleccioacuten_012_zps84yb3qfh.png)
 
Hecho esto podemos usarlo.
![](http://i666.photobucket.com/albums/vv21/angelvalera/Ejercicios%20tema%205/Seleccioacuten_013_zpsr3gqrcf2.png)

###**Ejercicio 2.1:**Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).

**SliTaz**

* lo primero es crear el disco duro necesario:

```**qemu-img create -f qcow2 slitaz.qcow2 8G**```

* Después descargamos una imagen [SliTaz](http://www.slitaz.org/en/) estable y la instalamos:

```**qemu-system-x86_64 -hda slitaz.qcow2 -cdrom slitaz-4.0.iso**```

![](http://i666.photobucket.com/albums/vv21/angelvalera/Ejercicios%20tema%205/Seleccioacuten_016_zpskqvopu1t.png)


**Debian Stable**

* Como antes, lo primero es crear el disco duro necesario:

```**qemu-img create -f qcow2 debian.qcow2 10G**```

* Después descargamos una imagen [Debian](http://cdimage.debian.org/debian-cd/8.3.0/i386/iso-cd/) estable y la instalamos:

```**$ qemu-system-x86_64 -machine accel=kvm -hda debian.qcow2 -cdrom debian-8.3.0-i386-CD-1.iso -m 1G -boot d**```

![](http://i666.photobucket.com/albums/vv21/angelvalera/Ejercicios%20tema%205/Seleccioacuten_014_zpsmexe246e.png)

Para ejecutarla debemos poner:

```**qemu-system-x86_64 -boot order=c -drive file=/media/Backup/Isos/discovirtual.img,if=virtio**```

En mi caso:

```**qemu-system-x86_64 -boot order=c -drive file=debian.qcow2,if=virtio**```
![](http://i666.photobucket.com/albums/vv21/angelvalera/Ejercicios%20tema%205/Seleccioacuten_015_zpsz5uscili.png)

###**Ejercicio 2.2:** Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels. 

Usaré VirtualBox e instalaré una imagen de SliTaz:

![](http://i666.photobucket.com/albums/vv21/angelvalera/Ejercicios%20tema%205/Seleccioacuten_017_zpsimrm9mwi.png)

![](http://i666.photobucket.com/albums/vv21/angelvalera/Ejercicios%20tema%205/Seleccioacuten_018_zpslonffkhj.png)



###**Ejercicio 3:**Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con qemu-system-x86_64 -hda /media/Backup/Isos/discovirtual.img

Para este ejercicio he usado el benchmark de [Sysbench](http://www.elmundoenbits.com/2013/04/benchmark-I.html#.VrHj2lThA8q),realizando los siguientes pasos:

* Primero lo instalamos:
```
**sudo apt-get install sysbench**
```
* Después, debemos crear un entorno de trabajo:
```
**sysbench --test=fileio --file-total-size=5G prepare**
```
* Lo siguiente es ejecutar los tests y mostrar los resultados:

```
sysbench --test=fileio --file-total-size=5G \
       --file-test-mode=rndrw --init-rng=on \
       --max-time=300 --max-requests=0 run
```

* Hecho esto limpiamos el espacio ocupado:

```sysbench --test=fileio --file-total-size=5G cleanup```

Realizamos primero el benchmark de una imagen ubuntu similar a la que usamos normalmente y que paravirtualizaremos:

Entramos en la imagen usando, como hicimos antes:

```qemu-system-x86_64 -boot order=c -drive file=ubuntu.qcow2,if=virtio```

Una vez dentro ejecutamos los comandos indicados antes:
![](http://i666.photobucket.com/albums/vv21/angelvalera/Ejercicios%20tema%205/Seleccioacuten_019_zpswxll4fwz.png)

![](http://i666.photobucket.com/albums/vv21/angelvalera/Ejercicios%20tema%205/Seleccioacuten_020_zps2vrr3x5p.png)


```qemu-system-x86_64 -hda ubuntu.qcow2```

Hecho esto se realizan las mismas operaciones.

![](http://i666.photobucket.com/albums/vv21/angelvalera/Ejercicios%20tema%205/Seleccioacuten_021_zpsmpjlnebh.png)

###**Ejercicio 4:**Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.

Si queremos que el sistema unix tenga entorno gráfico LXDE, podemos usar [Lubuntu](http://cdimage.ubuntu.com/lubuntu/releases/14.04/release/):

* Lo primero que tenemos que hacer es crear el espacio de almacenamiento:

```
$ qemu-img create -f qcow2 lubuntu.qcow2 6G
```
* Lo instalamos como en los ejercicios anteriores:

```
$ qemu-system-x86_64 -machine accel=kvm -hda lubuntu.qcow2 -cdrom lubuntu-14.04-alternate-i386.iso -m 1G -boot d
```

* Ahora accedemos a la máquina de la siguiente forma:
```
$ qemu-system-x86_64 -machine accel=kvm -hda lubuntu.qcow2 -m 512M -vnc :1
```
* Una vez en la máquina instalamos **vinagre** para ello usamos:

```
$ sudo apt-get install vinagre
```
* Para ver el escritorio usando vinagre usamos:

```
$ vinagre localhost:1
```

![](http://i666.photobucket.com/albums/vv21/angelvalera/Ejercicios%20tema%205/a507bbf5-c6ed-47e4-a0ce-f0ff8cbdeee5_zpsiovdybmn.png)




* Ahora instalamos **ssh** en la máquina Lubuntu:

```
$ sudo apt-get install ssh
```

* Reiniciamos la máquina, para ello hago un NAT del puerto 2222 de la máquina host al puerto 22 de la invitada:

```
$ qemu-system-x86_64 -machine accel=kvm -hda lubuntu.qcow2 -m 512M -redir tcp:2222::22
```
* Para entrar basta con ejecutar lo siguiente:

```
$ ssh angel@localhost -p 2222
```


###**Ejercicio 5:**Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.

* Lo primero que tenemos que hacer es instalar azure-cli, para ello hacemos:

```
sudo apt-get install nodejs-legacy
sudo apt-get install npm
sudo npm install -g azure-cli
```
* El siguiente paso es hacer login en azure:

```azure login```

Nos facilitará un enlace y un código. Debemos abrir el enlace con el navegador e introducir el código:

![](http://i666.photobucket.com/albums/vv21/angelvalera/Ejercicios%20tema%205/Seleccioacuten_022_zps7piwggsz.png)

Introducido el código, seleccionamos nuestra cuenta y en la consola nos aparecerá:

![](http://i666.photobucket.com/albums/vv21/angelvalera/Ejercicios%20tema%205/Seleccioacuten_023_zpsta6jylam.png)

Vamos a utilizar ubuntu-server 14.04. Podemos consultar las imágenes disponibles mediante:

```azure vm image list```

Y también podemos obtener información sobre la que vamos a utilizar:

```azure vm image show b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04-LTS-amd64-server-20140414-en-us-30GB```

![](http://i666.photobucket.com/albums/vv21/angelvalera/Ejercicios%20tema%205/Seleccioacuten_024_zpsrvvqex5l.png)

Hecho esto podemos crear la máquina virtual, para ello ejecutamos:
```
azure vm create maquina-angel-ej5 b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04-LTS-amd64-server-20140414-en-us-30GB angel Clave#Angel#1 --location "Central US" --ssh
```
![](http://i666.photobucket.com/albums/vv21/angelvalera/Ejercicios%20tema%205/Seleccioacuten_025_zpssigjob49.png)

Ahora una vez creada la máquina tenemos que arrancarla y conectarnos a ella por ssh.
```
azure vm start maquina-angel-ej5
ssh angel@maquina-angel-ej5.cloudapp.net
```
![](http://i666.photobucket.com/albums/vv21/angelvalera/Ejercicios%20tema%205/Seleccioacuten_026_zpswnxebr4a.png)

Una vez dentro de la máquina actualizamos el sistema base e instalamos nginx:

```
sudo apt-get update
sudo apt-get install nginx
```
Liberamos el puerto 80 e iniciamos el servicio

```
sudo fuser -k 80/tcp
sudo service nginx start
```
Por último, desconectamos ssh y abrimos el puerto 80 para nginx. Podemos comprobar mediante un navegador, que todo esta correcto.

```
azure vm endpoint create maquina-angel-ej5 80 80
```
![](http://i666.photobucket.com/albums/vv21/angelvalera/Ejercicios%20tema%205/Seleccioacuten_027_zpstcmdnbjy.png)

Ahora desde el navegador comprobamos que funciona:

![](http://i666.photobucket.com/albums/vv21/angelvalera/Ejercicios%20tema%205/Seleccioacuten_028_zps2g9kweyo.png)

Por último, lo que debemos hacer es apagar la máquina, para evitar costos.

```azure vm shutdown maquina-angel-ej5```

![](http://i666.photobucket.com/albums/vv21/angelvalera/Ejercicios%20tema%205/Seleccioacuten_029_zpsyx2b0jcm.png)

###**Ejercicio 7:**Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.

Lo primero que tenemos que hacer es descargar una version de Linux Mint,en mi caso la 17.3.

Al igual que en el ejercicio 2 se crea el espacio de almacenamiento:

```qemu-img create -f qcow2 lmint.qcow2 10G```

Se instala la imagen:

```qemu-system-x86_64 -machine accel=kvm -hda lmint.qcow2 -cdrom linuxmint-17.3-cinnamon-32bit.iso -m 1G -boot d```

![](http://i666.photobucket.com/albums/vv21/angelvalera/Ejercicios%20tema%205/Seleccioacuten_031_zpsldhmanuk.png)
