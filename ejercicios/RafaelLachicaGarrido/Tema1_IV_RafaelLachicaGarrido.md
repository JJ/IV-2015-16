#Tema 1 Teoria#
==
##Objetivos##

    1. Conocer la historia de la Computación Virtual, sus orígenes y razones de su existencia.

    2. Conocer los conceptos relacionados con el proceso de virtualización tanto de software como de hardware y ponerlos en práctica.

    3. Comprender la diferencia entre infraestructura virtual y real.

    4. Jutificar la necesidad de procesamiento virtual frente a real en el contexto de una infraestructura TIC de una organización.


###Ejercicio 1
####Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años. Consultar este artículo en Infoautónomos sobre el tema.

*HP PROLIANT ML350P G8 XEON E5-2620V*
Hp con Intel XEON E5-2620V a 2.1GHz y 8 GB RAM.
Precio <strong>1885 €</strong>

**Tienda** [DYNOS](http://www.dynos.es/servidor-hp-proliant-ml350p-g8-xeon-e5-2620v2-2.1ghz-8gb-sin-disco-duro-hdd-2.5-matrox-g200__736958-421.html)

Para amortizar este producto tendríamos varias fases, la primera la del IVA.
El primer año se amortiza el 100% del IVA, por lo que tenemos 21% de 1885€ = 395,85€.
Después se va amortizando cada año un 25% después de la base imponible sin IVA, por lo que tendríamos:= 1489,15€ sin base imponible.
Cada año amortizamos 372,2875€.

<strong>4 años</strong>
Total = (4 * 372,2875€)+(395,85€) = 1885€

<strong>7 años</strong>
Total = (7 * 212,73571€)+(395,85€) = 1885€

*En esta segundo opción tendríamos al año que amortizar un 0,14286%.*

###Ejercicio2###
####Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.####

En cuanto a un procesador estándar, tenemos el <strong>t2.medium</strong> que tiene 2 cpus y 4 GB, 0,046€/hora.
Para <strong>Microsof Azure</strong> tenemos para las mismas características un precio de 0,079€/hora.

Para los servicios alojamiento he escogido [1and1](http://www.1and1.es/alojamiento-web) donde la tarifa más cara es 9,99€/año con espacio web **ilimitado** ,con **2GB RAM**.

En [hostinet](https://www.hostinet.com/hosting-web/) tenemos almacenamiento **Cloud Pro** por 8,36€/mes con dominios ilimitado y espacio en disco ilimitado.

Comparando pues tenemos para **Amazon EC y 1and1:**
1% tiempo uso 
    - EC2: (0,046€/h *24 h *30 días * 12 meses)*1%= **3,97€**
    - 1and1: 9,99€/mes * 12 meses = *119,88€*
    No podemos elegir el 1% en 1and1.
    
    Conclusión, sale mucho más rentable y nos ofrece mucho más servicios un servidor en la nube como Amazon EC2
    que un hosting para almacenamiento y creación de servicios en la nube.


###Ejercicio 3###
####3.1 ¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro####

Virtualización de aplicaciones para el uso de algunas prácticas que necesite usar programas específicos de otro sistema operativo, usando wine por ejemplo en un entorno UNIX, y virtualización de entornos de desarrollo para aplicaciones /prácticas en asignturas más orientas a web, en las que tenga que hacer uso de PHP, Python, HTML, etc.

####3.2 Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones####

He creado un simple "Hola mundo" en Scala: 
'object Main {
	def main(args: Array[String]) {
		println("¡Hola mundo, Scaleando!")
	}
 }'
 
 Lo compilamos y ejecutamos:
 
rafaellg8@system32:~/Documentos/GII/Cuarto/IV/IV-Rafael_Lachica_Garrido_15-16$ scalac hola.scala 
rafaellg8@system32:~/Documentos/GII/Cuarto/IV/IV-Rafael_Lachica_Garrido_15-16$ scala hola.scala 
¡Hola mundo, Scaleando!

A continuación empaquetamos y ejecutamos en cde usando los comandos cde scala hola.scala y nos aparecerán 2 archivos, cde-package y cde-options:
![imagenScala](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/ej1Scala.jpg_zpsibuym3d9.png?t=1443563958 "scala-cde")

Vamos al directorio del ejecutable en cde y lo ejecutamos:
![imagenScala](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/scala2_zpsyziswngl.png?t=1443563958)

Tenemos el mismo resultado virtualizando con cde.

####4 Ejercicio 4: Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?####

Para los flags tenemos el siguiente resultado, ejecutando "egrep '^flags.*(vmx|svm)' /proc/cpuinfo" :
 ![vmx|svm](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/vmxImage_zpsszrzmvwj.png?t=1443563958 "Flags activados")

 **Modelo de procesador**, ejecuto cat /proc/cpuinfo:
![cpuinfo](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/cpuInfo_zpswh00wnbs.png?t=1443563924 "cpuInfo")

Nos aparece la información detallada de la cpu que es mi caso es un Intel core i3 2330 M con 2 núcleos reales a 2.4 GHz.

####Ejercicio 5####
1. Comprobar si el núcleo instalado en tu ordenador
 contiene este módulo del kernel usando la orden kvm-ok.

2. Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.

Para el ejercicio 1 instalamos el paquete kmv con sudo apt-get insall cpu-checker, [fuente](http://nyacomputing.com/how-to-install-kvm-on-ubuntu-and-run-virtual-machines/).

Ejecutamos a continuación 'sudo kvm-ok':
[kvm-ok](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/kmv-ok_zpsykwyuztd.png?t=1443563958 "km-ok")

Nos informa de que kvm está soportado en la cpu pero deshabilitado

Para el ejercicio 2 he instalado el hipervisor [Xen](https://help.ubuntu.com/community/Xen):
'rafaellg8@system32:~/Documentos/GII/Cuarto/IV/IV-Rafael_Lachica_Garrido_15-16$ sudo apt-get install xen-hypervisor-4.4-amd64'
