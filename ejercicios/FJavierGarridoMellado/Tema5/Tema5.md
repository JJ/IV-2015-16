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

