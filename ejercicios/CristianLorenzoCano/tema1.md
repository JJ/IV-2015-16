## Ejercicios TEMA 1
#### 1. Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.

para realizar el ejercicio he elegido el servidor [SERVIDOR HP PROLIANT DL380P G8](http://www.dynos.es/servidor-hp-proliant-dl380p-g8-xeon-e5-2620-2x4gb-ddr3-p420i-512mb-887111426765__470065-701.html)
cuyo precio es 2490 € IVA incluido es decir de 2057,85

los productos informaticos se pueden amortizar por completo y hasta un maximo de un 26% al año asi la amortizacion quedaria
de la siguiente forma

|    **Amortizacion a 4 años**      |     **Amortizacion a 7 años**       |
| --------------------------------- | ----------------------------------- |
| **1º:** 2057,85 x 0.26 = 535,04 € | **1º:** 2057,85 x 0.26 = 535,04 €   |
| **2º:** 2057,85 x 0.26 = 535,04 € | **2º:** 2057,85 x 0.26 = 535,04 €   |
| **3º:** 2057,85 x 0.26 = 535,04 € | **3º:** 2057,85 x 0.10 = 205,78 €   |
| **4º:** 2057,85 x 0.23 = 452,73 € | **4º:** 2057,85 x 0.10 = 205,78 €   |
|                                   | **5º:** 2057,85 x 0.10 = 205,78 €   |
|                                   | **6º:** 2057,85 x 0.10 = 205,78 €   |
|                                   | **7º:** 2057,85 x 0.08 = 164,65 €   |


#### 2. Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

para este ejercicio he utilizado como modelo de servidor cloud una configuracion propia en [http://www.interdominios.com](http://www.interdominios.com/cloud-pago-por-uso/cloud-pago-por-uso.aspx)
con los siguientes valores: 
- 2 CPU
- 32 GB de RAM
- 1200 GB de Almacenamiento
resultando en un precio de 626,40 €/mes pagando solo por lo realmente usado con tarifacion por minuto con lo cual
el precio es:
626,40 €/mes= 20,20 €/dia = 0.84 €/h = 0,014 €/min

como servidor dedicado he elegido el [Dell PowerEdge R430](https://dinahosting.com/dedicados) que tiene las mismas caracteristica y cuyo precio es
323 €/mes

#####Para un uso anual del 10%
* **tiempo de uso** = 365 x 0,1 = 36,5 dias = 876 Horas = 52560 min
* **precio del servidor cloud** = 52560 x 0,014 = 735,84 €
* **precio del servidor dedicado** = 12 x 323 = 3876 €

#####Para un uso anual del 1%
* **tiempo de uso** = 365 x 0,01 = 3,65 dias = 87,6 Horas = 5256 min
* **precio del servidor cloud** = 5256 x 0,014 = 73,58 €
* **precio del servidor dedicado** = 12 x 323 = 3876 €

#### 3.1 ¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro
hecho
#### 3.2 Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.
el programa que he creado es un pequeño script en python que suma los numeros del 1 al 20

    suma=0;
    for i in range(1,20):
	    suma=suma+i;
    print suma;

lo primero es installar cde
    sudo apt-get install cde

![imagen1](http://i62.tinypic.com/se7ehd.png)

despues se empaqueta con
    cde python sumatoria.py
    
y por ultimo lo probamos
![imagen2](http://i58.tinypic.com/i3i7b5.png)

#### 4 Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?

mi procesador es un Intel Core i3

la salida de la orden es la siguiente, en ella podemos ver que si dispone del flag vmx
![imagen3](http://i58.tinypic.com/23lk10o.png)

#### 5.1 Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.

la salida da lo siguiente
![imagen4](http://i60.tinypic.com/21nqmpf.png)
com se puede ver si contiene el modulo

#### 5.2 Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.
tengo instalado VMware
