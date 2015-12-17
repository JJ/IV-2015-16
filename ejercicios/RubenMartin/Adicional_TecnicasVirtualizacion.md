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
