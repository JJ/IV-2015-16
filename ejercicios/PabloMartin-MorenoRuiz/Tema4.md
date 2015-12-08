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

Pero vemos que sucede un fallo y para solucionalo eliminamos el archivo /var/run/docker.pid y ya podemos ejecutar docker:

![arreglar ejecucion](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/4.%20Inicializando%20docker_zpswsm7m2gw.jpg)

Ejecutamos el comando en segundo plano y ya podemos instalar imágenes:

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

Para realizar este ejercicio lo primero que hago es buscar todas las iamgenes que tiene  docker con mongo y almacenarlas en el archivo lista_mongo:

![buscar_imagenes_mongo](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/14.%20Lista%20de%20mongos_zpsilqzd8z3.jpg)

Ahora podemos ver todos las imagenes disponibles:

![imagenes_mongo](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/15.%20nano%20lista%20mongo_zpscke0pb6j.jpg)


Instalo mongo:
![Instalando_imagen_mongo](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/16.%20Instalando%20mongo_zpsn5zp1vrb.jpg)


Compruebo que la imagen se ha instalado correctamente:

![imagenes_instaladas_3](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/17.%20Todas%20las%20imagenes_zpsq2bqz028.jpg)

# Ejercicio 8. Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.

Para realizar este ejercicio, lo primero que hago es ejecutar el contenedor ubuntu de la siguiente forma:

![ejecutar_contenedor](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/18.%20ejecutar%20docker%20ubuntu_zps0pufqvxo.jpg)

Una vez inicialiado creo un usuario:

![crear_usuario](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/19.%20Creando%20usuario_zps7cdpho88.jpg)

Inicio la sesión con el nuevo usuario:

![inicio_sesion](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/20.%20Hacemos%20login_zpszd0qpskh.jpg)

Intentamos instalar nginx:

![instalar_nginx1](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/21.%20Error%20superusuario_zpsiwrgjaes.jpg)

Pero cómo el usuario no es superusuario, tenemos que hacerlo superusuario:

![superusuario](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/22.%20add%20superusuarios_zpsemdct3ry.jpg)

Ahora conseguimos instalar nginx y para ello ejecutarmos service nginx status para ver que si funcionar realmente, también se va ha instalar curl y comprobamos que devuelve algo:

![curl](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/25.%20instalar%20curl_zpsoms1unhc.jpg)

![nginx_va](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/26.%20Prueba%20curl_zpsqrgceucl.jpg)



# Ejercicio 9. Crear a partir del contenedor anterior una imagen persistente con commit. 

Para realizar este ejercicio ejcutamos sudo docker ps -a para ver las antiguas ejecuciones de los contenedores y elegir uno al que hacerle un commit:

![docker ps -a](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/30.%20ultimas%20maquinas%20ejecutadas_zpsujfyubph.jpg)

Realizamos un commit:

![commit](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/31.%20commit%20maquina%20de%20ubuntu_zpsbx0v9wu8.jpg)

Comprobamos que se ha hecho un commit:

![commit_realizado](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/32.%20commit%20realizado_zpskmrecpzs.jpg)

# Ejercicio 10. Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección.

Para realizar este ejercicio lo primero es registrarse en Dockerhub:

![registro_docker-hub](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/Seleccioacuten_032_zpst9gcibfi.png)

Una vez hecho eso enlazamos con github:

![enlazar1](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/Seleccioacuten_033_zpsylhpjhfg.png)

![enlazar2](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/Seleccioacuten_034_zpsvklblc3e.png)

![enlazar3](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/Seleccioacuten_035_zps45kkipb8.png)

Una vez hecho lo esto, selecionamos los repositorios en los que queremos que funcione docker:

![seleccion](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/Seleccioacuten_036_zpsstmivb0f.png)

Y en este caso seleccionamos el de empresas que llevamos usando hasta ahora en la asignatura:

![seleccion_empresa](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/Seleccioacuten_038_zpsuei9ky9c.png)

Y ya tenemos el panel de administración de este repositorio preparado:

![panel_empresas](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/Seleccioacuten_039_zpsrad8qclb.png)

Ahora lo que hay que hacer es un archivo Dockerfile el directorio de nuestra aplicacioón, simplemente con esto instalamos todo lo necesario para que funcion:

![Dockerfile_Empresas](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/Seleccioacuten_040_zpsb27f1bf5.png)

Lo siguiente que tenemos que hacer es crear la imagen en local para comprobar que funciona y ejecutarla en un navegador, para desarollar esta parte con comodidad he instalado un entorno gráfico.

Para probar que funciona correctamente ejecutamos en local el siguiente comando para contruir una imagen:

![contruir_imagen](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/35.%20construir%20imagen%20local_zpscs4jhkgg.jpg)

Una vez contruida la imagen, comprobamos que se ha hecho:

![imagen_construida](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/36.%20iamgenes%20con%20imagen%20local_zpspzgdnwsn.jpg)

Ahora ejecutamos la imagen y vemos que ya contiene nuestra aplicación y lo que hacemos ahora es ejecutarla:

![ejecución](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/37.%20ejecutar%20imagen_zps1iyyebhf.jpg)

Necesitamos hace un ifconfig para ver la ip dentro de esta imagen:

![ifconfig](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/38.%20ifconfig_zpscdytqimv.jpg)

Vemos ejecutandose nuestra web en el navegador:

![en_navegador](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/39.%20navegador_zpsyd9o0vwd.jpg)

Y ahora cada vez que hagamos un push en github, se crearán imagenes en dockerhub:

![ejecucion_en_dockerhub](http://i393.photobucket.com/albums/pp14/pmmre/Practica3IV/Practica4IV/Practica4IV-2/40.%20dockerhub%20funcionando_zpsqy6mt6yd.jpg)