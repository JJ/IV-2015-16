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

En el ejercicio 4 podremos comprobar que esta bien instalado.

# Ejercicio 4

## 1. Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.

En la siguiente imagen vemos cómo instalar lxc-webpanel, para hacerlo debemos de ejecutarlo cómo root:

![instalacion_lxc-webpanel](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Seleccioacuten_021_zpstbupa7mi.png)

Una vez instalado, vemos que se nos indica que podemos acceder al panel desde localhost:5000, si accedemos podemos ver en la siguiente imagen el panel que nos sale:

![panel-lxc-webpanel](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Seleccioacuten_022_zpslavqpgnt.png)

Podemos ver a la izquierda diversas opciones cómo usuarios, configuraciones y los contenedores que creados. Y ver el estado de los diversos contenedores, iniciarlos, pararlos o detenerlos.

En la siguiente imagen iniciamos un contenedor, desde dentro del mismo contenedor:

![inicio_contenedor](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Seleccioacuten_025_zpscuvlxdm5.png)

y ahora lo paramos:

![parar_contenedor](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Seleccioacuten_026_zpsrbcoh2xq.png)


## 2. Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.

Si nos introducimos en un contenedor podemos ver la configuración que tiene y modificarla:

![menu_contenedor](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Seleccioacuten_023_zpszrk3z28h.png)

En la siguiente imagen vemos cómo ejemplo cómo limitamos la memoría del contenedor:

![limitando_memoria](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Seleccioacuten_024_zpsjcfqbpp6.png)

# Ejercicio 6. Instalar docker.

Este ejercicio en principio parece secillo y lo es, pero únicamente si uno tiene suerte con el Linux que tenga instalado. En mi ordenador tengo una partición con ubuntu 12.04, después de actualizar mi versión de Kernel a la 3.13, quedarme sin wifi al hacerlo y conseguir arreglarlo, me fijo que el tutorial es sólo para 64 bits y no sólo sino que busco en internet y veo que docker no funciona en Linux de 32 bits y vaya el mío es de 32...

En este punto o formateo mi linux, elimando todos mis archivos y configuracines de 5 años o cómo he hecho, instalo en Windows 7, con VMware una Máquina Virtual de ubuntu con 64 bits.

Ahora SI! funciona. Simplemente ejecutando el simple y sencillo comando de la siguiente imagen:

![instalacion_docker](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/1.%20instalando%20IV_zpsfacskpyh.jpg)


En la siguiente imagen comprobamos la versión que tenemos de docker:

![version_docker](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/2.%20docker%20-v_zpsqnrwdalk.jpg)

# Ejercicio 7.

## 1. Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS.

Lo primero es ejecutar docker con el siguiente comando:

![ejecutar_docker](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/3.%20sudo%20docker%20-d%20fallo_zpswutule1d.jpg)

Pero vemos que sucede un fallo y para solucionalor eliminamos el archivo /var/run/docker.pid y ya podemos ejecutar docker:

![arreglar ejecucion](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/4.%20Inicializando%20docker_zpswsm7m2gw.jpg)

Pero cómo vemos si dejamos de ejecutar, el comando ya podemos descargar imagenes así que para ello lo ejecutamos en segundo plano:

![docker_en_segundo_plano](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/9.%20Ejecutar%20el%20servicio%20en%20segundo%20plano%20mientras%20instalo_zpsj9x0mgu2.jpg)

Ahora instalamos ubuntu:

![instalamos_ubuntu](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/10.%20Instalando%20ubuntu%20con%20docker_zpsuf8sftn9.jpg)

Podemos comprobar la imagenes instaladas con el siguiente comando:

![imagenes_instaladas_1](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/11.%20sudo%20docker%20images%20%20para%20comprobar%20que%20esta%20instalado_zpsiz0pbzg1.jpg)


Ahora instalamos, la máquina de centOS de la siguiente forma:

![imagen_centOS](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/12.%20docker%20instalacion%20centos_zpsen4bhmus.jpg)

Y comprobamos que ha sido correctamente instalada:
![imagenes_instaladas_2](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/13.%20Todas%20las%20imagenes%20instaladas_zpszcus5lyl.jpg)

## 2. Buscar e instalar una imagen que incluya MongoDB.

# Ejercicio 8. Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.


# Ejercicio 9. Crear a partir del contenedor anterior una imagen persistente con commit. 
