##Ejercicio1: Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años. ##
La tienda de informática que he consultado ha sido pccomponentes y el servidor que he seleccionado es un 
[HP ProLiant ML310e](http://www.pccomponentes.com/hp_proliant_ml310e_g8_xe_e3_1220_8gb_2tb.html) que tiene 
un precio de **729€** (**602.48€ sin IVA**). Suponiendo que el servidor lo he comprado en Enero de el año 2015 
la amortización sería la siguiente:

A 4 años (25% cada año):
  - 2015: 150.62€
  - 2016: 150.62€
  - 2017: 150.62€
  - 2018: 150.62€
  

A 7 años (14.3% cada año):
  - 2015: 86.15464€
  - 2016: 86.15464€
  - 2017: 86.15464€
  - 2018: 86.15464€
  - 2019: 86.15464€
  - 2020: 86.15464€
  - 2021: 85.55216€


##Ejercicio 2: Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo. ##

Como proveedor de servicios en la nube he escogido [Microsoft Azure](https://azure.microsoft.com/es-es/pricing/) con 1.75 GB de RAM	y 224 GB de SSD y como servicio de alojamiento en Internet un VPS de [dinahosting](https://dinahosting.com/vps) con 1.5 GB de RAM, 120GB de almacenamiento y una tasa de transferencia de 1TB que tiene un precio de 53€ al mes si lo administra el proveedor de servicios y 44€ si lo administra el propio cliente.
El problema de no usar todo el tiempo de un año es que en el caso de los VPS da igual el tiempo que lo usemos ya que se contrata todo el tiempo de un mes o de un año, mientras que con Azure la ventaja es que contratas el servicio por tiempo.

**1 % del tiempo en un año:**
Esto es unas 88 horas al año, en el caso del servidor en la nube de Azure esto tendría un precio de 5,94€ al mes, como podemos ver bastante más bajo que el VPS que como mínimo nos costaría 44€ al mes.

**10% del tiempo en un año:**
Esto serían 876 horas al año, en el caso de Azure, estas horas nos costarían 58,7€ que tendría un precio más elevado en este caso que un VPS.

Como conclusión resulta más barato un VPS si vas a usarlo más del 9% del tiempo de un año, mientras que si el uso que le vas a dar es menor del 9% del tiempo de un año te sale más rentable un proveedor de servicios en la nube.

##Ejercicio 4: Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden? ##

Mi procesador si tiene esos flags instalados, es un Intel Core i3 M 370 que funciona a 2.40GHz. Como salida de esta orden aparece: 
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf pni dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 popcnt lahf_lm arat dtherm tpr_shadow vnmi flexpriority ept vpid

fpu es un flag de Intel (Floating Point Support) salen 4 uno por cada núcleo (virtual y físico, dos y dos) del procesador.

##Ejercicio 5: 1.Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.##
Al ejecutar el comando compruebo que no lo tiene ya que me devuelve por pantalla: 
**INFO: Your CPU does not support KVM extensions KVM acceleration can NOT be used**
##2.Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.##
El hipervisor que he elegido Xen un hipervisor para gestionar máquinas virtuales de código abierto desarrollado por la Universidad de Cambridge y lo he instalado con el siguiente comando: **apt-get install xen-linux-system**.
