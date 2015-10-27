#Tema 1: Introducción a la infraestructura virtual

## Ejercicio 1 : Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.
Vamos a calcular el coste de amortización de un [Lenovo ThinkServer TS 440](http://www.amazon.es/Lenovo-ThinkServer-TS440-70AQ0009UX-E3-1225V3/dp/B00HEK9A8M/ref=lp_11036071_1_3/186-4709759-3585620?s=pc&ie=UTF8&qid=1444809467&sr=1-3) 1.679,23 €
Primero extraemos el precio sin IVA:
1679.23 / 1.21 = 1387.79 €

A esta base imponible podemos imputarle como gasto deducible un 25% de su valor en una *amortización a 4 años*:
1387.79 * 0.25 = 346.95 € por año

Sin embargo el gasto decucible en una *amortización a 7 años* es mayor los primeros años y se va decrementando progresivamente:
1387.79 * 0.25 = 346.95 € por el primer año
1387.79 * 0.25 = 346.95 € por el segundo año
1387.79 * 0.15 = 208.17 € por el tercer año
1387.79 * 0.15 = 208.17 € por el cuarto año
1387.79 * 0.10 = 138.78 € por el quinto año
1387.79 * 0.10 = 138.78 € por el sexto año
1387.79 * 0.05 = 69.39 € por el séptimo año

## Ejercicio 2 : Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

![Comparación servidores](http://i.imgur.com/v2JlKJt.png)
El precio del servidor en OHV.es es de 30€ la mes, lo que hace un total de **360€** al cabo de un año.
En 1&1 el monto asciende a 79.2€ por mes, en doce meses por tanto son **950.4€**
El uso al 1% tras un año sería de 3.6€ contra 9.504€
Finalmente tras un uso al 10% el coste sería de 36€ contra 95.04€


## Ejercicio 3 : Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

Primero instalamos el empaquetador de entorno con la orden:
```
sudo apt-get install cde
```

Y elegimos la aplicación que queremos virtualizar, en este caso un hola mundo escrito python.

```
#!/usr/bin/env python

print 'Hola mundo!'
```
Ejecutándo cde empaquetamos el programa:

```
cde python holamundo.py

```
Ahora podemos ejecutar el paquete creado en otras distribuciones


## Ejercicio 4 : Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?
En el fichero /proc/cpuinfo está contenida esta información:
![CPU](http://i.imgur.com/vSCO0ac.png)

## Ejercicio 5 : 1. Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.
No estaba instalado, pero puede ser usado tras ejecutar:
```
sudo apt-get install cpu-checker
```

## 2. Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.

VirtualBox y Vmware workstation instalados.

