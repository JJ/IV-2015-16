## 1º-) Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años. Consultar este artículo en Infoautónomos sobre el tema.

He elegido el siguiente ordenador:  HP ProLiant ML310E G8 V2 Intel Xeon E3-1220V3/4GB/2TB

Más información en: http://www.pccomponentes.com/hp_proliant_ml310e_g8_v2_intel_xeon_e3_1220v3_4gb_2tb.html

Donde se puede observar que va equipado con un procesador Intel Xeon, que son los que estan destinados a servidores. Su precio es de 864€. Por lo que si lo amortizamos a 4 años, tendremos que:

**864 * 0.25 = 216**
Por lo que tendríamos que pagar 216€ cada año.

Para una amortización de 7 años y teniendo en cuenta que cada año pagaríamos lo mismo tenemos que:

**864 * 0.143 = 123.55**
Por lo que tendríamos que pagar cada año 123.55€

## 4º-) Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?

Usamos la siguiente orden en el terminal:
alvaro@alvaro-IdeaPad-U410:~$ egrep '^flags.*(vmx|svm)' /proc/cpuinfo
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer xsave avx f16c rdrand lahf_lm ida arat epb pln pts dtherm tpr_shadow vnmi flexpriority ept vpid fsgsbase smep erms xsaveopt

y vemos que efectivamente tengo el flag vmx activado, por lo cual es posible la virtualización, puesto que mi procesador es intel, tengo la posibilidad de virtualizar a nivel de hardware.

Cabe destacar que solo he copiado una linea de la salida, ya que salen 4 totalmente identicas.

Mediante la orden :
alvaro@alvaro-IdeaPad-U410:~$ *cat /proc/cpuinfo*

Obtengo en la salida mi procesador, que es el siguiente:
model name	: Intel(R) Core(TM) i5-3337U CPU @ 1.80GHz
## 5º-)
### 5.1º-) Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.

Usando dicho comando obtenemos:

alvaro@alvaro-IdeaPad-U410:~$ kvm-ok
INFO: /dev/kvm exists
KVM acceleration can be used

### 5.2º-)Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.

En mi caso tengo ya instalado virtualbox, pues lo necesitaba para la asignatura DAI, como me dio problemas con las cabeceras del kernel, lo que hice fue ir a la página de virtualbox y descargar el .deb más reciente, "virtualbox-5.0.deb", he instalarlo desde el gestor de paquetes, lo cual resultó muy sencillo, y ya no tuve ningún problema, por lo cuál estoy listo para cuando se indique que hay que crear una máquina virtual.
