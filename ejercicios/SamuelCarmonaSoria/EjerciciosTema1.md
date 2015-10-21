#Tema 1: Introducción a la infraestructura virtual: concepto y soporte físico

##Ejercicio 1
##Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.

He elegido el [HP ProLiant ML150 Gen 9 E5-2603v3/4GB/500GB] (http://www.pccomponentes.com/hp_proliant_ml150_gen_9_e5_2603v3_4gb_500gb.html), de PcComponentes.
Su precio es de 1002€ con IVA incluido, y tal como indica la propia página, el precio sin IVA es 828.1€.


###Amortización a 4 años
La amortización máxima sería 25% por cada año, así que usaré tal porcentaje para el precio sin IVA (828€ para redondear):
- Año 1:	828€*0.25 = 207€
- Año 2:	828€*0.25 = 207€
- Año 3:	828€*0.25 = 207€
- Año 4:	828€*0.25 = 207€


###Amortización a 7 años
Ya que para este caso son casi el doble de años, vamos a dividir el porcentaje de mayor a menor a medida que avanzan los años:
- Año 1:	828€*0.25 = 207€
- Año 2:	828€*0.20 = 165.6€
- Año 3:	828€*0.20 = 165.6€
- Año 4:	828€*0.15 = 124.2€
- Año 5:	1000€*0.10 = 82.8€
- Año 6:	1000€*0.05 = 41.4€
- Año 7:	1000€*0.05 = 41.4€


##Ejericio 2
##Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

Vamos a utilizar un servidor dedicado de [Hostalia](http://www.hostalia.com/dedicados/?utm_medium=cpc&utm_source=google&utm_content=busqueda&utm_campaign=google_servidoresdedicados_generico&gclid=CjwKEAjw1_KwBRDEz_WvncL4jGwSJAAEym0dxhn8ECMCIfmm13ghgmlkQNvE113_qpTlP38xUPPpQhoCHCXw_wcB) y una máquina virtual [Azure Linux](https://azure.microsoft.com/es-es/pricing/details/virtual-machines/#Linux).

Usaremos las opciones con 4 núcleos:
![Máquina Virtual Azure](http://i770.photobucket.com/albums/xx346/BkY_1234/foto1_zpsm1d1vfm5.jpg)
En concreto, la instancia A3: €0,1586/h (~€119/mes)

![Servidor dedicado Hostalia](http://i770.photobucket.com/albums/xx346/BkY_1234/foto2_zpsozalak2s.jpg)
Aquí, la primera opción, el precio normal es 99.9€/mes.

| Proveedor | CPUs | RAM | Precio/mes | Precio/año |  Uso 1 % del año | Uso 10% del año |
|-----------|------|-----|--------|--------|--------|--------|
|Microsoft Azure| 4 | 7 GB| 119 €/mes|1428| 14.28€ | 142.8€ |
|   Hostalia Dedicado |   4  |16 GB| 99.90 €/mes|1199 €|11.99€ | 119.9€|
|-----------|------|-----|--------|--------|--------|--------|

##Ejercicio 3.1
##¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro
[Comentario añadido.](https://github.com/JJ/IV-2015-16/issues/1)

##Ejercicio 4
##Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.
ejpython.py
```shell
#!/usr/bin/env python

print "Ejercicio para IV"
```

Instalamos CDE: (en Linux Debian en mi caso)
```shell
sudo apt-get install cde.
```

Para empaquetar utilizamos la siguiente orden:
```shell
cde python ejpython.py
```

También lo podemos ejecutar, teniendo instalado python previamente con:
```shell
python ejpython.py
```


##Ejercicio 4
##Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?
Usamos el siguiente comando:
```shell
egrep ' flags.*(vmx|svm)' /proc/cpuinfo
```
![CPU flags](http://i770.photobucket.com/albums/xx346/BkY_1234/foto3_zpsscouvg8d.jpg)


Para saber el modelo del procesador, usaremos:
```shell
cat  /proc/cpuinfo
```
![CPU flags](http://i770.photobucket.com/albums/xx346/BkY_1234/foto4_zpsb7mjmvrt.jpg)

##Ejercicio 5:
###1. Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden *kvm-ok*.
Usando dicha orden, nos indica que nuestro kernel no tiene dicho módulo y nos aconseja instalarlo a partir del paquete **cpu-checker**, así que lo instalamos. Una vez instalado volvemos a usar la orden **kvm-ok** y nos muestra que sí está instalado.

He estado probando el comando, e intentando instalar cpu-checker, pero no sé si es por la actualización reciente de Debian o por algún motivo pero no puedo realizarlo.

De igual manera, ya llevo usando este mismo OS unos años y tengo VirtualBox funcionando con OS instalados previamente.

####2. Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.
Como he dicho arriba, tengo instalado **VirtualBox**, que junto con VMware son los dos hipervisores que más he utilizado.
