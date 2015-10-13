#Ejercicios tema 1


##Ejercicio 1
###Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.
El ordenador que he elegido es *KIT SERVIDOR ML310 470065-800 XEON E3-1220V3 3.1GHZ 8GB DDR3 2X 1TB + FOUNDATION 2012* en la tienda de [Dynos](http://www.dynos.es/kit-servidor-ml310-470065-800-xeon-e3-1220v3-3.1ghz-8gb-ddr3-2x-1tb--mas-foundation-2012__KIT-ML310-1.html)

Algunas de sus caractirísticas son las siguientes:

- Nombre de Marca:	HP
- Gama de Producto:	ML310e G8
- Modelo de Producto:	470065-800
- Tipo de Producto:	Servidor
- Número de procesadores admitidos:	1
- Número de procesadores instalados:	1
- Fabricante de Procesador:	Intel
- Modelo de Procesador:	Xeon E3-1220V3
- Núcleo del Procesador:	Quad-core (4 Core)
- Velocidad de Procesador:	3,10 GHz
- Velocidad Turbo Máxima:	3,50 GHz
- Caché:	8 MB
- Procesamiento de 64 bits:	Sí
- Memoria Estándar:	8 GB
- Memoria Máxima:	32 GB
- Tecnología de la Memoria:	DDR3 SDRAM
- Número de Ranuras de Memoria (Total):	4
- Número de Discos Duros:	2
- Capcidad Total del Disco Duro:	2 TB
- Interfaz de Disco Duro:	Serial ATA/600
- RPM de Disco Duro:	7200
- Tipo de Unidad Óptica:	Lector DVD
- Compatibilidad con RAID:	Sí
- Niveles de RAID:	0, 1, 1+0
- Número de Ranuras de 3,5":	4
- Número Total de Ranuras de Expansión:	4
- Número de Ranuras PCI Express x4:	1
- Número de Ranuras PCI Express x8:	2
- Número de Ranuras PCI Express x16:	1
- Tecnología Ethernet:	Gigabit Ethernet
- Interfaces/Puertos
- Número total de puertos USB:	8
- Número de puertos USB 3.0:	2
- Red (RJ-45):	Sí
- Remote Management:	Sí

El precio de este producto es 969€ (con IVA)
El precio de amortización de un producto se realiza a partir del precio del producto sin IVA, así que lo primero que hacemos es rectarle el IVA al precio del servidor:
- precio con IVA: 969€
- IVA (21%): 168,18€
- precio sin IVA: 969 * 1,21 = 800,82€

###Amortización a 4 años
Deducimos el máximo del 25% de la amortización por año, con lo cual sería 800,82 * 0,25 = 200,205€ al año.

###Amortización a 7 años
Deducimos que los primeros años se amortiza más
<ol>
	<li>Primer año: 800,82 * 0,25 = 200,205</li>
	<li>Segundo año: 800,82 * 0,25 = 200,205</li>
	<li>Tercer año: 800,82 * 0,15 = 120,123</li>
	<li>Cuarto año: 800,82 * 0,15 = 120,123</li>
	<li>Quinto año: 800,82 * 0,15 = 120,123</li>
	<li>Sexto año: 800,82 * 0,10 = 80,082</li>
	<li>Séptimo año: 800,82 * 0,10 = 80,082</li>
</ol>


##Ejercicio 2
###Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.
Como servidor dedicado he escogido Hostalia
Este tiene un coste anual de 419,4€ (los 6 primeros meses) y 599,4€ (los siguientes 6 meses) que hacen un total de 1018,8€ al año. Sus características son:
![captura de pantalla](https://www.dropbox.com/s/ecl3jk229pnvfdv/ejr2.png?dl=1)

Para Servicios en la nube he escogido AWS Amazon, las caractiristicas que nos ofrece son:
Procesador intel 2.4 GHz Xeon E5-2676
Memoria RAM: 16 GiB
Con un coste de 199€ cada mes.
Si lo usamos un 1% tendria un coste de 1,99€ al mes que al año sería 23,88€
Si por el contrarío lo usamos un 10% al mes tendría un coste de 19,9€ y al año de 238,8€.

Con esta comparación podemos ver que sale mas económico el servicio en la nube (la comparación es haciendo uso entre un 1% y 10%)

##Ejercicio 3.1
###¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro
[Contestada en el foro](https://github.com/JJ/IV-2015-16/issues/1)


##Ejercicio 3.2
###Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

<ol>
	<li>He instalado CDE con el comando: sudo apt-get install cde</li>
	<li>Me he creado un pequeño programa en python que imprime una frase</li>
	<li>He empaquetado mi programa con el comando: cde python programa.py</li>
	<li>Me he movido a la ruta en la que me ha creado el archivo emmpaquetado por CDE</li>
	<li>Ejecuto el archivo creado</li>
</ol>

En esta captura se puede ver el contenido del programa creado y la ejecución del archivo empaquetado por cde.
![captura de pantalla](https://www.dropbox.com/s/a7kmk596868l9wu/ejr3_2.png?dl=1)


##Ejercicio 4
###Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?
Usando dicho comando no me lista nada, con lo cual quiere decir que mi procesador no tiene esta función o la tiene desactivada.
![captura de pantalla](https://www.dropbox.com/s/9yc3wh5vgi43kt8/ejr4_1.png?dl=1)

Para ver que modelo de procesador tengo uso el comando "cat /proc/cpuinfo" y obtengo la siguiente salida
![captura de pantalla](https://www.dropbox.com/s/0v6729pfrbhswwc/ejr4_2.png?dl=1)
![captura de pantalla](https://www.dropbox.com/s/8qdrd503r5hxa42/ejr4_3.png?dl=1)

##Ejercicio 5.1
###Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.
![captura de pantalla](https://www.dropbox.com/s/ixfejcp2i5tqnc6/ejr5_1.png?dl=1)

##Ejercicio 5.2
###Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.
Tengo instalado en mi ordenador el Software Parallels Desktop, con el que se pueden gestionar máquinas virtuales
