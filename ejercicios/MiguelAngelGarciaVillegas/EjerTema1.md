# Asignatura: IV Grupo de Practicas Miercoles 8:30h a 10:30h
## Miguel Ángel García Villegas 

# Ejercicios Tema 1

## Ejercicio 1. Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.

Tienda Informática: PcComponentes
Ordenador tipo servidor: HP ProLiant ML150 Gen 9 E5-2609v3/4GB 
Precio: 1369 IVA incluído
Enlace y más info: (http://www.pccomponentes.com/hp_proliant_ml150_gen_9_e5_2609v3_4gb.html) 

### Amortización a 4 años
Suponemos que el ordenador se compra a principios de año.

Dado que hay que quitar el IVA (21%), al precio del artículo quedaría:
1369/1,21 = 1131,40 € sin el 21% de IVA

1131,40€ / 4 años = 282,85 € por año. 

### Amortización a 7 años
Suponemos que el ordenador se compra a principios de año.

Dado que hay que quitar el IVA (21%), al precio del artículo quedaría:
1369/1,21 = 1131,40 € sin el 21% de IVA

1131,40€ / 7 años = 161,63 € por año. 

## Ejercicio 2. Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

He elegido en Axarnet, Servidor Advanced -> https://www.axarnet.es/servidores-vps/windows-linux-server-administrado/

Servidor Advanced, 4 Cores CPU, 4GB de RAM, 50GB Disco SSD, Tráfico ilimitado, 1 Dirección IP y Plesk 12 -30 dominios por 19,98€/mes.

19,98€ / 30 días = 0,67 €/día
0,67€ / 24 horas = 0,028 €/hora

He elegido en Strato, VPS Linux L2 https://www.strato.es/vps-linux/

VPS Linux L2, 4 Cpu, 8GB de RAM, 400GB Disco SSD por 14,90€/mes

14,90€ / 30 días = 0,49 €/día
0,67€ / 24 horas = 0,020 €/hora

#### *Para un uso anual del 1%*   

Axarnet -> 0,028/hora * 24h * 30dias * 1% =0.20€/mes 

Strato -> 0,020/hora * 24h * 30dias * 1% =0.14€/mes 

#### *Para un uso anual del 10%*   

Axarnet -> 0,028/hora * 24h * 30dias * 10% =2.016€/mes 

Strato -> 0,020/hora * 24h * 30dias * 10% =1.44€/mes 

#### Conclusiones

He realizado también una consultas a otro soporte, como es Arsys, http://www.arsys.es/servidor-cloud

Depende el fin y el uso por supuesto, pero creo que es más rentable, contratar un proveedor de servicios en la nube que un servidor dedicado. 


## Ejercicios 3. 
### a) ¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro

Los tipos de virtualización, que voy a encontrar en las prácticas, son de tipo, V. Plena y V. de Aplicaciones.


Cuando necesito utilizar SO sin modificar, utilizamos virtualización plena, en concreto he utilizado VirtualBox, -> https://www.virtualbox.org/.


Ahora cuando necesito ejecutar una aplicación de un sistema operativo distinto al que tengo, se utiliza una virtualización de aplicaciones, en concreto cuando he necesitado ejecutar un programa de Windows en Linux he utilizado Wine, -> https://www.winehq.org/

Enlace al comentario: https://github.com/JJ/IV-2015-16/issues/1#issuecomment-147682034

### b) Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

**PROGRAMA**

import re: 
//Que empiece por mayuscula
if re.search('^[A-Z]', cadena):
	print 'Si'
else:
	print 'No'

Instalar el paquete **CDE** -> **sudo apt-get install cde**

Para empaquetar el programa y poder ejecutarlo, utilizamos la orden

    cde python empieceMayus.py

## Ejercicios 4. Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?


**$ egrep '^flags.*(vmx|svm)' /proc/cpuinfo**

flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx lm constant_tsc arch_perfmon pebs bts rep_good nopl aperfmperf pni dtes64 monitor ds_cpl vmx smx est tm2 ssse3 cx16 xtpr pdcm sse4_1 lahf_lm dtherm tpr_shadow vnmi flexpriority
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx lm constant_tsc arch_perfmon pebs bts rep_good nopl aperfmperf pni dtes64 monitor ds_cpl vmx smx est tm2 ssse3 cx16 xtpr pdcm sse4_1 lahf_lm dtherm tpr_shadow vnmi flexpriority

##Salida 
**$ cat /proc/cpuinfo**

processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 23
model name	: Intel(R) Core(TM)2 Duo CPU     P8400  @ 2.26GHz
stepping	: 6
microcode	: 0x60c
cpu MHz		: 800.000
cache size	: 3072 KB
physical id	: 0
siblings	: 2
core id		: 0
cpu cores	: 2
apicid		: 0
initial apicid	: 0
fpu		: yes
fpu_exception	: yes
cpuid level	: 10
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx lm constant_tsc arch_perfmon pebs bts rep_good nopl aperfmperf pni dtes64 monitor ds_cpl vmx smx est tm2 ssse3 cx16 xtpr pdcm sse4_1 lahf_lm dtherm tpr_shadow vnmi flexpriority
bogomips	: 4521.21
clflush size	: 64
cache_alignment	: 64
address sizes	: 36 bits physical, 48 bits virtual
power management:

processor	: 1
vendor_id	: GenuineIntel
cpu family	: 6
model		: 23
model name	: Intel(R) Core(TM)2 Duo CPU     P8400  @ 2.26GHz
stepping	: 6
microcode	: 0x60c
cpu MHz		: 800.000
cache size	: 3072 KB
physical id	: 0
siblings	: 2
core id		: 1
cpu cores	: 2
apicid		: 1
initial apicid	: 1
fpu		: yes
fpu_exception	: yes
cpuid level	: 10
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx lm constant_tsc arch_perfmon pebs bts rep_good nopl aperfmperf pni dtes64 monitor ds_cpl vmx smx est tm2 ssse3 cx16 xtpr pdcm sse4_1 lahf_lm dtherm tpr_shadow vnmi flexpriority
bogomips	: 4521.21
clflush size	: 64
cache_alignment	: 64
address sizes	: 36 bits physical, 48 bits virtual
power management:


## Ejercicios 5. 
### a) Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.

He comprobado que no está instalado, aunque lo he instalado escribiendo:
**sudo apt-get install cpu-checker**

Ahora si teniendo instalado, muestra lo siguiente:
**$ sudo kvm-ok**
INFO: /dev/kvm does not exist
HINT:   sudo modprobe kvm_intel
INFO: Your CPU supports KVM extensions
INFO: KVM (vmx) is disabled by your BIOS
HINT: Enter your BIOS setup and enable Virtualization Technology (VT),
      and then hard poweroff/poweron your system
KVM acceleration can NOT be used


### b) Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.

Tengo instalado VirtualBox.
Si no lo tiene instalado y quiere instalarlo: **sudo apt-get install virtualbox**


