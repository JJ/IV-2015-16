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

![](http://s2.subirimagenes.com/imagen/previo/thump_9489022probandoapp.png)

![](http://s2.subirimagenes.com/imagen/previo/thump_9489043metiendodatos.png)

![](http://s2.subirimagenes.com/imagen/previo/thump_9489045probandoinsercion.png)


###Ejercicio 4
**Crear pruebas para las diferentes rutas de la aplicación.**

###Ejercicio 5
**Instalar y echar a andar tu primera aplicación en Heroku.**

###Ejercicio 6
**Usar como base la aplicación de ejemplo de heroku y combinarla con la aplicación en node que se ha creado anteriormente. Probarla de forma local con foreman. Al final de cada modificación, los tests tendrán que funcionar correctamente; cuando se pasen los tests, se puede volver a desplegar en heroku.
Como en todos los ejemplos anteriores, se puede cambiar “node” y “heroku” por la herramienta que se haya elegido.**

###Ejercicio 7
**Haz alguna modificación a tu aplicación en node.js para Heroku, sin olvidar añadir los tests para la nueva funcionalidad, y configura el despliegue automático a Heroku usando Snap CI o alguno de los otros servicios, como Codeship, mencionados en StackOverflow**


###Ejercicio 8
**Preparar la aplicación con la que se ha venido trabajando hasta este momento para ejecutarse en un PaaS, el que se haya elegido.**


