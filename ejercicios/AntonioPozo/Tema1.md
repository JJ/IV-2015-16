###Ejercicio 1
**Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.**

* **Servidor**
* HP ProLiant ML310E G8 V2 Intel Xeon E3-1220V3/4GB/2TB


![Servidor](http://fotos.pccomponentes.com/ordenadores_sobremesa/servidores/hp_proliant_ml310e_g8_v2_intel_xeon_e3_1220v3_4gb_2tb.jpg)
* El servidor se ha sacado de la tienda *pccomponentes.com* (http://www.pccomponentes.com/hp_proliant_ml310e_g8_v2_intel_xeon_e3_1220v3_4gb_2tb.html)

* **Precio: 864€**


* **Especificaciones**

    * Sistema:
        * Procesador Intel® Xeon® E3-1220 v3 (4 núcleos, 3,1 GHz, 8 MB, 80 W)
        Número de procesadores 1
        Núcleo de procesador disponible 4
        Formato (totalmente configurado) 4U
        Tipo de fuente de alimentación (1) kit de fuente de alimentación integrada de fábrica de 350 W con varias salidas
        Ranuras de expansión (4) máximo: para obtener una descripción detallada, consulte QuickSpec
    * Memoria:
        * Memoria, estándar UDIMM de 4 GB (1 x 4 GB)
        * Ranuras de memoria 4 ranuras DIMM; Máximo
        * Tipo de memoria 2R x8 PC3L-10600E-9
    * Almacenamiento
        * Unidades de disco duro incluidas (2) SATA LFF; unidades sin conexión en caliente de 1 TB
        * Tipo de unidad óptica DVD-ROM SATA media altura
    * Tarjetas de controladores
        * Controlador de red Adaptador Ethernet 332i de 1 Gb y 2 puertos por controlador
        * Controlador de almacenamiento (1) Dynamic Smart Array B120i / ZM;
        * Dimensiones y peso
        * Dimensiones (ancho x fondo x alto) 17,5 x 47,52 x 36,82 cm

Más información en: http://www.pccomponentes.com/hp_proliant_ml310e_g8_v2_intel_xeon_e3_1220v3_4gb_2tb.html


* **Amortización a cuatro años**
Suponemos que la compra del ordenador se hace a principios del primer año, para amortizarlo completo durante los 4 años.
Se descuenta del precio total el IVA (21%). Por tanto, el precio del servicor caeria al: 864/1.21 = 714€

    714€ / 4 años = 178,51€/año

    Coste de amortización (4 años): **178,51€**.




* **Amortización a siete años**
Haciendo las mismas suposiciones que en el apartado anterior:

    714€ / 7 años = 102€/año

    Coste de amortización (7 años): **102€**. 


###Ejercicio 2
**Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.**

Para dar solución a este ejercicio he optado por analizar grandes empresas como AMAZON EC2 y GOOGLE COMPUTE ENGINE. 
A continuación se exponen las características de cada producto:
* AMAZON EC2
	* Nombre: m4.xlarge
	* Virtual CPUs: 4
	* RAM: 16GB
	* Precio: $0.252/h
        * **1% de uso:** 87,6h * $0.252/h = $22,0752
        * **10% de uso:** 876h * $0.252/h = $220,752

* GOOGLE COMPUTE ENGINE
	* Nombre: n1-standard-4
	* Virtual CPUs: 4
	* RAM: 15GB
	* Precio: $0.140/h
        * **1% de uso:** 87,6h * $0.140/h = $12,264
        * **10% de uso:** 876h * $0.140/h = $122,64

En cuanto a proveedor de alojamiento Internet he optado por Hostminio cuyo plan más caro son 5,99€/mes = 72€/mes y 
el servicio de hosting es del 100%.
    

###Ejercicio 3.1
**¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro**

Comentado en: https://github.com/JJ/IV-2015-16/issues/1



###Ejercicio 3.2
**Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.**
He aprovechado un programa implementado en python para la asignatura DAI. Ordena vectores según varios algoritmos de reordenación.
![Programa en ejecucion](http://i57.tinypic.com/k2h449.jpg)


###Ejercicio 4
**Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?**

![Programa en ejecucion](http://i62.tinypic.com/24m7tif.png)



###Ejercicio 5.1
**Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.**
![puedo acelerar por hardware](http://i62.tinypic.com/vcytu9.png)

###Ejercicio 5.2
**Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.**

En la máquina anfitriona tengo instalado Parallels Desktop
