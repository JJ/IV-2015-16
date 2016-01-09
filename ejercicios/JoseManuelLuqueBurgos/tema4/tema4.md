# Ejercicios Tema 3

## Ejercicio 1
### Instala LXC en tu versión de Linux favorita. Conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.


Comprobamos la versión de los repositorios de Arch con: 'yaourt -Ss lxc'

```
community/lxc 1:1.1.5-3
    Linux Containers
```

Procedemos a instalarla con: `yaourt -S lxc`

```
 jose@tux2duo ⮀ ~ ⮀ yaourt -S lxc
[sudo] password for jose:
resolving dependencies...
looking for conflicting packages...

Packages (4) cgmanager-0.39-2  libnih-1.0.3-2  rsync-3.1.2-1  lxc-1:1.1.5-3

Total Download Size:   0.90 MiB
Total Installed Size:  3.20 MiB

:: Proceed with installation? [Y/n] y
:: Retrieving packages ...
 rsync-3.1.2-1-x86_64                                                         279.4 KiB  1376K/s 00:00 [############################################################] 100%
 libnih-1.0.3-2-x86_64                                                        137.4 KiB   597K/s 00:00 [############################################################] 100%
 cgmanager-0.39-2-x86_64                                                      107.6 KiB   769K/s 00:00 [############################################################] 100%
 lxc-1:1.1.5-3-x86_64                                                         398.0 KiB  1549K/s 00:00 [############################################################] 100%
(4/4) checking keys in keyring                                                                         [############################################################] 100%
(4/4) checking package integrity                                                                       [############################################################] 100%
(4/4) loading package files                                                                            [############################################################] 100%
(4/4) checking for file conflicts                                                                      [############################################################] 100%
(4/4) checking available disk space                                                                    [############################################################] 100%
(1/4) installing libnih                                                                                [############################################################] 100%
(2/4) installing cgmanager                                                                             [############################################################] 100%
(3/4) installing rsync                                                                                 [############################################################] 100%
(4/4) installing lxc                                                                                   [############################################################] 100%
Optional dependencies for lxc
    arch-install-scripts: for archlinux template
    dnsmasq: lxc-net.service [installed]
    lua [installed]
    lua-filesystem: lxc-top
    lua-alt-getopt: lxc-top
```

## Ejercicio 2
### Comprobar qué interfaces puente se han creado y explicarlos.

Creamos el contenedor con la orden: `sudo lxc-create -t ubuntu -n caja-ubuntu`

Tras la instalación nos aparece lo siguiente:

```
Generation complete.
Setting up libdevmapper1.02.1 (2:1.02.48-4ubuntu7.4) ...
Setting up dmsetup (2:1.02.48-4ubuntu7.4) ...
update-initramfs: deferring update (trigger activated)
Processing triggers for libc-bin ...
ldconfig deferred processing now taking place
Processing triggers for initramfs-tools ...
Processing triggers for resolvconf ...
invoke-rc.d: policy-rc.d denied execution of start.
Download complete
Copy /var/cache/lxc/precise/rootfs-amd64 to /var/lib/lxc/ubuntu-box/rootfs ...
Copying rootfs to /var/lib/lxc/ubuntu-box/rootfs ...
Generating locales...
  en_GB.UTF-8... up-to-date
Generation complete.
Creating SSH2 RSA key; this may take some time ...
Creating SSH2 DSA key; this may take some time ...
Creating SSH2 ECDSA key; this may take some time ...
Timezone in container is not configured. Adjust it manually.

##
# The default user is 'ubuntu' with password 'ubuntu'!
# Use the 'sudo' command to run tasks as root in the container.
##

sudo lxc-create -t ubuntu -n ubuntu-box  152.69s user 24.34s system 17% cpu 16:26.51 total

```

Lo arrancamos con: `sudo lxc-start -n ubuntu-box`

Ahora en el host ejecutamos ifconfig y vemos que hay dos nuevos interfaces:

```
lxbr0:
        inet 10.0.3.1  netmask 255.255.255.0  broadcast 0.0.0.0
        inet6 fe80::225:d3ff:fe63:a78e  prefixlen 64  scopeid 0x20<link>
        ether fe:25:d3:63:a7:8e  txqueuelen 1000
        RX packets 6115  bytes 3653012 (3.4 MiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 2998  bytes 486081 (474.6 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

vethSNB9QG:
        ether fe:25:d3:63:a7:8e  txqueuelen 1000
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

```

Uno sirve para que la máquina creada tenga acceso a internet mientras que la segunda sirve para tener acceso entre varias instancias de contenedores.


## Ejercicio 3
#### Crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya.

Con arch he tenido problemas de varios tipos al instalar otras distribuciones así que he desistido, apartir de ahora uso con anfitrión Ubuntu.

```
sudo lxc-create -t debian -n caja-debian
```

Para crearo uno con fedora procedemos de la misma forma:

```
sudo lxc-create -t debian -n caja-fedora
```

## Ejercicio 4
### Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.

Instalamos con `sudo wget https://lxc-webpanel.github.io/tools/install.sh -O - | sudo bash`

