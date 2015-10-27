# Tema 1

### Ejercicio 1: Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.

El servidor que se ha elegido es [HP ProLiant ML110 Gen9 E5-1620v3/4GB/1TB](http://www.pccomponentes.com/hp_proliant_ml110_gen9_e5_1620v3_4gb_1tb.html).

Para calcular la amortización, hay que tener en cuenta el precio final del artículo sin IVA, en este caso, el coste del IVA sería de 220,24 €, y el del servidor de 1.048,76€

Para cada año de los primeros cuatro, se deduce una amortización máxima de un 25% del coste del servidor (sin IVA), por ello, lo que habría que pagar cada año sería: 
	- 1048,76€ * 0,25	=	262,19€

** Cálculo de la amortización a 7 años **
	- Primer Año  :	1048,76€ * 0,25	=	262,19€
	- Segundo Año :	1048,76€ * 0,25	=	262,19€
	- Tercer Año  :	1048,76€ * 0,15 =	157,31€
	- Cuarto Año  : 1048,76€ * 0,15 =	157,31€
	- Quinto Año  : 1048,76€ * 0,10 =	104,88€
	- Sexto Año   : 1048,76€ * 0,05 =	52,438€
	- Séptimo Año : 1048,76€ * 0,05 =	52,438€


-------------------------------------------------------------------------------------------------------------------------------------------------

### Ejercicio 2: Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

Servicio de alojamiento en Internet: [Strato](https://www.strato.es/)
Proveedor de servicios en la nube: [Azure](https://azure.microsoft.com/es-es/pricing/details/virtual-machines/#Linux)

** Coste de Strato
 Por una máquina de características similares: 1,79€ al mes * 12 meses = 21,48 € al año


** Si la infraestructura comprada se usase el 1% del tiempo 
 Coste año * 1% = ((Coste en un mes) * 12 ) * 1% = ((Coste por hora * 24 horas * 30 días) * 12 ) * 1% = ((0,0152/h * 24 * 30 ) * 12 ) * 1% = (131,328 €) * 1% = 1,31328 €          
                   

** Si la infraestructura se usase el 10% del tiempo
 Coste año * 10% = ((Coste en un mes) * 12 ) * 10% = ((Coste por hora * 24 horas * 30 días) * 12 ) * 10% = ((0,0152/h * 24 * 30 ) * 12 ) * 10% = (131,328 €) * 10% = 13,1328 € 


### Ejercicio 3.2: Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

 Se elige hacer el típico "Hello world!" en bash. Para ello se crea un archivo llamado hello-world.sh, en el que se introducirá lo siguiente:
   #!/bin/bash
   echo "hello world!"     

Posteriormente se le darán permisos de ejecución con: chmod +x hello-world.sh
Para empaquetarlo con CDE, primero hemos de descargarlo. Usando git podemos clonar el directorio donde se encuentra su código fuente con la siguiente orden:
git clone git://github.com/pgbovine/CDE.git
Hecho esto, se genera la aplicación usando make.            
Finalmente, para empaquetar el hello world!, copiamos hello-world.sh al directorio de CDE y: ./cde ./hello-world.sh

### Ejercicio 4: Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?

      
Como flags aparecen:   
![misFlags](https://photos-2.dropbox.com/t/2/AABS_IdkKAThYiRsyVKEnnGNlU1sW15ZvoDd6VmeMO6J0A/12/14470490/png/32x32/1/_/1/2/ejercicio4_flags.png/EM-94QoY1vgXIAEgAigB/9WysgyjooZLivFZ6q4NrI9UWFxOKZInv7Af1UlqwETY?size=1024x768&size_mode=2)    

      
Para saber el modelo de procesador del equipo, vemos el contenido de del archivo cpuinfo del directorio /proc, pero como lo que nos interesa es solo el nombre del procesador, usando una tubería, le pasamos esa información a grep para que filtre sólo por nombre del modelo. Para ello, en una terminal se introduce:
      
          cat /proc/cpuinfo | grep "model name"
         
Lo que da como salida:          

![miProcesador](https://photos-2.dropbox.com/t/2/AADjqvaqM5y-CfnvfONNWs5yryp34w3SZagBc_soCWPPMg/12/14470490/png/32x32/1/_/1/2/ejercicio4_modeloProcesadores.png/EM-94QoY2fgXIAEgAigB/UjvZjgvYBkhYt8WwvGfOPk4DCXj2lkAQnTZroDqpPpQ?size=1024x768&size_mode=2)    

### Ejercicio 5.1
      
Al introducir la orden, aparece lo siguiente:         
![kvm](https://photos-3.dropbox.com/t/2/AAD9PT0zMMP2GwHCxxeT6S91Hl2qzaMbctdiNN0Gzih4XA/12/14470490/png/32x32/1/_/1/2/ejercicio5_kvm.png/EM-94QoY3PgXIAEgAigB/Awx2CosHl-NmSdVCG6_GwGiO7flwzuYpObRkUXeCqlg?size=1024x768&size_mode=2)       
Lo que significa que, al no soportar virtualización, no se soporta la orden kvm

### Ejercicio 5.2
     
Se instala VirtualBox
