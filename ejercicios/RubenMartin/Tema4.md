# Ejercicios de Rubén Martín Hidalgo
## Tema 4
### Ejercicio 1: Instala LXC en tu versión de Linux favorita. Conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.

Para la versión 1.07 instalamos con: `sudo apt-get install lxc`

Si queremos la úlitma versión: `sudo apt-get -t trusty-backports install lxc`

Comprobamos que la versión por tanto es posterior a la 1.0:

![Version LXC](https://www.dropbox.com/s/uyyks3k8314l73v/versionLXC.PNG?dl=1)

### Ejercicio 2: Comprobar qué interfaces puente se han creado y explicarlos.

Creamos el contenedor con: `sudo lxc-create -t ubuntu -n una-caja`

Lo arrancamos con la orden: `sudo lxc-start -n una-caja`

Y entramos con "ubuntu" como usuario y password.

Ejecutamos `ifconfig -a` fuera del contenedor, y podremos ver las siguientes interfaces que se acaban de añadir:

![Puentes Red](https://www.dropbox.com/s/esetwirycpa16q3/puentesRed.PNG?dl=1)

La primera es usada para tener acceso a internet desde el contenedor. La segunda se usa para la comunicación entre los distintos contenedores. 

### Ejercicio 3: Crear un contenedor basado en tu distribución y otro basado en otra que no sea la tuya.

En el ejercicio anterior creé un contenedor con Ubuntu, que es la distribución que suelo usar habitualmente.

Ahora voy a crear otro con Debian: 

```
sudo lxc-create -t debian -n debianita
```

### Ejercicio 4.1: Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas.

Instalar con `sudo wget https://lxc-webpanel.github.io/tools/install.sh -O - | sudo bash`

Y accedemos al panel mediante la dirección "http://localhost:5000/" en el navegador web, introduciendo 'admin' como usuario y contraseña.

![LXC Web Panel](https://www.dropbox.com/s/ofr24yj3ho1yeco/lxcwebpanel.PNG?dl=1)

Arrancamos los contenedores desde el panel de control con éxito.

![Contenedores en marcha](https://www.dropbox.com/s/8i28vtg8jho6kd9/contenedoresArrancados.PNG?dl=1)

### Ejercicio 4.2: Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria.

Accedemos a la pantalla de configuración de recursos del contenedor, que por defecto viene así:

![Recursos iniciales](https://www.dropbox.com/s/06n42r6ylh2g9n1/configuracionDefectoLXC.PNG?dl=1)

Para modificar los recursos, primero debemos parar la ejecución del contenedor, para poder aplicar los cambios. Luego se podrá volver a arrancar sin problemas.

![Recursos cambiados](https://www.dropbox.com/s/wfz2hjitrwtcbwp/recursosLXC.PNG?dl=1)
