###Ejercicio 1: Instala LXC en tu versión de Linux favorita. Para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.


Para instalar **lxc**:

- ejecutamos la orden de terminal: ```sudo apt-get install lxc ```
- y comprobamos si el kernel soporta este tipo de virtualización: ```lxc-checkconfig```

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema4/lcx1.png)


###Ejercicio 2: Comprobar qué interfaces puente se han creado y explicarlos.

Los pasos son los siguientes:

- En primer lugar, crear un contenedor: 
``` sudo lxc-create -t ubuntu -n container_lxc ```

- Conectarnos al contenedor: 
```sudo lxc-start -n container_lxc ```

- Realizar Login como *root* en el contenedor: usuario: *ubuntu* pass: *ubuntu*

- Comprobar las interfaces de red: ```ifconfig -a```

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema4/lcx2.png)

Como se observa se han creado las interfaces: **lxcbr0** y **veth0JN0HL**, ésta última habilitada cuando el contentedor está arrancado.

###Ejercicio 3: 
- ####Crear y ejecutar un contenedor basado en Debian.

	- Crear el contendor: ```sudo lxc-create -t debian -n box-debian ```
	- Ejecutar el contendor: ``` sudo lxc-start -n box-debian ```

- ####Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora.

	- ```sudo lxc-create -t cirros -n box-cirros ```

###Ejercicio 4: Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas virtuales que se tengan instaladas. 

Para instalar **lxc-webpanel** ejecutamos (como *sudo su*):
```wget https://lxc-webpanel.github.io/tools/install.sh -O - | bash ```

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema4/panelxc.png)

Para acceder al panel simplemente navegamos a la url: http://localhost:5000 o a la IP de la máquina en el puerto por defecto 5000 (como en este caso) con usuario: *admin* y pass: *admin*:

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema4/panelxc1.png)

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema4/panelxc3.png)

Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar (en sistemas multinúcleo) o cantidad de memoria:

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema4/panelxc4.png)


###Ejercicio 5: Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor. Usar nginx.

- Creamos una jaula: ```sudo debootstrap --arch=amd64 lucid /home/jaula/ ```
- Configuramos la jaula: ``` sudo chroot /home/jaula ```

Para instalar **nginx** en la jaula: 

```apt-get -y install wget
wget http://nginx.org/keys/nginx_signing.key
apt-key add nginx_signing.key ```

Añadir el repo:

``` echo "deb http://ppa.launchpad.net/nginx/$nginx/ubuntu lucid main" > /etc/apt/sources.list.d/nginx-$nginx-lucid.list ```

```apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C```

Y finalmente instalar **nginx** en la jaula:
```
apt-get update
apt-get install nginx curl
``` 

- Tras instalar nginx en ambos sistemas pasamos a realizar un test para comparar las prestaciones con **ab** (apache benchmark): ```ab -n 5000 -c 500 127.0.0.1:8080/ ```


###Ejercicio 6: Instalar docker.

Se ha realizado la instalación de Docker para la práctica, como se indica [aquí](https://github.com/nachobit/IV_PR_OpenOrder/blob/master/documentacion/entornopruebas.md).

###Ejercicio 7: Instalar a partir de docker una imagen alternativa de Ubuntu y alguna adicional, por ejemplo de CentOS. Buscar e instalar una imagen que incluya MongoDB.

Mediante la siguiente orden descargamos la imagen de **Ubuntu** para Docker:
```docker pull ubuntu```

Para **CentOS**:
```docker pull centos```

Para una imagen con **MongoDB** podemos hacerlo con la orden:
```docker pull mongo```


###Ejercicio 8: Crear un usuario propio e instalar nginx en el contenedor creado de esta forma.

Entramos a nuestro contenedor Docker:
```docker run -t -i ubuntu /bin/bash```

Y para añadir un nuevo usuario (nacho) ejecutamos la orden:
```adduser nacho```

El siguiente paso es instalar **nginx**:
```sudo apt-get install nginx```

###Ejercicio 9: Crear a partir del contenedor anterior una imagen persistente con commit.

Los pasos a seguir son los siguientes:

1. Localizar ID de la máquina a la que queremos realizar commit: ``` sudo docker ps -a ```
2. Comprobar ID: ```sudo docker inspect ID ```
3. Realizar el commit: ```sudo docker commit ID n_commit ```
4. Comprobar el commit: ```sudo docker images ```


###Ejercicio 10: Crear una imagen con las herramientas necesarias para el proyecto de la asignatura sobre un sistema operativo de tu elección.

Se ha realizado como se indica [aquí](https://github.com/nachobit/IV_PR_OpenOrder/blob/master/documentacion/entornopruebas.md).
