### Ejercicio 1: Instalar los paquetes necesarios para usar KVM. Ya lo hicimos en el primer tema, pero vamos a volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.

Compruebo que mi sistema es apto como se muestra en la siguiente figura:
![puedo acelerar por hardware](http://i62.tinypic.com/vcytu9.png)


### Ejercicio 2.1: Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS, GALPon Minino, Damn Small Linux, SliTaz y ttylinux.

La siguiente captura es de SliTaz:

![SliTaz](https://www.dropbox.com/s/braae7elkgbduoc/SliTaz.png?dl=0)

La siguiente captura es de Ubuntu:

![ubuntu](https://www.dropbox.com/s/z8r4hnk7ahrplc9/ubuntu.png?dl=0)




### Ejercicio 2.2: Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.

a continuación se muestran diferentes máquinas virtuales que tengo instaladas con parallels:
![centro de control de parallels](https://www.dropbox.com/s/mn7qpfa5tu4p1mp/parallels.png?dl=0)


### Ejercicio 3: Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con qemu-system-x86_64 -hda /media/Backup/Isos/discovirtual.img.




### Ejercicio 4: Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.



### Ejercicio 5: Crear una máquina virtual ubuntu en Azure e instalar en ella un servidor nginx para poder acceder mediante web.

Para instalar la máquina virtual he utilizado la sección de Máquinas Virtuales del panel de control de manage.windowsazure.com.
Una vez creada la máquina virtual, accedo a ella por ssh e instalo nginx:

```
ssh azureuser@ubuntudeapozo.cloudapp.net
sudo apt-get install nginx

```


### Ejercicio 6: Usar juju para hacer el ejercicio anterior.



### Ejercicio 7: Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.


La siguiente captura muestra Linux Mint funcionando con el hipervisor Parallels:

![mint](https://www.dropbox.com/s/lt8nj5kzaa48vrm/mint.png?dl=0)
