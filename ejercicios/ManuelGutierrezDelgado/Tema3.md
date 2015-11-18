#TEMA 3

#Ejercicio 1
##Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.

Usaré OpenShift
![OpenShift](https://i.gyazo.com/fa0a1ccd9cfef2e1519fe3221372e388.png)


#Ejercicio 2
##Crear una aplicación en OpenShift y dentro de ella instalar WordPress.

Para crear una aplicación, en el menú inicial hacemos click en crear aplicación ahora:
![WordPress](https://i.gyazo.com/95d07fded5eae3fdf886f6a7e948cbe8.png)

Se nos abre un menú y elegimos WordPress:
![WordPress](https://i.gyazo.com/8c08b1eb5308905277ea4bec7402166c.png)

Pinchamos en crear aplicación y elegimos **WordPress**. Vamos asignando datos si queremos, aunque poniendo solo el nombre de la aplicación y el dominio bastaría:
![WordPress](https://i.gyazo.com/768ee6f740d2aa3fb0b65d0bbda80365.png)

Una vez configurado nos pedirá que instalemos WordPress en la página de inicio,donde nos pide el lenguaje, el nombre de la página, el usuario, la contraseña y el email.
Una vez rellenados los campos, le damos a instalar.
Y tras instalarse, tenemos nuestro WordPress viendo esta frase: **HOLA MUNDO**:
![WordPress](https://i.gyazo.com/3e9d3523af91f59fe4186f12b0efc845.png)


#Ejercicio 3
##Realizar una app en express (o el lenguaje y marco elegido) que incluya variables como en el caso anterior.

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

Vemos que todo funciona bien.
![Porra](https://i.gyazo.com/59473aefd6911a1f87ee1bce1e5fdb68.png)

Ejecutamos la aplicación:
![Porra](https://i.gyazo.com/9fa69dd3b843f5ffdf60ce4fdf18a11e.png)

Introducimos datos.
![Porra](https://i.gyazo.com/4c360f81b426026daca34c9885a1a2ad.png)

Comprobamos que todo está correcto.
![Porra](https://i.gyazo.com/aa6c9227a63cf58a4cd37d04bcefe639.png)


#Ejercicio 4
##Crear pruebas para las diferentes rutas de la aplicación.

Test.
![Porra](https://i.gyazo.com/0619cb0e261c946212eb813246e5c432.png)

Resultado.
![Porra](https://i.gyazo.com/bc5c9bf942d0571d68acbcb872ad8c5b.png)


#Ejercicio 5
##Instalar y echar a andar tu primera aplicación en Heroku.

- Lo primero de todo es descargar las herramientas necesarias. 
	- wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
![Porra](https://i.gyazo.com/907981d16098f86f438495f21b4399f4.png)
 
- Nos logueamos
	- heroku login
![Porra](https://i.gyazo.com/03416b352d99b14f6c8834b6fd7f1ec3.png)

- Clonamos el directorio y entramos en el mismo
	- git clone git@github.com:heroku/node-js-getting-started.git
![Porra](https://i.gyazo.com/3298242beaae4382a8ce5f809a439cc4.png)

- Instalamos dependencias
	- npm install
- iniciamos la aplicación
	- npm start

![Porra](https://i.gyazo.com/cd74fca03303d667fcf4513187b5deac.png)

- Una vez hemos visto que la aplicación funciona en local, procedemos a desplegarla en Heroku.
	- heroku create
	- git push keroku master
- Arrancamos el servidor.
	- heroku ps:scale web=1
- Abrimos nuestra aplicación en el navegador.
	- heroku open
![Porra](https://i.gyazo.com/c198df76f8c29610bfa56aab33e16eb8.png)
	

#Ejercicio 6
##Usar como base la aplicación de ejemplo de heroku y combinarla con la aplicación en node que se ha creado anteriormente. Probarla de forma local con foreman. Al final de cada modificación, los tests tendrán que funcionar correctamente; cuando se pasen los tests, se puede volver a desplegar en heroku. Como en todos los ejemplos anteriores, se puede cambiar “node” y “heroku” por la herramienta que se haya elegido.


#Ejercicio 7
##Haz alguna modificación a tu aplicación en node.js para Heroku, sin olvidar añadir los tests para la nueva funcionalidad, y configura el despliegue automático a Heroku usando Snap CI o alguno de los otros servicios, como Codeship, mencionados en StackOverflow


#Ejercicio 8
##Preparar la aplicación con la que se ha venido trabajando hasta este momento para ejecutarse en un PaaS, el que se haya elegido.
