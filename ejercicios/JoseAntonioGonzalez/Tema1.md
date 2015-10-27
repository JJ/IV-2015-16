#Ejercicio 1

#### Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años

El servidor encontrado es un Dell PowerEdge T110 II:

http://configure.euro.dell.com/dellstore/config.aspx?oc=pet1102bu&model_id=poweredge-t110-2&c=es&l=es&s=bsd&cs=esbsdt1&

Su precio total es de 800€. Las amortizaciones respectivas a 4 y 7 años son:
	
    Amortizacion 4 años:
    800 / 4 = 200
    
El servidor debe producir 200 €/año si queremos que se amortice en 4 años.

	Amortización 7 años:
    800 / 7 = 114.28
    
El servidor debe producir 114.28 €/año si queremos que se amortice en 7 años.

#Ejercicio 2

####Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) si la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

COnsultamos el sitio http://www.1and1.es en busca de uno de sus servidores virtuales. En la imagen, vemos algunas de sus tarifas para estos servidores virtuales. Nos quedamos con la primera de todas, que vale 20€ al mes (y no 9.99 como aparece en la imagen, ya que ese precio es si se contrata un mínimo de 24 meses)

![](https://www.dropbox.com/s/pnt79qjg00aa01d/1and1.png?dl=1)

EL coste total sería en 6 meses de 120 €.

Ahora, comparamos el precio que nos costaría contratar una máquina dedicada de similares características. Tal y como se aprecia en la imagen, el coste es mucho superior, ya que asciende a más de 43 euros:

![](https://www.dropbox.com/s/850gtzgm3rka80f/1and1_2.png?dl=1)

Sin embargo, si calculamos lo que nos cuesta usarla un 1% y un 10%, vemos que si sale a cuenta contratar este servicio:

	4320h(6meses) /100 = 43.20 h
    43.20 horas * 0.06 € / h = 2.59€
    
   	4320 * 10 / 100 = 432 h
    432 horas * 0.06 € / h =25.92€
    
Estos precios son claramente inferiores a los 120€ que nos cuesta contratarlo las 24 horas durante los 6 meses, así que deberíamos de sopesar nuestras necesidades y contratar un tipo de servicio u otro.

# Ejercicio 3

#### 1. ¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro

He tenido que trabajar con sistemas operativos virtualizados al completo en mis prácticas, siendo así una virtualización plena (por ejemplo usando Virtual Box para emular servidores web). Aunque en las aulas de prácticas, para algunas asignaturas, hemos necesitado usar wine para ejecutar programas hechos para Windows dentro de Linux. Esto sería del tipo "virtualización de aplicaciones". También he usado este tipo de virtualización en la segunda parte del ejercicio 4, ya que he tenido que usar CDE

#### 2. Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

El código de ejemplo está en el directorio, como "ejemplo_prueba.py". Lo empaquetamos con CDE con la siguiente orden:
	
    cde python ejemplo_prueba.py
    
En la primera ejecución falla por que falta el módulo webpy. Lo instalamos mediante la orden:

	sudo apt-get install python-webpy
    
Después, reintentamos la orden, y ahora que si que se pued ejecutar, CDE lo empaqueta todo en un directorio, tal y como se muestra en la imagen.

![](https://www.dropbox.com/s/hsg5z3g83pmua6d/CDE.png?dl=1)

#Ejercicio 4

#### Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?

Para consultar la información del modelo de los procesadores instalados en el equipo, utilizamos la orden

	cat /proc/cpuinfo | grep model

Para saber si tenemos KVM activado, utilizamos la orden

	egrep -c "vmx" /proc/cpuinfo
    
En nuestro caso, nos devuelve 4, que son el número de procesadores que tienen la tecnología KVM activada.

#Ejercicio 5

#### 5.1 Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.

No podemos ejecutar la orden kvm-ok sin tener antes el programa cpu-checker instalado. Para ello:

	sudo apt-get install cpu-checker

Y una vez instalado, ejecutamos kvm-ok:

	joseantonio@Asus:~$ kvm-ok 
	INFO: /dev/kvm exists
	KVM acceleration can be used
    
#### 5.2 Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.     
Para unas prácticas anteriores, tenía instalado en mi equipo Virtual Box. Aunque no puedo poner capturas de la instalación, la orden sería:
	
    sudo apt-get install virtualbox
    
O bien, en su [página web](https://www.virtualbox.org/wiki/Linux_Downloads) podemos descargar una versión, que en el caso de Ubuntu, se puede instalar comodamente desde el centro de Software.