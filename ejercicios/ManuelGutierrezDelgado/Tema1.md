# Ejercicio 1

## Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años. Consultar este artículo en Infoautónomos sobre el tema.

Para acceder al enlace: [aquí] (http://www.pccomponentes.com/hp_proliant_ml310e_g8_v2_intel_xeon_e3_1220v3_4gb_1tb.html)

Este servidor que cuesta 699 € podríamos amortizarlo de la siguiente manera: 

Considerando que hemos comprado a principios de año el servidor, podremos deducir el 100% del IVA sobre el producto, que sería de un 21% en España. 

	699€/1.21 = 577,69€
	
El precio del servidor sin IVA es 577,69€.

En cuatro años seria:

100 / 4 = 25   -------> 25% para los 4 años.

25% de 577,69 = 144.42€

2015---->144,42€

2016---->144,42€

2017---->144,42€

2018---->144,42€

Y para el caso de siete años tenemos:

100 / 7 = 14,29   ------->  14,29% para los 7 años.

14,29% de 577,69 = 82,55€

2014---->82.55€

2015---->82.55€

2016---->82.55€

2017---->82.55€

2018---->82.55€

2019---->82.55€

2020---->82.55€

(__Los resultados los he redondeado__)

# Ejercicio 2

## Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo. 

Para la comparación, utilizaremos Windows Azure y Hostinger.

En Hostinger tenemos lo siguiente:

[![Gyazo](https://i.gyazo.com/6552eb148f78ce4de9eaca9ccf16972c.png)](https://gyazo.com/6552eb148f78ce4de9eaca9ccf16972c)

El precio al año sería el siguiente:

	6.99/mes * 12 = 83,88€/año

En Azure tenemos lo siguiente:

[![Gyazo](https://i.gyazo.com/ce3394945e9f494dc990f55a92045640.png)](https://gyazo.com/ce3394945e9f494dc990f55a92045640)

A la hora ----> 0.017€

Al día----> 0.017€ x 24 = 0.408€

Al mes----> 0.408€ x 30 = 12,24€ 

Al año----> 12,24€ x 12 = 146,88€ 

Calculamos todo en función de las horas que se utilizaría en un 1% y en un 10%.

Si lo usamos el 1% del año = 1,4688€
Si lo usamos el 10% del año = 14,688€

Como podemos observar, Azure es más rentable, principalmente ya que se paga por lo usado. Aunque en el momento en el que vayamos a hacer un uso superior al 70% claramente Hostinger sería más rentable. Ya todo dependería del uso.

# Ejercicio 3

## 1. ¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro

[![Gyazo](https://i.gyazo.com/cad63d04544b1a63fd0144338b586094.png)](https://gyazo.com/cad63d04544b1a63fd0144338b586094)

## 2.Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

En primer lugar, voy a proceder a instalar CDE. Para ello, nos bajaremos su código fuente directamente desde su repositorio público de GitHub usando git y después lo instalamos. Con git, clonaremos el directorio con el siguiente comando:

<pre><code> git clone git://github.com/pgbovine/CDE.git </code></pre>

Cuando lo tengamos descargado, accederemos a la carpeta "CDE" y ejecutaremos la aplicación haciendo "__make__".

[![Gyazo](https://i.gyazo.com/b8cb0fc170c2dd0c0c20317a29c55584.png)](https://gyazo.com/b8cb0fc170c2dd0c0c20317a29c55584)

Una vez descargado, vamos a proceder a hacer un script de un "Hola mundo" sencillo, llamado hola_mundo.sh.

<pre><code>#!/bin/bash
echo "¡¡Hola Mundo!!" 
</code></pre>

[![Gyazo](https://i.gyazo.com/405dd3e72f3137295a902032b2c2771b.png)](https://gyazo.com/405dd3e72f3137295a902032b2c2771b)

Y le daremos permisos de ejecución:

<pre><code> chmod +x hola_mundo.sh </code></pre>

Ahora vamos a empaquetar el programa. Para ello, ejecuto el siguiente comando: 

<pre><code> ./cde /home/manolo/CDE/hola_mundo.sh </code></pre>

[![Gyazo](https://i.gyazo.com/a4169022ee3bf3f025671786f7bf98bb.png)](https://gyazo.com/a4169022ee3bf3f025671786f7bf98bb)

Solo queda comprimir los archivos generados que serán los que se encuentre en el directorio "cde-package". Podemos comprimir usando el siguiente comando:

<pre><code> tar czvf hola_mundo.tar.gz cde-package/ </code></pre>

Para ejecutar el programa con CDE, deberemos introducir la ruta hasta el archivo hola_mundo.sh.cde (en nuestro caso: cde-package/cde-root/home/javi/CDE/hola_mundo.sh.cde), que será el que llame al programa cde-exec y ejecutará el programa que hemos empaquetado con CDE.

[![Gyazo](https://i.gyazo.com/46469a366f97ee09d205381d1a254eb6.png)](https://gyazo.com/46469a366f97ee09d205381d1a254eb6)


# Ejercicio 4 

## Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?

Para comprobar si está activada la virtualización a nivel de hardware deberemos ejecutar el siguiente comando: 

<pre><code> egrep '^flags.*(vmx|svm)' /proc/cpuinfo </pre></code>

[![Gyazo](https://i.gyazo.com/758691ca02a7276059a6119f900cd065.png)](https://gyazo.com/758691ca02a7276059a6119f900cd065)

Respecto al modelo de procesador,lo vamos a consultar ejecutando: <pre><code> cat /proc/cpuinfo </pre></code>

[![Gyazo](https://i.gyazo.com/9da75ea14cc06a7c192ff7f3379f15b0.png)](https://gyazo.com/9da75ea14cc06a7c192ff7f3379f15b0)

# Ejercicio 5

## 1. Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.

Mi núcleo sí contiene dicho módulo del kernel.

[![Gyazo](https://i.gyazo.com/1da214b4fa46d5ec89bfcf0bb66152ae.png)](https://gyazo.com/1da214b4fa46d5ec89bfcf0bb66152ae)

## 2. Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.

El hipervisor que he instalado para gestionar máquina virtuales es __VirtualBox__.
