#Ejercicios tema 5


##Ejercicio 1
###Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.
En primer lugar instalo KVM con el comando `sudo apt-get install cpu-checker` y después lo compruebo de las dos formas posibles:

* `sudo kvm-ok`
* `egrep -c '(vmx|svm)' /proc/cpuinfo`

y obtenemos los siguientes resultados:

![KVM](https://www.dropbox.com/s/l86jzei9qx7k9zk/ejr1.1.png?dl=1)



##Ejercicio 2
###1.- Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS (que sirve como soporte para Docker) GALPon Minino, hecha en Galicia para el mundo, Damn Small Linux, SliTaz (que cabe en 35 megas) y ttylinux (basado en línea de órdenes solo).
modprobe: ERROR: could not insert 'kvm_intel': Operation not supported
me da este error tanto en mac como en ubuntu

###2.- Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.
He usado parallels para instalar Slitaz-4.0 que previamente me he descargado del [Sitio Oficial de Slitaz](http://www.slitaz.org/en/)

En primer lugar le he dado la configuracion de tamaño de disco y de número de procesadores que se puede ver en la imagen

![Slitaz con parallels](https://www.dropbox.com/s/ur8u2p2d91cv8hc/ejr2.2.1.png?dl=1)

Y aqui tenemos la máquina de Slitaz arrancada

![Slitaz con parallels](https://www.dropbox.com/s/deslflk6f4ntwht/ejr2.2.2.png?dl=1)



##Ejercicio 3
###Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con



##Ejercicio 4
###Crear una máquina virtual Linux con 512 megas de RAM y entorno gráfico LXDE a la que se pueda acceder mediante VNC y ssh.
Para poder tener el entorno gráfico LXDE me descargo el Sistema Operativo Lubunto-15.10, ya que este lo tiene instalado. Me lo descargo del [Sitio Oficial](https://help.ubuntu.com/community/Lubuntu/GetLubuntu)


##Ejercicio 5
###Crear una máquina virtual ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.
En primer lugar instalo el cliente de azure ejecutando el comando `sudo npm install -g azure-cli`.

Una vez instalado ejecutamos `azure login` el cual nos da un enlace que tenemos que abrir en el navegador y un código que debemos de introducir en esa web para logearnos.

![azure login](https://www.dropbox.com/s/m69zvdm6l86wjoh/ejr5.1.png?dl=1)

Una vez hecho esto y logeandonos en esta web nos muestra un mensaje de que se ha realizado satisfactoriamente

![login ok](https://www.dropbox.com/s/91evbzgzmavzyzr/ejr5.2.png?dl=1)

A continuación creo un sitio web indicándole un nombre. El comando que he ejecutado para ellos ha sido `azure site create --location "West US" maquina-azure-ubuntu-14-ejr5`

![Creo el sitio web](https://www.dropbox.com/s/qc7i56gqzg6bt0t/ejr5.3.png?dl=1)

Comprobamos que efectivamente se ha creado bien entrando desde nuestro navegador a la URL que se nos menciona al crearse

![Verifico la creacion del sitio web](https://www.dropbox.com/s/t1odlaoiufhkrfo/ejr5.4.png?dl=1)

Ahora creo la máquina en el sitio creado anteriormente. Voy a hacer uso de la máquina de Ubuntu 14_04_3 de Azure, para ello ejecuto el comando: `azure vm create maquina-azure-ubuntu-14-ejr5 b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04_3-LTS-amd64-server-20151218-en-us-30GB nacho Nacho@azure1 --location "Central US" --ssh`

![Creo la maquina](https://www.dropbox.com/s/y4g9v9uuhzs6d6n/ejr5.5.png?dl=1)

Nos conectamos a la máquina por ssh 

![Nos conectamos a la máquina por ssh](https://www.dropbox.com/s/iou8pmalfn3ftsi/ejr5.6.png?dl=1)

Y ahora ejecuto los siguientes comandos para instalar nginx:

* sudo apt-get update
* sudo apt-get install nginx
* sudo fuser -k 80/tcp
* sudo service nginx start

Nos desconectamos de ssh y ejecutamos `azure vm endpoint create maquina-azure-ubuntu-14-ejr5 80 80`

![abrimos puerto 80](https://www.dropbox.com/s/57l2nn53o020u18/ejr5.7.png?dl=1)

Y por último nos vamos a nuestro navegador y comprobamos que nginx se ha instalado correctamente

![comprobamos nginx](https://www.dropbox.com/s/we3wlcpfyp0fzwk/ejr5.8.png?dl=1)

##Ejercicio 6
###Usar juju para hacer el ejercicio anterior.
Para instalar Juju sigo los pasos del [tutorial se nos indica en el enunciado](https://jujucharms.com/docs/stable/getting-started) 

En primer lugar instalo Juju con el comando `brew install juju`

![instalo juju](https://www.dropbox.com/s/5g7359jukuc10nh/ejr6.1.png?dl=1)

A continuación ejecuto el comando `juju init` que me crea el archivo /Users/joseignaciorecuerdacambil/.juju/environments.yaml

![juju init](https://www.dropbox.com/s/kmg3lj7t3inlkmi/ejr6.2.png?dl=1)


##Ejercicio 7
###Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.

En primer lugar descargo el Sistema Operativo desde su [página oficial](http://www.linuxmint.com)

Y lo instalo con Parallels dándole la siguiente configuración

![Configuracion linux mind](https://www.dropbox.com/s/uiopkryylmbiowq/ejr7.1.png?dl=1)

Aquí se puede ver funcionando Linux Mint

![Linux Mint funcionando](https://www.dropbox.com/s/ofqht33aarpgrh8/ejr7.2.png?dl=1)

