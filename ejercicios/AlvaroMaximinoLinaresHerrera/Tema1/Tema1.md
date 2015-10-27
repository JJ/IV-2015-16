## 1º-) Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años. Consultar este artículo en Infoautónomos sobre el tema.

He elegido el siguiente ordenador:  HP ProLiant ML310E G8 V2 Intel Xeon E3-1220V3/4GB/2TB

Más información en: http://www.pccomponentes.com/hp_proliant_ml310e_g8_v2_intel_xeon_e3_1220v3_4gb_2tb.html

Donde se puede observar que va equipado con un procesador Intel Xeon, que son los que estan destinados a servidores. Su precio es de 864€. Por lo que si lo amortizamos a 4 años, tendremos que:

**864 * 0.25 = 216**
Por lo que tendríamos que pagar 216€ cada año.

Para una amortización de 7 años y teniendo en cuenta que cada año pagaríamos lo mismo tenemos que:

**864 * 0.143 = 123.55**
Por lo que tendríamos que pagar cada año 123.55€

## 2º-) Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.


Bien, vamos a comparar dos sitios diferentes, uno con el que estuve trabajando en la asignatura SWAP, de tercero, y otro que he encontrado navegando por Internet. Con el que estuve trabanjo fue con (Microsoft Azure)[https://azure.microsoft.com/es-es/] , aunque era con una cuenta de estudiante que se nos proporcionó para un trabajo, y el otro servicio que he encontrado navegando por Internet es (OVH)[https://www.ovh.es/vps/vps-ssd.xml].

Cabe destacar que Microsoft Azure tiene un servicio en el cual se paga por horas de uso, mientras que OVH tiene lo que podríamos denominar, una "tarifa plana", en la cual se paga siempre lo mismo, independientemente del uso que se le dé.

Las especificaciones son  las siguientes:

    VPS SSD 2                  Microsoft Azure
    KVM OpenStack              Máquina Virtual
    1 vCore                        1 núcleos			
    2,4 GHz
    4 GB RAM                     0.75 GB de RAM
    SSD 20 GB                    HDD	20 GB en disco
    RAID 10 local
    5,99 € /mes + IVA                 0,015 €/h
    (7,25 € IVA incl.)                11,29 €/mes

Como se puede ver, en el servicio de Azure no se nos especifica el la velocidad del procesador, y tenemos mucha menos RAM, pues no podemos cambiarla a nuestro antojo, pero si cambiaba la RAM, obtendría mayor espacio en disco, lo cual y según se pide en el ejercicio hubiese estado mal, pues deben de tener procesadores parecidos y discos duros parecidos.
Se puede ver también que OVH nos ofrece un SSD, mientras que Azure solo nos ofrece HDD.
Ahora pasaremos a comparar los precios en función del uso que le demos a las máquinas virtuales.

Para un 1% de uso tendremos que pagar:

 Azure -> 11,29 €/mes * 0,01 = 0,1129 €/mes lo que redondeando a dos decimales serían unos 0,11 €/mes.
 
 OVH   -> 7,25 €/mes pues como ya he comentado sus precios son siempre fijos, independientemente de que uso se le de.

Para un 10% de uso tendremos que pagar:

 Azure -> 11,29 €/mes * 0,1 = 1,129 €/mes lo que redondeando a dos decimales serían unos 1,13 €/mes.

 OVH   -> 7,25 €/mes pues como ya he comentado sus precios son siempre fijos, independientemente de que uso se le de.

Como conclusión tenemos que dependiendo del uso que se le vaya a dar nos vendrá mejor un sitio u otro, pues si lo vamos a usar siempre la opción de OVH es mejor que Azure, pues resulta más económica, pero ya hemos visto que si no la vamos a tener siempre en funcionamiento es más económico Azure.


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
