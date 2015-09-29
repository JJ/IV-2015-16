# Ejercicios de Rubén Martín Hidalgo
## Tema 1
### Ejercicio 1: Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.

He escogido como servidor el [HP PROLIANT ML310E GEN8](http://www.dynos.es/servidor-hp-proliant-ml310e-gen8-xeon-e3-1220v3-3.1ghz-8gb-ddr3-lff-2x-1tb-dvd-rom-ata-600-array-b120i-888182061657__470065-800.html) de la tienda [Dynos](http://www.dynos.es/).

Para calcular su coste de amortización, se debe obtener a partir del precio final del producto sin IVA, que lo calculamos a través de alguna web destinada para ello:

![Precio sin IVA = 576.86 €](https://www.dropbox.com/s/t2teia06jogmbpl/calculosinIVA.PNG?dl=1)

**Amortización a 4 años**

Deducimos una amortización máxima del 25% cada año: 576.86 * 0.25 = 144.22 € cada uno de los cuatro años.

**Amortización a 7 años**

Los primeros años se debe amortizar más.  
 - Primer año: 576.86 * 0.25 = 144.22 € 
 - Segundo año: 576.86 * 0.25 = 144.22 €  
 - Tercer año: 576.86 * 0.15 = 86.53 €  
 - Cuarto año: 576.86 * 0.15 = 86.53 €  
 - Quinto año: 576.86 * 0.10 = 57.69 €  
 - Sexto año: 576.86 * 0.05 = 28.84 €  
 - Séptimo año: 576.86 * 0.05 = 28.84 €

### Ejercicio 2: Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

Para el alojamiento web he elegido el siguiente servidor dedicado de [1&1](https://www.1and1.es/): 

![Servidor dedicado 1&1](https://www.dropbox.com/s/86d418v4j4sc1rt/Server1%261.PNG?dl=1)

Como proveedor de servicios en la nube, escogí [Microsoft Azure](https://azure.microsoft.com/es-es/), con dos instancias de máquina virtual con características similares al servidor dedicado.

![Servidor nube Azure](https://www.dropbox.com/s/i50tpdgtig2470h/ServerAzure.PNG?dl=1)

**Se usa sólo el 1% del tiempo**

Precio del servidor en nube de Azure: 0.405 €/hora * 24h * 31 dias) * 1% * 2 instancias = 6.03 €/mes

Precio del servidor dedicado de 1&1: 119.99 €/mes

**Se usa sólo el 10% del tiempo**

Precio del servidor en nube de Azure: 0.405 €/hora * 24h * 31 dias) * 10% * 2 instancias = 60.26 €/mes

Precio del servidor dedicado de 1&1: 119.99 €/mes

Como podemos ver, con proveedores de servicios en la nube que nos cobran por el uso y no por el hecho de tener acceso, nos puede resultar más económico si hacemos un uso por debajo del 20% del total.
