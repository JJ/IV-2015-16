# Ejercicios Tema 1  

## Ejercicio 1  

Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.  

[HP ProLiant ML350 Gen9](http://www.pccomponentes.com/hp_proliant_ml350_gen9_e5_2620v3_16gb_2x300gb.html)  

Especificaciones (según PCComponentes.com):  
* **Procesador** Intel® Xeon® E5-2620 v3 (6 núcleos, 2,4 GHz, 15 MB, 85 W)  
* **Disco duro** 2x300GB  
* **Unidad Óptica** No incluye  
* **Memoria RAM** 16GB  
* **Red**  
  * **Ethernet**  
  * **LAN** 10/100/1000Base  
  * **Tipo de interfaz** ethernet Gigabit  
* **Control de energía**  
* **Fuente de alimentación** 2x500W  
* **Dimensiones (Ancho x Profundidad x Altura)** 21.9 x 76.9 x 46.4 cm  
* **Peso** 30 kg  

| Base Imponible | IVA (21%) | Total |
| -------------- | --------- | ----- |
| 2448.76 € | 514.24 €  | 2963 € |

**Amortización a 4 años**  
*Suponiendo porcentaje máximo del 25%*  
1er año (25%): 612.19 €  
2º año (25%): 612.19 €  
3er año (25%): 612.19 €  
4º año (25%): 612.19 €  
Total: 2448.76 €  

**Amortización a 7 años**  
*Suponiendo porcentaje máximo del 25%*  
1er año (15%): 367.32 €  
2º año (15%): 367.32 €  
3er año (15%): 367.32 €  
4º año (15%): 367.32 €  
5º año (15%): 367.32 €  
6º año (15%): 367.32 €  
7º año (10%): 244.84 €  
Total: 2448.76 €  

## Ejercicio 2  

Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.  

**Servidor dedicado**

Servidor dedicado *XL12i* de [1and1](http://www.1and1.es/server-dedicated-tariff#server)  

Especificaciones:  
* **CPU** Intel®Xeon® E5-2640  
* **RAM** 32 GB DDR3 ECC  
* **HDD** 2.000 GB (2 x 2.000 GB SATA)  

* **Precio** 169.99 €/mes

**Servidor en la nube**

Servidor en la nube *d2.xlarge* de EC2 de [Amazon](https://aws.amazon.com/ec2/instance-types/)  

Especificaciones:  
* **CPU** Intel Xeon E5-2676v3 (Haswell)  
* **RAM** 30.5 GB  
* **HDD** 3 x 2000 GB  

* [**Precio**](https://aws.amazon.com/ec2/pricing/) 0.69 $/h - 0.61 €/h

**Comparativa**

| Servidor dedicado (€/mes) | Servidor cloud (€/mes al 1%) | Servidor cloud (€/mes al 10%) |
| --- | --- | --- |
| 169.99 € | 4.45 € | 44.53 € |

## Ejercicio 3  

### 3.1  

¿Qué tipo de virtualización usarías en cada caso?  

Véase el comentario en el [foro](https://github.com/JJ/IV-2015-16/issues/1#issuecomment-148947567)  

### 3.2  

Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.  

He creado un fichero python con un simple *Hola mundo*. Lo he empaquetado con CDE y comprobado su ejecución sin problemas.  

## Ejercicio 4  

Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?  

**Modelo** Intel(R) Core(TM) i7-4720HQ CPU @ 2.60GHz  

![Salida del comando](https://www.dropbox.com/s/h3iuthud0xvn75g/snapshot1.png?dl=1)  

## Ejercicio 5  

### 5.1  

Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.  

**Salida del comando kvm-ok**  

```bash
avaron@Tharak:~$ kvm-ok
INFO: /dev/kvm exists
KVM acceleration can be used
avaron@Tharak:~$ 
```

### 5.2  

Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.  
 
Tengo instalado VirtualBox 5.0 como gestor de máquinas virtuales.
