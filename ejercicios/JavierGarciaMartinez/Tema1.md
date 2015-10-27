# Ejercicio 1 #

## Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años. Consultar este artículo en Infoautónomos sobre el tema. ## 

Para acceder al enlace: [aquí] (http://www.pccomponentes.com/hp_proliant_ml310e_g8_xe_e3_1220_8gb_2tb___foundation_2012.html)

Este servidor que cuesta 833 € podríamos amortizarlo de la siguiente manera: 

Considerando que hemos comprado a principios de año el servidor, podremos deducir el 100% del IVA sobre el producto, que sería de un 21% en España. 

	833€ de 21% = 174,93€
	
	833€ – 174,93€ = 658,07€
	
El precio del servidor sin IVA es 658,07€.

En cuatro años seria:

100 / 4 = 25   -------> 25% para los 4 años.

25% de 658,07 = 164,5175

2014---->164,5175€

2015---->164,5175€

2016---->164,5175€

2017->164,5175€

Y para el caso de siete años tenemos:

100 / 7 = 14,29   ------->  14,29% para los 7 años.

14,29% de 658,07 = 94,038203€

2014---->94,038203€

2015---->94,038203€

2016---->94,038203€

2017---->94,038203€

2018---->94,038203€

2019---->94,038203€

2020---->94,038203€

# Ejercicio 2 #

## Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo. ##

Para la comparación, utilizaremos Windows Azure y Hostinger.

En Hostinger tenemos lo siguiente:

<img src="https://github.com/javiergama8/Images/blob/master/2.1.png">

El precio al año sería el siguiente:

	6.99€/mes  x 12 meses= 83.88€/año

En Azure tenemos lo siguiente:

<img src="https://github.com/javiergama8/Images/blob/master/2.2.png">

A la hora ----> 0.0149€

Al día----> 0.0149€ x 24 = 0,3576€  

Al mes----> 0,3576€ x 31 = 11.18€ 

Al año----> 11.18€ x 12 = 134.16€ al año. 

Calculamos todo en función de las horas que se utilizaría en un 1% y en un 10%.

__Hostinger:__ En Hostinger no se paga por el tiempo de uso, sino que se alquila el servicio por 83.88€ al año y lo utilizamos todo el tiempo que queramos.

__Azure:__ En Azure, al contrario que en Hostinger, se paga por el tiempo de uso del servicio, así que:

__Si lo usamos un 1% al año---->__ 134.16 x 1 / 100=1.342€ al año 

__Si lo usamos un 10% al año ---->__ 134.16 x 10 / 100=13.42€ al año 

Como podemos observar, Azure es más rentable, principalmente ya que se paga por lo usado. Aunque en el momento en el que vayamos a hacer un uso superior al 70% claramente Hostinger sería más rentable. Ya todo dependería del uso.

# Ejercicio 3 #

## 1. ¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro ##

Comentar en el foro.

## 2.Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones. ##

En primer lugar, voy a proceder a instalar CDE. Para ello, nos bajaremos su código fuente directamente desde su repositorio público de GitHub usando git y después lo instalamos. Con git, clonaremos el directorio con el siguiente comando:

<pre><code> git clone git://github.com/pgbovine/CDE.git </code></pre>

Cuando lo tengamos descargado, accederemos a la carpeta "CDE" y ejecutaremos la aplicación haciendo "__make__".

<img src="https://github.com/javiergama8/Images/blob/master/3.2.png">

Una vez descargado, vamos a proceder a hacer un script de un "Hola mundo" sencillo, llamado hola_mundo.sh.


<pre><code>#!/bin/bash
echo "¡¡Hola Mundo!!" 
</code></pre>

<img src="https://github.com/javiergama8/Images/blob/master/3.3.png">

Y le daremos permisos de ejecución:

<pre><code> chmod +x hola_mundo.sh </code></pre>

Ahora vamos a empaquetar el programa. Para ello, ejecuto el siguiente comando: 

<pre><code> ./cde /home/javi/hola_mundo.sh </code></pre>

<img src="https://github.com/javiergama8/Images/blob/master/3.4.png">

Solo queda comprimir los archivos generados que serán los que se encuentre en el directorio "cde-package". Podemos comprimir usando el siguiente comando:

<pre><code> tar czvf hola_mundo.tar.gz cde-package/ </code></pre>

Para ejecutar el programa con CDE, deberemos introducir la ruta hasta el archivo hola_mundo.sh.cde (en nuestro caso: cde-package/cde-root/home/javi/CDE/hola_mundo.sh.cde), que será el que llame al programa cde-exec y ejecutará el programa que hemos empaquetado con CDE.

<img src="https://github.com/javiergama8/Images/blob/master/3.5.png">


# Ejercicio 4 #

## Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden? ##

Para comprobar si está activada la virtualización a nivel de hardware deberemos ejecutar el siguiente comando: 

<pre><code> egrep '^flags.*(vmx|svm)' /proc/cpuinfo </pre></code>

<img src="https://github.com/javiergama8/Images/blob/master/10.png">

Respecto al modelo de procesador,lo vamos a consultar ejecutando: <pre><code> cat /proc/cpuinfo </pre></code>

<img src="https://github.com/javiergama8/Images/blob/master/10.1.png">

El modelo de procesador usado es el "Intel(R) Core(TM) i3 CPU       M 370  @ 2.40GHz.

# Ejercicio 5 #

## 1. Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok. ##

Mi núcleo sí contiene dicho módulo del kernel.

<img src="https://github.com/javiergama8/Images/blob/master/11.png">

##2. Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.##

El hipervisor que he instalado para gestionar máquina virtuales es __VirtualBox__.