La dirección de acceso es "http://localhost:5000/" y los credenciales "admin" "admin"
![lxc web](http://i.imgur.com/FJR12Mc.png)

Desde ahí podemos manipular las cajas creadas, ya sea su estado (iniciar, parar...) así como su configuración

Las opciones de CPU se configuran en el apartado de hardware, siempre y cuando la máquina se encuentre desconectada lógicamente.

## Ejercicio 5
### Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor usando nginx.

Para hacer la comparativa usaremos AB (Apache Benchmark)

Los pasos a seguir para el contenedor son:
 - Arrancar el contenedor lxd:  ``` sudo lxc-start -n caja-ubuntu ```
 - Instalar nginx: ``` sudo apt-get install nginx ```
 - Instalar AB: ``` sudo apt-get install apache2-utils ```

Como vimos en el ejercicio 2, tenemos una dirección ip para interactura con la caja, la usamos para ejecutar contra ella apache Benchmark
 - ```ab -n 2000 -c 1000 http://10.0.3.1/  ```

 ![ab contenedor](http://i.imgur.com/TCZX5XT.png)

Para la jaula realizamos lo siguiente:
 - Nos ayudamos de la herramienta **debootstrap** : ``` debootstrap --arch=i386 lucid /home/jose/jaula http://archive.ubuntu.com/ubuntu ```
 - Hacemos chroot para acceder: ``` sudo chroot /home/jose/jaula ```
 - Montamos */proc* para tener acceso a los útiles de red: ``` mount -t proc proc /proc ```
 - Añadimos los repositorios de nginx en *apt-sources.list*, lo instalamos junto a AB y lanzamos nginx.
 - Volvemos a usar ab, esta vez contra la jaula: ``` ab -n 2000 -c 1000 http://10.0.3.16/ ```

 ![ab jaula](http://i.imgur.com/wtLLkwy.png)

 Asumiendo que en ambos test usamos páginas estáticas, cuyo resultado puede variar en caso de que lo hagamos con otras de
 mayor envergadura los resultados para la jaula son más favorables debido a que la *virtualización* se hace de manera más liviana ya que la jaula aprovecha y dispone de más recursos del anfitrión generalmente.

## Ejercicio 6
### Instalar docker

Lo instalamos con:

``` yaourt -S docker ```

 Configuramos nuestro usuario:

 ``` gpasswd -a jose docker && newgrp docker ```

 Para lanzarlo, primero lanzamos el servicio y luego docker:

  ``` systemctl start docker ```

  ``` sudo docker -d & ```

Para comprobar que está ejecutandose usamos *docker info*:

```
Containers: 0
Images: 0
Server Version: 1.9.1
Storage Driver: devicemapper
 Pool Name: docker-8:1-2104328-pool
 Pool Blocksize: 65.54 kB
 Base Device Size: 107.4 GB
 Backing Filesystem: xfs
 Data file: /dev/loop0
 Metadata file: /dev/loop1
 Data Space Used: 53.74 MB
 Data Space Total: 107.4 GB
 Data Space Available: 29.69 GB
 Metadata Space Used: 606.2 kB
 Metadata Space Total: 2.147 GB
 Metadata Space Available: 2.147 GB
 Udev Sync Supported: true
 Deferred Removal Enabled: false
 Deferred Deletion Enabled: false
 Deferred Deleted Device Count: 0
 Data loop file: /var/lib/docker/devicemapper/devicemapper/data
 Metadata loop file: /var/lib/docker/devicemapper/devicemapper/metadata
 Library Version: 1.02.113 (2015-12-05)
Execution Driver: native-0.2
Logging Driver: json-file
Kernel Version: 4.3.3-2-ARCH
Operating System: Arch Linux (containerized)
CPUs: 2
Total Memory: 3.864 GiB
Name: tux2duo
ID: QU4G:42ET:IFXH:SF6U:LH5G:7I7T:JCEI:DZT3:3MHC:MZL3:VGPJ:N6HK
````

## Ejercicio 7
### Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.

Una vez está corriendo lanzamos:

 - ```sudo docker pull ubuntu ```

```  
Using default tag: latest
latest: Pulling from library/ubuntu

fcee8bcfe180: Pull complete
4cdc0cbc1936: Pull complete
d9e545b90db8: Pull complete
c4bea91afef3: Pull complete
Digest: sha256:b53bb7b0d18842214ac7472c2a8801e8682c247d30f1ba4bab0083a2e2e091ea
Status: Downloaded newer image for ubuntu:latest

```

 - ```sudo docker pull centos```

```  
Using default tag: latest
latest: Pulling from library/centos

fa5be2806d4c: Pull complete
2bf4902415e3: Pull complete
86bcb57631bd: Pull complete
c8a648134623: Pull complete
Digest: sha256:8072bc7c66c3d5b633c3fddfc2bf12d5b4c2623f7004d9eed6aae70e0e99fbd7
Status: Downloaded newer image for centos:latest

```

- ```sudo docker pull mongo```

```
Using default tag: latest
latest: Pulling from library/mongo

c950d63587be: Pull complete
3ba3ba0cdebd: Pull complete
788d70e76e3e: Pull complete
c5c26aead75d: Pull complete
42e04855676a: Pull complete
76abcca5eddc: Pull complete
db55d43af105: Pull complete
fc9de0177f93: Pull complete
c08fd20206bc: Pull complete
d3efe0b8d0e8: Pull complete
4e43baa24ed1: Pull complete
9b527e45167a: Pull complete
6838b2d1001f: Pull complete
c867a3def62e: Pull complete
17647169a815: Pull complete
6293f12cb81c: Pull complete
3e408cde1b7f: Pull complete
cf55d61f5307: Pull complete
Digest: sha256:8453d81cfe34363285a203720bf08b37dcbd622023ea2fe54c0de97d2e257281
Status: Downloaded newer image for mongo:latest

```
Para comprobar las imagenes disponibles usamos *docker images*

```
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
ubuntu              latest              c4bea91afef3        5 days ago          187.9 MB
centos              latest              c8a648134623        2 weeks ago         196.6 MB
mongo               latest              cf55d61f5307        4 weeks ago         316.9 MB

```

Si queremos ejecutar cualquiera de ellas usamos:

``` sudo docker run -i -t <nombre_maquina> /bin/bash ```
