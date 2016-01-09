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
![lxc web](http://imgur.com/FJR12Mc)

Desde ahí podemos manipular las cajas creadas, ya sea su estado (iniciar, parar...) así como su configuración

Las opciones de CPU se configuran en el apartado de hardware, siempre y cuando la máquina se encuentre desconectada lógicamente.
