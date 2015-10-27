##Ejercicio 1:

Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular 
su coste de amortización a cuatro y siete años. Consultar este artículo en Infoautónomos sobre el tema.

Yo he elegido el servidor HP ProLiant ML310e G8 XE E3-1220/8GB/2TB , que he buscado en pccomponentes( en concreto,
[este](http://www.pccomponentes.com/hp_proliant_ml310e_g8_xe_e3_1220_8gb_2tb.html) ) 


El precio con IVA(28%) es de 729€ y sin IVA es de 602.48€.

Amortización a 4 años:

Como sólo podemos un 25% cada año, sobre el precio sin IVA, pues quedaría así:

Por cada año pagaremos : 0.25 * 602.48 = 150.62

Lo que hará un total de  602.48 €

Amortización a 7 años: (14.28 % cada año , y el último año 14.32 % ) .

Los 6 primeros años : 86,034144 € / año
El 7 año : 86,275136 €.

##Ejercicio 2:
Como servidor VPS he escogido uno arsys, [Servidor VPS Linux S] ( https://shop.arsys.es/shoppingcart.php )
Las características del mismo son : 4 GB de RAM ,100 GB de Disco Duro.
El precio es de 60€/mes ó 648€/año (10% de descuento).

Y como servidor en la nube, he escogido uno de Azure, utilizando la [calculadora] (https://azure.microsoft.com/es-es/pricing/calculator/)
Las características son las siguientes: 2 núcleos, 3.5 GB de RAM , 489GB de SSD y sale a 0.135€/hora , 100,39 €/MES.

Vamos a calcular el coste durante un año con un porcentaje de utilización del 1% y del 10%.

**El 1% son 87.6 horas( redondearemos a 88 horas). Por tanto:
	En el primer caso: El rpecio sería 60€, ya que es por meses.
	En el segundo caso: 11,87 €/MES.

**El 10% son 876 horas. Por lo tanto:
	En el primer caso: Son 36.5 días, el precio sería de 60x2 , 120€, ya que sería dos meses.
	En el segundo caso : El precio sería de 100,39 €.



##Ejercicio 3: 
¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro.
Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

He realizado un ejemplo básico en python: 

Ejercicio3.py:

#!/usr/bin/python
print "Probando ejercicio 3."

Instalamos cde: sudo apt-get install cde

![Instalando cde](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/ea78d245-a9bb-49a1-86cc-30e2b8485ef4_zpso1aoyb3t.png)


Después, accedemos al directorio cde-package/cde-root/... hasta el directorio en el que está el programa.
Y ejecutamos ./python ejercicio3.py y comprobamos que funciona.

![Comprobando](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/ef7761bf-045a-4fb0-8bef-5a75be109764_zpspz6ipmzw.png)


##Ejercicio 4:
Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?

Debemos ejecutar la siguiente orden : egrep '^flags.*(vmx|svm)' /proc/cpuinfo.
Podemos ver la salida a continuación:

![Ejecución](http://i1175.photobucket.com/albums/r629/Cesar_Albusac_Jorge/ejercicio4_zpshrmnh3ab.png)


##Ejercicio 5:
Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.
No me funciona la orden kvm-ok. Previamente he instalado el paquete cpu-checker pero no me funciona.
Lo volveré a intentar.


Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.

Yo ya estoy usando VMware para otras asignaturas, con máquinas virtuales instaladas.
El proceso de instalación es sencillo y se puede ver en la [página web](https://www.vmware.com/pdf/desktop/ws90-using.pdf) del mismo.




