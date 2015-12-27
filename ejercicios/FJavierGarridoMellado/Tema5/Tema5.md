### Ejercicio 1: Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.

El primer paso es comprobar la compatibilidad con KVM, para ello se ejecuta lo siguiente:
```
sudo apt-get install cpu-checker
sudo kvm-ok
```

![comprobacionkvm](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/comprobarkvm_zpsdeljuqst.png)

A continuación, he procedido a seguir los pasos de la página oficial de [Ubuntu](https://help.ubuntu.com/community/KVM/Installation) para instalar KVM:

- Procedo a instalar los paquetes necesarios
```
sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils
```

![instalacion](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/paquetes_zps3qdnqw1r.png)

- Para crear máquinas virtuales desde la linea de comandos:
```
sudo apt-get install virtinst
```

![virtint](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/virtinst_zpsp9741pdr.png)

- Ahora es necesario añadir mi usuario a los grupos kvm y libvirtd.
```
sudo adduser javi kvm
sudo adduser javi libvirtd
```

![users](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/usuarios_zpsqn1276ih.png)

- Relogueo

- Se Comprueba la instalación mediante el siguiente comando:
```
virsh -c qemu:///system list
```

![okinstalacion](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/comprobacion_zpslsxxrzfv.png)

- Es recomendable tener una interfaz gráfica, aunque no es necesario para un futuro Ingeniero Informático.

![virtmanager](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/virtmanager_zpsmdgibibo.png)

- Desde el panel de inicio se puede arrancar la interfaz gráfica(Herramientas del sistema->Gestor de máquinas virtuales), esta nos indica si es necesario instalar más paquetes.

![gestor](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/interfazgrafica_zpsrvnaq4g9.png)

![gestor2](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/paquetesainstalar_zpswq4uouca.png)

- Realizado estos pasos, puede usarse de manera correcta:

![resultado](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/resultado_zpsi2fjtsjs.png)

### Ejercicio 2: Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).

*CoreOS:*

- Procedo a crear el disco duro necesario:
```
$ qemu-img create -f qcow2 coreos.qcow2 10G
```

![discocoreos](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/coreosdiscoduro_zpsyqnr36az.png)

- Realizo una instalación de una imagen [CoreOS](https://coreos.com/os/docs/latest/booting-with-iso.html) estable:
```
$ qemu-system-x86_64 -machine accel=kvm -hda coreos.qcow2 -cdrom coreos_production_iso_image.iso -m 1G -boot d
```

![instalacioncoreos](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/arrancarcoreos_zpsdxyhylcn.png)

![coreos](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/coreos_zpsz422in4f.png)

*Debian Stable:*

- Procedo a crear el disco duro necesario:
```
$ qemu-img create -f qcow2 debian.qcow2 10G
```

![discodebian](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/debiandiscoduro_zpswrt0y7d5.png)

- Realizo una instalación de una imagen [Debian](http://cdimage.debian.org/debian-cd/8.2.0/amd64/iso-cd/) estable:
```
$ qemu-system-x86_64 -machine accel=kvm -hda debian.qcow2 -cdrom debian-8.2.0-amd64-CD-1.iso -m 1G -boot d
```

![instalaciondebian](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/arrancardebian_zpscp000flk.png)

![debian](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/debian_zpsr0sjfthy.png)

Para arrancar la máquina una vez instalada puede usarse una orden tal como esta  *qemu-system-x86_64 -boot order=c -drive	file=/media/Backup/Isos/discovirtual.img,if=virtio*

### 2.Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.

He usado para este ejercicio VirtualBox, concretamente he instalado una Debian Stable como se aprecia en las imágenes.

![debian1](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/debian1_zpsaigphxyz.png)

![debian2](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/debian2_zpsj5kanvdc.png)

![debian3](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/debian3_zps7zixqafz.png)

### Ejercicio 3: Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con *qemu-system-x86_64 -hda /media/Backup/Isos/discovirtual.img*

Para este ejercicio he usado el benchmark de [Sysbench](http://www.elmundoenbits.com/2013/04/benchmark-I.html#.VoAuSt9vEc9), los pasos para su instalación y ejecución son los siguientes:
- Instalación
```
sudo apt-get install sysbench
```
- Creación del entorno de trabajo
```
sysbench --test=fileio --file-total-size=5G prepare
```
- Ejecución de los tests y resultados
```
sysbench --test=fileio --file-total-size=5G \
       --file-test-mode=rndrw --init-rng=on \
       --max-time=300 --max-requests=0 run
```
- Limpiar el espacio ocupado
```
sysbench --test=fileio --file-total-size=5G cleanup
```

Para probar con paravirtualización `qemu-system-x86_64 -boot order=c -drive file=ubuntu.qcow2,if=virtio`

![instalar](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/instalarsysbench_zpseoivkznx.png)

![preparar](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/preparartest_zpso2pb4urg.png)

![resultados1](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/resultado_zpsw85ntrmr.png)

![clean](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/clean_zpswgdjyziy.png)

Para probar sin paravirtualización `qemu-system-x86_64 -hda ubuntu.qcow2`

![resultado2](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/resultado1_zpsg3ajtl1n.png)





