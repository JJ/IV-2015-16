#Ejercicios Tema 1

##Ejercicio 1

###Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años

Para realizar el ejercicio he elegido [Dell PowerEdge R630](http://www.dell.com/es/empresas/p/poweredge-r630/pd?oc=per6301&model_id=poweredge-r630)

El precio sin IVA del equipo es 1.330 €

####Amortización a 4 años

Si queremos amortizarlo en un plazo de 4 años cada año amortizamos un [25%](http://www.infoautonomos.com/fiscalidad/gastos-deducibles-autonomos-irpf-estimacion-directa/), ya que es el máximo autorizado, por lo que cada año quedaría así:

* **Primer año**: 1.330 € * 0.25 = 332,5 €

* **Segundo año**: 1.330 € * 0.25 = 332,5 €

* **Tercer año**: 1.330 € * 0.25 = 332,5 €

* **Cuarto año**: 1.330 € * 0.25 = 332,5 €

####Amortización a 7 años

En el caso de amortizarlo a siete años podemos hacer lo siguiente:

* **Primer año**: 1.330 € * 0.25 = 332,5 €

* **Segundo año**: 1.330 € * 0.25 = 332,5 €

* **Tercer año**: 1.330 € * 0.10 = 133 €

* **Cuarto año**: 1.330 € * 0.10 = 133 €

* **Quinto año**: 1.330 € * 0.10 = 133 €

* **Sexto año**: 1.330 € * 0.10 = 133 €

* **Septimo año**: 1.330 € * 0.10 = 133 €

##Ejercicio 2

###Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

Para este ejercicio he elegido los siguientes servidores:

Por un lado, un [servidor en la nube](https://www.axarnet.es/servidores-cloud?gclid=CjwKEAjwhdOwBRDFsYTfhvzX1hYSJAAfCUcLlhWPqpC98amsCCPtwDXgPVC9YKxml8i-kNoV4QXIQBoClyfw_wcB) con las siguientes caracteristicas:

* **CPU**: 8vCPU
* **RAM**: 64GB
* **Almacenamiento**: 1TB

El precio de este servidor es de 199,95 € al mes y de (199,95 €/mes / 24 horas/dia / 31 dias/mes) 0,26875 € la hora


Por el otro lado esta el [servidor dedicado](http://www.1and1.es/server-dedicated-tariff#server)(concretamente la opcion X8i) con estas caracteristicas:

* **CPU**: Intel®Xeon® E5-2630 V3 8 Cores (HT)
* **RAM**: 64GB
* **Almacenamiento**: 4TB

El precio de este servidor es de 299,99 € al mes

Una vez presentados los servidores a calcular su coste cuando se usan el 1% y el 10% del tiempo:


Si los usamos el 1% del tiempo tendremos el siguiente gasto:

* Servidor cloud =  0.01 * (0,26875 €/h * 24h/dia * 31 dias/mes * 12 meses/año) = 23,994€ al año

* Servidor dedicado = 299,99 €/mes * 12 meses = 3599,88 € al año

Si los usamos el 10% del tiempo.

* Servidor cloud = 0.1 * (0,26875 €/h * 24h/dia * 31 dias/mes * 12 meses/año) = 239,94 € al año

* Servidor dedicado = 299,99 €/mes * 12 meses = 3599,88 € al año


##Ejercicio 3
###1. ¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro

Comentado en el [foro](https://github.com/JJ/IV-2015-16/issues/1)

###2. Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

Para este ejercicio he realizado un pequeño script con Python 2.6

~~~
#!/usr/bin/ python

print "Hola a todos!!"
~~~

Para instalar cde podemos usar `sudo apt-get install cde`

Tras instalarlo debemos empaquetar el script usando `cde python script.py` Al hacer esto se nos creara un archivo llamado cde.options y un directorio cde-package

![captura1](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/captura1_zps2sekwgtq.png)

Ahora probamos la ejecución, para ello debemos situarnos en el directorio correspondiente

![captura2](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/captura2_zpsdltl6vze.png)



##Ejercicio 4
###Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?

Mi procesador es: Intel® Core™ i5-4200M CPU @ 2.50GHz × 4

Aunque podemos obtener ver el contenido de /proc/cpuinfo

Al ejecutar la orden `egrep '^flags.*(vmx|svm)' /proc/cpuinfo` da la siguiente salida:

![captura3](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/captura4_zpskvgcbhl8.png)

Podemos ver que dispone del flag vmx


##Ejercicio 5
###1. Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden `kmv-ok`


Al intentar usar la orden nos pedirá instalar cpu-checker, tras esto podemos usarla sin nigun problema.

![captura4](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/captura5_zps0v2jts8s.png)

Podemos ver que mi ordenado contiene el módulo 


###2. Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.

Actualmente tengo instalado VMware Player, para instalarlo se puede seguir este [tutorial](http://askubuntu.com/questions/459817/how-to-install-vmware)








