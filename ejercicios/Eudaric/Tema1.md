#Tema 1: Introducción a la infraestructura virtual: concepto y soporte físico

## Ejercicio 1. Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.

He elegido el [HP ProLiant ML310e G8 XE E3-1220/8GB/2TB](http://www.pccomponentes.com/hp_proliant_ml310e_g8_xe_e3_1220_8gb_2tb.html), de PcComponentes. El precio es de 729 € (602.48 € sin IVA)

####Amortización a 4 años
La amortización máxima del 25% por año (para cuatro años): 602.48*0.25 = 150.62 € de amortiazación por año. 
####Amortización a 7 años
Cada año 602.48*0.1429 = 86.09 €

##Ejericio 2. Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.
| Proveedor | CPUs | RAM | Precio |
|-----------|------|-----|--------|
|   Google App Engine |   1  |3.75 GB| 22.83 €/mes|
|Microsoft Azure| 1 | 1.75 GB| 38 €/mes|
|Microsoft Azure| 2 | 3.5 GB| 76 €/mes|

##Ejercicio 3:
####1. ¿Qué tipo de virtualización usarías en cada caso?
[Comentar en el foro](https://github.com/JJ/IV-2015-16/issues/1)

#### 2. Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones

##Ejercicio 4. Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?
Con la orden:
` egrep'^fraag.*(vmx|sm)' /proc/cpuinfo`

El resultado de dicha orden:
`flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer xsave avx lahf_lm ida arat epb pln pts dtherm tpr_shadow vnmi flexpriority ept vpid xsaveopt`

Vemos los flags que tenemos activados en nuestros procesadores. Mi procesador uno de los flags que tiene activado el flag **vmx**, que indica que tengo la posibilidad de virtualizar a nivel hardware y además está activada, dicha virtualización se hará a través de VT-x de Intel.

Con la orden:
`cat /proc/cpuinfo/`
Vemos toda la información de nuestros procesadores. En mi caso, el modelo de mi procesador es un **Intel(R) Core(TM) i7-2670QM CPU @ 2.20GHz**

##Ejercicio 5:
####1. Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden *kvm-ok*.
Usando dicah orden, nos indica que nuestro kernel no tiene dicho módulo y nos aconseja instalarlo a partir del paquete **cpu-checker**, así que lo isntalamos. Una vez instalado volvemos a usar la orden **kvm-ok** y nos muestra que sí está instalado.
```
~$ kvm-ok
INFO: /dev/kvm exists
KVM acceleration can be used
```
####2. Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.
Desde este [enlace](http://www.ubuntugeek.com/install-qemu-on-ubuntu-14-10-and-mange-qemu-with-virt-manager.html) de **Ubuntu Geek** nos explica como instalar **QEMU**. En mi caso, he instalado **VirtualBox**, ya que es la que más he usado hasta hora como hipervisor.



