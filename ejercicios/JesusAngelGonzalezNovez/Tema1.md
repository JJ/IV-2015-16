# Tema 1

### Ejercicio 1: Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.

Mirando por Amazon he encontrado el servidor [HP 726042-425](http://www.amazon.es/dp/B00E88ZHLC/ref=asc_df_B00E88ZHLC29121151/?tag=googshopes-21&creative=24526&creativeASIN=B00E88ZHLC&linkCode=df0)

Su precio es de 682,51€ (IVA incl.), como necesitamos el precio sin IVA pues hacemos el cálculo:

682.51€ / 1.21 = 564.05€

**Amortización a 4 años**

Con una amortización máxima del 25% por año: 

    - Primer año: 	564.05€ * 0.25 = 141.01€
    - Segundo año:	564.05€ * 0.25 = 141.01€
    - Tercer año:	564.05€ * 0.25 = 141.01€
    - Cuarto año:	564.05€ * 0.25 = 141.01€

**Amortización a 7 años**

En este caso se va reduciendo el coste del producto conforme pasan los años, los 2 primeros años se mantiene el 25% pero el 50% restante se divide de forma gradual en los 5 siguientes años como podemos ver a continuación:

    - Primer año: 	564.05€ * 0.25 = 141.01€
    - Segundo año:	564.05€ * 0.25 = 141.01€
    - Tercer año:	564.05€ * 0.15 =  84.60€
    - Cuarto año:	564.05€ * 0.15 =  84.60€
    - Quinto año:	564.05€ * 0.10 =  56.40€
    - Sexto año:	564.05€ * 0.05 =  28.20€
    - Séptimo año:  564.05€ * 0.05 =  28.20€

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

Si navegamos por el árbol de directorios generado por CDE encontraremos el intérprete para Ruby en cde-package/cde-root/usr/bin/

Como vemos, es una forma interesante y práctica de distribuir aplicaciones de forma empaquetada con todo lo que pueda necesitar nuestra aplicación.

### Ejercicio 4: Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?

Los flags que me aparecen son los siguientes:

    egrep '^flags.*' /proc/cpuinfo

![flags](img/tema1-4flags.png)

No tengo opción de virtualización a nivel de hardware en este ordenador.

Para ver el modelo de procesador usamos:

    cat /proc/cpuinfo | grep "model name"

![model name](img/tema1-4.png)

La orden cat /proc/cpuinfo sin el grep, nos da toda la información detallada del ordenador pero con el filtro grep obtenemos solo el nombre del procesador. Como vemos tengo 2 núcleos de Intel T1600 a 1.66GHz


### Ejercicio 5.1: Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.

    sudo kvm-ok

![Captura módulo kvm](img/tema1-5.1.png)

