#Ejercicios tema 4


##Ejercicio 1
###Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0
Para instalar LXC he utilizado el comando:
`sudo apt-get install lxc`

Seguidamente confirmo dos datos importantes:

* Por un lado que la versión es superior a la 1.0. Usando el comando: `lxc-monitor --version`

![versión LXC](https://www.dropbox.com/s/7f7zlshwif8xdhv/ejr1.2.png?dl=1)

* Y por otro lado comprobamos que el kernel soporta lxc-containers y que todo esta bien configurado. Esto lo he hecho con el comando: `lxc-checkconfig`

![kernel soporta lxc-containers](https://www.dropbox.com/s/u25004f1v8k4er6/ejr1.1.png?dl=1)


