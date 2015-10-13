Lista de ejercicios Javier RUiz César
============================

#TEMA 1: Introducción a la infraestructura virtual: concepto y soporte físico#



###Ejercicio 1###

#####Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años. Consultar este artículo en Infoautónomos sobre el tema.#####

[Servidor al que calcular la amortización](http://www.pccomponentes.com/hp_proliant_ml310e_g8_xe_e3_1220_8gb_2tb.html?gclid=CKGXptPKiMECFfHKtAodVQ0ABQ)
El servidor tiene un precio de 729€.


+ El precio sin el IVA (base imponible) es 602,48€. El IVA es de 729-602,48=126,52€.


######Amortización a 4 años######
Se amortiza un 25% de la base imponible/año. Es decir, 150,62€/año.
Suponiendo que lo comprásemos ahora, en el año 2015 solo amortizaría los meses de octubre, noviembre y diciembre (la amortización por mes es de 12,552€).

Amortización:
* Año 2015: 12,552*3=37,656€
* Año 2016: 150,62€
* Año 2017: 150,62€
* Año 2018: 150,62€
* Año 2019: 12,552*9=112,968€


######Amortización a 7 años######
Se amortiza un 14,29% de la base imponible/año. Es decir, 86,09€/año.
Suponiendo que lo comprásemos ahora, en el año 2015 solo amortizaría los meses de octubre, noviembre y diciembre (la amortización por mes es de 7,17€).

Amortización:
* Año 2014: 7,17*3=21,51€
* Año 2015: 86,09€
* Año 2016: 86,09€
* Año 2017: 86,09€
* Año 2018: 7,17*9=64,53€


***

###Ejercicio 2###
#####Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) si la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.#####

[VPS Hostinger Plan 1](http://www.hostinger.es/hosting-vps)
* 1024 MB RAM
* CPU 2,4Ghz
* 1.00 GB transferencia mensual
* Espacio en disco de 20 GB
* 6.99€/mes

[Amazon EC2 t2.micro](http://aws.amazon.com/es/ec2/pricing/)
* 1 vCPU
* 1 GiB de memoria
* $0.013/hora = 0.01€/hora
* Almacenamiento EBS

######Si solo se usa un 1%######
+ **Hostinger** : se pagaría 6.99€/mes * 12 meses = 83.88€/año
+ **Amazon** : (0.01€/hora * 24h/día * 30 días/mes * 12 meses/año) * 0.01 = 0.891326€/año


######Si solo se usa un 10%######
+ **Hostinger** : se pagaría 6.99€/mes * 12 meses = 83.88€/año
+ **Amazon** : (0.01€/hora * 24h/día * 30 días/mes * 12 meses/año) * 0.1 = 8.91326€/año


***

###Ejercicio 3###
##### 1. ¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro#####
#####2. Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.#####

######Parte 2#####

Código (en prueba.py)

```python
#!/usr/bin/env python
# -*- coding: utf-8 -*-

#!/usr/bin/env python
# -*- coding: utf-8 -*-

n = 1
while n <= 25: 
    print n,
    n += 1
```

Una vez comprobado que funciona,

+ Instalamos CDE utilizando "sudo apt-get install cde"
+ Ejecutamos el programa utilizando "cde python programa.py"
+ Entramos al directorio "/cde-package/cde-root/home/miUsuario" con "cd".
+ Ejecutamos "./python.cde prueba.py", ya que hay que ejecutar el programa con extensión "cde" y pasarle como parámetro aquellos ficheros que necesitemos.

Lo llevamos a otra máquina, ejecutamos el último paso y comprobamos que funciona correctamente.


***

###Ejercicio 4###
#####Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?#####
El procesador es "Intel® Core™ i7-2720QM CPU @ 2.20GHz × 8".
La salida del comando es la siguiente:

![Comprobación de flags](http://i60.tinypic.com/j8cspd.png)



***


### Ejercicio 5###

#####Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.#####
Al ejecutarlo, el sistema me ha solicitado que instalase un paquete. 
Lo instalo utilizando "sudo apt-get install cpu-checker".
Ejecuto "kvm-ok" y he obtenido la siguiente salida:
>INFO: /dev/kvm exists
>KVM acceleration can be used

Por lo que puedo utilizar KVM.


***


***
***
***
