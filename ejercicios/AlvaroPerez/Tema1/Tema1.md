#Tema 1
###Ejercicio1: Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.

Cojemos este servidor de la web de pccomponentes.com: HP ProLiant DL60 Gen 9 E5-2603v3/4GB cuyo precio es de 979€. Sin iva es: 809.09€

***Amortización a 4 años***
    
    Amortización máxima del 25% por año entonces: 809.09 * 0.25 =  202.25 cada año.
    
***Amortización a 7 años***

    Primer y segundo año: 809.09 * 0.25 = 202.25
    Tercer y cuarto año:  809.09 * 0.15 = 121.36
    Quinto año:           809.09 * 0.10 =  80.91
    Sexto y séptimo año:  809.09 * 0.05 =  40.46
    
###Ejercicio2: Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

_Elegimos un servidor dedicado de **1&1** con las siguientes características:_

Procesador: Amd Opteron 4274 HE

Nucleos de CPU: 8 Cores * 2.6Ghz

Memoria RAM: 16 GB DDR3

Disco Duro: 1500 GB

Coste: 169.99/Mes 


_Elegimos dos máquinas virtuales de **Azure** con las siguientes características:_

Nucleos de CPU: 8 Cores

Memoria RAM: 14GB 

Disco Duro: 600GB

Coste: 0.405/Hora 

**Se usa el 1% del tiempo:**

1&1: 169.99/Mes * 12 meses = 2039.88
Azure: 0.405/Hora => 301.32/Mes * 0.01 = 3.01/Mes * 12 Meses = 36.16

**Se usa el 10% del tiempo:**

1&1: 169.99/Mes * 12 meses = 2039.88
Azure: 0.405/Hora => 301.32/Mes * 0.1 = 30.13/Mes * 12 Meses = 361.58



###Ejercicio3: Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

Pequeño programa en python:

![Ejercicio3](https://www.dropbox.com/s/br1shbt4610drmg/Ejercicio3.png?dl=1)


* Instalamos CDE: apt-get install cde.

* Para empaquetar utilizamos la siguiente orden: cde python prueba.py .


###Ejercicio4: Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?

Modelo del procesador:

![Ejercicio4](https://www.dropbox.com/s/v6kp6shilid64qv/Ejercicio4.png?dl=1)

Tras ejecutar la orden, el resultado es:

![Ejercicio4b](https://www.dropbox.com/s/dsm36paloltkw7s/Ejercicio4b.png?dl=1)

Como no devuelve nada, esto quiere decir que el procesador no tiene esta funcionalidad o la tiene desactivada.

###Ejercicio5.1: Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.

Para poder usar la orden kvm-ok debemos hacer esto: apt-get install cpu-checker .

Ahora vemos con kvm-ok si es posible la acelaración KVM:

![Ejercicio5a](https://www.dropbox.com/s/6bco88pnqvlyd3t/Ejercicio5a.png?dl=1)


###Ejercicio5.2: Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios. 

Como hipervisor he elegido VirtualBox, para instalarlo uso: apt-get install virtualbox-qt.

![Ejercicio5b](https://www.dropbox.com/s/ideodftlsygcuty/Ejercicio5b.png?dl=1)





