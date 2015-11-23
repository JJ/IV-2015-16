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

Termina y nos da los datos para acceder:
```
##
# The default user is 'ubuntu' with password 'ubuntu'!
# Use the 'sudo' command to run tasks as root in the container.
##
```

Accedemos y arrancamos la caja:
```
 sudo lxc-start -n ubuntu-caja
```


Comprobamos la configuración de las interfaces de red:
```
ubuntu@ubuntu-caja:~$ ifconfig
eth0      Link encap:Ethernet  direcciónHW 00:16:3e:ac:d6:c4  
          Direc. inet:10.0.3.67  Difus.:10.0.3.255  Másc:255.255.255.0
          Dirección inet6: fe80::216:3eff:feac:d6c4/64 Alcance:Enlace
          ACTIVO DIFUSIÓN FUNCIONANDO MULTICAST  MTU:1500  Métrica:1
          Paquetes RX:42 errores:0 perdidos:0 overruns:0 frame:0
          Paquetes TX:22 errores:0 perdidos:0 overruns:0 carrier:0
          colisiones:0 long.colaTX:1000 
          Bytes RX:5769 (5.7 KB)  TX bytes:2284 (2.2 KB)

lo        Link encap:Bucle local  
          Direc. inet:127.0.0.1  Másc:255.0.0.0
          Dirección inet6: ::1/128 Alcance:Anfitrión
          ACTIVO BUCLE FUNCIONANDO  MTU:65536  Métrica:1
          Paquetes RX:0 errores:0 perdidos:0 overruns:0 frame:0
          Paquetes TX:0 errores:0 perdidos:0 overruns:0 carrier:0
          colisiones:0 long.colaTX:0 
          Bytes RX:0 (0.0 B)  TX bytes:0 (0.0 B)
```

Tiene interfaces normales como cualquier PC.
Probamos ahora nuestra interfaces locales, de nuestro PC local a ver si han sido modificadas:

![imagenIfconfig](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-11-17%20141323_zpsqasmqost.png)

Vemos que nos crea la interfaz nueva de lxcbr, que la usa para que nos podamos comunicar desde el contenedor con internet.

##Ejercicio 3: Crear y ejecutar un contenedor basado en Debian.
##En general, crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya.
Como ya he instalado el contenedor de ubuntu, crearé otro de **cirros**:
```
rafaellg8@system32:~$ sudo lxc-create -t cirros -n cirrosBox
--2015-11-23 18:42:31--  http://download.cirros-cloud.net/0.3.4/cirros-0.3.4-x86_64-lxc.tar.gz
Resolviendo download.cirros-cloud.net (download.cirros-cloud.net)... 69.163.241.114
Conectando con download.cirros-cloud.net (download.cirros-cloud.net)[69.163.241.114]:80... conectado.
Petición HTTP enviada, esperando respuesta... 200 OK
```

##Ejercicio 4:
### a) Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.
### b)Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.
Seguimos este tutorial de lxc para instalarlo ![lxc-webpage](https://lxc-webpanel.github.io/install.html).

Ejecutamos como superusuario la orden:
```
wget https://lxc-webpanel.github.io/tools/install.sh -O - | bash
```
Esto descarga y ejecuta el script. Nos sale la instalación:
```
root@system32:/home/rafaellg8#  wget https://lxc-webpanel.github.io/tools/install.sh -O - | bash
--2015-11-23 18:50:01--  https://lxc-webpanel.github.io/tools/install.sh
Resolviendo lxc-webpanel.github.io (lxc-webpanel.github.io)... 23.235.43.133
Conectando con lxc-webpanel.github.io (lxc-webpanel.github.io)[23.235.43.133]:443... conectado.
Petición HTTP enviada, esperando respuesta... 200 OK
Longitud: 2678 (2,6K) [application/x-sh]
Grabando a: “STDOUT”

100%[===============================================================================================================================>] 2.678       --.-K/s   en 0s      

2015-11-23 18:50:02 (200 MB/s) - escritos a stdout [2678/2678]

 _     __   _______  __          __  _       _____                 _ 
| |    \ \ / / ____| \ \        / / | |     |  __ \               | |
| |     \ V / |       \ \  /\  / /__| |__   | |__) |_ _ _ __   ___| |
| |      > <| |        \ \/  \/ / _ \ '_ \  |  ___/ _` | '_ \ / _ \ |
| |____ / . \ |____     \  /\  /  __/ |_) | | |  | (_| | | | |  __/ |
|______/_/ \_\_____|     \/  \/ \___|_.__/  |_|   \__,_|_| |_|\___|_|


Adding /etc/init.d/lwp...
Done
Starting server...done.
Connect you on http://your-ip-address:5000/

```
Ahora abrimos ```localhost:5000``` en el navegador y tenemos nuestras opciones de lxc y arrancamos nuestras cajas:
**Nota** usuario y contraseña admin.
[box](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-11-23%20190707_zpsmvepq92l.png)

b) Restringir recursos:
Para ello paramos las máquinas primero y después elegimos en cada contenedor los recursos, yo por ejemplo, como en local tengo ubuntu y después hay que comparar, tocaré los recursos de ubuntu:
[boxsetting](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-11-23%20191502_zps2fpnopdn.png)

En mi caso he ajustado sólo 1 GB para la memoria RAM, y que funcione sólo con 2 de los 4 núcleos.

##Ejercicio 5. Comparar servidores usando nginx entre jaulas y contenedores.
Para crear una jaula usaré el software que ya me viene instalado en ubuntu llamado **debootstrap**. He usado el siguiente enlace para crearlas: [fuente](https://help.ubuntu.com/community/BasicChroot)
Procedemos a crear la jaula:
1. ```sudo debootstrap --arch=amd64 lucid /home/jaulas/lucid/ http://archive.ubuntu.com/ubuntu```