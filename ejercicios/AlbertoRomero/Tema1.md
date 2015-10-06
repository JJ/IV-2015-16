#Tema 1

##Ejercicio 1.
##Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.

Vamos a usar el servidor [HP ProLiant ML110 Gen9](http://www.pccomponentes.com/hp_proliant_ml110_gen9_e5_1620v3_4gb_1tb.html) de Pccomponentes.com.

Le quitamos el IVA al precio del producto mediante una calculadora on-line fiable:


![Precio sin IVA](https://i.gyazo.com/84556a8c3cd3de8fb6937a9db6dd139e.png "Precio sin IVA")



##Amortización a 4 años

25% por cada año, así que dividiremos entre 4 los 1000€ del precio sin iva.

- Año 1:	1000€*0.25 = 250€
- Año 2:	1000€*0.25 = 250€
- Año 3:	1000€*0.25 = 250€
- Año 4:	1000€*0.25 = 250€

##Amortización a 7 años

- Año 1:	1000€*0.25 = 250€
- Año 2:	1000€*0.25 = 250€
- Año 3:	1000€*0.15 = 150€
- Año 4:	1000€*0.15 = 150€
- Año 5:	1000€*0.10 = 100€
- Año 6:	1000€*0.05 = 50€
- Año 7:	1000€*0.05 = 50€

##Ejercicio 2.
##Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) en el caso de que la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.


Hemos elegido [Hostalia](http://www.hostalia.com/dedicados) para nuestro servidor dedicado

![Servidor dedicado en hostinger.es](https://i.gyazo.com/8744a290041033716614c163379bada0.png)

El precio por un año sería: 6.99/mes * 12 = 83,88€/año
Su precio fijo, da igual que lo usemos el 1% del tiempo o el 100%.

![Servidor en la nube de Microsoft Azure](https://i.gyazo.com/373232c757ac705dfbe4fa7c9c2be2b7.png)

El precio varía según el uso que se le de:

Precio por hora: 0.017€

Precio por día : 0.017€ x 24 = 0.408€

Precio por mes : 0.408€ x 30 = 12,24€

Por año        : 12,24€ x 12 = 146,88€

Si lo usamos el 1% del año = 1,4688€
Si lo usamos el 10% del año = 14,688€

Para un uso bajo, el precio del servicio en la nube es mucho más económico.


##Ejercicio 3.1
##¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro
[Comentario añadido.](https://github.com/JJ/IV-2015-16/issues/1#issuecomment-144691470)

##Ejercicio 3.2
##Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

Instalamos cde con el comando:
`sudo apt-get install cde`
Hacemos un script básico en python:
![script python](http://i.imgur.com/oaQRntA.png)

Nos bajamos el cdepack desde la web oficial y ejecutamos el siguiente comando:
![cdepack](http://i.imgur.com/GMWSEin.png)

Este ejecutable lo hemos probado en otra distribucion linux y comprobamos que se ejecuta aun no teniendo el entorno de python.


##Ejercicio 4
##Comprobar si el procesador o procesadores instalados tienen estos flags. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?

Usamos el siguiente comando:
`egrep ' flags.*(vmx|svm)' /proc/cpuinfo`

![Flags](https://i.gyazo.com/8722665e59f3d4bf0d1758dd13517af4.png "flags")


Para saber el modelo del procesador, usaremos:
`cat /proc/cpuinfo` 

![CPU INFO](https://i.gyazo.com/a43bd4ff8094d24293c81749032e87cb.png "CPU INFO")

#Ejercicio 5.1la123

##Comprobar si el núcleo instalado en tu ordenador contiene este módulo del kernel usando la orden kvm-ok.

Ya tenia todo instalado previamente en mi ordenador, por lo que solo necesito ejecutar
`sudo kvm-ok`

![kvm-ok](https://i.gyazo.com/d1ab4c0e7c5ba7d30ecd7b7a52da3ac4.png "kvm-ok")

#Ejercicio 5.2
##Instalar un hipervisor para gestionar máquinas virtuales, que más adelante se podrá usar en pruebas y ejercicios.

Hemos instalado el hipervisor [VirtualBox](http://www.virtualbox.org)




















