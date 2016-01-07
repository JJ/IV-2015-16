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

Para probar sin paravirtualización `qemu-system-x86_64 -hda ubuntu.qcow2` y se realiza las mismas operaciones de creación del entorno y ejecución de los tests que he comentado antes.

![resultado2](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/resultado1_zpsg3ajtl1n.png)

###Ejercicio 4: Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.

- El primer paso es crear el espacio de almacenamiento:
```
$ qemu-img create -f qcow2 lubuntu.qcow2 8G
```
- Se procede a su instalación igual que en ejercicios anteriores:
```
$ qemu-system-x86_64 -machine accel=kvm -hda lubuntu.qcow2 -cdrom lubuntu.iso -m 1G -boot d
```

- Se accede a la máquina de la siguiente forma:
```
$ qemu-system-x86_64 -machine accel=kvm -hda lubuntu.qcow2 -m 512M -vnc :1
```
- Se procede a instalar *vinagre* mediante:
```
$ sudo apt-get install vinagre
```
- Puede verse el escritorio con vinagre de la siguiente forma:
```
$ vinagre localhost:1
```

![conexionvinagre](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/vinagre_zpsjlkogp2g.png)

- A continuación instalo **ssh** en la máquina Lubuntu:
```
$ sudo apt-get install ssh
```

- Apago la máquina y vuelvo a arrancar, para ello hago un NAT del puerto 2222 de la máquina host al puerto 22 de la invitada:
```
$ qemu-system-x86_64 -machine accel=kvm -hda lubuntu.qcow2 -m 512M -redir tcp:2222::22
```
- Para entrar basta con ejecutar lo siguiente:
```
$ ssh javi@localhost -p 2222
```

![sshlubuntu](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/sshlubuntu_zpsvodhapmx.png)

### Ejercicio 5: Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.

- El primer paso es instalar las herramientas necesarias para hacer uso de azure mediante linea de ordenes:
```
$ sudo apt-get install nodejs-legacy
$ sudo apt-get install npm
$ sudo npm install -g azure-cli
```

![azurecli](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/azurecli_zpstblivsi3.png)

- El siguiente paso es hacer login en azure:
```
$ azure login
```
Esto hace que nos de un enlace web y un password, el cual hay que introducir:

![azurecliver](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/azurecli2_zpstnlg0rht.png)

- El siguiente paso es loguearse en azure y se completa el proceso de login:

![logueo](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/logueoazure_zpsya5wvrkv.png)

- A continuación procedo a ver las imágenes que pueden utilizarse (en mi caso Ubuntu) y a solicitar información sobre alguna imagen:
```
$ azure vm image list
$ azure vm image show b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04-LTS-amd64-server-20140414-en-us-30GB
```
![vmlist](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/vmlist_zps32jew5ek.png)

![vmshow](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/vmshow_zpsakf8fyor.png)

- El siguiente paso es crear la máquina virtual(con la localización "West Europe" da error):
```
$ azure vm create maquina-javi-ubu5 b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04-LTS-amd64-server-20140414-en-us-30GB javi Clave#Javi#1 --location "Central US" --ssh
```

![crearmaquina](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/crearmaquinaubu_zpsfefpvef7.png)

- El siguiente paso es arrancar la máquina y conectar por ssh:
```
$ azure vm start maquina-javi-ubu5
$ ssh javi@maquina-javi-ubu5.cloudapp.net
```

![arranqueyssh](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/arranqueyssh_zpsj2uytdhm.png)

- Los dos siguientes pasos son actualizar el sistema operativo e instalar nginx:
```
sudo apt-get update
sudo apt-get install nginx
```

![instalarnginx](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/instalarnginx_zpsvysi5ora.png)

- Posteriormente se arranca nginx y se abre el puerto 80 de la máquina:
``` 
sudo service nginx start
azure vm endpoint create maquina-javi-ubu5 80 80
```

![nginx](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/nginxstatus_zpsdd9ljdem.png)

![abrirpuertos](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/abrirpuertos_zpsi6kqt0ql.png)

- En el navegador introducir el dominio de la máquina:

![nginxfuncionando](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/nginx_zps2lbpgxpw.png)

- Por último no olvidar apagar la máquina:
```
azure vm shutdown maquina-javi-ubu5
```

![apagar](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/apagar_zpsialecg36.png)

### Ejercicio 6: Usar juju para hacer el ejercicio anterior.

- El primer paso es instalar juju, para ello(añadir el repositorio no es necesario):
```
sudo add-apt-repository ppa:juju/stable
sudo apt-get update && sudo apt-get install juju-core
```
- Posteriormente se inicia juju mediante el comando:
```
juju init
```
Tambien es válido el comando ` juju generate-config`

![jujuinit](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/initjuju_zpsi45r1xcr.png)

