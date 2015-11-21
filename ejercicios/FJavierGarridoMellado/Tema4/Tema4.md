###Ejercicio1: Instala LXC en tu versión de Linux favorita. Normalmente la versión en desarrollo, disponible tanto en GitHub como en el sitio web está bastante más avanzada; para evitar problemas sobre todo con las herramientas que vamos a ver más adelante, conviene que te instales la última versión y si es posible una igual o mayor a la 1.0.

He instalado la version 1.0.7

![instalacionlxc](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/Pantallazo_zps6s3u6afi.png)

Y se procede a probar su compatibilidad.

![compatibilidad](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/Pantallazo-1_zpsteh1crpp.png)

###Ejercicio2: Comprobar qué interfaces puente se han creado y explicarlos.

- A la hora de crear el contenedor daba un error *debootsrap is missing* , se ha solucionado con el siguiente comando( sacado de los comentarios del siguiente [enlace](http://www.stgraber.org/2012/05/04/lxc-in-ubuntu-12-04-lts/)):

'''
apt-get install lxc debootstrap
'''

- Puede verse los templates de los que se dispone con el comando:
'''
sudo ls /usr/share/lxc/templates/
'''

- Para la creación del contenedor he ejecutado **sudo lxc-create -t ubuntu -n my-container**

![creacioncontenedor](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/creacioncontenedor_zpsdhqzda4x.png)

![creacioncontenedor2](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/creacioncont_zpsdjnejbly.png)

- Arranco el contenedor con el comando:
```

sudo lxc-start -n nubecilla
```

Se observa como queda una pantalla negra y el cursor parpadeando, el siguiente paso es introducir el usuario que por defecto es **ubuntu** y pulsar enter, a continuaciòn pide el password a introducir que por defecto tambien es **ubuntu**.

![arrancarcontenedor](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/arrancarcontenedor_zpseexdtowf.png)

- Desde otro terminal ( fuera del contenedor ) ejecuto la orden **ifconfig -a** y se observa los interfaces puentes que se han creado.En mi caso se ha creado **lxcbr0** para que el contenedor tenga acceso a internet y **vethDNIYLW** que permite la comunicación entre diferentes contenedores.

![puentes](http://i1045.photobucket.com/albums/b457/Francisco_Javier_G_M/puentes_zpsxdcapnqp.png)






