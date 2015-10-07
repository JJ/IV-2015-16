###Tema 1

##Ejercicio1: Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.

Para el ejercicio usaremos este ordenador: Hp-500-315ns-intel-core-i5-4460s-8gb-1-tb--intel-hd-graphics-dvdrw--usb-3.0-wifi-win-8.1

Usando como ejemplo un ordenador servidor de 599 euros. Imaginamos que compramos el ordenador el 6/01/2015. Con lo que el primer año tendremos que contarlo entero, al comprarlo en el primer trimestre. Calculamos el precio sin iva de dicho ordenador: 599 / 1,21 = 495 €.

**Amortización a 4 años con un 25% cada año:**

Año 2015, 2016, 2017, 2018 y 2019: 123, 76 €

Para la amortización a 7 años imaginaremos que el ordenador lo compramos en mitad del año, en este caso el 6/07/2015. El primer y segundo año pondremos un 25% y el resto un 10 %.

**Añortización a 7 años:**

Año 2015: 61,88 €, Año 2016: 123, 76 € Año 2017, 2018, 2019, 2020, 2021: 49,5 €, Año 2022: 61,88 €

##Ejercicio2: Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

Para la comparación usare los siguiente servidores:

http://aws.amazon.com/es/ec2/

https://cloud.google.com/compute/

**Cálculo de los precios al 1% de uso:**

Amazon: 0,126714105 * 87,6 horas = 11,15084124 euros.
Google: 0,114834658 * 87,6 horas = 10,105449904 euros.

**Cálculo de los precios al 10% de uso:**

Amazon: 0,126714105 * 876 = 111,00155598 euros
Google: 0,114834658 * 876 horas = 100,595160408 euros

##Ejercicio3: Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

Ejercicio3.py

```shell
#!/usr/bin/env python

print "Esto es un ejercicio"
```

Instalamos CDE: 
```shell 
apt-get install cde.
```

Para empaquetar utilizamos la siguiente orden: 
```shell 
cde python Ejercicio3.py 

```

##Ejercicio4: Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?

Para visualizar el modelo de procesador usamos:
```shell
cat /proc/cpuinfo
```

Aparece en pantalla: 
```shell
model name : Intel(R) Core(TM) i5 CPU M 430 @ 2.27GHz
```

Tras introducir la orden:
```shell
egrep '^flags.*(vmx|svm)' /proc/cpuinfo
```

No aparece nada por lo que vemos que no tiene la función activada o no tiene dicha funcionalidad.

##Ejercicio 5: Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok. Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.

Usando el siguiente comando: ```shell kvm-ok ``` Vemos que aparece lo siguiente en pantalla:
```shell
 INFO: /dev/kvm exists 
 KVM acceleration can be used
```

Como hipervisor he elegido VirtualBox, para instalarlo uso: ```shell apt-get install virtualbox-qt ```

Aunque en este caso ya tenia el hipervisor instalado por otras asignaturas, por lo que no me hizo falta instalarlo.
