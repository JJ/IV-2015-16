###Ejercicio 1
**Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.**

Me di de alta en OpenShift para utilizarlo como PaaS para mi Tabajo Fin de Grado.
###Ejercicio 2
**Crear una aplicación en OpenShift y dentro de ella instalar WordPress.**

La aplicación ya se ha creado:

![aplicación en openshift](http://s2.subirimagenes.com/imagen/previo/thump_9488277openorderwordpress.png)

Y como se puede observar en la siguiente captura, está funcionando.
![](http://s2.subirimagenes.com/imagen/previo/thump_9488278wordpress.png)

###Ejercicio 3
**Realizar una app en express (o el lenguaje y marco elegido) que incluya variables como en el caso anterior.**

Se va a crear la aplicación porra:

- mkdir porra
- cd porra
- npm init
- npm install express --save
- npm install express-generator -g
- express prueba-rest
- cd prueba-rest
- npm install # instala dependencias
- npm install supertest
- npm install -g grunt-cli
- npm install grunt-shell
- sudo apt-get install sqlite3
- npm install sqlite3
- npm install should --save-dev
- grunt creadb

![](http://s2.subirimagenes.com/imagen/previo/thump_9488283creadb.png)

Como vemos en la captura anterior no hay errores y podemos continuar. Ejecutamos la aplicación:

![](http://s2.subirimagenes.com/imagen/previo/thump_9489022probandoapp.png)

Probamos a meter datos:

![](http://s2.subirimagenes.com/imagen/previo/thump_9489043metiendodatos.png)

En la captura de abajo podemos ver los datos que acabamos de introducir

![](http://s2.subirimagenes.com/imagen/previo/thump_9489045probandoinsercion.png)

Por último, subimos el proyecto a GitHub:

- git init
- git commit -m "aplicación porra - ejercicio3"
- git remote add origin git@github.com:AntonioPozo/Porra- git push -u origin master
Puede encontrar el proyecto [aquí](https://github.com/AntonioPozo/Porra)
###Ejercicio 4
**Crear pruebas para las diferentes rutas de la aplicación.**

El fichero de test lo puedes encontrar [aquí](https://github.com/AntonioPozo/Porra/blob/master/test/test.js)
Ejecutamos los tests:

![test con mocha](http://s2.subirimagenes.com/imagen/previo/thump_9489620testporra.png)


###Ejercicio 5
**Instalar y echar a andar tu primera aplicación en Heroku.**

- Lo primero de todo es descargar las herramientas necesarias. 
	- wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh 
- Nos logueamos
	- heroku login
	
		![login heroku](http://s2.subirimagenes.com/imagen/previo/thump_9489622loginheroku.png)

- Clonamos el directorio y entramos en el mismo
	- git clone git@github.com:heroku/node-js-getting-started.git
- Instalamos dependencias
	- npm install
- iniciamos la aplicación
	- npm start   
	![aplicación funcionando](http://s2.subirimagenes.com/imagen/previo/thump_9489624heroku.png)

- Una vez hemos visto que la aplicación funciona en local, procedemos a desplegarla en Heroku
	- heroku create
	- git push keroku master
- Renombramos la aplicación ya que el nombre inicial es aleatorio
	- heroku apps:rename firstappiv
	- heroku git:remote -a firstappiv
- Arrancamos el servidor
	- heroku ps:scale web=1
- Abrimos nuestra aplicación en el navegador
	- heroku open
	- Automáticamente se nos abre el navegador con la [app](https://firstappiv.herokuapp.com/)
	
		![heroku online](http://s2.subirimagenes.com/imagen/previo/thump_9489627herokuonline.png)

	
###Ejercicio 6
**Usar como base la aplicación de ejemplo de heroku y combinarla con la aplicación en node que se ha creado anteriormente. Probarla de forma local con foreman. Al final de cada modificación, los tests tendrán que funcionar correctamente; cuando se pasen los tests, se puede volver a desplegar en heroku.
Como en todos los ejemplos anteriores, se puede cambiar “node” y “heroku” por la herramienta que se haya elegido.**

###Ejercicio 7
**Haz alguna modificación a tu aplicación en node.js para Heroku, sin olvidar añadir los tests para la nueva funcionalidad, y configura el despliegue automático a Heroku usando Snap CI o alguno de los otros servicios, como Codeship, mencionados en StackOverflow**


###Ejercicio 8
**Preparar la aplicación con la que se ha venido trabajando hasta este momento para ejecutarse en un PaaS, el que se haya elegido.**


