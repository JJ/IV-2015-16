# Tema 4

### Ejercicio 1

**Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.**

Se puede comprobar si los paquetes están instalados con la orden

	kvm-ok

o

	egrep -c '(vmx|svm)' /proc/cpuinfo

Un valor mayor que 0 indica que la virtualización está soportada.

![kvm](https://www.dropbox.com/s/yg1wdltq1qqztuu/ej1.png?dl=1)



