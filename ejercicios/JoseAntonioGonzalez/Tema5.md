#Ejercicio 1

Empezaremos por el principio, y comprobaremos si nuestra CPU soporta la tecnología KVM.Para saber si tenemos KVM activado, utilizamos la orden

	egrep -c "vmx" /proc/cpuinfo
    
En nuestro caso, nos devuelve 4, que son el número de procesadores que tienen la tecnología KVM activada.

Al ser compatible, vamos a instalar los paquetes necesarios, siguiendo los pasos de [este enlace](https://wiki.debian.org/KVM#Installation)
