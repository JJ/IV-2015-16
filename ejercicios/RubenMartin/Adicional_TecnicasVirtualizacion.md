# Ejercicios de Rubén Martín Hidalgo
## Tema Adicional: Técnicas de virtualización
### Ejercicio 1: Crear un espacio de nombres y montar en él una imagen ISO de un CD de forma que no se pueda leer más que desde él.

1. Creamos el espacio de nombres: `sudo unshare -m /bin/bash`. La opción -m indica que el espacio de nombres es de tipo montaje. Desde ese instante estamos trabajando como root dentro de dicho namespace. 

2. Creamos la carpeta de montaje dentro de /mnt: `mkdir /mnt/ISO`

3. Montamos la imagen ISO en dicha carpeta: `mount -o loop disk.iso /mnt/ISO`

Aquí tenemos el ejemplo que he realizado, donde se puede ver que solo dentro del espacio de nombres se puede acceder a la imagen montada:

![Creación de espacio de nombres de montaje](https://www.dropbox.com/s/sgb53q7mt3gopop/espaciodenombres.PNG?dl=1)

### Ejercicio 2.1: Mostrar los puentes configurados en el sistema operativo.

1. Instalamos el paquete de "bridge-utils" con: `sudo apt-get install bridge-utils`

2. Luego solo tenemos que ejecutar `brctl show` para ver los puentes de red de nuestro sistema.

Estos son mis puentes de red:

![Puentes de red en mi sistema](https://www.dropbox.com/s/9kybz5mct0g8m2o/puentesRed2.PNG?dl=1)

Se puede ver que tengo los puentes creados para docker, lxc y virtualbox.

### Ejercicio 2.2: Crear un interfaz virtual y asignarlo al interfaz de la tarjeta wifi, si se tiene, o del fijo, si no se tiene.

1. Creamos el puentes con `sudo brctl addbr puente`.

2. Y lo añadimos a la interfaz del wifi: `brctl addif puente wlan0`

Si en vez de usar la interfaz wifi queremos una fija, ponemos eth0 donde pone wlan0.

### Ejercicio 3.1: Usar debootstrap (o herramienta similar en otra distro) para crear un sistema mínimo que se pueda ejecutar más adelante.

1. Instalamos debootstrap: `sudo apt-get install debootstrap`

2. Creamos la jaula con `sudo debootstrap --arch=amd64 lucid /home/jaulas/lucid/ http://archive.ubuntu.com/ubuntu`

Mi jaula con el sistema Lucid:

![Jaula con Lucid](https://www.dropbox.com/s/hmtr8oy56fgu9zi/jaulaLucid.PNG?dl=1)

### Ejercicio 3.2: Experimentar con la creación de un sistema Fedora dentro de Debian usando Rinse.

1. Instalamos primero Rinse con `sudo apt-get install rinse`.

2. Buscamos la distribución fedora en la lista de disponibles: `rinse --list-distributions` 

![Distribuciones de Rinse](https://www.dropbox.com/s/r7olcbrnmcxusp3/distribucionesRinse.PNG?dl=1)

3. Creamos la carpeta de la jaula: `sudo mkdir -p /home/jaulas/fedora`. Con la opción -p crea las carpetas intermedias.

4. Descargamos e instalamos el sistema fedora en la jaula con `sudo rinse --arch=amd64 --distribution fedora-core-6 --directory /home/jaulas/fedora`.

![Jaula con Fedora funcionando](https://www.dropbox.com/s/ihasescn79uae7w/jaulaFedora.PNG?dl=1)

### Ejercicio 4: Instalar alguna sistema debianita y configurarlo para su uso. Trabajando desde terminal, probar a ejecutar alguna aplicación o instalar las herramientas necesarias para compilar una y ejecutarla.

1. Entramos a la jaula creada en el ejercicio 3.1: `sudo chroot /home/jaulas/lucid`

2. Montamos el filesystem virtual /proc e instalamos el paquete de idioma español para corregir algunos errores dentro de la jaula: `mount -t proc proc /proc && apt-get install language-pack-es`

3. Instalamos un editor: `sudo apt-get install nano`

4. Creamos un programa simple para Python, por ejemplo hola.py con el siguiente contenido: `print "hola mundo"`

5. Ejecutamos el programa: `python hola.py`

![Programa Python funcionando en la jaula](https://www.dropbox.com/s/yrbrzkoy28536hq/holamundoEnjaula.PNG?dl=1)

### Ejercicio 5: Instalar una jaula chroot para ejecutar el servidor web de altas prestaciones nginx.

1. Entramos a la jaula: `sudo chroot /home/jaulas/lucid`

2. Actualizamos paquetes: `sudo apt-get update`

3. Instalamos Nginx: `sudo apt-get install nginx`

4. Dejamos libre el puerto 80 con `sudo fuser -k 80/tcp`. Este comando se ejecuta fuera de la jaula.

5. Iniciamos el servicio de Nginx: `sudo service nginx start`

6. Instalamos Curl para poder leer páginas webs: `sudo apt-get install curl`

7. Comprobamos que el servidor está en marcha: `curl localhost`. También se puede hacer desde nuestro navegador web del sistema anfitrión:

![Nginx funcionando con curl](https://www.dropbox.com/s/c1fx63x4pyloo78/nginxChroot.PNG?dl=1)

![Nginx funcionando con navegador web](https://www.dropbox.com/s/a9s8er597l70n0x/nginxfuncionando.PNG?dl=1)

### Ejercicio 6: Crear una jaula y enjaular un usuario usando 'jailkit', que previamente se habrá tenido que instalar.

Vamos a descargar Jailkit de la [web oficial](http://olivier.sessink.nl/jailkit/): `wget http://olivier.sessink.nl/jailkit/jailkit-2.19.tar.gz`

![Descargando Jailkit](https://www.dropbox.com/s/cwtdga3i0covdyr/descargandoJailkit.PNG?dl=1)

Descomprimimos el archivo descargado: `tar -xzvf jailkit-2.19.tar.gz`

Entramos en la carpeta de jailkit descomprimida y ejecutamos `./configure && make && sudo make install` para instalarlo.

![Instalando Jailkit](https://www.dropbox.com/s/77bdpfdqhqnfv9e/instalandoJailkit.PNG?dl=1)

Ahora creamos un sistema de ficheros poseído por root: 

```
sudo mkdir -p /seguro/jaulas/dorada
sudo chown -R root:root /seguro
```

Con `sudo jk_init -v -j /seguro/jaulas/dorada jk_lsh basicshell netutils editors` iniciamos la jaula e instalamos varias cosas en ella.

Vamos a crear un usuario y le asignamos una password: 

```
sudo useradd pruebaIV 
sudo passwd pruebaIV
```

Y enjaulamos el usuario creado: `sudo jk_jailuser -m -j /seguro/jaulas/dorada/ pruebaIV`

![Enjaulamos usuario](https://www.dropbox.com/s/sdx0nxlaydpcf65/crearusuarioJalkit.png?dl=1)

Por último para que el usuario pueda tener la shell habitual, debemos editar el fichero "/seguro/jaulas/dorada/etc/passwd" y cambiar la linea de `jk_lsh` después de los dos puntos por `/bin/bash`, quedando así:

![Modificar shell jailkit](https://www.dropbox.com/s/en4rhoqx4e9xinj/shellJailkit.PNG?dl=1)

Ya podemos acceder a la jaula con nuestro usuario pulsando "Ctrl+Alt+F1" e introduciendo los datos de acceso del usuario creado anteriormente:

![Jaula de jailkit funcionando](https://www.dropbox.com/s/0ohi4o8u4gtau2k/jailkitfuncionando.PNG?dl=1)

Luego podemos volver a modo gráfico en nuestro sistema anfitrión pulsando "Ctrl+Alt+F7".
