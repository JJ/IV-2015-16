Ejercicios Tema 1
============

Ejercicio 1:
-----------
**Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.**

[HP 736958-421 ProLiant ML350p Gen8 1P PS Server](http://www.amazon.co.uk/HP-736958-421-ProLiant-ML350p-Server/dp/B00F8A38N8/ref=sr_1_3?ie=UTF8&qid=1444209311&sr=8-3&keywords=Server+computer).

Precio en libras exterlinas: 1,477.33   
IVA aplicado: 20% (UK Standar Taxes)  
Precio sin IVA en libras exterlinas: 1186.6  
Pasandolo a Euros:  
![](http://i.imgur.com/nRJN8xq.png)  

**Amortización a 4 años:**   
Aplicando el índice de amortización para equipos informáticos establecido por la Agencia Tributaria:

Primer año: 25% --403.8€   
Segundo año: 25% --403.8€  
Tercer año: 25% --403.8€  
Cuarto año: 25% --403.8€  

**Amortización a 7 años:**   

Aplicando el índice de amortización para equipos informáticos establecido por la Agencia Tributaria:

Primer año: 25% --403.8€   
Segundo año: 25% --403.8€  
Tercer año: 15% -- 242.3€  
Cuarto año: 15% --242.3€    
Quinto año: 10% --161.5€  
Sexto año: 5% -- 80.75€  
Septimo año: 5% -- 80.75€    

   
--------------------------------------------------------------------
--------------------------------------------------------------------
Ejercicio 2:
-----------
**Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.**

He tomado como referencia de hosting el servicio proporcionado por la empresa [1&1](http://www.1and1.es/alojamiento-web) el cual nos muestra como tarifa top la siguiente:

![](http://i.imgur.com/4TVCLEg.png)  
![](http://i.imgur.com/Nlo7Swn.png)  

El precio es de 9,99€ al mes durante el primer año, luego esta cuota mensual asciente a 14,99€ al mes. Esto claro está que no tiene en cuenta el uso efectivo que se realice sobre el servicio solicitado, es decir, da igual que % del servicio aprobechemos que la tarifa mensual no varía. (Es una de las características de los servicios de hosting "estáticos")

En le caso de **Microsoft Azure** o de **Amazon EC2**, los precios varían en función del uso o el consumo que realicemos, es decir:  

Para **Microsoft Azure**, hacienda uso de su calculadora de precious podemos estimar el consume por hora aproximado solicitando una máquina de las siguientes características:

![](http://i.imgur.com/ClEQrlw.png)

**0.031 GBP/h = 0,04 €/h**  

En el caso de Amazon EC2 la calculadora nos muestra los siguientes resultados:  

![](http://i.imgur.com/7kK40C3.png)

**0.03 USD/h = 0.03 €/h**

El precio tanto de Amazon como de Azure son muy parecidos con la diferencia de que si solicitamos mas recursos, Azure aumenta mas rapidamente sus precious que Amazon, siendo Amazon algo mas económico al solicitor mas recursos que los estándares aquí expuestos.

--------------------------------------------------------------------
--------------------------------------------------------------------


Ejercicio 3:
-----------
**¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro**


[Comment al foro](https://github.com/JJ/IV-2015-16/issues/1#issuecomment-147791527) 

--------------------------------------------------------------------
--------------------------------------------------------------------


Ejercicio 4:
-----------
**Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?**

El modelo es,
Intel(R) Core(TM) i5-3337U CPU @ 1.80GHz

![](http://i.imgur.com/V5b48Qt.png)  


--------------------------------------------------------------------
--------------------------------------------------------------------  
  
Ejercicio 5:
-----------
**Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok**  

Al lanzar la orden kvm-ok, muestra la ausencia del modulo

!![](http://i.imgur.com/5GvvYdA.png) 

































