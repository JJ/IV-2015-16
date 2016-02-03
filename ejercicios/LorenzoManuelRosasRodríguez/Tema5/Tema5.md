### Ejercicio 1: Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.

Debo comprobar la compatibilidad de kvm, para hacerlo realizo los siguientes pasos:

- Instalar cpu-checker desde la terminal:

```
sudo apt-get install cpu-checker
```
![instalacion_cpu_checker](https://www.dropbox.com/s/jg6zpdj9i8wuvdb/img2.png?dl=1)

- Comprobar:
```
sudo kvm-ok
```

![kvm-ok](https://www.dropbox.com/s/gptmdlpn8v67vld/img3.png?dl=1)

Una vez comprobada la compatibilidad, realizo lo siguiente:

- Instalación de los paquetes que necesitamos:
```
sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils
```

![instalacion_paquetes](https://www.dropbox.com/s/fc65xi4i4tsqrey/img5.png?dl=1)

- Instalación de **virtinst**, para crear máquinas virtuales:
```
sudo apt-get install virtinst
```

![instalacion_paquetes](https://www.dropbox.com/s/wp9vxyu87xzqaau/img6.png?dl=1)


- Añado usuario **ubuntu**(el que uso) a los grupos kvm y libvirtd.
```
sudo adduser ubuntu kvm
sudo adduser ubuntu libvirtd
```

- Compruebo que la instalción se ha realizado correctamente:
```
virsh -c qemu:///system list
```

![okinstalacion](https://www.dropbox.com/s/e5jtxcsyyn06rnt/img7.png?dl=1)


### Ejercicio 2: Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).

*Instaclación de CoreOS:*

- Creo el disco duro necesario:
```
$ qemu-img create -f qcow2 coreos.qcow2 10G
```

- Procedo a la instalación de la imagen [CoreOS](https://coreos.com/os/docs/latest/booting-with-iso.html):
```
$ qemu-system-x86_64 -machine accel=kvm -hda coreos.qcow2 -cdrom coreos_production_iso_image.iso -m 1G -boot d
```
![CoreOs](https://www.dropbox.com/s/2e8louciqot9w6g/img8.png?dl=1)

*Instalación Slitaz:*

Realizo los mismo pasos, pero con una imagen distinta:

![CoreOs](https://www.dropbox.com/s/53258b5n0jsulsb/img9.png?dl=1)


### 2.Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.

He usado para este ejercicio VirtualBox, concretamente he instalado una linux-mint como se aprecia en las imágenes.

![linux1](https://www.dropbox.com/s/3sebtththlzysdw/img10.png?dl=1)

![linux2](https://www.dropbox.com/s/0tmx0qmthqezqcj/img11.png?dl=1)

![linux3](https://www.dropbox.com/s/s1quaurfelk6jt6/img15.png?dl=1)

![linux4](https://www.dropbox.com/s/48shrapds7k3rqq/img16.png?dl=1)


### Ejercicio 5: Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.

Para ello podemos seguir los pasos para crear una máquina virtual en Amazon( puede verse [aquí](https://github.com/lorenmanu/submodulo-lorenzo/blob/master/documentacion/ec2.md)).

Para tener nginx, deberemos conectarnos a la máquina por ssh. Para poder conectarnos por ssh hay que tener atención con el último apartado de nuestro archivo. En ese apartado también podremos dar a nuestra máquina la capacidad de etender peticiones por http( tcp  puerto 80).

- Para instalar nginx bastará con realizar dentro de nuestra máquina en Amazon:
```
sudo apt-get update
sudo apt-get install nginx
```

- Posteriormente se arranca nginx, por defecto se abre por el puerto 80, y ya atiende peticiones http:
``` 
sudo service nginx start

```


### Ejercicio 7: Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.

Realizo los mismo pasos del ejercicio 2, pero con la imagen linux-mint: 



![img7](https://www.dropbox.com/s/t2ry26lpz1xvv8s/img_7_lorenzo.png?dl=1)





