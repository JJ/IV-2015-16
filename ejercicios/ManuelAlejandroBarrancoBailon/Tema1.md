#Tema 1

##Ejercicios

###Ejercicio 1
Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años. Consultar este artículo en Infoautónomos sobre el tema.

El servidor que he consultado en la tienda Dynos < www.dynos.es > ha sido:

**SERVIDOR HP PROLIANT ML350P G8 XEON E5-2620v2 2.1GHz 8GB SIN DISCO DURO HDD 2.5" MATROX G200**
<http://www.dynos.es/servidor-hp-proliant-ml350p-g8-xeon-e5-2620v2-2.1ghz-8gb-sin-disco-duro-hdd-2.5-matrox-g200-4514953641990__736958-421.html#mod-descripcion>

cuyo precio es de 1885 € IVA incluido.

![Servidor HP](http://i1016.photobucket.com/albums/af281/raperaco/hp_proliant_zpsp3ljtq9z.jpg)

Lo primero que haremos será **deducir el IVA** (21%). 
Para ello: 
	1885 / 1.21 = 1557.85 € es el precio sin IVA.

Ahora se calcula su coste de amortización a **4 años**:

	1557.85 * 0.25 = **389.46 €/año**
	
Y para calcular su coste de amortización en **7 años**:

	1557.85 * 1/7 = **222.55 €/año**
	

###Ejercicio 2
Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.	
	
Para realizar el ejercicio, las características y procesador que he comparado ha sido de 1 núcleo y 20 GB de almacenamiento SSD. 
He consultado el proveedor de alojamiento [OVH](https://www.ovh.es) en su apartado de [hosting VPS] (https://www.ovh.es/vps/vps-ssd.xml) obteniendo un precio de 7.25 €/mes IVA incluido.

![Precio OVH](http://i1016.photobucket.com/albums/af281/raperaco/Precio%20OVH_zps8fihd4c0.png)

Para el proveedor de servicios en la nube, he consultado Azure de Mirosoft, en su apartado de [calculadora de precios](https://azure.microsoft.com/es-es/pricing/calculator/), obteniendo un precio de 0.015 €/hora para el servicio de un núcleo y 20 GB de almacenamiento.

![Precio Azure](http://i1016.photobucket.com/albums/af281/raperaco/precio_azure_zpsiy5dqavt.png)

Ahora vamos a realizar la comparación en los siguientes casos: 

* Si se usa sólo el **1%**:
	* Para el servicio de alojamiento (OVH): **7.25 € se use lo que se use durante un mes**
	* Para el servicio en la nube (Azure): 11.29€/mes * 0.01 = **0.1129 € habría que pagar sólamente**
	
* Si se usa sólo el **10%**:
	* Para el servicio de alojamiento (OVH): **7.25 € se use lo que se use durante un mes**
	* Para el servicio en la nube (Azure): 11.29€/mes * 0.1 = **1.129 € habría que pagar sólamente**
	
	
En resumen, en ambos casos vemos que si sólo se va a usar un 1% o un 10 % del tiempo, es más económica la opción del servicio en la nube de Azure (7.25€ VS. 0.112e9 o 1.129€). En cambio, si este servicio se va a usar durante un mes completo todas las horas, es más económica la opción de alojamiento (11.29€ > 7.25€).


###Ejercicio 3
1.¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro

Para tener un SO como tal virtualizado, recurriría a la virtualización plena, usando por ejemplo VirtualBox.
Cuando en Linux se quiere ejcutar un ejecutable (.exe) de Windows que no está disponible para Linux, he recurrido a Wine para virtualizar la aplicación concreta.
A nivel de virtualización de sistema operativo, conozco OpenVZ donde anfitrión y clientes usan Linux como sistemas operativos y están totalmente aislados, aunque nunca lo he llegado a utilizar.

2.Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

He creado un programa que escribe 5 veces una oración.

![Programa Python](http://i1016.photobucket.com/albums/af281/raperaco/ej3Python_zpse2k8ja2w.png)

El resultado de la ejecución es el siguiente:

*Ubuntu: ![Ejecución en Ubuntu](http://i1016.photobucket.com/albums/af281/raperaco/ejecucionUbuntu_zpsyswfzyk5.png)

Ahora procedo a empaquetarlo con CDE y probarlo en otra distribución como Linux Mint.

El uso de la herramienta CDE podemos verlo en la [página oficial](http://www.pgbovine.net/cde.html)

Tras haber instalado CDE, realizamos el empaquetado de la aplicación:

![Empaquetado con CDE](http://i1016.photobucket.com/albums/af281/raperaco/empaquetarConCDE_zpszilqnb0c.png)

Tras comprimirlo, llevarlo a otra máquina Linux y descomprimirlo, nos movemos por las carpetas *cde-package/cde-root/home/<usuario_actual>*. En esa ubicación, habrá un fichero con extensión **.cde** que será el que habrá que ejecutar el cual tiene enlazadas todas las bibliotecas y requisitos de la aplicación. Lo vemos en la siguiente imagen:

*En la misma máquina en la que se empaquetó (Ubuntu Server 14.04): ![Ejecución en Ubuntu Server](http://i1016.photobucket.com/albums/af281/raperaco/ejecucionCDEUbuntuServer_zpsjna99yyl.png)

*Linux Mint: ![Ejecución en Linux Mint](http://i1016.photobucket.com/albums/af281/raperaco/ejecucionCDEMint_zps1drak6yf.png)
	
	
	
###Ejercicio 4
Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?	
	
El modelo de procesador es el [Intel Core i5 M430 @2.27GHz](http://ark.intel.com/products/43537/Intel-Core-i5-430M-Processor-3M-Cache-2_26-GHz). Lo he consultado con el comando *cat /proc/cpuinfo*, el cual muestra la siguiente información:

![Modelo de procesador](http://i1016.photobucket.com/albums/af281/raperaco/cpuinfo_zpsjbqaxxjk.png)

La salida que aparece al ejecutar la orden egrep '^flags.*(vmx|svm)' /proc/cpuinfo es:
![Orden flags virtualización](http://i1016.photobucket.com/albums/af281/raperaco/salidaFlagsVirtualizacion_zpscl5z8qgh.png)

*Aparece la misma salida repetida cuatro veces, porque es la recogida en cada uno de los "cores"*. 
Vemos como efectivamente aparece el flag *vmx*.


###Ejercicio 5
1. Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.	
Ejecuto el comando kvm-ok, y recibo el aviso de que no lo tengo instalado, que instale el programa cpu-checker. 
![KVM1](http://i1016.photobucket.com/albums/af281/raperaco/kvm1_zpsld5yj6xc.png)

Lo instalo, y vuelvo a ejecutar la orden *kvm-ok* y ya veo que el núcleo sí contiene este módulo KVM.
![KVM2](http://i1016.photobucket.com/albums/af281/raperaco/kvm2_zpsubojrr12.png)

2. Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.
Tengo ya dos hipervisores instalados en el PC como son **VirtualBox** y **VMware**, listos para usar y crear máquinas virtuales.
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		

	
	


