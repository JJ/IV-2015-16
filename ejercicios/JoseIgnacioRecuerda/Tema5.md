#Ejercicios tema 5


##Ejercicio 1
###Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.
En primer lugar instalo KVM con el comando `sudo apt-get install cpu-checker` y después lo compruebo de las dos formas posibles:

* `sudo kvm-ok`
* `egrep -c '(vmx|svm)' /proc/cpuinfo`

y obtenemos los siguientes resultados:
![KVM](1.1)







