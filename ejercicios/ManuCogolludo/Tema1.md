# Tema 1

### Ejercicio 1: Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.

Me he deicidido para utilizar como servidor el [Lenovo Thinkserver ts440](http://www.pccomponentes.com/lenovo_thinkserver_ts440_70aq_intel_xeon_e3_1225_v3_4gb.html) en PCcomponentes.

El coste de amortización se obtiene del precio final, pero sin I.V.A. El calculo se puede realizar en web que permitan dichas operaciones, como por ejemplo: [calcuworld.com](http://es.calcuworld.com/calculadoras-financieras/calculadora-iva/).

El calculo del servidor que he elegido es ![Precio sin IVA = 593.67 €](https://github.com/Makova/IV-2015-16/blob/mirama/imagenes/calculadorIVA.png).

**Amortización a 4 años**

Deduciendo una amortización máxima del 25% por cada año: 593.67 * 0.25 = 148.41€ a pagar por cada año de los cuatro años amortizados.

**Amortizacón a 7 años**

Los dos primeros años comienzan pagando más que el resto de años y así sucesivamente hasta finalizar la amortización del servidor.

	- Primer año: 	593.67 * 0.25 = 148.41
	- Segundo año:	593.67 * 0.25 = 148.41
	- Tercer año:	593.67 * 0.15 =  89.05
	- Cuarto año:	593.67 * 0.15 =  89.05
	- quinto año:	593.67 * 0.10 =  59.36
	- Sexto año:	593.67 * 0.05 =  29.68
	- Séptimo año:	593.67 * 0.05 =  29.68

Céntimo arriba, céntimo abajo.

-------------------------------------------------------------------------------------------------------------------------------------------------

### Ejercicio 2: Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

He escogido el siguiente server para alojamiento web dedicado en [STRATO](https://www.strato.es)

![Strato](https://github.com/Makova/IV-2015-16/blob/master/imagenes/ServerLinux.png)

Y como proveedor de servicios en la nube he escogido [Azure](https://www.microsoft.com/es-es/search/result.aspx?q=azure) y precio de dos máquinas 
virtuales con características que se acercan al escogido como PC y servidor dedicado:  

![Azure](https://github.com/Makova/IV-2015-16/blob/master/imagenes/Azure.png)

**Se usa sólo el 1% del tiempo:**

Precio servidor en nube Azure: 0.101 €/h * 24h * 31 días) * 1% * 2 estancias = 0,00202 €/mes

Precio del servidor dedicado de Strato: 47,19 €/mes

**Se usa sólo el 10% del tiempo:**

Precio servidor en nube Azure: 0.101 €/h * 24h * 31 días) * 10% * 2 estancias = 0,0202 €/mes

Precio del servidor dedicado de Strato: 47,19 €/mes

Es verdad que con proveedores en la nube por los que pagamos por uso y no por a acceso, sale 
realmente ecónomico con una máquina normalita, pero creo que es más que suficiente para una WordPress, correo, etc...
Por lo menos el que he escogido yo :D ni medio céntimo. Pero puede que me haya hecho un lío.
