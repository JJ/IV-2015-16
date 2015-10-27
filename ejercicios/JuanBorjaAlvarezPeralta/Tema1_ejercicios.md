#1: Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años. Consultar este artículo en Infoautónomos sobre el tema. 

El articulo elejido y  su descripción se encuentran en este enlace: 

http://www.informatica2.com/es_producto/PRIMERGY_TX1310M1_XE_E31226V3_SYST~1218191.html?cpart=13&gclid=CMG7lvWjv8gCFSjlwgodUoQKyw

Procedemos a calcular la amortización a 4 años: 476.96 euros con iva. 
Vamos a calcular el coste sin iva: para ello 476,96/1,21=394,18€

Proceso de amortización teniendo en cuenta  que corresponde a un 25% por año para ello
394,18*0,25 = 98,54€

La amortización para 7 años, teniendo en cuenta que corresponde a un 25% en dos primeros años y luego se va reduciendo:

* Primer Año:394,18*0.25=98,54€
* Segundo Año:394,18*0,25=98,54€
* Tercer Año:394,18*0,15=59,127€
* Cuarto Año:394,18*0,15=59,127€
* Quinto Año:394,18*0,10=39,418€
* Sexto Año:394,18*0,05=19,709€
* Séptimo Año:394,18*0,05=19,709€


#2: Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) si la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

https://aws.amazon.com/es/ec2/pricing/ 

* Cogemos el t2.large con las siguientes características:

   - 2vcpu
   - 8 GiB de memoria
   - $0.04 por hora= 0,09€ por hora
   - Almacenamiento EBS
   
* Como servidor he escogido el que ofrece Arsys(http://www.arsys.es/servidores/dedicados) con las siguientes características:

   - Procesador: Intel Xeon 8 Core, 2 GHz
   - RAM: 12GB
   - Disco Duro: 2x300 GB SATA Hw RAID 1
   - Coste: 125.00€/mes
   

* Si se usa el 1% del tiempo:
   - Arsys: 125.00€/mes * 12 meses = 1500€
   - Amazon : (0.09€/hora * 24h/día * 30 días/mes * 12 meses/año) * 0.01 = 7,776€/año

* Se usa el 10% del tiempo:
   - Arsys: 125.00€/mes * 12 meses = 1500€
   - Amazon : (0.09€/hora * 24h/día * 30 días/mes * 12 meses/año) * 0.1 = 77.76€/año

#3.1: ¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro

Siempre he usado virtualización plena en todas mis prácticas, para tener la funcionalidad del Sistema Operativo y para que realizar tareas que no pongan en peligro el equipo
Siempre he usado VMware para ello.

#3.2: Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

* El programa que he creado es un pequeño es el típico hola mundo en python

   - borja@ubuntu:~$ python /home/borja/Desktop/HolaMundo.py
   - Hola Mundo

* Instalo el cde sudo apt-get install cde

   - borja@ubuntu:~$ sudo apt-get install cde
   - [sudo] password for borja: 
   - Reading package lists... Done
   - Building dependency tree
   - Reading state information... Done

* Después lo empaqueto con cde python HolaMundo.py

   - borja@ubuntu:~/Desktop$ cde python  HolaMundo.py
   - Hola Mundo

#4: Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?

borja@ubuntu:~/Desktop$ cat /proc/cpuinfo | grep model

    model: 70
    model name: Intel(R) Core(TM) i7-4960HQ CPU @ 2.60GHz
    model	: 70
    model name	: Intel(R) Core(TM) i7-4960HQ CPU @ 2.60GHz
    model	: 70
    model name	: Intel(R) Core(TM) i7-4960HQ CPU @ 2.60GHz

Usando dicho comando no me lista nada, con lo cual quiere decir que mi procesador no tiene esta función 

borja@ubuntu:~/Desktop$ egrep '^flags.*(vmx:svm)' /proc/cpuinfo
borja@ubuntu:~/Desktop$ 



