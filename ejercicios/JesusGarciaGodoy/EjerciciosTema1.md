# Ejercicios Tema 1
  
## Ejercicio 1
 
Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.

**Servidor**

El servidor que he elegido es [HP ProLiant DL560 Gen9 E5-4620v3 2P 64GB-R P440ar/2GB 8SFF 2x1200W RPS Base Server](http://www8.hp.com/us/en/products/proliant-servers/product-detail.html?oid=8283795)


Sus principales características son:

 * Procesador
	Intel® Xeon® E5-4620 v3 (10 core, 2.0 GHz, 25MB, 105W)
 * Eficiencia energética
	ENERGY STAR® qualified
 * Número de procesadores
	2
 * Núcleo de procesador disponible
	10
 * Formato (totalmente configurado)
	2U
 * Tipo de fuente de alimentación
	(2) Ranura común del kit de fuente de alimentación de conexión en caliente Platinum Plus de 1.200 W
 * Ranuras de expansión
	(7) PCIe 3.0
 * Memoria, estándar
	RDIMM de 64 GB (4 x 16 GB)
 * Ranuras de memoria
	48 ranuras DIMM
 * Tipo de memoria
	2R x4 PC4-2133P-R
 * Unidades de disco duro incluidas
	(8) SFF, ninguna de serie; Admite hasta (8) tarjetas de red iLO dedicadas a la gestión SAS/SATA SFF. Ampliable a un máximo de 24 unidades SFF.

El precio (sin IVA) es de [13,451.49 $].

IVA (21%): 2824.81 $

Precio con IVA: 16276.30 $

Con una amortización a 4 años del 25% el servidor saldría a 3362.87 $ al año.

Con una amortización a 7 años (constante del primer al último año) el servidor saldría a 1921.64 $ al año.

## Ejercicio 2

Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

[VPS Strato Linux L1](https://www.strato.es/vps-linux/)
* 2 CPU cores
* 4 GB RAM
* 200 GB SSD/HDD
* Tráfico ilimitado
* 8.99€/mes

[Amazon EC2 t2.medium](http://aws.amazon.com/es/ec2/pricing/)
* 2 vCPU
* 4 GiB de memoria
* $0.056/hora = 0.05€/hora
* Almacenamiento EBS


** Coste de Strato
 El gasto es fijo: 8.99 € al mes * 12 meses = 107.88 € al año

** Coste Amazon EC2

** Usando un 1%
+ *Strato* : se pagaría 8.99€/mes * 12 meses = 107.88€/año (gasto fijo)
+ *Amazon* : (0.05€/hora * 24h/día * 30 días/mes * 12 meses/año) * 0.01 = 4.32€/año

** Usando un 10%
+ *Strato* : se pagaría 8.99€/mes * 12 meses = 107.88€/año (gasto fijo)
+ *Amazon* : (0.05€/hora * 24h/día * 30 días/mes * 12 meses/año) * 0.1 = 43.2€/año
 
## Ejercicio 3

** ¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro

[Comentario](https://github.com/JJ/IV-2015-16/issues/1#issuecomment-146032513)

** Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

Tras instalar CDE, procedemos a escribir un programa básico, como el clásico "hola mundo".

![script python](http://i.imgur.com/zwqVFOs.png)

Probamos a ejecutarlo con CDE:

![probando cde](http://i.imgur.com/l2F5ZeQ.png)

El script ha sido probado en otra distribución Linux y efectivamente funciona, sin estar presente el entorno de python.

## Ejercicio 4

Comprobar si el procesador o procesadores instalados tienen los flags vmx ó svm . ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?

El modelo del procesador es Intel(R) Core(TM) i5-4460 CPU @ 3.20 GHz, lo cual se puede ver al hacer un cat al archivo /proc/cpuinfo.

![cpuinfo](http://i.imgur.com/2O28JVk.png)

La salida de egrep '^flags.*(vmx|svm)' /proc/cpuinfo muestra lo siguiente:

![flag vmx](http://i.imgur.com/Jg5zPt2.png)

Con lo que queda claro que dispone de la funcionalidad.

## Ejercicio 5

** Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.

![kvm-ok](http://i.imgur.com/8cDNCcN.png)

** Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.

Se ha instalado VirtualBox mediante el gestor de paquetes en mi Linux Mint 17.


