# Ejercicios de Rubén Martín Hidalgo
## Tema 5
### Ejercicio 1: Instalar los paquetes necesarios para usar KVM. Ya lo hicimos en el primer tema, pero vamos a volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.

1. Primero instalamos el paquete kvm-ok con el comando: `sudo apt-get install cpu-checker`

2. Ejecutamos `sudo kvm-ok` ó `egrep -c '(vmx|svm)' /proc/cpuinfo` para averiguar si está instalado el módulo.

![Comprobación módulo kvm](https://www.dropbox.com/s/7snrxi4sweozfkg/kvm-ok.PNG?dl=1)

![Comprobación en /proc/cpuinfo](https://www.dropbox.com/s/igxc4zryo1uezn3/Comprobar%20KVM.PNG?dl=1)

Como podemos ver nos sale 0, lo cual significa que nuestra CPU no soporta virtuación de KVM.

### Ejercicio 2.1: Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS, GALPon Minino, Damn Small Linux, SliTaz y ttylinux.

Comenzamos activando KVM con: `sudo modprobe kvm-intel`

Primero vamos a crear una máquina virtual con [SliTaz](http://www.slitaz.org/en/):

- Descargamos una imagen estable de la [página web oficial](http://www.slitaz.org/en/get/#stable).

- Creamos un disco duro virtual en formato QCOW2: `qemu-img create -f qcow2 fichero-cow.qcow2 200M` 

![Creacion del fichero QCOW2](https://www.dropbox.com/s/b0mmrhvlc9cikus/ficheroQcow2.PNG?dl=1)

- Instalamos el sistema con el fichero de almacenamiento virtual creado y la ISO descargada, usando KVM mediante: `qemu-system-x86_64 -hda fichero-cow.qcow2 -cdrom slitaz-4.0.iso`

![Instalando Slitaz](https://www.dropbox.com/s/rehtkqqnj5145eq/InstalandoSlitaz.PNG?dl=1)

- Una vez instalado, esta se ejecuta automáticamente. En caso de necesitar iniciarlo en cualquier otro momento, deberemos hacer `qemu-system-x86_64 -hda fichero-cow.qcow2`. En mi caso al ser una versión "Live", no podremos arrancarlo ya que no se instala. 

![Slitaz funcionando](https://www.dropbox.com/s/jmo0zfe3b7minn4/Slitaz_funcionando.PNG?dl=1)

Del resto de opciones que tenemos, CoreOs se instala sobre contenedor Docker o en una máquina virtual de Amazon EC2. TtyLinux ya no ofrece soporte. Me he decantado por probar [GALPon Minino](http://minino.galpon.org/en):

- Descargamos la imagen de la [página web oficial](http://minino.galpon.org/es/descargas), en mi caso la versión "Ártabros 2.1 minimal".

![Descargar versión Artabros](https://www.dropbox.com/s/6grj8n4bijtcc32/MVGalpon.PNG?dl=1)

- En este caso necesitamos crear un fichero de almacenamiento más grande: `qemu-img create -f qcow2 fichero-cow2.qcow2 1G`

- Ahora instalamos el sistema operativo en la máquina virtual: `qemu-system-x86_64 -hda fichero-cow2.qcow2 -cdrom minino-artabros-2.1_minimal.iso`

![Instalando Artabros](https://www.dropbox.com/s/ic9j647ji53ec1b/ArtabrosInstalando.PNG?dl=1)

Este es el sistema de Artabros funcionando:

![Artabros funcionando](https://www.dropbox.com/s/b5vmmdwyfmacmqg/minino%20Funcionando.PNG?dl=1)

### Ejercicio 2.2: Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.

Yo suelo utilizar [VirtualBox](https://www.virtualbox.org/) como hipervisor. Para ello debes seguir los siguientes pasos:

1. Descargamos el programa de su [web oficial](https://www.virtualbox.org/wiki/Downloads).

2. También podemos instalarlo directamente sobre Linux con el comando: `sudo apt-get install virtualbox-5.0 dkms`

3. Abrimos el programa, y esta es la pantalla principal que nos encontramos:

![Pantalla inicio VirtualBox](https://www.dropbox.com/s/2yflzouol1w2jyu/Virtualbox-Interfaz.PNG?dl=1)

Para crear una máquina virtual, damos en "Nueva" y luego configuraremos algunos parámetros como los siguientes:

- Memoria RAM:

![Memoria RAM en VirtualBox](https://www.dropbox.com/s/2gv6oi81acmimjj/virtualBox-Memoria.PNG?dl=1)

- Procesadores:

![Procesadores en VirtualBox](https://www.dropbox.com/s/mhv70fceopzdgtp/Virtualbox-Procesadores.PNG?dl=1)

- Almacenamiento: 

![Almacenamiento en VirtualBox](https://www.dropbox.com/s/dye92zi95lm7psc/Virtualbox-Discoduro.PNG?dl=1)

Y esta es mi máquina de Ubuntu Server funcionando:

![VirtualBox funcionando con Ubuntu Server](https://www.dropbox.com/s/rsfn7v96lzosfbj/virtualBox_Funcionando.PNG?dl=1)

### Ejercicio 3: Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con qemu-system-x86_64 -hda /media/Backup/Isos/discovirtual.img.

El código que he creado para el benchmark es el siguiente, escrito en C++:

```
#include <iostream> 
#include <fstream> 
#include <cstdio> 
#include <ctime> 
 
using namespace std;

 
int main () {
	double inicio, final, tamanio_archivo; 
    ifstream ficheroEntrada;
    string nombre;
    string frase;
 
    cout << "Dime el nombre del fichero: ";
    getline(cin,nombre);

	std::clock_t start, end; 

	inicio = ficheroEntrada.tellg(); 
	ficheroEntrada.seekg(0, ios::end); 
	final = ficheroEntrada.tellg(); 
	ficheroEntrada.close(); // Ya que nos hemos colocado al final o bien podemos cerrar el fichero y abrirlo de nuevo o colocarnos de nuevo al comienzo del fichero 
 
	tamanio_archivo = (final-inicio)/(1024*1024); // Pasamos los datos a MegaBytes 
	ofstream fichero_salida("f2"); 
	start= std::clock(); 
 

    ficheroEntrada.open ( nombre.c_str() , ios::in);
    if (ficheroEntrada.is_open()) {

        while (! ficheroEntrada.eof() ) {
            getline (ficheroEntrada,frase);
			fichero_salida << frase;
        }

        ficheroEntrada.close();
    }
    else cout << "Fichero inexistente o faltan permisos para abrirlo" << endl;  
   
	end = std::clock(); 

	double tiempo_total = (end-start)/(double) CLOCKS_PER_SEC;  
 
	cout << "\nTiempo transcurrido : " << tiempo_total << " segundos" << endl; 
	cout << "Tamaño del fichero : " << tamanio_archivo << " MegaBytes" << endl; 
	cout << "\nVelocidad de lectura/escritura : " << tamanio_archivo/tiempo_total << " MB/s\n" << endl; 
	
	ficheroEntrada.close(); 
	fichero_salida.close();
	
    return 0;
}
 
```

Compilamos el programa con la orden `g++ -o benchmark benchmark.cpp` y ejecutamos con `./benchmark`.

Para arrancar la máquina virtual en modo normal, lo hacemos con `qemu-system-x86_64 -hda fichero-cow2.qcow2`.

Para hacerlo usando paravirtualización es con el comando `qemu-system-x86_64 -boot order=c -drive file=fichero-cow2.qcow2,if=virtio`.

### Ejercicio 4: Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.

Voy a usar Lubuntu que viene con el entorno gráfico LXDE ya instalado. 

Descargamos la imagen del sistema de la [web oficial](https://help.ubuntu.com/community/Lubuntu/GetLubuntu).

![Descargar la imagen](https://www.dropbox.com/s/0dij4mb3v9h9vnv/descargaLubuntu.PNG?dl=1)

Creamos primero el almacenamiento virtual: `qemu-img create -f qcow2 lubuntu.img 8G`

![Creacion del almacenamiento virtual](https://www.dropbox.com/s/9vccqrw8p7olg1q/almacenamientoVirtual.PNG?dl=1)

Iniciamos la instalación del SO en la máquina virtual: `qemu-system-x86_64 -hda lubuntu.img -cdrom /home/romi/Downloads/lubuntu-15.10-desktop-amd64.iso -m 512M`

![Instalando Lubuntu](https://www.dropbox.com/s/bpvfn4a43a1af73/maquinaLubuntu.PNG?dl=1)

Arrancamos la máquina virtual mediante servidor VNC: `qemu-system-i386 -hda lubuntu.img vnc :1`

![Maquina arrancada en servidor VNC](https://www.dropbox.com/s/ql15bh2ps1q1yjf/maquinaVNC.PNG?dl=1)

Para poder conectar a la máquina, descargamos primero un cliente VNC, en mi caso Vinagre: `sudo apt-get install vinagre`

Conectamos con `vinagre localhost:5901`. El puerto de VNC es el 5900, le añadimos 1 que es por donde añadimos la máquina virtual.

Si preferimos conectar por SSH en vez de VNC, primero redireccionamos el puerto: `qemu-system-x86_64 -boot order=c -drive file=lubuntu.img,if=virtio -m 512M -name lubuntu -redir tcp:2222::22`. La opción -name indica el nombre de usuario a usar.

Y conectamos por ssh: `ssh -p 2222 lubuntu@localhost`.
