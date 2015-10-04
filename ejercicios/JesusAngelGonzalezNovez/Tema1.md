# Tema 1

### Ejercicio 1: Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.

Mirando por Amazon he encontrado el servidor [HP 726042-425](http://www.amazon.es/dp/B00E88ZHLC/ref=asc_df_B00E88ZHLC29121151/?tag=googshopes-21&creative=24526&creativeASIN=B00E88ZHLC&linkCode=df0)

Su precio es de 682,51€ (IVA incl.), como necesitamos el precio sin IVA pues hacemos el cálculo:

682.51€ - 682.51€ * 0.21 = 539.18€

**Amortización a 4 años**

Con una amortización máxima del 25% por año: 

    - Primer año: 	539.18€ * 0.25 = 134.80€
    - Segundo año:	539.18€ * 0.25 = 134.80€
    - Tercer año:	539.18€ * 0.25 = 134.80€
    - Cuarto año:	539.18€ * 0.25 = 134.80€

**Amortización a 7 años**

En este caso se va reduciendo el coste del producto conforme pasan los años, los 2 primeros años se mantiene el 25% pero el 50% restante se divide de forma gradual en los 5 siguientes años como podemos ver a continuación:

    - Primer año: 	539.18€ * 0.25 = 134.80€
    - Segundo año:	539.18€ * 0.25 = 134.80€
    - Tercer año:	539.18€ * 0.15 =  80.88€
    - Cuarto año:	539.18€ * 0.15 =  80.88€
    - Quinto año:	539.18€ * 0.10 =  53.92€
    - Sexto año:	539.18€ * 0.05 =  26.96€
    - Séptimo año:  539.18€ * 0.05 =  26.96€

### Ejercicio 3.2: Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

Descargo "cde" de [aqui](https://cloud.github.com/downloads/pgbovine/CDE/cde_2011-08-15_64bit) y a cotinuación:

    sudo mv cde_2011-08-15_64bit /usr/bin/cde
    sudo chmod u+x /usr/bin/cde

Creo un script sencillo en Ruby:

    #!/usr/bin/ruby
    $i = 0
    $num = 5
    while $i < $num  do
       puts("i = #$i" )
       $i +=1
    end

Empaquetemos con la orden:

    cde ruby script1.rb

FALTA PROBARLO EN DISTINTAS DISTRIBUCIONES

### Ejercicio 4: Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?

Los flags que me aparecen son los siguientes:

    egrep '^flags.*' /proc/cpuinfo

![flags](img/tema1-4flags.png)

Para ver el modelo de procesador usamos:

    cat /proc/cpuinfo | grep "model name"

![model name](img/tema1-4.png)

La orden cat /proc/cpuinfo sin el grep, nos da toda la información detallada del ordenador pero con el filtro grep obtenemos solo el nombre del procesador. Como vemos tengo 2 núcleos de Intel T1600 a 1.66GHz


### Ejercicio 5.1: Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.

    sudo kvm-ok

![Captura módulo kvm](img/tema1-5.1.png)

