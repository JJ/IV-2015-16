# Ejercicios Tema 1
  
## Ejercicio 1
 
Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.

**Equipo**

El equipo seleccionado es [HP ProLiant ML150 Gen9 E5-2609v3](http://www8.hp.com/es/es/products/proliant-servers/product-detail.html?oid=7183204)


Las principales características son:

 * Procesador
   	Intel® Xeon® E5-2609 v3 (6 núcleos, 1,9 GHz, 15 MB, 85 W) 
	Número de procesadores 1
	Núcleo de procesador disponible 6 

 * Tipo de fuente de alimentación
	(1) Fuente de alimentación con integración de fábrica de 550 W 

 * Ranuras de expansión
	(6) máximo: para obtener una descripción detallada, consulte QuickSpec


 * Memoria, estándar
    	RDIMM de 8 GB (1 x 8 GB) 

 * Ranuras de memoria
    	16 ranuras DIMM; Máximo 

 * Tipo de memoria
	1R x8 PC4-2133P-R

 * Almacenamiento (no incluido)
	Samsung 840 EVO - Disco duro sólido interno SSD de 500 GB


El precio es de [1.339,88](http://www.amazon.es/HP-ProLiant-E5-2609v3-Non-hot-Server/dp/B00QX4XMLQ/ref=sr_1_4?s=computers&ie=UTF8&qid=1443985044&sr=1-4&keywords=hp+proliant#productDetails) + [244.99](http://www.amazon.es/dp/B00E3W19MO/ref=asc_df_B00E3W19MO29223280/?tag=googshopes-21&creative=24514&creativeASIN=B00E3W19MO&linkCode=df0)

Precio con IVA: 1584.87 € 

IVA (21%): 275,06 €

Total Sin IVA: 1.309,81 €

Con una amortización del 25% (4 años) tenemos que el servidor nos cuesta 327.45€ al año.

Con una amortización a 7 años tenemos que el servidor nos cuesta 187.116€ al año suponiendo que es constante del primer al último año.

## Ejercicio 2

Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

**Servidor dedicado VPS**

El VPS elegido pertenece a [serverhub](https://my.serverhub.com/cart.php?a=add&pid=629&_ga=1.137224563.236627008.1443994975)

Uso al 1%: 189$ que son 168€/mes aproximadamente y que al año tiene un coste de 2016€

Uso al 10%: el precio es fijo así que de igual manera el coste se mantiene en 2016€

**Servicio cloud**

El servicio escogido es Microsoft Azure calculando el precio aproximado [aquí](https://azure.microsoft.com/es-es/pricing/calculator/)

Tamaño de la instacia A3 con un uso completo (744 horas/mes) tiene un precio de 200,77€/mes

Uso al 1%: 2€/mes

Uso al 10%: 20€/mes

**Conclusión**

Es obvio que las ventajas de usar servicios en la nube en el aspecto económico son claramente favorables en comparación con la adquisición de un servicio VPS o un servidor propio.
A parte de la parte económica, la nube ofrece más ventajas como pueden ser el escalado, flexibilidad y rapidez en la configuración.
 
## Ejercicio 3

¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro

[Comentario](https://github.com/JJ/IV-2015-16/issues/1#issuecomment-145777828)

Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

En primer lugar creamos un programa, el lenguaje elegido es python. 

Para comprobar que realmente se produce un empaquetado de los recursos que dicho programa necesita usaremos una librería la cual es necesario instalar en el equipo que ejecuta el programa, dicha libreria es Fibo.

~~~python
# Importamos dicha libreria
from Fibo import fab2

# Línea de rigor
print("Hello world")

# Dime los 10 primeros numeros de fibonacci
fb = fab2(10)

# Imprimelos
print(fb)
~~~

Si ejecutamos dicho programa en un sistema el cual no tiene Fibo instalado obtenemos:
![Error](https://www.dropbox.com/s/93tsucddau1ppum/Screenshot_2015-10-05_00-55-48.png?dl=1)

A continuación empaquetamos dicho programa con CDE y lo ejecutamos en el sistema anterior que nos daba error:
![AhoraSi](https://www.dropbox.com/s/bpbdxoagazq9xrt/Screenshot_2015-10-05_01-01-53.png?dl=1)

La estructura generada por CDE es la siguiente:

cde-package

└── cde-root

    ├── bin -> usr/bin
    ├── etc
    ├── home
    │   └── jose
    │       └── Development
    │           └── pythontest
    │               ├── bin
    │               └── lib
    │                   └── python2.7
    │                       ├── encodings -> ./../../../../../..//usr/lib/python2.7/encodings
    │                       ├── lib-dynload -> ./../../../../../..//usr/lib/python2.7/lib-dynload
    │                       └── site-packages
    ├── lib -> usr/lib
    ├── lib64 -> usr/lib
    ├── sbin -> usr/bin
    └── usr
        ├── bin
        ├── lib
        │   ├── locale
        │   └── python2.7
        │       ├── encodings
        │       ├── lib-dynload
        │       ├── lib-tk
        │       └── plat-linux2
        ├── lib64 -> lib
        └── share
            └── zoneinfo
                └── Europe

29 directories

## Ejercicio 4

Comprobar si el procesador o procesadores instalados tienen los flags vmx ó svm . ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?

El modelo del procesador es Intel(R) Core(TM)2 Duo CPU T6500 @ 2.10GHz

La salida de egrep '^flags.*(vmx|svm)' /proc/cpuinfo no muestra nada por lo que éste procesador no tiene la posibilidad de virtualización a nivel de hardware.

## Ejercicio 5

Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.

Debido a que mi procesador no soporta la virtualización, [no dispongo](https://wiki.archlinux.org/index.php/KVM#Checking_support_for_KVM) de la orden kvm.
