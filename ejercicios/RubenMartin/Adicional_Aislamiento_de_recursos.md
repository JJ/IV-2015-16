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

Las funciones de control de recursos de Oracle Solaris permiten que se comparta el ancho de banda entre las VNIC en la red virtual de un sistema. Más info [aquí](http://docs.oracle.com/cd/E26921_01/html/E25833/gewag.html).

[Aquí](http://es.ccm.net/faq/3155-limitar-los-recursos) podemos ver ejemplos para limitar recursos como el uso de CPU, accesos a disco y el ancho de banda en Linux.

### Ejercicio 4: Implementar usando el fichero de configuración de 'cgcreate' una política que dé menos prioridad a los procesos de usuario que a los procesos del sistema (o viceversa). 

Definimos un grupo para procesos de usuario y otro para los del sistema:

- `sudo cgcreate -g memory,cpu,cpuacct:usuario`
- `sudo cgcreate -g memory,cpu,cpuacct:sistema`

Ahora vamos a modificar el fichero de configuración "/etc/cgconfig.conf".

Para modificar la  prioridad del proceso según su grupo tendremos que editar el parámetro "cpu.shares", por lo que al principio del fichero deberemos indicar dónde está montado el subsistema de cgroup, que para el caso de nuestra gestión de la cpu será:

```
mount {
	cpu = /sys/fs/cgroup/cpu;
}
```

A continuación, habrá que indicar que los procesos de usuario tendrán una prioridad del 30% frente a los procesos del sistema que tendrán una prioridad del 70%. 

Como el valor total de "cpu.shares" es de 1024, fijaremos un valor de 307 para procesos de usuario y 717 para procesos de sistema, añadiendo al fichero el siguiente contenido: 

```
group usuario { 
    cpu {        
		cpu.shares = "307"; 
    } 
} 
 
group sistema { 
    cpu { 
        cpu.shares = "717"; 
    } 
} 
```

El siguiente paso es crear las reglas de modo que el demonio "cgrulesengd" pueda mover los procesos a su grupo correspondiente. 

Para ello abrimos el fichero de configuración "/etc/cgrules.conf" y añadimos las dos nuevas reglas:

```
#<usuario>      <controladores>     <cgroup>    
usuario            cpu                /sys/fs/cgroup/cpu/usuario    
sistema            cpu                /sys/fs/cgroup/cpu/sistema   
```
 
Y finalmente para aplicar los cambios reiniciamos el servicio de cgconfig e iniciamos el cgred, para que se puedan aplicar las reglas anteriores de asignar los procesos a sus grupos correspondientes:
 
- `sudo service cgconfig restart`
- `sudo cgred start`
 
Si queremos que los cambios sean permamentes tenemos que configurar los servicios de cgconfig y cgred para que se inicien por defecto:
 
- `sudo chkconfig cgconfig on`
- `sudo chkconfig cgred on`

### Ejercicio 5: Usar un programa que muestre en tiempo real la carga del sistema tal como 'htop' y comprobar los efectos de la migración en tiempo real de una tarea *pesada* de un procesador a otro (si se tiene dos núcleos en el sistema). 

Instalamos htop con `sudo apt-get install htop`.

Y podemos ejecutar el programa simplemente haciendo `htop`, que nos muestra lo siguiente:

![Pantalla Htop](https://www.dropbox.com/s/zl396fkgsvoehps/htop.PNG?dl=1)

Finalmente no he encontrado la forma de migrar un proceso o tarea de un procesador a otro.

### Ejercicio 6: Configurar un servidor para que el servidor web que se ejecute reciba mayor prioridad de entrada/salida que el resto de los usuarios.

Para realizar esta configuración deberemos modificar otra vez el archivo "/etc/cgconfig.conf", y está vez tendremos que usar el parámetro "blkio.weight", por lo que tendremos que indicar donde se encuentra el controlador del bloqueo de entrada/salida, que en nuestro caso será `blkio = /sys/fs/cgroup/blkio`. 

Ahora tendremos que crear un grupo para los servidores al que llamaremos "servers" y dentro del cual indicaremos que le vamos a dar una prioridad mayor de entrada/salida que al resto de usuarios. 

Los valores posibles para este parámetro están en un rango que va desde 100 hasta 1000, así que para que los servidores tengan bastante más prioridad le vamos a dar un "peso" de 700. 

El archivo de configuración quedaría entonces así: 

```
mount { 
   blkio = /sys/fs/cgroup/blkio; 
} 
 
group servers { 
    blkio { 
        blkio.weight = "700"; 
    } 
} 
```

Ejecutamos `sudo service cgconfig start` para crear la jerarquía de cgroup y establecer los parámetros definidos. 

Si el servidor que tenemos funcionando es un servidor Apache, deberemos añadir la directiva de configuración `CGROUP_DAEMON="blkio:/http"` al fichero de configuración "/etc/apache2/apache2.conf" para que el servidor tenga conocimiento de que pertenece a un grupo de control, algo similar a las reglas que definimos en el archivo "/etc/cgrules.conf" para que un proceso fuera movido a su grupo correspondiente en el ejercicio 4.
