#Ejercicios tema 1 
--------
##Ejercicio 1
####Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.

Las tablas de amortización que fija cada año la [agencia Tributaria](http://www.agenciatributaria.es/static_files/AEAT/Contenidos_Comunes/La_Agencia_Tributaria/Segmentos_Usuarios/Empresas_y_profesionales/Impuesto_sociedades/Novedades_Impuesto_Sociedades_publicadas_2014/Comparativa_Sociedades_dic.pdf) en el caso de un equipo informático ,el coeficiente de amortización máximo es del 25 % 
Por lo tanto para un servidor HP ProLiant DL60 Gen 9 E5-2603v3/4GB [2] con un coste de 978 euros sin iva ,la amortización anual sería 244,75 euros /año. 

A 4 años la amortización es 244,74 * 4= 978,96 euros

A 7 años la amortización es 

1)978*0.25=244,5 

2) (978-244.5 )*0.25=  733.5 *0.25 =183.375

3) (733.5 -183.375)*0.25=550.25 *0.25= 137.531

4) (550.25-137.531 ) *0.25= 412.719 *0.25=103.18

5) (412.719-103.18) *0.25 = 309.539 *0.25=77.384

6) (309.539-77.384)*0.25 = 232.155 *0.25=58.038

7) (231.155-58.038)*0.25=173.117 *0.25=43.279


##Ejercicio 2
#####Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.


[tabla de caracterisiticas del servivio ofrecido por hostalia ](http://s1175.photobucket.com/user/Bob_Mures/media/1and1_sevidor_dedicado_zpsm6h1rwns.png.html)

[tabla de caracterisiticas del servivio ofrecido por adw](http://s1175.photobucket.com/user/Bob_Mures/media/adw.es_servidor_dedicado_zps5lypevfw.png.html)

Si comparamos el ordenador de la más alta gama ,la empresa [adw](http://www.adw.es/servidores-dedicados.html) ofrece un servidor con 32 GB de memoria ram ,un procesador con 4 cores y 8 hebras ,512 gb ssd de disco duro  por un precio de 80 euros /mes.
En cambio [1and1](http://www.1and1.es/server-dedicated-tariff?ac=OM.WE.WE861K171022T7073a&s_kwcid=AL!3115!3!89964622128!b!!g!!%2Bservidor%20%2Bdedicado&ef_id=VdrGdwAABXebOZXf:20151005085150:s#server) ofrece un servidor con 16 GB de memoria ram ,un prcesador con 4 núcleo y un disco duro SATA de 1000GB a un precio de 40 euros /mes los tres primero meses ,despúes ofrece el servicio a 80 euros/mes.

Como podemos observar el precio no es muy variable entre ambos proveedores.Sin embargo hay que tener en cuenta pequeños detalles a la hora de contratar un proveedor u otro.

##Ejercicio 3 
####¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro
[Ver foro](https://github.com/JJ/IV-2015-16/issues/1)

##Ejercicio 4
####Comprobar si el procesador o procesadores instalados tienen estos flags. 
Lo comprobamos con la orden 

`sysctl -a | grep machdep.cpu`

####¿Qué modelo de procesador es? 

`Intel(R) Core(TM) i5-4278U CPU @ 2.60GHz`

####¿Qué aparece como salida de esa orden?

`machdep.cpu.max_basic: 13
machdep.cpu.max_ext: 2147483656
machdep.cpu.vendor: GenuineIntel
machdep.cpu.brand_string: Intel(R) Core(TM) i5-4278U CPU @ 2.60GHz
machdep.cpu.family: 6
machdep.cpu.model: 69
machdep.cpu.extmodel: 4
machdep.cpu.extfamily: 0
machdep.cpu.stepping: 1
machdep.cpu.feature_bits: 3219913727 2147154879
machdep.cpu.leaf7_feature_bits: 10155
machdep.cpu.extfeature_bits: 739248384 33
machdep.cpu.signature: 263761
machdep.cpu.brand: 0
machdep.cpu.features: FPU VME DE PSE TSC MSR PAE MCE CX8 APIC SEP MTRR PGE MCA CMOV PAT PSE36 CLFSH DS ACPI MMX FXSR SSE SSE2 SS HTT TM PBE SSE3 PCLMULQDQ DTES64 MON DSCPL VMX EST TM2 SSSE3 FMA CX16 TPR PDCM SSE4.1 SSE4.2 x2APIC MOVBE POPCNT AES PCID XSAVE OSXSAVE SEGLIM64 TSCTMR AVX1.0 RDRAND F16C
machdep.cpu.leaf7_features: SMEP ENFSTRG RDWRFSGS TSC_THREAD_OFFSET BMI1 AVX2 BMI2 INVPCID
machdep.cpu.extfeatures: SYSCALL XD 1GBPAGE EM64T LAHF RDTSCP TSCI
machdep.cpu.logical_per_package: 16
machdep.cpu.cores_per_package: 8
machdep.cpu.microcode_version: 23
machdep.cpu.processor_flag: 6
machdep.cpu.mwait.linesize_min: 64
machdep.cpu.mwait.linesize_max: 64
machdep.cpu.mwait.extensions: 3
machdep.cpu.mwait.sub_Cstates: 286531872
machdep.cpu.thermal.sensor: 1
machdep.cpu.thermal.dynamic_acceleration: 1
machdep.cpu.thermal.invariant_APIC_timer: 1
machdep.cpu.thermal.thresholds: 2
machdep.cpu.thermal.ACNT_MCNT: 1
machdep.cpu.thermal.core_power_limits: 1
machdep.cpu.thermal.fine_grain_clock_mod: 1
machdep.cpu.thermal.package_thermal_intr: 1
machdep.cpu.thermal.hardware_feedback: 0
machdep.cpu.thermal.energy_policy: 1
machdep.cpu.xsave.extended_state: 7 832 832 0
machdep.cpu.arch_perf.version: 3
machdep.cpu.arch_perf.number: 4
machdep.cpu.arch_perf.width: 48
machdep.cpu.arch_perf.events_number: 7
machdep.cpu.arch_perf.events: 0
machdep.cpu.arch_perf.fixed_number: 3
machdep.cpu.arch_perf.fixed_width: 48
machdep.cpu.cache.linesize: 64
machdep.cpu.cache.L2_associativity: 8
machdep.cpu.cache.size: 256
machdep.cpu.tlb.inst.large: 8
machdep.cpu.tlb.data.small: 64
machdep.cpu.tlb.data.small_level1: 64
machdep.cpu.tlb.shared: 1024
machdep.cpu.address_bits.physical: 39
machdep.cpu.address_bits.virtual: 48
machdep.cpu.core_count: 2
machdep.cpu.thread_count: 4
MacBook-Pro-de-Bogdan:~ bogdan$ 
`

##Ejercicio 5 
####Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.
Instalamos QEMU en MAC OS X [sequimos los pasos ](http://docs.pistoncloud.com/support_docs/how_tos/install_qemu_mac_os_x.html)






