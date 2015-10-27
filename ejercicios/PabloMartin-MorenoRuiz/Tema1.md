# Ejercicios del Tema 1

## Ejercicio 1. Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años. Consultar este artículo en Infoautónomos sobre el tema. 
El servidor que amortizaremos lo encontramos en el siguiente enlace <http://www.dynos.es/servidor-hp-proliant-ml110e-gen9-xeon-e5-2620v3-2.4ghz-8gb-ddr4-lff-1tb-dvd-rom-array-b140i-888793950609__794996-425.html>.

Para amortizar un equipo informático tenemos que tener en cuenta varios factores.

* Cómo máximo podemos amortizar un 26% cada año.
* El máximo de años que podemos amortizar un equipo es de 10 años.
* Si un equipo no lo compramos al inicio del año solo podemos amortizar los meses que queden del año (es decir, si solo se amortiza lo 4 últimos meses sólo podemos amortizarlos 25%/4 = 6.25%).

Toda la información sobre estás amortizaciones viene en los 2 siguientes enlaces proporcionados en el guión de pŕacticas:

<http://www.infoautonomos.com/consultas-a-la-comunidad/988/.>

<http://www.infoautonomos.com/fiscalidad/gastos-deducibles-autonomos-irpf-estimacion-directa/>


El precio del ordenador es de 1499 euros. En mi caso, he dividido la amortización entre
los años en los que se nos pide que amorticemos.

 A) Amortización en 4 años.
 
  Entonces podemos amortizar cada año un 25%  que sería cada año 374.75 €.
  
 B) Amortización en 7 años.
 
  Entonces podemos amortizar cada año 14,29% que sería cada año 214,14 €.
  

## Ejercicio 3  

### 1. ¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro

En el caso de trabajar en mi máquina usararía la virtualización plena ya que con ella puedo compartir elementos e interaccionar entre varias máquinas virtuales de una forma más cómoda aunque pierda algo de rendimiento.

En el caso de tener un servidor compartido con varios clientes  y que no deben de saber de la existencia los unos de los otros usaría una virtualización a nivel de sistema operativo.

Usaría la virtualización parcial si necesito particionar lógicamente un disco duro o alterar la visión virtual de cualquier componente.

La virtualización de desarrollo la usaría para cuando creara nuevo software que necesito comprobar que funciona en diferentes versiones

Y usaría la virtualización de aplicaciones para recrear un entorno de ejecución para programas sin modificar mi sistema actual.



## Ejercicio 4 Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?

Si los tiene instalados y lo comprobamos con la siguiente orden egrep '^flags.*(vmx|svm)' /proc/cpuinfo. 

El prodecesador de mi máquina es Intel(R) Core(TM) i5 CPU       M 480  @ 2.67GHz
 
La salida de la orden introducida es la siguiente repetida 4 veces, una por cada hebra que maneja mi procesador.

flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx rdtscp lm constant_tsc arch_perfmon pebs bts xtopology nonstop_tsc aperfmperf pni dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 popcnt lahf_lm ida arat dtherm tpr_shadow vnmi flexpriority ept vpid

## Ejercicio 5

### 1. Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.

Al ejecutar el comandos se ha comprobado que si tiene este módulo del kernel.
La salida es la siguiente:

INFO: /dev/kvm exists

KVM acceleration can be used


### 2.Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios. 

Cómo hypervisor he instalado VirtualBox con la orden sudo apt-get isntall VirtualBox.



