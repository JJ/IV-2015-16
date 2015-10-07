# Ejercicio 3.1
**¿Qué tipo de virtualización usarías en cada caso? Comentar en el foro**

Contestado en la issue correspondiente

# Ejercicio 3.2

**Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.**

Primero debemos descargar CDE:
* Descargar codigo fuente de la release actual de: https://github.com/pgbovine/CDE/
* Descomprimir la carpeta y acceder a la carpeta resultante desde el terminal y ejecutar la orden make, que compilar el codigo segun el makefile incluido

Una vez compilado CDE podemos empaquetarlo con CDE
* Mover el codigo del programa donde se encuentra el ejecutable de la aplicacion CDE
* Ejecutamos el comando: ./cde ./Programa1.py

Esto da como resultado el archivo Programa1.py.cde
* Comprimimos la carpeta cd-package-cde en formato tar.gz utilizando: tar czvf Programa1.tar.gz cde-package/

Ya disponemos de un paquete que podremos ejecutar en cualquier distribucion de linux. Para ello solo bastaría con descomprimir el fichero mediante la siguiente orden tar xzvf Programa1.tar.gz, y pasar a ejecutarlo mediante la siguiente orden cde-package/cd-root/<ruta>/Programa1.py.cde
Para comprobar el resultado he utilizado una distribucion de Ubuntu como fuente del paquete y una distribucion de Fedora como receptora, donde se ha obtenido un identico resultado de ejecucion. Ambos SO han sido virtualizados para mayor comodidad.
