# **Ejercicios Tema 1**

###**Ejercicio 1**:Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.

El servidor escogido es el [HP ProLiant ML350 Gen9 E5-2620v3](http://www.pccomponentes.com/hp_proliant_ml350_gen9_e5_2620v3_16gb_2x300gb.html) de Pccomponentes.

Sobre el equipo:

 - Procesador Intel® Xeon® E5-2620 v3 (6 núcleos, 2,4 GHz, 15 MB, 85 W)
 - Disco duro 2x300GB
 - Unidad Óptica No incluye
 - Memoria RAM 16GB
 - Red
	 - Ethernet
	 - LAN 10/100/1000Base
	 - Tipo de interfaz ethernet Gigabit
 - Control de energía
 - Fuente de alimentación 2x500W
 - Dimensiones (Ancho x Profundidad x Altura): 21.9 x 76.9 x 46.4 cm
 - Peso 30 kg

Pasamos a calcular su amortización:

- Precio con IVA: 2965€ 

- IVA (21%): 514.59€

- Total Sin IVA: 2450.41 € 

**Amortización a 4 años**
Si consideramos que cada año tiene una amortización máxima, es decir del 25%, tenemos que el servidor nos cuesta 2450.41 * 0.25  =  612.60 € cada año.
**Amortización a 7 años**

Si consideramos que el servidor  se amortiza más los primeros años y menos los últimos años, tenemos que cada año:

- **Primer año:** 2450.41 * 0.25  =  612.60 
- **Segundo año:** 2450.41 * 0.25 = 612.60 
- **Tercer año:** 2450.41 * 0.15 = 367.56
-  **Cuarto año:** 2450.41 * 0.15 = 367.56
- **Quinto año:** 2450.41 * 0.10 = 245.04
- **Sexto año:** 2450.41 * 0.05 = 122.52
- **Séptimo año:** 2450.41 * 0.05 = 122.52


----------
###**Ejercicio 2**:Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

Para la comparativa he escogido por un lado un servidor dedicado que ofrece [Arsys](http://www.arsys.es/servidores/dedicados) con las siguientes características:

- **Procesador:** Intel Xeon 4 Core, 2 GHz
- **RAM:**  8GB
- **Disco Duro:** 2x500 GB SATA Hw RAID 1 
- **Coste:**  125.00€/mes

Por otro lado he escogido una máquina virtual de Azure con las siguientes carácteristicas:

Es una instancia [A3](https://azure.microsoft.com/es-es/pricing/calculator/):

- **Procesador:** 4 núcleos
- **RAM:**  7 GB
- **Disco Duro:** 120 GB 
- **Coste:**  0,202 €/h

**Si se usa el 1% del tiempo:**

Arsys: 125.00€/mes * 12 meses = **1500€**

Azure: 0,202 €/h =>150,58 €/MES * 0.01 = 1.5058€/MES  * 12 Meses = **18.0696€**

**Se usa el 10% del tiempo:**

Arsys: 125.00€/mes * 12 meses = **1500€**

Azure: 0,202 €/h =>150,58 €/MES *  0.1 = 15.058€/Mes * 12 Meses = **180.696€**

Como podemos observar la opción de usar máquinas virtuales en la nube es mucho más económica que la de usar un servidor dedicado.


----------
###**Ejercicio 3.1**:¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro



Usaría una virtualización plena si lo que queremos es poder disponer de varias máquinas virtuales con sistemas operativos completos y distintos, para ello podemos usar hipervisores como son VMware Player o VirtualBox, por ejemplo.

Usaría una virtualización de aplicación si lo que queremos es ejecutar una aplicación de Windows en Linux, usando WINE, por ejemplo.

Usaría la virtualización de entornos de desarrollo cuando por ejemplo se quiere usar phyton y evitar así crear conflictos con el sistema u otros proyectos.

----------
###**Ejercicio 3.2**:Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

El programa creado es:

    # Fichero holamundo.py
    
    print "Hola Mundo";
Lo siguiente que he hecho ha sido instalar cde en mi equipo, para ello:

    sudo apt-get install cde
Después empaquetamos el script con:

`cde python holamundo.py ` 

Nos situamos en el directorio /home/angel/cde-package/cde-root/home donde encontramos el fichero **python.cde** 

    angel@angel-pc:~/cde-package/cde-root/home/angel$ ./python.cde holamundo.py 
    Hola Mundo
    
----------
###**Ejercicio 4**:Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?


Usamos :

    
    cat /proc/cpuinfo

Para saber el tipo de procesador que usamos, en mi caso es:

Intel(R) Core(TM) i5-2450M CPU @ 2.50GHz

Para la orden:

    egrep '^flags.*(vmx|svm)' /proc/cpuinfo
Obtengo la salida:

`angel@angel-pc:~$ egrep '^flags.*(vmx|svm)' /proc/cpuinfo
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx rdtscp lm constant_tsc arch_perfmon pebs bts xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority ept vpid
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx rdtscp lm constant_tsc arch_perfmon pebs bts xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority ept vpid
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx rdtscp lm constant_tsc arch_perfmon pebs bts xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority ept vpid
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx rdtscp lm constant_tsc arch_perfmon pebs bts xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority ept vpid`

Por tanto, mi equipo dispone de capacidades de virtualización.

----------
###**Ejercicio 5.1**: Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.

Lo primero que debemos hacer es instalar kvm:

    sudo apt-get install cpu-checker

Ahora desde la terminal ejecutamos:

    sudo kvm-ok
INFO: /dev/kvm exists
KVM acceleration can be used


----------
###**Ejercicio 5.2**:  Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.

He instalado Virtualbox.
