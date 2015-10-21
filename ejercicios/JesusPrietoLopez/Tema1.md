#Ejercicios - Jesús Prieto López
##TEMA 1

###Ejercicio 1: Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.

Para este ejercicio he seleccionado el siguiente producto de www.amazon.es:

[Servidor Fujitsu PRIMERGY TX1310-M1](http://www.amazon.es/Fujitsu-PRIMERGY-TX1310-M1-E3-1246V3/dp/B00KDXRQW4/ref=sr_1_7?s=computers&ie=UTF8&qid=1443773986&sr=1-7&keywords=servidor)

El precio total del producto son 959,99 €, pero para la amortización necesitamos el precio sin IVA. Podemos calcularlo facilmente desde [aquí](calculariva.es).

El precio resultante sin IVA son 793.38 €, que es lo que vamos a amortizar. [En este enlace](http://www.infoautonomos.com/fiscalidad/gastos-deducibles-autonomos-irpf-estimacion-directa/) podemos ver cual es la cuota máxima de amortización por año, que ahora mismo está en 26%.

**Amortización en 4 años**

- 1º: 26% de 793.38€ = 206,27 €
- 2º: 26% de 793.38€ = 206,27 €
- 3º: 26% de 793.38€ = 206,27 €
- 4º: 22% de 793.38€ = 174,54 €

Los primeros 3 años podemos amortizarlo al máximo, mientras que el cuarto año sería al 22% restante que queda para amortizarlo.

**Amortización en 7 años**

- 1º: 15% de 793.38€ = 119,01 €
- 2º: 15% de 793.38€ = 119,01 €
- 3º: 15% de 793.38€ = 119,01 €
- 4º: 15% de 793.38€ = 119,01 €
- 5º: 15% de 793.38€ = 119,01 €
- 6º: 15% de 793.38€ = 119,01 €
- 7º: 10% de 793.38€ = 	79,32 €

Aquí al tener más margen de años podemos dividir la amortización y pagar menos cada año, aunque también podríamos haber intentado amortizar el máximo los primeros años y dividir lo restante de amortización en los últimos años.


###Ejercicio 2: Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

Para el servidor de alojamiento en internet he utilizado el proveedor [Hostinger](http://www.hostinger.es) y le he comparado con el proveedor [Microsoft Azure](https://azure.microsoft.com).

![Precio máquina virtual de Microsoft Azure](http://imgur.com/IWwee0Z.png)
![Precio servidor Hostinger](http://imgur.com/ZhSabMQ.png)

Microsoft Azure: 1 núcleo, 1 GB RAM, 20	GB en disco

11,29 €/mes | 0,015 €/h

Servidor Hostinger: 1 núcleo, 1 GB RAM, 20 GB en disco

6,99 €/mes

####Precio de uso del 1% del tiempo

Si calculamos a un año, un año regular tiene 8760 horas. Si lo utilizamos el 1% del tiempo quiere decir que lo utilizamos 87,6 horas (8760 * 0,01).

Microsoft Azure: 87,6h * 0,015 €/h = 1,314 €

####Precio de uso del 10% del tiempo

Igual que antes, solo que ahora en vez de utilizarlo un 1% se utilizará el 10% de tiempo. es decir, 870 horas.

Microsoft Azure: 876h * 0,015 €/h = 13,14 €

####Conclusión

Está claro que el proveedor de servicios nos saldrá más rentable en plazos de tiempo más cortos ya que permite pagar por uso, y no por el hecho de contratarlo tal mes, como en el caso del servidor dedicado.

###Ejercicio 3
1. ¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro

Lo he comentado en el [siguiente enlace](https://github.com/JJ/IV-2015-16/issues/1).

2. Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

He utilizado un pequeño programa desarrollado en Python, en la asignatura "DAI". El programa consiste en ir introduciendo números para intentar acertar que número se ha generado aleatoriamente, es el siguiente:

```python
#!/usr/bin/env python

import math
import random

num_adivinar = random.randrange(100)
num_intento = -1

while num_intento != num_adivinar:
	num_intento = int(input("Introduce un número:"))
	if num_intento > num_adivinar:
		print ("El número a adivinar es menor")
	elif num_intento < num_adivinar:
		print ("El número a adivinar es mayor")
	else:
		print ("Has acertado el número")
```

Después de instalar CDE (`apt-get install cde`) empaquetamos el programa creado en python (he utilizado python3).

`$ cde python3 adivinar.py`

Después en ese directorio donde estamos situados se crearán dos archivos "cde-options" y "cde-package". Accedemos a "cde-package/cde-root/home/usuario/" donde el usuario será nuestro nombre de usuario utilizado en linux, y debemos acceder al directorio con el mismo nombre y localización desde donde empaquetamos el ejecutable.

Después solo aparecerán dos archivos: "python3.cde" y el programa que empaquetamos, en este caso "adivinar.py". Ejecutamos la siguiente orden:

`$ python3.cde adivinar.py`

###Ejercicio 4: Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?

Mi procesador es Intel Core i3 M330 2.13GHz

Como salida de la orden `$ egrep '^flags.*(vmx|svm)' /proc/cpuinfo` aparece:

![Salida del comando para ver los flags](http://imgur.com/lnIX58x.png)

###Ejercicio 5:
1. Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden `kvm-ok`.

Parece ser que si tiene el módulo.

![Salida del comando kvm-ok](http://imgur.com/JsOwMzQ.png)

2. Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.

Yo utilizo [VMWARE](http://www.vmware.com/es).

