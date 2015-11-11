# Ejercicios de Rubén Martín Hidalgo
## Tema 4
### Ejercicio 1: Instala LXC en tu versión de Linux favorita. Conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.

Lo instalamos con: *sudo apt-get install lxc*

Vemos que la versión es posterior a la 1.0:

![Version LXC](https://www.dropbox.com/s/uyyks3k8314l73v/versionLXC.PNG?dl=1)

### Ejercicio 2: Comprobar qué interfaces puente se han creado y explicarlos.

Creamos el contenedor con: *sudo lxc-create -t ubuntu -n una-caja*

Lo arrancamos con la orden: *sudo lxc-start -n una-caja*

Y entramos con "ubuntu" como usuario y password.

Ejecutamos *ifconfig -a* fuera del contenedor, y podremos ver las siguientes interfaces que se acaban de añadir:

![Puentes Red](https://www.dropbox.com/s/esetwirycpa16q3/puentesRed.PNG?dl=1)

La primera es usada para tener acceso a internet desde el contenedor. La segunda se usa para la comunicación entre los distintos contenedores. 
