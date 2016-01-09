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

Ejercicio 2: Comprobar qué interfaces puente se han creado y explicarlos.
