### Ejercicio 1: Instalar los paquetes necesarios para usar KVM. Ya lo hicimos en el primer tema, pero vamos a volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.

Compruebo que mi sistema es apto como se muestra en la siguiente figura:
![puedo acelerar por hardware](http://i62.tinypic.com/vcytu9.png)


### Ejercicio 2.1: Crear varias máquinas virtuales con algún sistema operativo libre tal como Linux o BSD. Si se quieren distribuciones que ocupen poco espacio con el objetivo principalmente de hacer pruebas se puede usar CoreOS, GALPon Minino, Damn Small Linux, SliTaz y ttylinux.

La siguiente captura es de SliTaz:

![SliTaz](https://www.dropbox.com/s/braae7elkgbduoc/SliTaz.png?dl=1)

La siguiente captura es de Ubuntu:

![ubuntu](https://www.dropbox.com/s/z8r4hnk7ahrplc9/ubuntu.png?dl=1)


### Ejercicio 2.2: Hacer un ejercicio equivalente usando otro hipervisor como Xen, VirtualBox o Parallels.

a continuación se muestran diferentes máquinas virtuales que tengo instaladas con parallels:
![centro de control de parallels](https://www.dropbox.com/s/mn7qpfa5tu4p1mp/parallels.png?dl=1)


### Ejercicio 5: Crear una máquina virtual ubuntu en Azure e instalar en ella un servidor nginx para poder acceder mediante web.

Primero instalamos y configuramos la herramienta azure en local para poder manejar azure desde la terminal local:

```
sudo apt-get install nodejs-legacy
sudo apt-get install npm
npm install-g  azure-cli
azure config mode asm
```
Ahora nos conectamos con nuestra cuenta e introducimos los siguientes comandos para continuar:

```
azure login
azure account download
azure account import
```
Una vez hecho esto, creamos la máquina virtual con la siguiente orden:

```
azure vm create NOMBREMÁQUINA b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04_3-LTS-amd64-server-20151218-en-us-30GB USUARIO CONTRASEÑA --location "Central US" --ssh
```
Ahora nos conectamos a la máquina virtual por ssh para instalar nginx:

```
ssh apozo@baresmachine.cloudapp.net
sudo apt-get update
sudo apt-get install nginx
sudo fuser -k 80/tcp
sudo service nginx start
```
Ahora abrimos el puerto 80 con la herramienta azure desde local.

```
azure vm endpoint create baresmachine 80 80

```
Se puede observar que el proceso anterior ha tenido éxito con la siguiente captura:

![nginx funcionando en baresmachine](https://www.dropbox.com/s/l27ljqr7i1wawde/ej5.png?dl=1)


### Ejercicio 7: Instalar una máquina virtual con Linux Mint para el hipervisor que tengas instalado.


La siguiente captura muestra Linux Mint funcionando con el hipervisor Parallels:

![mint](https://www.dropbox.com/s/lt8nj5kzaa48vrm/mint.png?dl=1)
