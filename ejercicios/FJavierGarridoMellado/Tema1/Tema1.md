#Tema 1

###Ejercicio 1 : Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años. Consultar este artículo en Infoautónomos sobre el tema.

En **PcComponentes** encuentro el servidor [Lenovo TS-440 Think Server Intel Xeon V1225 E3/4GB](http://www.pccomponentes.com/lenovo_ts_440_think_server_intel_xeon_v1225_e3_4gb.html)

Por tanto el producto es el siguiente:
- **Nombre:**  *Lenovo TS-440 Think Server Intel Xeon V1225 E3/4GB*
- **Precio:**  *829€*
- **Descripción:** *El ThinkServer TS440 es un verdadero servidor con la serie de procesadores de clase empresarial Intel® Xeon® E3-1200 v3 - proporcionar un aumento de rendimiento del 15 por ciento por encima de nuestras torres de la generación anterior por lo que tiene el poder que necesita para hacer funcionar su negocio con eficacia. Y porque sabemos que usted necesita poder contar con el TS440, incluye características de fiabilidad, como código corrector de errores (ECC) y un controlador de almacenamiento a bordo con la capacidad de implementar hasta RAID 5 para proteger sus datos.*

- **Imagen del producto:**

![Servidor](http://thumbsfotos.pccomponentes.com/lenovo_ts_440_think_server_intel_xeon_e3_4gb_500gb_290_290.jpg)

Para el cálculo de la amortización primero hallo su precio sin IVA ( este es amortizado el primer año ):

 Precio sin IVA = 829 /1.21 = *685,12€*

**La amortización a 4 años** es la siguiente teniendo en cuenta que corresponde a un 25% por año:
685,12 * 0,25 = **171,28 €**

**La amortización a 7 años** es la siguiente teniendo en cuenta que corresponde a un 25% los dos primeros años y despues se realiza de forma gradual:
	- Primer año: 	685,12 * 0.25 = **171,28€**
	- Segundo año:	685,12 * 0.25 = **171,28€**
	- Tercer año:	685,12 * 0.15 =  **102,76€**
	- Cuarto año:	685,12 * 0.15 =  **102,76€**
	- quinto año:	685,12 * 0.10 =  **68,51€**
	- Sexto año:	685,12 * 0.05 =  **34,25€**
	- Séptimo año:	685,12 * 0.05 =  **34,25€**

###Ejercicio 2 : Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

Para el alojamiento web he visto [leaseweb](https://www.leaseweb.com/dedicated-servers/single-processor?processorCount=1) donde hay diferentes opciones de elección. Yo he optado por el siguiente:
![xeon](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/xeon_zpsien0avsv.png)

 Las carácteristicas del procesador son las siguientes:
- Intel® Xeon® Processor E3-1270 v2 
- (8M Cache, 3.40 GHz)
- 4 nucleos.

Para el proveedor de servicios en la nube he visto [Azure](https://azure.microsoft.com/es-es/pricing/calculator/) donde tengo de caracteristicas similares(muy parecidas):
![Azure](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/xeon_zpsbg2epfvs.png)

Usandose sólo el 1% del tiempo:

- Precio del servidor Azure( en la nube ): 0,172 €/h * 24h * 31 dias * 1% * 2 instancias =  2,55€/mes
- Precio del servidor dedicado de leaseweb: 141.83 €/mes

Usandose sólo el 1% del tiempo:

- Precio del servidor Azure( en la nube ): 0,172 €/h * 24h * 31 dias * 10% * 2 instancias =  25,5€/mes
- Precio del servidor dedicado de leaseweb: 141.83 €/mes

Puede observarse que según el uso que se le este dando puede resultar mas interesante el uso de la tecnología en la nube.


##Ejercicio3 : 

###3.1 ¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro


**Comentario en el foro:**
- Para usar diferentes sistemas operativos o maquinas recurriría a una virtualización completa o plena (VMware,VirtualBox,etc).
- En el caso de querer usar un ejecutable .exe o aplicaciones de Windows ( u otro sistema operativo) en un sistema UNIX/Linux usaría una virtualización de aplicaciones como por ejemplo Wine.
- En el caso de querer usar las dos versiones de Python recurriría a virtualización de entornos de desarrollo ( este cuatrimestre toca probar este tipo de virtualización )*

###3.2 Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

He creado un programa simple en *Python* que consiste en un minijuego de adivinar números entre 1 y 100:
```
#!/usr/bin/env python
import random

aleatorio= random.randint(1,100)
acertado=False
intentos=0


while  (acertado == False)  and  (intentos < 11) :
	numero=int(raw_input("Introduzca un numero entre 1 y 100: "))
	intentos+=1

	if (numero == aleatorio) :
		acertado=True
		print "Has acertado"
	elif (numero>aleatorio) :
		print "El numero buscado es menor"
	else:
		print "El numero buscado es mayor"
```
A continuación he instalado CDE mediante el comando *sudo apt-get install cde* y he empaquetado el programa mediante la orden *cde python ej1.py*:
![cde](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/cde_zpsvfai8mhl.png)
A continuación se procede a la ejecución del ejecutable creado mediante la orden *./python.cde ej1.py* en el directorio donde se encuentra el ejecutable( falta probar en otras distribuciones ):
![cde2](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/cde_zpspq1ew1ux.png)

##Ejercicio 4:Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?

El modelo de procesador es el Intel [M460@2.53GHz](http://ark.intel.com/es-es/products/50179/Intel-Core-i5-460M-Processor-3M-Cache-2_53-GHz) y puede verse con el comando *cat /proc/cpuinfo*

![cpu](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/cpu_zps3bcpiqgg.png)

La salida que aparece al visualizar los flags es la siguiente:

![flags](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/flags_zps1wureglz.png)

Se observa como el flag *vmx* esta activado.

##Ejercicio 5:

### 5.1 Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.

Tras instalar el paquete *cpu-checker* he comprobado que si incluye el componente KVM:
![KVM](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/kvm_zpsfoujzevi.png)

### 5.2 Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.

En mi caso dispongo de *VirtualBox y VMware* y he instalado *Xen* como otra opción mas a contemplar ( mediante el comando *sudo apt-get install xen-hypervisor-4.4-amd64*).



