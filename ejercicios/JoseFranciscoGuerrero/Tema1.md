# Tema 1

## Ejercicio 1. Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.
Para el ejercicio se ha elegido el servidor HP ProLiant ML310e Gen8 v2 cuyo precio en la web de Amazon.es es de 707,85€. Nuestro servidor dispone de un Intel Xeon de 4 núcleos a 3.1GHz, 8GB de memoria RAM y 1TB de almacenamiento.\
El coste de amortización se realiza con el precio del servidor sin IVA por lo que obtenemos el precio de dicho servidor sin el suplemento del 21%.\
707,85€/1,21=585€
#### Amortización a cuatro años
Para amortizarlo en cuatro años lo que hacemos es pagar un 25% del servidor cada año. Por tanto pagaríamos lo siguiente:
    
    Primer año: 585€*0,25= 146,25€
    Segundo año: 585€*0,25= 146,25€
    Tercer año: 585€*0,25= 146,25€
    Cuarto año: 585€*0,25= 146,25€

#### Amortización a siete años
La amortización en siete años la podemos realizar de dos formas, pagando la misma cantidad cada año o reduciendo el gasto anual progresivamente.

En el primer caso tenemos:

    Primer año: 585€*0,1429= 83,59€
    Segundo año: 585€*0,1429=83,59€
    Tercer año: 585€*0,1429= 83,59€
    Cuarto año: 585€*0,1429= 83,59€
    Quinto año: 585€*0,1429= 83,59€
    Sexto año: 585€*0,1429= 83,59€
    Séptimo año: 585€*0,1429= 83,59€
    
Reduciendo el gasto anual progresivamente lo que pagaríamos cada año sería lo siguiente:

    Primer año: 585€*0,25= 146,25€
    Segundo año: 585€*0,25= 146,25€
    Tercer año: 585€*0,15= 87,75€
    Cuarto año: 585€*0,15= 87,75€
    Quinto año: 585€*0,10= 58,5€
    Sexto año: 585€*0,05= 29,25€
    Séptimo año: 585€*0,05= 29,25€

## Ejercicio 2. Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar y con el resto de las características similares en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

## Ejercicio 3. Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

## Ejercicio 4. Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?
Para obtener el modelo de nuestro procesador realizamos en terminal un cat /proc/cpuinfo. En la siguiente imagen podemos ver la información el procesador:



