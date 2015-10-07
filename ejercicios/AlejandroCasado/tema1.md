#Ejercicios Tema 1

##Ejercicio 1

###Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años

Para realizar el ejercicio he elegido este [servidor Dell](http://www.dell.com/es/empresas/p/poweredge-r630/pd?oc=per6301&model_id=poweredge-r630)

El precio sin IVA del equipo es 1.330 €

Si queremos amortizarlo en un plazo de 4 años cada año amortizamos un [26%](http://www.infoautonomos.com/fiscalidad/gastos-deducibles-autonomos-irpf-estimacion-directa/), salvo el último.

* Primer año: 1.330 * 0.26 = 345,8 €

* Segundo año: 1.330 * 0.26 = 345,8 €

* Tercer año: 1.330 * 0.26 = 345,8 €

* Cuarto año: 1.330 * 0.22 = 292,6 €

En el caso de amortizarlo a siete años podemos hacer lo siguiente:

* Primer año: 1.330 * 0.26 = 345,8 €

* Segundo año: 1.330 * 0.26 = 345,8 €

* Tercer año: 1.330 * 0.10 = 133 €

* Cuarto año: 1.330 * 0.10 = 133 €

* Quinto año: 1.330 * 0.10 = 133 €

* Sexto año: 1.330 * 0.10 = 133 €

* Septimo año: 1.330 * 0.08 = 106,4 €

##Ejercicio 2

###Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

####Servidor cloud 
[Opción Cloud MAX](https://www.axarnet.es/servidores-cloud?gclid=CjwKEAjwhdOwBRDFsYTfhvzX1hYSJAAfCUcLlhWPqpC98amsCCPtwDXgPVC9YKxml8i-kNoV4QXIQBoClyfw_wcB): 8vCPU 64 GB RAM

Precio a la hora: 0,26875 €/h

Precio al mes: 199.95 € 

Precio al año: 2399,4 €



####Servidor dedicado
[Opción X8i](http://www.1and1.es/server-dedicated-tariff?__lf=Static#server): 8 Cores 64 GB RAM

Precio al mes: 299,99 €

Precio al año: 3599,88 €


Usando el 1% del tiempo.

* Servidor cloud = 87,6 h * 0,26875 €/h = 23,5425 €

* Servidor dedicado = 199,95 €/mes

Usando el 10% del tiempo.

* Servidor cloud = 876 h *  0,26875 €/h = 235,425 €

* Servidor dedicado = 199,95€/mes

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








