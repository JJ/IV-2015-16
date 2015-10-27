#Ejercicios Tema 1

## Ejercicio 1.
### Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.

Mirando por [pccomponentes](http://www.pccomponentes.com) he encontrado este servidor: 
[HP ProLiant ML310e G8 XE E3](http://www.pccomponentes.com/hp_proliant_ml310e_g8_xe_e3_1220_8gb_2tb.html)

Para calcula el coste de la armortización primero debemos saber cual es su coste sin IVA:


Su valor es de 729€, sin IVA su coste es de **602.48€** (La propia página nos lo muestra). 

**Amortización a 4 años**
Teniendo en cuenta una amortizació máxima de 25% cada año tomamos esto para los 4 años y obtenemos:
	-**Primer año**: 602.48€*0.25=150.62€
	-**Segundo año**: 602.48€*0.25=150.62€
	-**Tercer año**: 602.48€*0.25=150.62€
	-**Cuarto año**: 602.48€*0.25=150.62€
	-**Total**: 4*150.62€ = 602.48€

**Amortización a 7 años**
Para la amortización a 7 años podemos hacer como en el anterior caso o tambien coger un gasto con digitos descendentes (ya que un ordenador cada año que pasa pierde valor) como por ejemplo así:

	-**Primer año**: 602.48€*0.25=150.62€
	-**Segundo año**: 602.48€*0.25=150.62€
	-**Tercer año**: 602.48€*0.15 = 90.372€
	-**Cuarto año**: 602.48€*0.15 = 90.372€
	-**Quinto año**: 602.48*0.10 = 60.248€
	-**Sexto año**: 602.48*0.05 = 30.124€
	-**Septimo año**: 602.48*0.05 = 30.124€
	-**Total**: 150.62€*2 + 90.372€*2 + 60.248€ + 30.124€*2 = 602.48€

##Ejercicio 2.

### Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a tranferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

He encontrado estas dos páginas con estos precios en los que sus procesadores son parecidos. 
![](https://www.dropbox.com/s/byuwgmmhm4o4koh/t1-2.JPG?dl=0)

En 1and1 podemos encontrar un servidor virtual con CPU 4vCores, 4GB de RAM y disco duro de 300GB y tráfico ilimitado por 20€ al mes unos 240€ al año.


![](https://www.dropbox.com/s/diq9omb9o87csvu/T1-2a.JPG?dl=0)

En axarnet.es con CPU de 4 cores, 4GB de RAM y Tráfico ilimitado por 14.98€ al mes, que seria unos 179.76€

**Usando sólo el 1% del tiempo**
 0.03€/hora*24h*30dias*1% =0.23€/mes 
 0.029€/hora*24h*30dias*1% = 0.21€/mes

**Usando sólo el 10% del tiempo**

 0.03€/hora*24h*30dias*10% = 2.16€/mes
 0.029€/hora*24h*30dias*10% = 2.1€/mes

##Ejercicio 3
### ¿Qué tipo de virtualización usarías en cada caso?
[Comentado en el foro](https://github.com/JJ/IV-2015-16/issues/1#issuecomment-147697381)

##Ejercicio 4
###Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?

Al poner el comando que nos pide no obtengo ningun resultado, por lo que no los tiene instalados o los tiene desactivados:
![](https://www.dropbox.com/s/tmh1bfgd5mjlmh7/4-2.JPG?dl=0)

Con cat /proc/cpuinfo obtenemos:
![](https://www.dropbox.com/s/qdigo2lel2cpu0t/4-1.JPG?dl=0)


##Ejercicio 5
### 1. Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.

![](https://www.dropbox.com/s/rnpo4xba7cyi6l8/5-1.JPG?dl=0)

###2. Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.

Ya disponia de un hipervisor instalado.


