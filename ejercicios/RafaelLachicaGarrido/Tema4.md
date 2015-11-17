#Tema 4 - Virtualización ligera usando contenedores
##Rafael Lachica Garrido

##Ejercicio 1 - Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.

Para instalar lo hacemos a través de apt-get:
```
rafaellg8@system32:~/Documentos/GII/Cuarto/IV/IV-2015-16/ejercicios/RafaelLachicaGarrido$ sudo apt-get install lxc
```
Comprobamos que la versión es mayor a la 1.0:
![imagenLXC-Version](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-11-17%20132333_zpswkvv3c99.png)

Comprobamos la configuración establecida esté todo correcto:
![imagen](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-11-17%20133408_zps1racbchq.png)

##Ejercicio 2 - Comprobar qué interfaces puente se han creado y explicarlos.

Instalamos la caja con ubuntu:
```
rafaellg8@system32:~$ sudo lxc-create -t ubuntu -n ubuntu-caja
Checking cache download in /var/cache/lxc/precise/rootfs-amd64 ... 
Installing packages in template: ssh,vim,language-pack-en,language-pack-es
Downloading ubuntu precise minimal ...
```