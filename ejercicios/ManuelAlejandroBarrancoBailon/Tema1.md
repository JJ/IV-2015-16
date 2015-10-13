#Tema 1

##Objetivos del tema 1

- [] Conocer diferentes tecnologías relacionadas con la virtualización (Computación nube, Utility Computing, Software as a Service o Google AppSpot)
- [X] Conocer el concepto de software libre y su importancia dentro de la computación nube.
- [X] Entender el concepto de DevOps y las técnicas y tecnologías que cubre.
- [] Usar el sistema de control de fuentes git para desarrollo colaborativo y para despliegue de aplicaciones en la nube.


###Ejercicios

####Ejercicio 1
Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años. Consultar este artículo en Infoautónomos sobre el tema.

El servidor que he consultado en la tienda Dynos < www.dynos.es > ha sido:

**SERVIDOR HP PROLIANT ML350P G8 XEON E5-2620v2 2.1GHz 8GB SIN DISCO DURO HDD 2.5" MATROX G200**
<http://www.dynos.es/servidor-hp-proliant-ml350p-g8-xeon-e5-2620v2-2.1ghz-8gb-sin-disco-duro-hdd-2.5-matrox-g200-4514953641990__736958-421.html#mod-descripcion>

cuyo precio es de 1885 € IVA incluido.

![Servidor HP](http://i1016.photobucket.com/albums/af281/raperaco/hp_proliant_zpsp3ljtq9z.jpg)

Lo primero que haremos será **deducir el IVA** (21%). 
Para ello: 
	1885 / 1.21 = 1557.85 € es el precio sin IVA.

Ahora se calcula su coste de amortización a **4 años**:

	1557.85 * 0.25 = **389.46 €/año**
	
Y para calcular su coste de amortización en **7 años**:

	1557.85 * 1/7 = **222.55 €/año**
	

####Ejercicio 2
Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.	
	
Para realizar el ejercicio, las características y procesador que he comparado ha sido de 1 núcleo y 20 GB de almacenamiento SSD. 
He consultado el proveedor de alojamiento [OVH](https://www.ovh.es) en su apartado de [hosting VPS] (https://www.ovh.es/vps/vps-ssd.xml) obteniendo un precio de 7.25 €/mes IVA incluido.

![Precio OVH](http://i1016.photobucket.com/albums/af281/raperaco/Precio%20OVH_zps8fihd4c0.png)

Para el proveedor de servicios en la nube, he consultado Azure de Mirosoft, en su apartado de [calculadora de precios](https://azure.microsoft.com/es-es/pricing/calculator/), obteniendo un precio de 0.015 €/hora para el servicio de un núcleo y 20 GB de almacenamiento.

![Precio Azure](http://i1016.photobucket.com/albums/af281/raperaco/precio_azure_zpsiy5dqavt.png)

Ahora vamos a realizar la comparación en los siguientes casos: 

* Si se usa sólo el **1%**:
	* Para el servicio de alojamiento (OVH): **7.25 € se use lo que se use durante un mes**
	* Para el servicio en la nube (Azure): 11.29€/mes * 0.01 = **0.1129 € habría que pagar sólamente**
	
* Si se usa sólo el **10%**:
	* Para el servicio de alojamiento (OVH): **7.25 € se use lo que se use durante un mes**
	* Para el servicio en la nube (Azure): 11.29€/mes * 0.1 = **1.129 € habría que pagar sólamente**
	
	
En resumen, en ambos casos vemos que si sólo se va a usar un 1% o un 10 % del tiempo, es más económica la opción del servicio en la nube de Azure (7.25€ VS. 0.112e9 o 1.129€). En cambio, si este servicio se va a usar durante un mes completo todas las horas, es más económica la opción de alojamiento (11.29€ > 7.25€).


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		

	
	


