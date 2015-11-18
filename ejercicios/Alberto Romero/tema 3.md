#Alberto Romero Cañadas
#Tema 3

### Ejercicio 1.
### Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.
Me he dado de alta en OpenShift
![openshift](https://i.gyazo.com/e386b434d17561860c54f61717fd0085.png)

###Ejercicio 2.
###Crear una aplicación en OpenShift y dentro de ella instalar WordPress.

Creamos nuestra primera aplicación
![openshift](https://i.gyazo.com/3874280ed7f407d41c1d06d83737b5e8.png)


![openshift cuenta](https://i.gyazo.com/5776c9011885a70ea956e8c188caeccf.png)

Y aquí funcionando

![wordpress](https://i.gyazo.com/faf49f40f1ae6baa7da1603a7f67d04c.png)

###Ejercicio 3.
###Realizar una app en express (o el lenguaje y marco elegido) que incluya variables como en el caso anterior.

Vamos a crear la aplicación porra.

![mkdir](https://i.gyazo.com/3d2ca08f16f3636c05651818b9ff9248.png)

![express](https://i.gyazo.com/c149c91e4b98f6bfef474306eb7cbea9.png)

![express2](https://i.gyazo.com/86ddae0a6950f7f0234aaee299af8006.png)

Además, instalamos todo lo necesario de grunt y sqlite3.

Comprobamos que todo funciona correctamente.

![create](https://i.gyazo.com/4b75a4919146fae8c03550156f2be193.png)

Introducimos datos.

![datos](https://i.gyazo.com/dd72df85ce93d9c42000172fb37b84fd.png)

Comprobamos que todo está correctamente

![web](https://i.gyazo.com/4e962fcb3e37a158eb01ae6060fff56a.png)


###Ejercicio 4.
###Crear pruebas para las diferentes rutas de la aplicación.


Test.

![testmake](https://i.gyazo.com/afa3ed98ecb6720b3389e2216de33532.png)


Resultado.

![test](https://i.gyazo.com/671849566d920eb79dcb2a3d2bfc4813.png)

###Ejercicio 5.
###Instalar y echar a andar tu primera aplicación en Heroku.

Instalamos Heroku

![install heroku](https://i.gyazo.com/eb8440375ce28fc62714527f92e247b6.png)
Ejecutamos Heroku login e introducimos nuestros credenciales.

![herokulogin](https://i.gyazo.com/b506753b9aeac488944397e481ac0bac.png)

Clonamos el repositorio con git clone git@github.com:heroku/node-js-getting-started.git # or clone your own fork

Vamos a descargar todo lo necesario.

![clonando repositorio](https://i.gyazo.com/360308be1522823c17b85728ed76271b.png)

Y creamos la aplicación

![creando heroku](https://i.gyazo.com/85cd1135e4f4a6339ece75cc9b836909.png)

Usamos `npm init` e `npm start` para comprobar que todo funciona.
![heroku funcionando](https://i.gyazo.com/d5d6adb5a0d31530c90bdfb0a6e5a5a7.png)

Subimos a Heroku nuestra primera app

![heroku open](https://i.gyazo.com/bff339addf634c1708454ea77514b75d.png)

![first app heroku](https://i.gyazo.com/8b82656ba0eb44519cb1267c6ae97ccd.png)

Y ya tenemos funcionando nuestra primera app en heroku

![heroku](https://i.gyazo.com/49922b172fdb1ae4b7e38f3d7b01f46d.png)

### Ejercicio 6.
###Usar como base la aplicación de ejemplo de heroku y combinarla con la aplicación en node que se ha creado anteriormente. Probarla de forma local con foreman. Al final de cada modificación, los tests tendrán que funcionar correctamente; cuando se pasen los tests, se puede volver a desplegar en heroku.

Creamos el app
![creamos](https://i.gyazo.com/3dd3ecc4f1d9778bf2f4dc4b3b6b58e1.png)

Conectamos el repertorio de github con Heroku
![git-he](https://i.gyazo.com/e9f7fcccc941c0114a584bbabd5ee310.png)
![asd](https://i.gyazo.com/377f5f17ec3c0d88dc494e1aa1657183.png)

Comprobamos que todo está funcionando correctamente.
![webvehiculos](https://i.gyazo.com/96ca3ec8b3735333672e95cfef8417b1.png)

Disponible [aquí](http://webvehiculos.herokuapp.com/)

Para iniciar todo en local se puede realizar mediante dos comandos.
`foreman start web`
`heroku local web`


### Ejercicio 7.
###Haz alguna modificación a tu aplicación en node.js para Heroku, sin olvidar añadir los tests para la nueva funcionalidad, y configura el despliegue automático a Heroku usando Snap CI o alguno de los otros servicios, como Codeship, mencionados en StackOverflow.

Añadimos su archivo travis correspondiente.

![travis](https://i.gyazo.com/e0d8d0e7ecb9c8c467f8f59bf6015735.png)

Comprobamos que pasa los test.
![mocha](https://i.gyazo.com/31135cb86dd50fba6da48510d55570ec.png)

Ahora nos vamos a Heroku > Desploy. 
En Deploy activaremos "Automatic deploys" y marcaremos la casilla "Wait for CI to pass before deploy"

![hero](https://gyazo.com/245a2482f4a7d0658232a4a372ccec6f.png)



###Ejercicio 8.
###Preparar la aplicación con la que se ha venido trabajando hasta este momento para ejecutarse en un PaaS, el que se haya elegido.

La aplicación sobre la que he venido trabajando hasta este momento es la utilizada en el ejercicio 6. 
Dejo alguna captura de la [aplicacion](http://webvehiculos.herokuapp.com/)
![aplicación](https://i.gyazo.com/0ee42fcc4089d070928f2b5aea26cd4c.png)