- Esto crea un archivo **/home/javi/.juju/environments.yaml** con el siguiente contenido para azure(hay para openstack, amazon, etc):
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
    
        # force-image-name overrides the OS image selection to use a fixed
        # image for all deployments. Most useful for developers.
        #
        # force-image-name: b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-13_10-amd64-server-DEVELOPMENT-20130713-Juju_ALPHA-en-us-30GB
    
        # image-stream chooses a simplestreams stream from which to select
        # OS images, for example daily or released images (or any other stream
        # available on simplestreams).
        #
        # image-stream: "released"
    
        # agent-stream chooses a simplestreams stream from which to select tools,
        # for example released or proposed tools (or any other stream available
        # on simplestreams).
        #
        # agent-stream: "released"
    
        # Whether or not to refresh the list of available updates for an
        # OS. The default option of true is recommended for use in
        # production systems, but disabling this can speed up local
        # deployments for development or testing.
        #
        # enable-os-refresh-update: true
    
        # Whether or not to perform OS upgrades when machines are
        # provisioned. The default option of true is recommended for use
        # in production systems, but disabling this can speed up local
        # deployments for development or testing.
        #
        # enable-os-upgrade: true
```

- A continuación se crea el certificado necesario para que juju conecte con Azure( en Common Name poner Juju, bonita experiencia tuve en SPSI con esto):
```
openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout azure.pem -out azure.pem
openssl x509 -inform pem -in azure.pem -outform der -out azure.cer
chmod 600 azure.pem
```
- Con esto se obtiene los dos certificados necesarios para la conexión:    

![certificado](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/certificado_zpsw9nsz0bi.png)

![certificado2](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/certificado2_zps6bwwhyqc.png)

- Ahora se procede a configurar el archivo environments.yaml:
```
		management-subscription-id: 00000000-0000-0000-0000-000000000000
        management-certificate-path: /home/me/azure.pem
```
- En **management-subscription-id** hay que poner la id que se obtiene de ejecutar `azure account list`
- En **management-certificate-path** se pone la ruta hasta el certificado que se obtuvo en el paso anterior.
- En **storage-account-name** se pone el nombre de almacenamiento obtenido de ejecutar `azure storage account list`
- En **location** se pone la localización anterior.

A continuación se sube el certificado **azure.cer** a la máquina Azure, puede usarse el siguiente enlace para ir directamente a la opción de subir [certificados](https://manage.windowsazure.com/)

![subircertificado](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/subircertificado_zpsinx9smwm.png)

![subircertificado2](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/subircertificado2_zpszglqxovg.png)

![subircertificado3](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/subircertificado3_zpsshfamnp8.png)

- A continuación se ejecuta este comando para trabajar sobre azure:
```
juju switch azure
```
- Con la ejecución del siguiente comando se crea el taper:
```
juju bootstrap
```

![jujuazure](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/jujuazure_zpshrwxpcdj.png)

- El siguiente paso es instalar [nginx](https://jujucharms.com/u/imbrandon/nginx/precise/7)( puede realizarse tambien accediendo a la dirección que nos indica el comando anterior y hacerlo de mánera gráfica):
```
juju deploy cs:~imbrandon/precise/nginx-7
```

![jujunginx](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/jujunginx_zps7a7mlmqm.png)

- El siguiente paso es publicar el servicio:
```
juju expose nginx
```
- Y se comprueba que nginx esta funcionando ejecutando(hay que esperar un poco):
```
juju status
```

![jujustatus](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/jujustatus_zps2wqm8auu.png)

Se accede a la dirección que proporciona el servicio y se ve que efectivamente funciona.

![navegador](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/navegador_zpsqs3kbb0c.png)



### Ejercicio 7: Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.

Se procede a descargar la version 17.3 de [Linux Mint](http://www.linuxmint.com/edition.php?id=204), concretamente la versión Mate de "Rosa".
- Al igual que en el ejercicio 2 se crea el espacio de almacenamiento:
```
$ qemu-img create -f qcow2 lmint.qcow2 10G
```
- Se instala la imagen:
```
$ qemu-system-x86_64 -machine accel=kvm -hda lmint.qcow2 -cdrom linuxmint-17.3-cinnamon-64bit.iso -m 1G -boot d
```

![instalarmint](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/instalarmint_zps0y7xbanq.png)

Otra manera más automatizada es seguir los pasos que se sigue en la página oficial de [Debian](https://wiki.debian.org/VMBuilder):
- Clonar el siguiente repositorio:
```
$ git clone git://git.debian.org/git/pkg-escience/vmbuilder.git
```
- Ejecutar la siguiente orden:
```
./debian-vm-builder kvm lenny --tmp=/var/tmp --mirror http://ftp.de.debian.org/debian --rootpass debian
```

Esto instala una versión Debian Lenny.
