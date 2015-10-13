# Ejercicios de Rubén Martín Hidalgo
## Tema 1
### Ejercicio 1: Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.

He escogido como servidor el [HP PROLIANT ML310E GEN8](http://www.dynos.es/servidor-hp-proliant-ml310e-gen8-xeon-e3-1220v3-3.1ghz-8gb-ddr3-lff-2x-1tb-dvd-rom-ata-600-array-b120i-888182061657__470065-800.html) de la tienda [Dynos](http://www.dynos.es/).

Para calcular su coste de amortización, se debe obtener a partir del precio final del producto sin IVA, que lo calculamos a través de alguna web destinada para ello:

![Precio sin IVA = 576.86 €](https://www.dropbox.com/s/t2teia06jogmbpl/calculosinIVA.PNG?dl=1)

**Amortización a 4 años**

Deducimos una amortización máxima del 25% cada año: 576.86 * 0.25 = 144.22 € cada uno de los cuatro años.

**Amortización a 7 años**

Los primeros años se debe amortizar más.  
 - Primer año: 576.86 * 0.25 = 144.22 € 
 - Segundo año: 576.86 * 0.25 = 144.22 €  
 - Tercer año: 576.86 * 0.15 = 86.53 €  
 - Cuarto año: 576.86 * 0.15 = 86.53 €  
 - Quinto año: 576.86 * 0.10 = 57.69 €  
 - Sexto año: 576.86 * 0.05 = 28.84 €  
 - Séptimo año: 576.86 * 0.05 = 28.84 €

### Ejercicio 2: Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

Para el alojamiento web he elegido el siguiente servidor dedicado de [1&1](https://www.1and1.es/): 

![Servidor dedicado 1&1](https://www.dropbox.com/s/86d418v4j4sc1rt/Server1%261.PNG?dl=1)

Como proveedor de servicios en la nube, escogí [Microsoft Azure](https://azure.microsoft.com/es-es/), con dos instancias de máquina virtual con características similares al servidor dedicado.

![Servidor nube Azure](https://www.dropbox.com/s/i50tpdgtig2470h/ServerAzure.PNG?dl=1)

**Se usa sólo el 1% del tiempo**

Precio del servidor en nube de Azure: 0.405 €/hora * 24h * 31 dias * 1% * 2 instancias = 6.03 €/mes

Precio del servidor dedicado de 1&1: 119.99 €/mes

**Se usa sólo el 10% del tiempo**

Precio del servidor en nube de Azure: 0.405 €/hora * 24h * 31 dias * 10% * 2 instancias = 60.26 €/mes

Precio del servidor dedicado de 1&1: 119.99 €/mes

Como podemos ver, con proveedores de servicios en la nube que nos cobran por el uso y no por el hecho de tener acceso, nos puede resultar más económico si hacemos un uso por debajo del 20% del total.

### Ejercicio 3.1: ¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro.

Mi comentario en el foro está [aquí](https://github.com/JJ/IV-2015-16/issues/1#issuecomment-144691470).

### Ejercicio 3.2: Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

1. Creamos un script.py en python con un holamundo por ejemplo:
```
#! /usr/bin/python 
print "Hola mundo" 
```

2. Instalamos CDE con *sudo apt-get install cde*

3. Empaquetamos el script con *cde python script.py*, que nos crea los ficheros cde.options y cde-package

![Archivos creados CDE](https://www.dropbox.com/s/0vdjlsojagossbp/ficherosCDE.PNG?dl=1)

4. Nos vamos al directorio donde se encuentre el ejecutable creado: *cd cde-package/cde-root/home/usuario/...*

5. Y ejecutamos *./python.cde script.py*, y nos saldrá "Hola mundo" por la terminal.

### Ejercicio 4: Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?

Para comprobar si el procesador tiene instalados los flags, ejecutamos "egrep '^flags.*(vmx|svm)' /proc/cpuinfo"

Si no lista nada, entonces es que el procesador no tiene esa funcionalidad o está desactivada.

Con el comando *cat /proc/cpuinfo* vemos la CPU que tenemos:

![Intel Core i7 M640](https://www.dropbox.com/s/ulcduxlpw0zb0u7/infoCPU.PNG?dl=1)

### Ejercicio 5.1: Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.

1. Primero instalamos el paquete kvm-ok con el comando: *sudo apt-get install cpu-checker*

2. Ejecutamos *sudo kvm-ok* para averiguar si está instalado el módulo.

![Comprobación módulo kvm](https://www.dropbox.com/s/7snrxi4sweozfkg/kvm-ok.PNG?dl=1)

### Ejercicio 5.2: Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.

En mi caso he instalado [Xen](http://www.xenproject.org/developers/teams/hypervisor.html) con el siguiente comando: *sudo apt-get install xen-hypervisor-4.4-amd64*
