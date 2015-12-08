# Ejercicio 1. Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.

Para instalar lxc lo único que hay que poner es: sudo apt-get install lxc.

Para comprobar si funciona correctamente usamos el comando lxc-checkconfig,cómo podemos ver en la siguiente imagen:

![checkconfig](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Seleccioacuten_030_zpsjhbngsxd.png)


# Ejercicio 2. Comprobar qué interfaces puente se han creado y explicarlos.

En este ejercicicio tenemos que crear un contenerdor y comprobrar las interfaces de red.

Para ello lo que he hecho ha sido crear una con ubuntu cómo se indica en las prácticas, con el siguiente comando: sudo lxc-create -t ubuntu -n una-caja

Una vez creada podemos comprobar haciendo ifconfig en la máquina local que se han creado las interfaces red para el nuevo contenerdo:

![ifconfig_local](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Seleccioacuten_017_zpskmlznhew.png)

Claramente dentro del contenedor se tendrá una conexión de internet igualq ue cualquier máquina virtual.

# Ejercicio 3

## 1. Crear y ejecutar un contenedor basado en Debian.

Cómo no tengo captura de la imagen de cuándo instale Debian, entonces lo he hecho ha sido una búsqueda en mi historial para mostrar en la sigueinte imagen el comando para la instalación de un contenedor de Debian:

![imagen_debian](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Seleccioacuten_031_zpsebmuvnrd.png)

## 2. Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora. Nota En general, crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya. Fedora, al parecer, tiene problemas si estás en Ubuntu 13.04 o superior, así que en tal caso usa cualquier otra distro.

Para instalar una máquina Fedora lo realizamos con el cómando mostrado en la siguiente imagen:

![imagen_fedora](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Seleccioacuten_019_zpsgmr1iuxw.png)

En el ejercicio 4 podremos comprobar que esta bien instalado

# Ejercicio 4

## 1. Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.


## 2. Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.


# Ejercicio 6. Instalar docker.

# Ejercicio 7.

## 1. Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.

## 2. Buscar e instalar una imagen que incluya MongoDB.

# Ejercicio 8. Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.


# Ejercicio 9. Crear a partir del contenedor anterior una imagen persistente con commit. 
