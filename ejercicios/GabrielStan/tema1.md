# Tema 1

### Ejercicio 1

**Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años. Consultar este artículo en Infoautónomos sobre el tema.**

Servidor elegido: HP ProLiant ML150 Gen 9 E5-2603v3/4GB/500GB
Mas información: [HP ProLiant](http://www.pccomponentes.com/hp_proliant_ml150_gen_9_e5_2603v3_4gb_500gb.html)

El precio del servidor es de 1002€ IVA incluido (828.1€ sin IVA)

**Amortizazión a 4 años**

Como la amortización máxima es del 25% sobre el precio base:

1. primer año: 828.1 * 0.25 = 207.02€
2. segundo año: 828.1 * 0.25 = 207.02€
3. tercer año: 828.1 * 0.25 = 207.02€
4. cuarto año: 828.1 * 0.25 = 207.02€

**Amortizazión a 7 años**

1. primer año: 828.1 * 0.15 = 124.2€
2. segundo año: 828.1 * 0.15 = 124.2€
3. tercer año: 828.1 * 0.15 = 124.2€
4. cuarto año: 828.1 * 0.15 = 124.2€
5. quinto año: 828.1 * 0.15 = 124.2€
6. sexto año: 828.1 * 0.15 = 124.2€
7. séptimo año: 828.1 * 0.10 = 82.8€

### Ejercicio 2

**Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.**


He comparado los precios entre un VPS ofrecido por [Dinahosting](https://dinahosting.com/) y un servidor cloud ofrecido por [Microsoft Azure](https://azure.microsoft.com) con la siguiente configuración:

- Procesador: 1 vCore
- Ram: 1GB
- HDD: 20GB

![Precios Microsoft Azure](https://www.dropbox.com/s/f6es75dr85avwrm/servidor%20cloud%20azure.png?dl=1)
![Precios Dinahosting](https://www.dropbox.com/s/dagghelxfb549no/VPS%20dinahosting.png?dl=1)

Como se puede observar, el VPS tiene un coste fijo de 432€/año. Supniendo que el servidor cloud de Microsoft Azure está operativo 24/7 durante todo el año, tendría un coste mensual de 11.29€/mes, traducido como 135.48€/año. Si el servidor cloud solo está funcionando el 1% del tiempo, tendría un coste de 1.35€/año, y con un uso del 10% tendría un coste de 13.55€/año, bastante más reducido que el coste de un VPS.


### Ejercicio 3

**1. ¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro**

https://github.com/JJ/IV-2015-16/issues/1#issuecomment-145336366


**2. Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.**

Tras instalar CDE, he empaquetado una simple aplicación python que escribe por pantalla "Hola mundo!". Falta ejecutarlo en diferentes distribuciones.

![Instalando CDE](https://www.dropbox.com/s/i40a178ud7aixuj/instalando-cde.png?dl=1)

![Probando CDE](https://www.dropbox.com/s/vt9ndcse9wcf86g/probando-cde.png?dl=1)

### Ejercicio 4

**Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?**

resultado de ejecutar la orden:
$ cat /proc/cpuinfo

![cpu info](https://www.dropbox.com/s/9cejyp29011rwa4/procesador.png?dl=1)

El procesador tiene 2 nucleos, cada uno con 2 threads, por tando en el fichero aparece 4 veces la misma información.

![cpu flags](https://www.dropbox.com/s/k8ztc6l7v9ikmkj/flags.png?dl=1)

### Ejercicio 5

**1. Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.**

El SO tiene instalado el módulo KVM y la acceleración por hardware está activada.

![kvm](https://www.dropbox.com/s/o8hilb8ltk6wiym/kvm.png?dl=1)

**2. Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.**

$ sudo apt-get install qemu-kvm qemu

Hecho.

**Fin ejercicios tema 1 :) **

