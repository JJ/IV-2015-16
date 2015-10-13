Tema 1
===
> Mariano Palomo Villafranca

#### Ejercicio 1 : Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años. Consultar este artículo en Infoautónomos sobre el tema.

Tras consultar la web *PC Componentes*, encontramos el modelo de servidor [HP ProLiant ML110 Gen9 E5-2620v3/8GB/1TB](http://www.pccomponentes.com/hp_proliant_ml110_gen9_e5_2620v3_8gb_1tb.html).

La descripción del producto es la siguiente:
- **Nombre**: HP ProLiant ML110 Gen9 E5-2620v3/8GB/1TB
- **Precio**: 1369€ IVA // 1131.4€ No IVA.

Para el cálculo de la amortización haremos uso del precio sin IVA del producto.

**Amortización a 4 años**: con una amortización máxima del 25% por año, el cálculo sería **1131.4€ * 0.25 ► 282.85€**.

**Amortización a 7 años**: los dos primeros años corresponden  a un 25% y despues se realiza de forma gradual, como se muestra en la tabla.

|    Año     |        Total anual        |
| ---------- | ------------------------- |
|    1       | 1131.4€ * 0.25 ► 282.85€  |
|    2       | 1131.4€ * 0.25 ► 282.85€  |
|    3       | 1131.4€ * 0.15 ► 169.71€  |
|    4       | 1131.4€ * 0.15 ► 169.71€  |
|    5       | 1131.4€ * 0.10 ► 113.14€  |
|    6       | 1131.4€ * 0.05 ► 56.57€   |
|    7       | 1131.4€ * 0.05 ► 56.57€   |

#### Ejercicio 2: Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

En primer lugar, consultamos la lista de precios de servidores dedicados en una web especializada, por ejemplo, [arsys](http://www.arsys.es/servidores/dedicados). A continuación, consultamos también los precios de algún proveedor de servicios en la nube, como [Microsoft Azure](https://azure.microsoft.com/es-es/pricing/details/virtual-machines/#Linux).

A partir de dicha información, construimos la siguiente tabla comparativa:

|| ARSYS | AZURE |
|-| ----- | ----- |
| Procesador | Intel Xeon 8 núcleos | 8 núcleos |
| RAM | 12 GB | 14 GB |
| Disco duro | 2x300GB SAS Hw RAID1 | 605 GB |
| **Precio** | 125€/mes 1 año, luego 175€/mes |0.4048€/h

Suponiendo que la infraestructura comprada se utilice un 1% del tiempo y un 10% del tiempo, los cálculos serían los siguientes:

- Un año tiene 24h/dia * 365días = 8760h.
- El número de horas correspontiente al 1% es: 8760h * 0.01 = 87.6h
- El número de horas correspondiente al 10% es: 8760 * 0.1 = 876h

|| ARSYS | AZURE |
|-| ----- | ----- |
| 1% | 125€ * 12 = 1500€ el primer año. 2100€ a partir de entonces. | 0.4048€/h * 87.6h = 35.46€
| 10% | 125€ * 12 = 1500€ el primer año. 2100€ a partir de entonces. | 0.4048€/h * 876h = 354.6€

Por tanto, mientras que el uso de la infraestructura no sea superior a 1500€ / 0.4048€/h = 3705h (42%), la alternativa del servicio en la nube es mucho más económica.

#### Ejercicio 3.1: ¿Qué tipo de virtualización usarías en cada caso? Comentar en el [foro](https://github.com/JJ/IV-2015-16/issues/1)

**Virtualización plena**: conveniente cuando deseemos emular sistemas operativos completos y distintos por necesidades especificas. Para ello, podemos hacer uso de hipervisores como [VMWare](www.vmware.com) o [VirtualBox](https://www.virtualbox.org).

**Virtualización parcial**: al permitir emular algún recurso concreto, es útil para, por ejemplo, aislar procesos. Sin embargo, debemos tener en cuenta que no podemos ejecutar instancias separadas de sistemas operativos.

**Paravirtualización**: debemos tenerla en cuenta en los casos en los que se quiera mejorar el rendimiento. Al modificar el SO host, conseguimos bajas penalizaciones de rendimiento (2%-8%). Para ello, podemos hacer uso de herramientas como [Xen](http://www.xenproject.org/) o [KVM](http://www.linux-kvm.org/page/Main_Page).

**Virtualización de SO**: interesante cuando se desee un alto rendimiento, pués permite que un servidor físico ejecute múltiples instancias de sistemas operativos aislados, aunque con menor flexibilidad que las alternativas anteriores. Para ello, podemos utilizar [OpenVZ](https://openvz.org/Main_Page), por ejemplo.

**Virtualización de aplicaciones**: cuando deseemos ejecutar una aplicación compilada para ser ejecutada en un SO diferente al nuestro. Podemos hacer uso de herramientas como [Wine](https://www.winehq.org/), que permite ejecutar aplicaciones Windows en sistemas Linux, BSD, Solaris y Mac OS X.

**Virtualización de entornos de desarrollo**: como se comenta en la documentación del Tema 1, es muy interesante cuando deseemos llevar a cabo un proyecto, tipicamente en lenguajes de scripting (Perl, Python, Ruby, ...), pues incluyen diferentes versiones de intérpretes y librerias y permite probar una aplicación en diferentes versiones con una sola orden. Para ello, podemos hacer uso de aplicaciones como [virtualenv](https://virtualenv.pypa.io/), [perlbrew](perlbrew.pl), [rbenv](rbenv.org) o [RVM](https://rvm.io/).

#### Ejercicio 3.2: Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

A continuación se muestra el código del programa de prueba, el algoritmo de ordenación Quicksort, escrito en python.

```python
    def quicksort(L, first, last):
        # definimos los índices y calculamos el pivote
        i = first
        j = last    
        pivote = (L[i] + L[j]) / 2

        # iteramos hasta que i no sea menor que j
        while i < j:
            # iteramos mientras que el valor de L[i] sea menor que pivote
            while L[i] < pivote:
                # Incrementamos el índice
                i+=1
            # iteramos mientras que el valor de L[j] sea mayor que pivote
            while L[j] > pivote:
                # decrementamos el índice
                j-=1
            # si i es menor o igual que j significa que los índices se han cruzado
            if i < = j:
                # creamos una variable temporal para guardar el valor de L[j]
                x = L[j]
                # intercambiamos los valores de L[j] y L[i]
                L[j] = L[i]
                L[i] = x
                # incrementamos y decrementamos i y j respectivamente
                i+=1
                j-=1

        # si first es menor que j mantenemos la recursividad
        if first < j:
            L = quicksort(L, first, j)
        # si last es mayor que i mantenemos la recursividad
        if last > i:
            L = quicksort(L, i, last)

        # devolvemos la lista ordenada
        return L
```

A continuación, instalamos el paquete `CDE` mediante `sudo apt-get install cde`. Para empaquetar el programa y poder ejecutarlo, utilizamos la orden

    cde python ejercicio3_2.py

#### Ejercicio 4: Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?

Hacemos uso de la orden `egrep '^flags.*(vmx|svm)' /proc/cpuinfo` para consultar dicha información.

```

flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm ida arat epb pln pts dtherm tpr_shadow vnmi flexpriority ept vpid fsgsbase smep erms xsaveopt
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm ida arat epb pln pts dtherm tpr_shadow vnmi flexpriority ept vpid fsgsbase smep erms xsaveopt
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm ida arat epb pln pts dtherm tpr_shadow vnmi flexpriority ept vpid fsgsbase smep erms xsaveopt
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm ida arat epb pln pts dtherm tpr_shadow vnmi flexpriority ept vpid fsgsbase smep erms xsaveopt


```
Como vemos en la especificación de los flags activos, `vmx` aparece entre ellos.

#### Ejercicio 5.1: Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.

```
$ kvm-ok
INFO: /dev/kvm exists
KVM acceleration can be used
```

#### Ejercicio 5.2: Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.

Actualmente dispongo de VMWare y VirtualBox instalados. Adicionalmente, instalamos `Xen`:

    sudo apt-get install xen-hypervisor-4.4-amd64
