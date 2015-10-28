## Miguel Fernández Fernández
# Tema 1

### Ejercicio 1: Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.

En Amazon [HP ProLiant DL320e Gen8 v2](http://www.amazon.es/HP-ProLiant-DL320e-Gen8-v2/dp/B00KZCJ6XA/ref=pd_sim_sbs_147_3?ie=UTF8&refRID=0PJK1GJHQ9QPA7F9WSX7&dpID=11XNpU6nWYL&dpSrc=sims&preST=_AC_UL160_SR160%2C160_)

Su precio es de 768.19€ (IVA incl.), como necesitamos el precio sin IVA pues hacemos el cálculo:

768.19€ - 768.19€ * 0.21 = 606.87€

**Amortización a 4 años**

Con una amortización máxima del 25% por año: 

    - Primer año: 	606.87€ * 0.25 = 151.72€
    - Segundo año:	606.87€ * 0.25 = 151.72€
    - Tercer año:	606.87€ * 0.25 = 151.72€
    - Cuarto año:	606.87€ * 0.25 = 151.72€

**Amortización a 7 años**

En este caso se va reduciendo el coste del producto conforme pasan los años, los 2 primeros años se mantiene el 25% pero el 50% restante se divide de forma gradual en los 5 siguientes años como podemos ver a continuación:

    - Primer año: 	606.87€ * 0.25 = 151.72€
    - Segundo año:	606.87€ * 0.25 = 151.72€
    - Tercer año:	606.87€ * 0.15 =  91.03€
    - Cuarto año:	606.87€ * 0.15 =  91.03€
    - Quinto año:	606.87€ * 0.10 =  60.687€
    - Sexto año:	606.87€ * 0.05 =  30.34€
    - Séptimo año:      606.87€ * 0.05 =  30.34€


## Ejercicios 3. 
### a) ¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro

Los tipos de virtualización, que voy a encontrar en las prácticas, son de tipo, V. Plena y V. de Aplicaciones.


Cuando necesito utilizar SO sin modificar, utilizamos virtualización plena, en concreto he utilizado VirtualBox, -> https://www.virtualbox.org/.


Ahora cuando necesito ejecutar una aplicación de un sistema operativo distinto al que tengo, se utiliza una virtualización de aplicaciones, en concreto cuando he necesitado ejecutar un programa de Windows en Linux he utilizado Wine, -> https://www.winehq.org/

Enlace al comentario: https://github.com/JJ/IV-2015-16/issues/1#issuecomment-147682034

### b) Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

**PROGRAMA**

import re: 
//Que empiece por mayuscula
if re.search('^[A-Z]', cadena):
	print 'Si'
else:
	print 'No'

Instalar el paquete **CDE** -> **sudo apt-get install cde**

Para empaquetar el programa y poder ejecutarlo, utilizamos la orden

    cde python empieceMayus.py


### Ejercicio 4: Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?

Los flags que me aparecen son los siguientes:

    egrep '^flags.*' /proc/cpuinfo

![flags](http://i1379.photobucket.com/albums/ah138/migueib17/flags_zps8rpkteq0.png)

Para ver el modelo de procesador usamos:

    cat /proc/cpuinfo | grep "model name"

![model name](http://i1379.photobucket.com/albums/ah138/migueib17/cpuinfomodel_zpscl49z7sc.png)

La orden cat /proc/cpuinfo sin el grep, nos da toda la información detallada del ordenador pero con el filtro grep obtenemos solo el nombre del procesador. 


### Ejercicio 5.1: Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.

    sudo kvm-ok

![Captura módulo kvm](http://i1379.photobucket.com/albums/ah138/migueib17/ej5.1_zpsa5xsfi1o.png)
