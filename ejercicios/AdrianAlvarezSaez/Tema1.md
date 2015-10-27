#Tema 1#

##Ejercicio 1##

###Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.###

Para calcular el coste de amortización se ha elegido el servidor [HP ProLiant ML110 Gen9 E5-2620v3/8GB/1TB](http://www.pccomponentes.com/hp_proliant_ml110_gen9_e5_2620v3_8gb_1tb.html) a la venta en PcComponentes y su precio es 1311€, sin IVA 1083.47€.

Según las tablas oficiales de amortización lineal publicadas en la [Ley 27/2014, de 27 de noviembre](http://www.boe.es/buscar/act.php?id=BOE-A-2014-12328&tn=1&p=20150922&vd=#a12), se establece un coeficiente lineal máximo de amortización del **25%** para equipos *Equipos para procesos de información* para un periodo de 8 años máximo.

####Para el caso de la estimación de la vida útil del producto en 4 años:####

Suponemos un valor residual de 250€, por tanto la **Base de amortización** = 1083.47 - 250 = **833.47€**

Usando el método de amortización según tablas oficiales de amortización lineal obtenemos una **cuota de amortización anual** = 833.47 / 4 = **208.37€**


|Año|Base de amortización|Coef. de amortización|Amortización acumulada|Valor neto|
|---|--------------------|---------------------|----------------------|----------|
|1  |833.47€             |25%                  |208.37€               |875,1     |
|2  |833.47€             |25%                  |416.74€               |666,73    |
|3  |833.47€             |25%                  |625.11€               |458,36    |
|4  |833.47€             |25%                  |833.47€               |**250**   | **= Valor residual**|


####Para el caso de la estimación de la vida útil del producto en 7 años:####

Suponiendo un valor residual de 150€, por tanto la **Base de amortización** = 1083.47 - 150 = **933.47€**

Para este caso se usara un método de amortización más realista, que tiene en cuenta que el valor del equipo no se degrada de forma homogénea a lo largo de su vida útil, este es el **método de los números dígitos**.

Dado que el valor del equipo descenderá en mayor medida cuanto más antigüedad tenga, calculamos la suma de dígitos de forma creciente empezando por la unidad para el primer año: **1+2+3+4+5+6+7 = 28**.

La **cuota por dígito** sería 933,47/28 = 33.34€****

|Año|Dígitos|Base de amortización|Amortización         |Amortización acumulada|Valor neto|
|---|-------|--------------------|---------------------|----------------------|----------|
|1  |1      |933.47€             |1x33.34 = 33.34      |33.34                 |1050.13   |
|2  |2      |933.47€             |2x33.34 = 66.68      |100.02                |983.45    |
|3  |3      |933.47€             |3x33.34 = 100.02     |200.04                |883.43    |
|4  |4      |933.47€             |4x33.34 = 133.36     |333.4                 |750.07    |
|5  |5      |933.47€             |5x33.34 = 166.7      |500.1                 |583.37    |
|6  |6      |933.47€             |6x33.34 = 200.04     |700.14                |383.33    |
|7  |7      |933.47€             |7x33.34 = 233.38     |933.47                |**150**   | **= Valor residual**|

##Ejercicio 2##

###Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.###
Para la comparativa he escogido [Azure](www.azure.microsoft.com) de Microsoft como proveedor de servicios en la nube y a [Hostalia](http://www.hostalia.com/) para el servicio de servidor dedicado.

####Azure
Ofrece una máquina virtual (D3) con 4 núcleos, 14GB de RAM y 200GB de disco duro SSD por un precio de [0.283€/h](https://azure.microsoft.com/es-es/pricing/calculator/). En el caso de que se usara las 24 horas del día costaría **210,81€** al mes.
####Hostalia
Por [99€](http://www.hostalia.com/dedicados/) al mes obtenemos un servidor dedicado Dell PowerEdge R220 con 4 núcleos, 16GB de memoria RAM y dos discos duros SATA de 1TB.

####Supuesto del 1% de uso de la infraestructura
En el caso del servidor dedicado de Hostalia independientemente del uso que se haga el precio será fijo, en total **99€ \* 12 meses = 1188€ al año**

Sin embargo en el caso de Azure si varía el precio **210,81€ \* 12 meses \* 0,01 = 25,30€ al año**

####Supuesto del 10% de uso de la infraestructura
Al igual que en el supuesto anterior el servidor de Hostalia costaría **1188€** al año.

Para Azure tenemos **210,81€ \* 12 meses \* 0,1 = 252,97€ al año**

####Conclusión
A menos que hagamos un gran uso de las infraestructura, superior al 50% más o menos, la opción de contratar proveedores de servicios en la nube es mucho más rentable que el alquiler de un servidor dedicado.

##Ejercicio 3##

###1. ¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro.###
Si necesito ejecutar varias aplicaciones y funcionalidades de un SO diferente al mio de forma simultanea utilizo virtualización plena mediante el uso de hipervisores, normalmente de tipo 2 como VirtualBox.
En caso de necesitar ejecutar solo una apliación específica sin necesidad explícita de las demás funciones del SO usaría virtualización de aplicaciones usando algún emulador como Wine.
Cuando se necesita probar aplicaciones en un entorno seguro y que simule al de producción es recomendable usar contenedores (virtualización a nivel de sistema operativo) como por ejemplo Docker.

###2. Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.###

El programa creado consiste en un simple print.
```python
#!/usr/bin/env python3

print ("IT'S ALIVE")

```

Para empaquetar el programa simplemente usamos la orden **CDE** seguida del comando necesario para ejecutar el programa creado.

![Empaquetado con CDE](https://www.dropbox.com/s/t8yh4aopfsxorqh/Tema1_Ejercicio3_2.png?dl=1 "Empaquetado con CDE")

Si listamos el contenido del directorio donde hemos ejecutado la orden encontramos un archivo **cde.options** y una carpeta **cde-package**, el primero nos permite personalizar el comportamiento de **cde-exec** al ejecutar comandos dentro del paquete, la carpeta es donde se han empaquetado todos los archivos necesarios para la ejecución del comando que le pasamos como argumento.

Empaquetamos estos archivos en un tar y los enviamos al ordenador en el que queremos ejecutarlo, una vez descomprimidos, dentro del paquete encontraremos un directorio llamado **cde-root** que contiene el arbol de directorios incluida la carpeta donde se empaqueto el programa python, una vez situados en ese directorio ejecutamos el script python usando el programa **cde-exec** que se encuentra en la raiz del paquete **cde-package**, para evitar tener que poner una hilera de puntos y barras para la ruta relativa CDE crea automáticamente un script de shell en el mismo directorio donde se encuentra el programa python evitando así tener que introducir la larga ruta relativa.

![Ejecución paquete con cde-exec](https://www.dropbox.com/s/68ovx2hbttkl1u7/Tema1_Ejercicio3_2_1.png?dl=1 "Ejecución paquete con cde-exec")


##Ejercicio 4##

###Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?###

El modelo del procesador es un [Intel Core i3-350M](http://ark.intel.com/es-es/products/43529/Intel-Core-i3-350M-Processor-3M-Cache-2_26-GHz) con tecnología de virtualización Vt-x de Intel, para comprobar que esta característica esta activada comprobamos la lista de **flags** en el fichero virtual **/proc/cpuinfo**, para ello usamos el siguiente comando:

    egrep --color '(vmx|vt)' /proc/cpuinfo

![Flags del procesador](https://www.dropbox.com/s/vpuq2t37leewg3v/Tema1_Ejercicio4.png?dl=1 "Flags del procesador")


##Ejercicio 5##
###1. Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden *kvm-ok*.###
La orden **kvm-ok** es proporcionada por el paquete [CPU-Checker](https://launchpad.net/cpu-checker).

![Comprobación de KVM con kvm-ok](https://www.dropbox.com/s/iysdrcvwmmjjxtw/Tema1_Ejercicio5_1.png?dl=1 "Comprobación de KVM con kvm-ok")

El resultado del script muestra que la aceleración KVM esta activada y puede usarse.

###2. Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.###
He optado por utilizar VirtualBox 5.0

![Hipervisor instalado](https://www.dropbox.com/s/fd8tytkmna10u7g/Tema1_Ejercicio5_2.png?dl=1 "Hipervisor instalado")
