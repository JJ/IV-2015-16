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

### Ejercicio 5: Crear una máquina virtual ubuntu en Azure e instalar en ella un servidor nginx para poder acceder mediante web.

Hay dos formas de hacer esto, o mediante el panel de control web o por línea de órdenes. En este caso lo voy a hacer por linea de comandos que es la que nos interesa en esta asignatura:

Primero empezamos instalando los tres siguientes paquetes:

```
sudo apt-get install nodejs-legacy
sudo apt-get install npm
sudo npm install -g azure-cli
```

Ahora vamos a conectar con nuestra cuenta de Azure:

- Antes de todo deberíamos de hacer `azure config mode asm`.

- Creamos la configuración pública para nuestra cuenta: `azure account download`

![Creación de claves Azure](https://www.dropbox.com/s/3lcu5ns8pkz28wm/creacionClavesAzure.PNG?dl=1)

- Descargamos el archivo en el enlace de la captura anterior:

![Obtención de claves Azure](https://www.dropbox.com/s/cxu5anvhz4f312s/clavesAzure.PNG?dl=1)

- Importamos el pase de Azure que nos hemos descargado: `azure account import <file location>`. En "file location" ponemos la ubicación del archivo descargado.

![Importar pase de Azure](https://www.dropbox.com/s/ofm30xuwoy5cwcf/ImportamospaseAzure.PNG?dl=1)

- Creamos el sitio web con el comando `azure site create --location "West US" <web site>`. En "web site" ponemos el nombre que queremos que tenga la página que acceda a nuestra máquina virtual.

![Creación del sitio web](https://www.dropbox.com/s/w5uysgzon8dd11i/creacionwebAzure.PNG?dl=1)

Ya tenemos nuestra máquina en marcha:

![Acceso web a la máquina Azure](https://www.dropbox.com/s/7l32ag6dmcwz8eq/sitiowebFuncionando.PNG?dl=1)

Ahora vamos a instalar Ubuntu en ella:

- Buscamos la imagen que queremos de entre las disponibles: `azure vm image list westus ubuntuserver`

![Imágenes dispnibles en Azure](https://www.dropbox.com/s/wxri8ctmgog25sz/imagenesAzure.PNG?dl=1)

- Instalamos la imagen en la máquina virtual: `azure vm create <web site> b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04_3-LTS-amd64-server-20151218-en-us-30GB <user> <password> --location "North Europe" --ssh`

![Maquina creada con Ubuntu](https://www.dropbox.com/s/9kumm7jq9hg7y3x/maquinacreadaAzure.png?dl=1)

Ya podemos arrancarla con la orden `azure vm start pruebaiv-romi`:

![Arrancar máquina en Azure](https://www.dropbox.com/s/7z6jw3goxpn2npe/arrancarmaquinaAzure.PNG?dl=1)

Y ahora nos conectamos a la máquina por SSH: `ssh romi@pruebaiv-romi.cloudapp.net`

![Conexión a la maquina por ssh](https://www.dropbox.com/s/dgpsbk4oqcgl1d0/conectarAzure.PNG?dl=1)

Ahora procedemos a hacer una instalación de nginx como ya hemos hecho otras veces:

- `sudo apt-get update`
- `sudo apt-get install nginx`
- `sudo fuser -k 80/tcp`
- `sudo service nginx start`

Antes de acceder al servicio web, debemos abrir el puerto 80 para nginx:

 `azure vm endpoint create <web site> 80 80`
 
![Abrir puertos en Azure](https://www.dropbox.com/s/glqjxy38mxpmcyv/abrirpuertosAzure.PNG?dl=1)

Ya tenemos acceso a nuestro servidor:

![Servidor Nginx funcionando](https://www.dropbox.com/s/r1bdhg2zk53t4ka/servidorNginxAzure.PNG?dl=1)

Ahora para no seguir pagando, voy a apagar la máquina con el comando `azure vm shutdown pruebaiv-romi`:

![Apagando la maquina de Azure](https://www.dropbox.com/s/zlnnhl9aivkxamo/apagarMaquinaAzure.PNG?dl=1)

### Ejercicio 6: Usar juju para hacer el ejercicio anterior.

Vamos a empezar instalando juju como viene en la página de [instalación](https://jujucharms.com/docs/stable/getting-started).

- `sudo add-apt-repository ppa:juju/stable`
- `sudo apt-get update && sudo apt-get install juju-core` 

Ya podemos iniciar juju con el comando `juju init` o `juju generate-config`: 

![Juju init](https://www.dropbox.com/s/pgzudjm2f3dalos/initJuju.PNG?dl=1)

Esto creará el fichero environments.yaml en ~/.juju con el siguiente contenido sobre Azure:

```
# https://juju.ubuntu.com/docs/config-azure.html
azure:
	type: azure

	# location specifies the place where instances will be started,
	# for example: West US, North Europe.
	#
	location: West US

	# The following attributes specify Windows Azure Management
	# information. See:
	# http://msdn.microsoft.com/en-us/library/windowsazure
	# for details.
	#
	management-subscription-id: 00000000-0000-0000-0000-000000000000
	management-certificate-path: /home/me/azure.pem

	# storage-account-name holds Windows Azure Storage info.
	#
	storage-account-name: abcdefghijkl
```

Creamos el certificado necesario para que juju conecte con Azure con los siguientes comandos. Se aconseja poner "Juju" como "Common Name" al generar el certificado, para poder reconocerlo posteriormente.

- `openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout azure.pem -out azure.pem`
- `openssl x509 -inform pem -in azure.pem -outform der -out azure.cer`
- `chmod 600 azure.pem`

Esto nos creará dos ficheros, uno "azure.cer" y otro "azure.pem".

Ahora vamos a editar el fichero environments.yaml, introduciendo en él los datos de nuestra cuenta de Azure:

- *management-subscription-id*, será el Identificador de suscripción, que podemos obtener con: 
	`azure account list`

- *management-certificate-path*, ponemos el camino hasta el fichero "azure.pem" creado, que en mi caso es:
	`/home/romi/azure.pem`
	
- *storage-account-name*, que es el nombre del almacenamiento, obtenido con:
	`azure storage account list`
	
- *location*, donde pondremos la ubicación del almacenamiento de Azure, que se consigue también con el comando anterior.	
	
Ahora vamos a subir el nuevo certificado a nuestra cuenta de Azure. 

Pinchamos en Settings > Managements certificates > Upload:

![Subir certificado a Azure](https://www.dropbox.com/s/k0bgvobukeuoxq0/certificadoAzure.PNG?dl=1)

Y seleccionamos el archivo "azure.cer". Una vez terminemos, podremos pasar a crear el táper con Juju.

Ejecutamos el siguiente comando para trabajar sobre Azure:

 `juju switch azure`
 
Cramos el táper con:

 `juju bootstrap`
 
![Creamos el taper de juju](https://www.dropbox.com/s/p8rg4ehkqdtkwq5/taperJuju.PNG?dl=1)

Como podemos ver, este proceso instala paquetes básicos para el táper y lo prepara para poder hacer uso de él.

Ahora pasamos a instalar Nginx con:

 `juju deploy cs:~imbrandon/precise/nginx-7`

Y ahora publicamos el servicio:

 `juju expose nginx`
 
Ya podemos comprobar que nginx está funcionando. Con `juju status` obtenemos esto:

![Juju status](https://www.dropbox.com/s/1w7xgle9w80w6po/jujuStatus.PNG?dl=1)

Si accedemos a la public-adress que viene al final del servicio nginx mediante un navegador web, podremos ver que el servidor está funcionando.

### Ejercicio 7: Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.

Primero vamos a instalar todo lo necesario:

 `sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils virt-manager`
 
Nos descargamos la ISO de la página de descargas de [Linux Mint](http://www.linuxmint.com/download.php).

Creamos almacenamiento virtual para la máquina virtual:

 `dd if=/dev/zero of=LM_test_os.image bs=1M count=10240`

Y ahora instalamos la imagen descargada en el archivo creado, que funcionará como un disco duro:

 `kvm -cdrom Downloads/linuxmint-17.3-cinnamon-64bit.iso.part -m 1g -hda LM_test_os.image`
 
Estos dos últimos pasos se podrían hacer gráficamente con Virtual Machine Manager (virt-manager):

![Linux Mint con Virt-manager](https://www.dropbox.com/s/2go1wa3oji2qo3d/virt-manager.PNG?dl=1)
