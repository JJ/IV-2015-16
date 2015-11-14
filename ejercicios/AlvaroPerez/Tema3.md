#Tema 3
###Ejercicio1: Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.

Me doy de alta en OpenShift: 

![Ejercicio1](https://www.dropbox.com/s/by8z4lwbmuesp8q/Ejercicio1.png?dl=1)

###Ejercicio2: Crear una aplicación en OpenShift y dentro de ella instalar WordPress. 
Creamos una nueva aplicación dentro de OpenShift y seleccionamos WordPress:

![Ejercicio2a](https://www.dropbox.com/s/hz9pawe77palwpr/Ejercicio2a.png?dl=1)

Ahora nos pide que instalemos WordPress y a partir de ahí ya podemos configurar nuestro sitio:

![Ejercicio2b](https://www.dropbox.com/s/fgb5hk74jug8y3m/Ejercicio2b.png?dl=1)

###Ejercicio3: Realizar una app en express (o el lenguaje y marco elegido) que incluya variables como en el caso anterior.

La aplicación en express está en este repositorio: [empresas](https://github.com/alvaro-gr/empresa-IV).

Si todo está correcto en el navegador ponemos localhost:puerto_especificado y nos debería aparecer nuestra aplicación:

![Ejercicio3](https://www.dropbox.com/s/gvdmrrhto1rrrsy/Ejercicio2.png?dl=1)


###Ejercicio5: Instalar y echar a andar tu primera aplicación en Heroku.

Nos registramos en Heroku:

![Ejercicio5a](https://www.dropbox.com/s/3kjfifdpfh07krz/Ejercicio5a.png?dl=1)

Para empezar a usar Heroku instalamos **Toolbelt**, la orden la encontramos en su web:

![Ejercicio5b](https://www.dropbox.com/s/g6gne05ujsotlf0/Ejercicio5b.png?dl=1)

Hacemos login con la orden **heroku login** y clonamos la app de prueba:

![Ejercicio5c](https://www.dropbox.com/s/hbozvpp12s7z3cp/Ejercicio5c.png?dl=1)

Creamos una nueva app:

![Ejercicio5d](https://www.dropbox.com/s/w0tgm44cyvaj5ic/Ejercicio5d.png?dl=1)

Instalamos las dependecias **express** y **ejs** y lanzamos la apliación:

![Ejercicio5e](https://www.dropbox.com/s/ctvdh9f83606gau/Ejercicio5e.png?dl=1)

![Ejercicio5f](https://www.dropbox.com/s/9y2drvp6495mu62/Ejercicio5f.png?dl=1)


###Ejercicio6: Usar como base la aplicación de ejemplo de heroku y combinarla con la aplicación en node que se ha creado anteriormente. Probarla de forma local con foreman. Al final de cada modificación, los tests tendrán que funcionar correctamente; cuando se pasen los tests, se puede volver a desplegar en heroku.

Una vez que tengamos la aplicación de ejemplo de heroku que se llama **node-js-getting-started**,
 y esta este funcionando correctamente. Podemos seguir el detalloso tutorial de Heroku para Nodejs. Solo lo que tenemos que hacer es copiar nuestros ficheros a
 el directorio de la app de ejemplo y modificar el **package.json** para decirle que arranque desde nuestro fichero de inicio de la app. También modificamos el fichero **Profile** para indicarle cual es el index.
 
Dentro de **Heroku** podemos editar la configuaración de la app de ejemplo a nuestro gusto:

![Ejercicio6a](https://www.dropbox.com/s/ytndtq5g2lksygw/Ejercicio6a.png?dl=1)
 
Y si compruebamos el link de nuestra app de ejemplo vemos que ya esta nuestra app ahí: 
 
![Ejercicio6b](https://www.dropbox.com/s/c5zve3lh4pbdofk/Ejercicio6b.png?dl=1)
   

###Ejercicio8: Preparar la aplicación con la que se ha venido trabajando hasta este momento para ejecutarse en un PaaS, el que se haya elegido. 

Para este ejercicio voy a utlizar el PaaS **Openshift**. Lo primero que tenemos que hacer es crear la aplicación dentro de la web de Openshift y seleccionar
que va utilizar **Nodejs**:

![Ejercicio8a](https://www.dropbox.com/s/5lxi8vhqgaaj48w/Ejercicio8a.png?dl=1)

Debemos de instalar el cliente de Openshift que se llama **rhc** y configurarlo. Utilizamos **git** para subir nuesta aplicación, y haciendo **push** ya
podemos acceder a la url que nos facilita Openshift:

![Ejercicio8b](https://www.dropbox.com/s/q6t6wbwi649zaxc/Ejercicio8b.png?dl=1)


  