#Tema 5
##Rafael Lachica Garrido

### Ejercicio 1: Instalar los paquetes necesarios para usar KVM.
[fuente](http://nyacomputing.com/how-to-install-kvm-on-ubuntu-and-run-virtual-machines/).
Instalamos primero cpu-checker:
```
$ sudo apt-get install cpu-checker
[sudo] password for rafaellg8:
Leyendo lista de paquetes... Hecho
Creando árbol de dependencias       
Leyendo la información de estado... Hecho
Los paquetes indicados a continuación se instalaron de forma automática y ya no son necesarios.
  akonadi-backend-mysql akonadi-server consolekit dirmngr icoutils kate-data
```

A continuación, como ha hicimos en el tema 1,comprobamos que está instalado el módulo de KVM, a través del comando **sudo kvm-ok**:
```
rafaellg8@system32:~/Documentos/GII/Cuarto/IV/IV-2015-16$ sudo kvm-ok
INFO: /dev/kvm exists
KVM acceleration can be used
```
[kvm-ok](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/kmv-ok_zpsykwyuztd.png?t=1443563958 "km-ok")


### Ejercicio 2.1: Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS, GALPon Minino, Damn Small Linux, SliTaz y ttylinux.

Dado que KVM es un módulo del kernel, puede que no esté cargado por defecto. Dependiendo del procesador que usemos, lo cargamos con:
```
sudo modprobe kvm-intel
```
Con esto, si no esta ya activado, activamos KVM. En mi caso como mi cpu es Intel Core i3, he puesto intel.

Ahora descargamos y creamos la máquina virtual de [Stilaz](http://www.slitaz.org/en/get/#stable), ya que es la que menos especacio ocupa.
