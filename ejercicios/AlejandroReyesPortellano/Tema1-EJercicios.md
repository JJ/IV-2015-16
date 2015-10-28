#Ejercicio 1: Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años. Consultar este artículo en Infoautónomos sobre el tema.

El articulo elejido y toda su informacion se encuentran en este enlace: 

[Producto](http://www.informatica2.com/es_producto/LENOVO_EMC_PX2-300D_NETWO~1143373.html?cpart=13&gclid=Cj0KEQjwqNiwBRDnq93MioaqtKQBEiQAb7Ezn6w1RwM8SiATVL7zl3zYg3JUwht0cfOxABQS1Rfy2y0aAjQG8P8HAQ)

Descripcion del producto:

* El dispositivo de almacenamiento en red Iomega® StorCenter px2-300d pro de 2 receptáculos con unidades de disco duro de clase servidor ofrece almacenamiento ultrarrápido y protección en un chasis silencioso y de reducido tamaño. 
* Los dispositivos StorCenter resultan ideales para pequeñas y medianas empresas así como ubicaciones comerciales distribuidas como oficinas remotas y sucursales, proporcionando protección y copias de seguridad de datos, con funciones para compartir archivos de forma local y remota en la Nube.

Precio del producto:555.35€
Calculamos el precio sin iva: 555.35/1.21=458.96€
Calculamos la amortizacion para 4 años.
Para calcularlo tenemos en cuenta que corresponde a un 25% por año.
458.96*0.25=114.74€


Calculamos la amortizacion para 7 años.
Tenemos en cuenta que se corresponde a un 25% los dos primeros años y luego se va reduciendo de forma gradual:

* Primer año: 458.96*0.25=114.74€
* Segundo año: 458.96*0.25=114.74€
* Tercer año: 458.96*0.15=68.84€
* Cuarto año: 458.96*0.15=68.84€
* Quinto año: 458.96*0.10=45.89€
* Sexto año: 458.96*0.05=22.94€
* Septimo año: 458.96*0.05=22.94€

#Ejercicio 3:¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro. Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.  

Para la primera parte de la pregunta esta respondida en el foro:  [Foro](https://github.com/JJ/IV-2015-16/issues/1)  
Para la segunda parte de la pregunta:  
El lenguaje utilizado es python, el programa imprime en pantalla "hola mundo"  
Codigo:  
* _print "hola mundo"_
Ejecucion:  
* _python holamundo.py_
Para poder empaquetarlo con CDE lo descargamos e instalarlo tecleamos en la terminal "sudo apt-get install cde".  
Una vez instalado ejecutamos "cde python holamundo.py" y en la terminal nos muestra holamundo. En el directorio que hemos ejecutado la orden comentada anteriormente se muestra un archivo nuevo que se llama "cde-option" y un directorio llamado "cde-package"  
Accedemos a la carpeta donde se ha comprimido el archivo:  
* _reyic@reyic-Aspire-5755G ~ $ cd Escritorio/cde-package/cde-root/home/reyic/Escritorio/_
* _reyic@reyic-Aspire-5755G ~/Escritorio/cde-package/cde-root/home/reyic/Escritorio $ ls_
* _holamundo.py  IV-Ejercicio3.py  python3.cde  python.cde_  
Esto nos muestra que esta empaquetado, ahora procedemos a ejecutarlo:  
* _reyic@reyic-Aspire-5755G ~/Escritorio/cde-package/cde-root/home/reyic/Escritorio $ ./python.cde holamundo.py_ 


#Ejercicio 4:Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?  
La primera parte del ejercicio:  
Ejecutamos la orden: _reyic@reyic-Aspire-5755G ~ $ grep 'model name' /proc/cpuinfo_  
Nos muestra:  
* _model name: Intel(R) Core(TM) i7-2630QM CPU @ 2.00GHz_

La segunda parte del ejercicio ejecutamos la orden: "$ egrep '^flags.*(vmx|svm)' /proc/cpuinfo" y muestra lo siguiente por la terminal:  
* flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority ept vpid
* flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority ept vpid
* flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority ept vpid
* flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority ept vpid
* flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority ept vpid
* flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority ept vpid
* flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority ept vpid
* flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm ida arat epb xsaveopt pln pts dtherm tpr_shadow vnmi flexpriority ept vpid  

#Ejercicio 5:Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.
Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.  
Primera parte del ejercicio:  
* Al teclear la orden _kvm-ok_ me muestra por terminal que no esta instalado, por tanto procedo a instalar con _sudo apt-get install cpu-checker_
* Una vez instalado me muestra la terminal _reyic@reyic-Aspire-5755G ~ $ kvm-ok_ 
* _INFO: /dev/kvm exists_ 
* _KVM acceleration can be used_
Segunda parte del ejercicio:  
Dispongo de Virtualbox instalado en mi ordenador.




	


