# Ejercicios de Lorenzo Manuel Rosas Rodríguez
## Tema 1
### Ejercicio 1: Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.

Para realizar el ejercicio he escogido el servidor [HP ProLiant ML110 Gen9 E5-1620v3/4GB/1TB](http://www.pccomponentes.com/lenovo_ts_440_think_server_intel_xeon_v1225_e3_4gb.html), el cual he encontrado en **PcComponentes**.

Ahora indicamos características de nuestro producto:
- **Procesador** ==> *E5-1620V3 (3.5 GHz)*
- **Disco duro** ==>  *1TB*
- **Unidad Óptica** ==> *No incluye*
- **Memoria** ==> *RAM 4GB*
- **Red**
   - ==> *Ethernet*
   - ==> *LAN 10/100/1000Base*
   - ==> *Tipo de interfaz ethernet Gigabit*
   - ==> *Conexiones: 2 x USB 2.0,4 x USB 3.0,1 x VGA,2 x R-J45*
   - ==> *Dimensiones (Ancho x Profundidad x Altura): 19.5 cm x 48.05 cm x 44 cm*
   - ==> *Peso 12.5 kg*


Para más información consultar el enlace de arriba. Imagen del producto:

![Servidor](http://fotos.pccomponentes.com/ordenadores_sobremesa/servidores/hp_proliant_ml110_gen9_e5_2603v3_4gb.jpg)

Para realizar el cálculo de la amortización hay que hayar el precio del producto sin IVA, ya que este es amortizado el primer año. Este precio ya nos lo da la página, el cual es 1000 euros.

Para la amortización en 4 años, en cada uno sería del 25%, por lo tanto nos saldría:


|    Año     |   Precio   | Porcentaje | Total Anual |
| ---------- | ---------- | ---------- | ----------- |
|    1       |  1000      |    0.25    |  250euros   |
|    2       |  1000      |    0.25    |  250euros   |
|    3       |  1000      |    0.15    |  250euros   |
|    4       |  1000      |    0,15    |  250euros   |


Para la amortización en 7 años tenemos dos opciones: 
- O bien podríamos hacer como en el caso anterior y pagar lo mismo cada año, por lo que tendríamos en porcentaje en cada uno del 15%(aproximadamente). 

|    Año     |   Precio   | Porcentaje | Total Anual |
| ---------- | ---------- | ---------- | ----------- |
|    1       |  1000      | 15%(aprox) |  150 euros  |
|    2       |  1000      | 15%(aprox) |  150 euros  |
|    3       |  1000      | 15%(aprox) |  150 euros  |
|    4       |  1000      | 15%(aprox) |  150 euros  |
|    5       |  1000      | 15%(aprox) |  150 euros  |
|    6       |  1000      | 15%(aprox) |  150 euros  |
|    7       |  1000      | 15%(aprox) |  150 euros  |

- También podríamos realizar un pago descendente, de forma que en cada año pagaríamos: 25% primer año, 25% segundo año, 15% tercer año, 15% cuarto año, 10% quinto año, 5% sexto año, 
5% séptimo año.


|    Año     |   Precio   | Porcentaje | Total Anual |
| ---------- | ---------- | ---------- | ----------- |
|    1       |  1000      | 25%(aprox) |  250 euros  |
|    2       |  1000      | 20%(aprox) |  200 euros  |
|    3       |  1000      | 15%(aprox) |  150 euros  |
|    4       |  1000      | 15%(aprox) |  150 euros  |
|    5       |  1000      | 10%(aprox) |  100 euros  |
|    6       |  1000      | 5%(aprox)  |  50 euros   |
|    7       |  1000      | 5%(aprox)  |  50 euros   |


###Ejercicio 2 : Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

Para realizar el ejercicio tendremos en cuenta dos propuestas:

- [Azure](https://azure.microsoft.com/es-es/)
![img](https://www.dropbox.com/s/wp55jgv6mg7wwqe/imagen_azure_1.png?dl=1)
- [1and1](http://www.1and1.es)
![img](https://www.dropbox.com/s/zjik2nlv47nbrs5/1and1.png?dl=1)

Por lo tanto, en el caso de Azure:
- Si lo usamos un 1%, equivale 7,44 horas el mes, y su precio sería ===> **7,44x0,130€=0,9672 euros**
- Si lo usamos un 10%, deducimos que su precio será 9,672 euros usando el razonamiento anterior.

En el caso de 1&1, no hay restricción de tiempo, entonces si usamos azure con un porcentaje del 1% será más barato, pero si lo usamos con un 10% será más caro.

###Ejercicio 3. Apartado2. Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

Para realizar el ejercicio podemos programar un bucle cualquiera, utilizando para ello la sintaxis de phyton:

Código (en ejemplo.py)

```python
#!/usr/bin/env python
# -*- coding: utf-8 -*-

#!/usr/bin/env python
# -*- coding: utf-8 -*-

n = 1
while n <= 30: 
    print n,
    n += 1
```

Si funciona:

- **Realizamos la instalación de CDE utilizando "sudo apt-get install cde”**
- **Después ejecutamos el programa utilizando "cde python programa.py”.**
- **Entramos al directorio "/cde-package/cde-root/home/miUsuario" con "cd”.**
- **Ejecutamos "./python.cde prueba.py", ya que hay que ejecutar el programa con extensión "cde" y pasarle como parámetro aquellos ficheros que necesitemos.**

Finalmente lo llevaríamos a otra máquina, ejecutaríamos el último paso y comprobaríamos que funciona correctamente.

##ejercicio 5:
**1- Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.**

Salida:

![kvm](https://www.dropbox.com/s/drv3yvt0gfsk8p3/img1_tema1.png?dl=1)

**2-Instalar un hiper-visor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.**
Solución:
```
sudo apt-get install xen-hypervisor-amd64
```







