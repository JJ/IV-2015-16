###Ejercicio 1: Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años. Consultar este artículo en Infoautónomos sobre el tema.

Vamos a analizar un PC-Servidor vendido por la empresa **Dynos**: [SERVIDOR HP PROLIANT ML110E GEN9] (http://www.dynos.es/servidor-hp-proliant-ml110e-gen9-xeon-e5-2620v3-2.4ghz-8gb-ddr4-lff-1tb-dvd-rom-array-b140i-888793950609__794996-425.html)

Producto:

 - SERVIDOR HP PROLIANT ML110E GEN9
 - DESCRIPCIÓN: El servidor HP ProLiant ML110 Gen9 es una torre pequeña y silenciosa con rendimiento, ampliación y crecimiento, a un precio asequible, para adaptarse a las exigencias de computación de las empresas de pequeño y mediano tamaño. El servidor ML110 Gen9 dispone de un único procesador y es una torre de 4,5 U, que incluye hasta cinco (5) ranuras PCIe con espacio para crecer con hasta ocho (8) unidades de disco de factor de forma grande (LFF) o dieciséis (16) de factor de forma reducido (SFF). También proporciona ocho (8) ranuras DIMM DDR4 que admiten HP DDR4 SmartMemory con una capacidad máxima de 256 GB, lo que lo convierte en el servidor ideal para empresas de pequeño a mediano tamaño y oficinas remotas/sucursales.

 - ESPECIFICACIONES: 
  + CPU: XEON E5-2620v3 3.5GHZ 
  + RAM: 8GB DIMM DDR4 
  + HDD: 1TB DVD-ROM ARRAY B140I 

 - PRECIO: 1499€
 
PRECIO SIN IVA (21%): 1184,21€

*Amortización a 4 años (25% por año)*
 - 2015: 1184,21€ * 0.25 = 296€
 - 2016: 1184,21€ * 0.25 = 296€
 - 2017: 1184,21€ * 0.25 = 296€
 - 2018: 1184,21€ * 0.25 = 296€

*Amortización a 7 años (25% los 2 primeros años y gradual los siguientes)*

1184,21 * 0. = 296€
1184,21 * 0.25 = 296€
1184,21 * 0.15 = 177,6€
1184,21 * 0.15 = 177,6€
1184,21 * 0.15 = 177,6€
1184,21 * 0.10 = 118,4€
1184,21 * 0.10 = 118,4€


###Ejercicio 2: Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) si la infraestructura comparada se usa sólo el 1% o el 10% del tiempo.

Para calcular el coste del servidor elijo *leaseweb* (https://www.leaseweb.com/dedicated-server/configure/20740).

El servidor dedicado tiene las siguientes características:
 - MODELO: Supermicro SC813MTQ
 - CPU: Intel Xeon E5-1650v2
 - RAM: 16GB
 - HDD: 4x2TB SATA2 (RAID 5)
 - DATA CENTER: AMSTERDAM
 - PRECIO (COSTE): 549€ / MES

Para el proveedor de servicios en la nube elijo *Amazon Web Services*:
 - Tipo servicio: Amazon EC2
 - CPU: Intel Xeon® E5-2676 v3 (Haswell) de 2,4 GHz
 - RAM: 16GB

Costo total: 195€ / MES
 - El coste para un uso del 1%/Mensual: 2,1€
 - El coste para un uso del 10%/Mensual: 19,8€

###Ejercicio 3: 
###1.- ¿Qué tipo de virtualización usarías en cada caso?
 -- Comentado en el foro (https://github.com/JJ/IV-2015-16/issues/1).

###2.- Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

 1. Instalamos CDE: sudo apt-get install cde
 2. Ejecutamos la orden: cde python adivina.py
 3. Entramos en el directorio creado tras empaquetar: /cde-package/cde-root/home/usu
 4. Ejecutamos la orden: ./python.cde adivina.py
 5. Probamos en otras distros

![img](https://github.com/nachobit/ETSIIT/blob/master/IV1516/ejercicios/tema1/ub.png)

![img](https://github.com/nachobit/ETSIIT/blob/master/IV1516/ejercicios/tema1/ub1.png)

###Ejercicio 5: 

###Ejercicio 5.1: Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.

Tras instalar el componente necesario: sudo apt-get install cpu-checker en mi máquina Ubuntu Server no está presente: *KVM acceleration can NOT be used*

###Ejercicio 5.2: Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.

Dispongo de Parallels y VirtualBox instalados en el PC.