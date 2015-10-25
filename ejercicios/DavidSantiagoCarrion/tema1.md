#Tema 1: Introducci�n a la infraestructura virtual

## Ejercicio 1 : Consultar en el cat�logo de alguna tienda de inform�tica el precio de un ordenador tipo servidor y calcular su coste de amortizaci�n a cuatro y siete a�os.
Vamos a calcular el coste de amortizaci�n de un [Lenovo ThinkServer TS 440](http://www.amazon.es/Lenovo-ThinkServer-TS440-70AQ0009UX-E3-1225V3/dp/B00HEK9A8M/ref=lp_11036071_1_3/186-4709759-3585620?s=pc&ie=UTF8&qid=1444809467&sr=1-3) 1.679,23 �
Primero extraemos el precio sin IVA:
1679.23 / 1.21 = 1387.79 �

A esta base imponible podemos imputarle como gasto deducible un 25% de su valor en una *amortizaci�n a 4 a�os*:
1387.79 * 0.25 = 346.95 � por a�o

Sin embargo el gasto decucible en una *amortizaci�n a 7 a�os* es mayor los primeros a�os y se va decrementaando progresivamente:
1387.79 * 0.25 = 346.95 � por el primer a�o
1387.79 * 0.25 = 346.95 � por el segundo a�o
1387.79 * 0.15 = 208.17 � por el tercer a�o
1387.79 * 0.15 = 208.17 � por el cuarto a�o
1387.79 * 0.10 = 138.78 � por el quinto a�o
1387.79 * 0.10 = 138.78 � por el sexto a�o
1387.79 * 0.05 = 69.39 � por el s�ptimo a�o

## Ejercicio 2 : Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un a�o de un ordenador con un procesador est�ndar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las caracter�sticas similares (tama�o de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa s�lo el 1% o el 10% del tiempo.

## Ejercicio 3 : 1. [Comentario en el hilo](https://github.com/JJ/IV-2015-16/issues/1)
2. Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

## Ejercicio 4 : Comprobar si el procesador o procesadores instalados tienen estos flags. �Qu� modelo de procesador es? �Qu� aparece como salida de esa orden?

## Ejercicio 5 : 1. Comprobar si el n�cleo instalado en tu ordenador contiene este m�dulo del kernel usando la orden kvm-ok.

2. Instalar un hipervisor para gestionar m�quinas virtuales, que m�s adelante se podr� usar en pruebas y ejercicios.