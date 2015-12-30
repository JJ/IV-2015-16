# Ejercicios de Rubén Martín Hidalgo
## Tema Adicional: Aislamiento de recursos
### Ejercicio 1: Comprobar si en la instalación hecha se ha instalado cgroups y en qué punto está montado, así como qué contiene.

En mi SO, que es Ubuntu 14.04, se monta por defecto en `/sys/fs/cgroup` que contiene blkio, cpu, cpuacct, cpuset, devices, freezer, hugetlb, memory, net_cls, net_prio, perf_event y systemd. Estos ficheros permiten controlar y monitorizar la actividad de los diferentes grupos de control. 

![Directorio Cgroup](https://www.dropbox.com/s/91tbc57j204ktok/lsCgroup.PNG?dl=1)

### Ejercicio 2: Crear diferentes grupos de control sobre un sistema operativo Linux. Ejecutar en uno de ellos el navegador, en otro un procesador de textos y en uno último cualquier otro proceso. Comparar el uso de recursos de unos y otros durante un tiempo determinado.

Primero instalamos el paquete "cgroup-bin" que permite un control por línea de órdenes algo más sencillo sin necesidad de trabajar directamente con sistemas de ficheros virtualescon:

 `sudo apt-get install cgroup-bin`

Creamos los distintos grupos de control: 

 `sudo cgcreate -a romi -g memory,cpu,cpuacct:ejercicio2`

La orden anterior crea un grupo ejercicio2 que se encarga de controlar la memoria, la CPU y de contabilizar el uso de recursos de la CPU y da permiso a romi para que trabaje con él. 

Ahora creamos 3 subgrupos para  ejecutar  el  navegador,  un  procesador  de  textos  y  el centro de software de Ubuntu:

- `sudo cgcreate -g memory,cpu,cpuacct:ejercicio2/navegador`
- `sudo cgcreate -g memory,cpu,cpuacct:ejercicio2/editor`
- `sudo cgcreate -g memory,cpu,cpuacct:ejercicio2/software`
 
Ejecutamos los distintos procesos para cada grupo de control:

- `sudo cgexec -g memory,cpu,cpuacct:ejercicio2/navegador firefox &`
- `sudo cgexec -g memory,cpu,cpuacct:ejercicio2/editor geany &`
- `sudo cgexec -g memory,cpu,cpuacct:ejercicio2/software software-center &`

En las siguientes carpetas tendremos los resultados.
 
 `/sys/fs/cgroup/(memory|cpu|cpuacct)/ejercicio2/(navegador|editor|software)`

Aquí tenemos un ejemplo donde podemos comparar datos de los stat:

![Ejemplo de archivo stat con Cgroup](https://www.dropbox.com/s/bkn7tzkx55ku0q5/statCGROUP.png?dl=1)

### Ejercicio 3: Discutir diferentes escenarios de limitación de uso de recursos o de asignación de los mismos a una u otra CPU.

### Ejercicio 4: Implementar usando el fichero de configuración de 'cgcreate' una política que dé menos prioridad a los procesos de usuario que a los procesos del sistema (o viceversa). 

### Ejercicio 5: Usar un programa que muestre en tiempo real la carga del sistema tal como 'htop' y comprobar los efectos de la migración en tiempo real de una tarea *pesada* de un procesador a otro (si se tiene dos núcleos en el sistema). 

### Ejercicio 6: Configurar un servidor para que el servidor web que se ejecute reciba mayor prioridad de entrada/salida que el resto de los usuarios.
