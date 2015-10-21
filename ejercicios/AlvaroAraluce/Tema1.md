#Ejercicios del tema 1

##Ejercio1: Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años. Consultar este artículo en Infoautónomos sobre el tema.

De acuerdo a la tabla de amortizaciones simplificada, para "equipos para tratamiento de la información y sistemas y programas informáticos" podemos aplicarle un coeficiente máximo del 26% a 10 años.

Para este ejercicio he decidido calcular el coste de amortización del [SERVIDOR HP PROLIANT ML110E GEN9 XEON E5-2620v3 2.4GHZ 8GB DDR4 LFF 1TB DVD-ROM ARRAY B140I](http://www.dynos.es/servidor-hp-proliant-ml110e-gen9-xeon-e5-2620v3-2.4ghz-8gb-ddr4-lff-1tb-dvd-rom-array-b140i-888793950609__794996-425.html) con un coste de __1499,00€ *IVA incluido*__ (consultado el día 30/09/2015).


Entonces tenemos que:

| Base imponible |   IVA   | Total factura |
|----------------|---------|---------------|
|    1238.84€    | 260.16€ |    1499.00€   |


Suponemos para ambos apartados que el servidor es adquirido al comienzo del año.

### 1.1 Amortización a cuatro años

Dividimos entre **4 años** la base imponible y obtenemos una **cuota de amortización de 309.71€**.

| Año | Cuota de amortización| Amortización acumulada | Valor neto contable |
|-----|----------------------|------------------------|---------------------|
|  1  | 309.71€              | 309.71€                | 929.13€             |
|  2  | 309.71€              | 619.42€                | 619.42€             |
|  3  | 309.71€              | 929.13€                | 309.71€             |
|  4  | 309.71€              | 1238.84€               | 0€                  |

### 1.2 Amortización a siete años

Dividimos entre **7 años** la base imponible y obtenemos una **cuota de amortización de 176.98€**.

| Año | Cuota de amortización| Amortización acumulada | Valor neto contable |
|-----|----------------------|------------------------|---------------------|
|  1  | 176.98€              | 176.98€                | 1061.86€            |
|  2  | 176.98€              | 353.96€                | 884.88€             |
|  3  | 176.98€              | 530.94€                | 707.9€              |
|  4  | 176.98€              | 707.92€                | 530.92€             |
|  5  | 176.98€              | 884.9€                 | 353.94€             |
|  6  | 176.98€              | 1061.88€               | 176.98€             |
|  7  | 176.98€              | 1238.84€               | 0€                  |


## Ejercicio 3

### Ejercicio 3.1

[Contestado en el issue](https://github.com/JJ/IV-2015-16/issues/1)

### Ejercicio 3.2

El programa simple está desarrollado en python

print "Hola mundo!"

Guardamos este programa tan complejo en un fichero... por ejemplo "holaKase.py".

El siguiente paso es descargar CDE. Podemos encontrarlo [aquí](http://www.pgbovine.net/cde.html). (En mi caso voy a descargar la versión de [64bits](https://github.com/downloads/pgbovine/CDE/cde_2011-08-15_64bit) aunque también está disponible la versión de [32bits](https://github.com/downloads/pgbovine/CDE/cde_2011-08-15_32bit))

Se descargará un ejecutable al que debemos dar permisos de ejecución:

$ *sudo chmod +x cde_2011-08-15_64bit*

Ya sólo tenemos que ejecutar el comando

$ *./cde_2011-08-15_64bit python holakAse.py*

Y se nos genera un directorio donde encontraremos el fichero "holakAse.py.cde" junto con otros ficheros de datos de cde.

Para probar si funciona hemos probado con un Sistema Operativo virtualizado tipo Unix. Hemos copiado el directorio generado y ahora accedemos a la ruta donde cde nos ha virtualizado el código.

Accedemos a la ruta:

$ *cd cde-package/cde-root/<ruta>*

Y ejecutamos nuestro programa:

$ *./python.cde holakAse.py*

Y tras la ejecución obtenemos un resultado idéntico al obtenido en la máquina principal.

Para realizar este ejercicio me he basado en la [guía de usuario](http://www.pgbovine.net/cde/manual/) de la página oficial.

### Ejercicio 4

**Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?**

Para comprobar el procesador que tengo ejecuto la orden:

$ *grep 'model name' /proc/cpuinfo*

La salida que obtengo es la siguiente:

model name	: Pentium(R) Dual-Core CPU       T4500  @ 2.30GHz
model name	: Pentium(R) Dual-Core CPU       T4500  @ 2.30GHz

Eso significa que tengo un procesador Pentium(R) de 2 núcleos.

Si ejecuto la orden:

$ _egrep '^flags.*(vmx|svm)' /proc/cpuinfo_

No obtengo ninguna salida.

### Ejercicio 5

**Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.**

Al ejecutar la orden, la terminal me dice que debo instalar el programa, así que le hacemos caso y ejecutamos:

$ _sudo apt-get install cpu-checker_

Después de eso, ejecutamos de nuevo la orden y obtenemos:

INFO: Your CPU does not support KVM extensions  
INFO: For more detailed results, you should run this as root  
HINT:   sudo /usr/sbin/kvm-ok

**Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios**

Yo ya tengo instalado VirtualBox como hipervisor, que es el que me gusta. Para instalarlo, sólo debemos ejecutar la orden:

$ _sudo apt-get install virtualbox_

**Nota: ** La forma de instalar puede variar de una distribución a otra.
