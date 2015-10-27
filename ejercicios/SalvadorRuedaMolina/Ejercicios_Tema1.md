##Ejercicio 1.
##Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.

Ordenador Lenovo ThinkServer precio 745 euros y le quitamos el IVA y quedaría 615,7€.

Amortización en 4 años sería: el 26%(Máxima amortización) cada año y el ultimo el resto es decir.

1º año ->160	 €

2º año ->160 €

3º año ->160 €

4º año → 135,7 €

Amortización en 7 años lo repartiríamos en el  14% cada año y el resto en el último.

Del primer al sexto año → 86.2€ cada año.

7º año → 98,5 €

##Ejercicio 2.

##Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

Para el servidor dedicado he usado un servidor de la web arsys con un procesador de 4 núcleos  y 8 GB de RAM con sistema operativo Windows cuyo precio es de 150 euros al mes.

Para el servidor web usare el de Microsoft Azure  con 4 nucleos y 7 GB de RAM con el sistema operativo Windows cuyo precio es 225,87 euros al mes.

Si usamos el 1%:
Para el servidor en la nube debemos hacer los siguientes calculos:
Calculamos la hora que tiene un año-> 24*365=8760 horas.

Por lo que el 1% del año sería 8760*0,01=87,6 horas.

El precio por hora de nuestro servidor en la nube es: 0,304€.

Por lo que el precio sería de 26,63€.

Para el servidor dedicado la operación es más simple ya que independientemente de lo que utilicemos el precio no varía.

150*12=1800€

Para calcular el 10% de uso la operación es similar:

Para los servidores en la nube->8760*0,1= 876 horas al año.

876*0,304€=266,3€

Mientras el servidor dedicado nos seguiría costando 1800€.

##Ejercicio 3.
## 1.¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro.

[Foro](https://github.com/JJ/IV-2015-16/issues/1 )

## 2. Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.
Para empaquetarlo en CDE me lo he bajado con el siguiente comando:

sudo apt-get install cde

Una vez instalamos lo empaquetamos de la siguiente manera:

 cde python eje2.py

Se nos creara un archivo cde.options y un directorio cde-package.
Dentro de ese directorio podemos buscar nuestra carpeta donde se encuentra el archivo empaquetado y  lo ejecutamos con:

./python.cde eje2.py


##Ejercicio 4.
##Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?
Si tengo los flags activados.

Intel® Core™ i7-3537U CPU @ 2.00GHz × 4

![Sin titulo](http://i1028.photobucket.com/albums/y349/Salva_Rueda/eje4_zpsoxnp2iso.png)

##Ejercicio 5.

##1.Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.

Si lo contiene.

![Sin titulo](http://i1028.photobucket.com/albums/y349/Salva_Rueda/eje5_zpsffzuyrtp.png)

##2.Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.

Ya dispongo de Vmware Player



