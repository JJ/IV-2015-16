**Ejercicio1.**
**Instala LXC en tu versión de Linux favorita. Normalmente la 
versión en desarrollo, disponible tanto en GitHub como en el sitio web 
está bastante más avanzada; para evitar problemas sobre todo con las 
herramientas que vamos a ver más adelante, conviene que te instales la 
última versión y si es posible una igual o mayor a la 1.0.**

vamos a proceder a instalar LXC

![instalacion](https://i.gyazo.com/44ab70513fb23fb064fcdd92689af464.png)

Comprobamos que todo se haya instalado correctamente

![comprobar](https://i.gyazo.com/43c2d28dd36eb8d118c4b727e59b5e07.png)

Ejercicio 2.
Comprobar qué interfaces puente se han creado y explicarlos.


Cramos un contenedor básico con `sudo lxc-create -t ubuntu -n my-container`
Tras un buen rato ejecutandose:

![container](https://i.gyazo.com/a7282bdf96a0fe87fc7fad0e7d842429.png)

Ahora probamos a iniciar nuestro contenedor.

![start-cont](https://i.gyazo.com/1d797d4456c071e77a9b48568370cd53.png)

Una vez iniciado, nos pide usuario y pass. Por defecto es ubuntu:ubuntu
![init/cont](https://i.gyazo.com/f1512424bad7827aaf8965ed90d56a2b.png)



Desde otro terminal, mediante **ifconfig -a** podemos observar las interfaces creadas.
** lxcbr0** y **vethY2M30W**
El primero es el que hace que el contenador tenga acceso a internet y el segundo realiza
la conexión entre contenedores.

![shockets](https://i.gyazo.com/9e16ec9717dc98add05158dd0d75c0d6.png)


**Ejercicio 3.**
**1.Crear y ejecutar un contenedor basado en Debian.**

Vamos  a crear un contenedor basdo en debian llamado debian1.

![debian1](https://i.gyazo.com/407894009d72b17339f57acc367572d8.png)

Para ejcutarlo, simplemente usaremos `lxc-start -n debian1`

**2. Crear y ejecutar un contenedor basado en otra distribución, tal como Fedora.**
`sudo lxc-create -t fedora -n fedora1`

![fedora1](https://i.gyazo.com/fffd8f4489c5fb7ac79d2c528178c3a4.png)
![endfedora1](https://i.gyazo.com/7b75d8cf532fbd164ff5e039d6c555af.png)

Para iniciarlo usaremos `sudo lxc-start -n fedora1`

**Ejercicio 4.**
**1.Instalar lxc-webpanel y usarlo para arrancar, parar y visualizar las máquinas
 virtuales que se tengan instaladas.**
 
 Instalamos mediante `wget https://lxc-webpanel.github.io/tools/install.sh -O - | sudo bash`
 
![webpanel](https://i.gyazo.com/e86e29a3f97811d15e8d994988b4ec3d.png)

Entramos en `http://localhost:5000/ con los credenciales admin:admin

![webpanel](https://i.gyazo.com/4a67aa182e2decd66ed8f0decc83273b.png)

Aquí podemos ver todos los contenedores.

![containers](https://i.gyazo.com/309961f685032cd48e1ea626bb121d5b.png)

**2.Desde el panel restringir los recursos que pueden usar: CPU shares, CPUs que se pueden usar 
(en sistemas multinúcleo) o cantidad de memoria.**

Elegimos uno de los contenedores y restringimos los recursos.

![recursos](https://i.gyazo.com/bece5d065ee3b42326eb9b494b247143.png)

**Ejercicio 5.**
**Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor.
Usar nginx.**

probamos que este todo correctamente.
![nginx](https://i.gyazo.com/8dcad7e2cdf08157cb898b3e6944f5e8.png)

Instalamos lo necesario con `sudo apt-get install apache2-utils`
![utils](https://i.gyazo.com/ad08e5d4cdb23779a8515f74bc93efe9.png)

Escribimos ifconfig -a desde el contenedor.

![config](https://i.gyazo.com/8b2845f425b5992bfb484c0decd471b4.png)

Usamos ab con el comando `ab -n 1000 -c 1000 http://10.0.3.189/`
![resultados](https://i.gyazo.com/6b25a5c918a853678ffd7082554ff4b8.png)

Ahora vamos a crear la jaula mediante `sudo debootstrap --arch=amd64 
lucid /home/jaula/alberto/ http://archive.ubuntu.com/ubuntu`
![jail](https://i.gyazo.com/91e61109d342198977be226399008be1.png)

Entramos a `/home/jaula/alberto`y dentro ejecutamos `sudo chroot /home/jaula/alberto`
Para instalar nginx añadimos al sources.list 
`deb http://nginx.org/packages/ubuntu/ lucid nginx`
`deb-src http://nginx.org/packages/ubuntu/ lucid nginx`
![deb](https://i.gyazo.com/5b5460d2a7064aad45edf2ee7fe96389.png)
Y ahora instalamos nginx y curl con `apt-get install nginx curl`

![curlnew](https://i.gyazo.com/16c6588ec2da656a47ec9653b729ee6c.png)
Hacemos un `ifconfig -a`

![ifconfig](https://i.gyazo.com/63bbad4b94df5af35ab5b2a5de2c768c.png)

Realizamos el test sobre localhost `ab -n 1000 -c 1000 http://localhost`

![test2](https://i.gyazo.com/a7c3986dd5dcc2f77b55641c15625b6e.png)

Los resultados son mejores en la jaula, es debido a que el contenedor usa el puente.

**Ejercicio 6.**
**Instalar docker.
**Para instalar docker usamos `sudo apt-get install docker.io`**
 
![docker](https://i.gyazo.com/adb8fb7df2ee569a5c6c0c948d75c5df.png)

Comprobamos la versión
![dockerversion](https://i.gyazo.com/ed199c9cb38a0dbb14887e927eb7ce5b.png)

Comprobamos que todo funciona correctamente.
![hidocker](https://i.gyazo.com/1f0ce0123e2542835bf0a8ee0efde081.png)

Debemos borrar **docker.pid** cada vez que se va a ejecutar docker. 
Para ello usaremos `sudo rm /var/run/docker.pid`

**Ejercicio 7.**
**1.Instalar a partir de docker una imagen alternativa de Ubuntu y alguna 
adicional, por ejemplo de CentOS.**

Con `sudo docker -d &` arrancamos el servicio y creamos la imagen con 
`sudo docker pull ubuntu´
![dockerimage](https://i.gyazo.com/17215385cf9ee803d6f637549dcbecb8.png)

Para comprobar que está todo ´sudo docker ps`
![dockerps](https://i.gyazo.com/727a0d6ffdad6fec1fcc1da1177eab0a.png)

Para arrancar el contenedor usamos `sudo docker run -i -t ubuntu /bin/bash`
![contdock](https://i.gyazo.com/0a8f470ba33a6d85b3618e558ac52655.png)

Ahora vamos a instalar **CentOS**
![centosdocker](https://i.gyazo.com/79ecdabf709ed1ff3bfe6279410a760f.png)

**2.Buscar e instalar una imagen que incluya MongoDB.**

Usaremos `sudo docker pull mongo`
![mongo](https://i.gyazo.com/64814760589eeed891caf2c0b05b93c6.png)

Comprobamos que la imagen de mongo funcione
![mongoOK](https://i.gyazo.com/e44da58fd67fe8989f83b2f1df86feb1.png)

**Ejercicio 8.**
**Crear un usuario propio e instalar nginx en el contenedor creado de esta forma**

- Entramos en la imagen de ubuntu con `sudo docker run -i -t ubuntu`
- Añadimos un usuario con `useradd -d /home/alberto -m alberto
- Añadimos una pass con `passwd alberto`
- Hacemos root al nuevo user `sudo adduser alberto sudo`
- Procedemos a logearnos con dichos datos.

![adduser](https://i.gyazo.com/2a21075e6307c431042750ff1c68e2be.png)

Instalamos nginx y Curl. Y lanzamos curl con `curl 127.0.0.1`

**Ejercicio 9.**
**Crear a partir del contenedor anterior una imagen persistente con commit.**

Arrancamos el contenedor.
![asdasd](https://i.gyazo.com/e879637577b91cb3633ee2e6e6dacb57.png)

hacemos el commit mediante `sudo docker commit 3ada474fe550 imagen_persistente`
![commit](https://i.gyazo.com/fc0fd1e2cbb54668d34091c3573bcc10.png)

Comprobamos que se ha realizado correctamente con sudo docker images -notrunc
![commit2](https://i.gyazo.com/c5b8c7179de313116b4b58bc5c03d746.png)



