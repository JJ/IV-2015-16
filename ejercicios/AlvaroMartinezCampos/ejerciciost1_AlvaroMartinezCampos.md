# Ejercicios Tema 1. Álvaro Martínez Campos
# Ejercicio 1

**Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.**

* **Servidor**
* HP ProLiant ML150 Gen 9 E5-2620v3/8GB
![Servidor](http://thumbsfotos.pccomponentes.com/hp_proliant_ml150_gen_9_e5_2603v3_4gb_500gb_290_290.jpg)
* Encontrado en: http://www.pccomponentes.com/hp_proliant_ml150_gen_9_e5_2620v3_8gb.html

* **Precio**

	* 1369

* **Descripción del producto**
El servidor HP ProLiant ML150 Gen9 es un servidor en torre que ofrece un valor excepcional para una empresa con un presupuesto limitado, con una profundidad de chasis de 24 pulgadas. Con zócalos de procesador dual, proporciona rendimiento esencial con los procesadores Intel ® Xeon ® E5-2600 v3. 
Con innovaciones integradas que simplifican la implementación y la gestión del servidor, su empresa podrá aprovechar de manera continua estos beneficios a diario, con opciones de expansión que permiten ampliar según sea necesario, ofreciendo un mayor valor de negocio. El servidor HP ProLiant ML150 Gen9 ofrece eficiencia y productividad tanto para pequeñas como para medianas empresas.

Más información en: http://www.pccomponentes.com/hp_proliant_ml150_gen_9_e5_2620v3_8gb.html
	

* **Amortización a cuatro años**
Suponemos que la compra del ordenador se hace a principios del primero año, para amortizarlo completo durante los 4 años.
Se descuenta del precio total el IVA, en este caso 21%. Por tanto, el precio del servicor caeria al: 1369/1.21 = 1131,40 , redondeando= 1131€

* 1131€ / 4 años = 282,75€/año

	Coste de amortización en **4 años** es de **282,75€**.

	
	

* **Amortización a siete años**
Tomando como base el descuento de **21% de IVA** del apartado anterior, el **coste de amortización** quedaría de la siguiente forma:

	* 1131€ / 7años = 161,57€/año

	Coste de amortización en **7 años** es de **161,757€**. 


# Ejercicio 2

**Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) si la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.**

Utilizo como servicio en la nube: http://www.interdominios.com/servidor-cloud/
Utilizo como servicios de : https://dinahosting.com/dedicados

#### Caracteristica del servidor a comparar:
* 1 GB de memoria
* 160GB de disco duro
* Pentium dual core

#### Modelos seleccionados:
*Servicio de alojamiento: Dell PowerEdge 860 * 
Precio: 38.7 €/mes
*Servicio en la nube: Modelo a medida*
Precio: 51.67 €/mes Dado que solo pagare lo que utilizare, contamos el coste:
* 1,72€/dia
* 0.67€/h
* 0.011 €/min

#### *Uso anual del 10%*

Tiempo de uso:  
* 365 x 0,1 = 36,5 dias = 876 Horas = 52560 min  

Precio del servidor en la nube:  
* 52560 x 0.011 = 578,16 €  

Precio del servidor dedicado  
* 12 x 38.7 = 464,4 €   

#### *Para un uso anual del 1%*   

Tiempo de uso
* 365 x 0,01 = 3,65 dias = 87,6 Horas = 5256 min  

Precio del servidor cloud  
* 5256 x 0.011 = 57,816 €  

Precio del servidor dedicado  
* 12 x 38.7 = 464,4 €    


# Ejercicio 3.1
**¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro**

Contestado en issue: https://github.com/JJ/IV-2015-16/issues/1#issuecomment-146274292

# Ejercicio 3.2

**Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.**

Primero debemos descargar CDE:
* Descargar codigo fuente de la release actual de: https://github.com/pgbovine/CDE/
* Descomprimir la carpeta y acceder a la carpeta resultante desde el terminal y ejecutar la orden make, que compilar el codigo segun el makefile incluido

Una vez compilado CDE podemos empaquetarlo con CDE  
* Mover el codigo del programa donde se encuentra el ejecutable de la aplicacion CDE  
* Ejecutamos el comando: ./cde ./Programa1.py  

Esto da como resultado el archivo Programa1.py.cde  
* Comprimimos la carpeta cd-package-cde en formato tar.gz utilizando: tar czvf Programa1.tar.gz cde-package/  

Ya disponemos de un paquete que podremos ejecutar en cualquier distribucion de linux.  
Para ello solo bastaría con descomprimir el fichero mediante la siguiente orden tar xzvf Programa1.tar.gz, y pasar a ejecutarlo mediante la siguiente orden cde-package/cd-root/<ruta>/Programa1.py.cde
Para comprobar el resultado he utilizado una distribucion de Ubuntu como fuente del paquete y una distribucion de Fedora como receptora, donde se ha obtenido un identico resultado de ejecucion.  
Ambos SO han sido virtualizados para mayor comodidad.

# Ejercicio 4
**Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?**

En mi caso tuve que activar la virtualizacion en la bios el cuatrimestre pasado para poder virtualizar sistemas operativos para practicas.  
Utilizando la orden: wmic cpu obtenemos la información general de la cpu en windows, como salida obtengo un resumen de información de la cpu:  

AddressWidth  Architecture  AssetTag     Availability  Caption                               Characteristics  ConfigManagerErrorCode  ConfigManagerUserConfig  CpuStatus  CreationClassName  CurrentClockSpeed  CurrentVoltage  DataWidth  Description                           DeviceID  ErrorCleared  ErrorDescription  ExtClock  Family  InstallDate  L2CacheSize  L2CacheSpeed  L3CacheSize  L3CacheSpeed  LastErrorCode  Level  LoadPercentage  Manufacturer  MaxClockSpeed  Name                                       NumberOfCores  NumberOfEnabledCore  NumberOfLogicalProcessors  OtherFamilyDescription  PartNumber   PNPDeviceID  PowerManagementCapabilities  PowerManagementSupported  ProcessorId       ProcessorType  Revision  Role  SecondLevelAddressTranslationExtensions  SerialNumber  SocketDesignation  Status  StatusInfo  Stepping  SystemCreationClassName  SystemName       ThreadCount  UniqueId  UpgradeMethod  Version  VirtualizationFirmwareEnabled  VMMonitorModeExtensions  VoltageCaps  
64            9             Fill By OEM  3             Intel64 Family 6 Model 60 Stepping 3  4                                                                 1          Win32_Processor    2501               12              64         Intel64 Family 6 Model 60 Stepping 3  CPU0                                      100       198                  1024                       6144         0                            6      4               GenuineIntel  2501           Intel(R) Core(TM) i7-4710HQ CPU @ 2.50GHz  4              4                    8                                                  Fill By OEM                                            FALSE                     BFEBFBFF000306C3  3              15363     CPU   TRUE                                                   SOCKET 0           OK      3                     Win32_ComputerSystem     WIN-0DC1M9HJ3MQ  8                      33                      TRUE                           TRUE                                  


# Ejercicio 5
**Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.** 

Dado que la maquina virtual no permitia la virtualización he tenido que arrancar un host sin virtualizar.  
Utilizandolo sobre una maquina virtual de Ubuntu:  
bott@bott-igiv:~/Git$ kvm-ok  
INFO: /dev/kvm exists KVM acceleration can be used  

**Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.**
He instalado virtual box
