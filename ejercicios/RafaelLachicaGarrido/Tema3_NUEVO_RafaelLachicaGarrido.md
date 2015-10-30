#Tema 3
##Rafael Lachica Garrido

#Ejercicio 1
##Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu u OpenShift.
Usaré OpenShift
![Openshift](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Proyecto1_zpsrbk2uop7.png)
Me daré de alta en el sistema de **Openshift**, accedemos a [Openshift](https://openshift.redhat.com) y nos registramos.

![Openshift](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/openshift_zps6qi2uvc0.png)


#Ejercicio 2
##Crear una aplicación en OpenShift y dentro de ella instalar WordPress.
Para crear una aplicación, en el menú inicial hacemos click en crear aplicación ahora:
![wordOpenshift](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Proyecto7_zpse4p5tisk.png)

Se nos abre un menú y elegimos WordPress:
![WordPress](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Proyecto8_zpszefvupgq.png)

Pinchamos en crear aplicación y elegimos **WordPress**. Vamos asignando datos como la IP Pública y el dominio:
![WordPress](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-10-18%20125416_zpsdwttwvad.png)

[direcciónURL](http://php-rafaellg8.rhcloud.com)

Una vez configurado nos pedirá que instalemos WordPress en la página de inicio,donde nos pide el lenguaje, el nombre de la página el usuario y contraseña,además del email.
Una vez rellenado correctamente los campos, le damos a instalar.
Y ya tenemos nuestro WordPress con la primera entrada **HOLA MUNDO**:
![WordPress2](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-10-18%20130413_zps2h70qbx2.png)

#Aplicación: Calificaciones de empresas de prácticas
Instalamos nodejs
![instalacionNodejs](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/installnode_zpsgelt0lqx.png)
Comprobamos que se ha instalado correctamente y comprobamos su versión:
![nodeVersion](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/node_zpsdg7z8ra6.png)

Instalamos después algunos paquetes y frameworks que necesitaremos como express:
```
rafaellg8@system32:~/Desktop/empresaPracticas$ npm install express
express@4.13.3 node_modules/express
├── escape-html@1.0.2
├── merge-descriptors@1.0.0
├── array-flatten@1.1.1
├── cookie@0.1.3
├── utils-merge@1.0.0
├── methods@1.1.1
├── cookie-signature@1.0.6
├── fresh@0.3.0
├── range-parser@1.0.2
├── vary@1.0.1
├── path-to-regexp@0.1.7
├── etag@1.7.0
├── content-type@1.0.1
├── parseurl@1.3.0
├── content-disposition@0.5.0
├── serve-static@1.10.0
├── depd@1.0.1
├── qs@4.0.0
├── finalhandler@0.4.0 (unpipe@1.0.0)
├── on-finished@2.3.0 (ee-first@1.1.1)
├── proxy-addr@1.0.8 (forwarded@0.1.0, ipaddr.js@1.0.1)
├── accepts@1.2.13 (negotiator@0.5.3, mime-types@2.1.7)
├── type-is@1.6.9 (media-typer@0.3.0, mime-types@2.1.7)
└── send@0.13.0 (destroy@1.0.3, statuses@1.2.1, ms@0.7.1, mime@1.3.4, http-errors@1.3.1)
```

**index.jade** que contiene lo referente al html:
```
extends layout

block content
  h1 #{title}
  br

  form(action="/completetask", method="post")
    table.table.table-striped.table-bordered
      tr
        td Nombre Empresa
        td Nombre Alumno
        td Fecha Inicio
        td Fecha Final
        td Puntuacion
        td Editar
      if (typeof tasks === "undefined")
        tr
          td
      else
        each task in tasks
          tr
            td #{task.name}
            td #{task.category}
            td #{task.dateEnterpriseStart}
            td #{task.dateEnterpriseFinish}
            td #{task.puntos}
            td
              input(type="checkbox", name="#{task.id}", value="#{!task.completed}", checked=task.completed)
    button.btn(type="submit") Eliminar Empresas
  hr
  form.well(action="/addtask", method="post")
    label Nombre Empresa:
    input(name="name", type="textbox")
    br
    label Nombre Alumno:
    input(name="category", type="textbox")
    br
    label Fecha Inicio:
    input(name="dateEnterpriseStart",type="date")
    label Fecha Final:
    input(name="dateEnterpriseFinish",type="date")
    br
    label Puntuacion:
    input(name="puntos",type="number" min="0" max="10")
    br
    button.btn(type="submit") Añadir empresa

```

En el archivo **config.js** tenemos toda la configuración asociada a las claves y las bases de datos en Azure:
```
var config = {}

config.host = process.env.HOST || "https://rafaellg8db.documents.azure.com:443/";
config.authKey = process.env.AUTH_KEY || "GeruNMDiTiCz5IJlv+i3vVKiX5T4lXerHCF/UxYIYYewqQHwy6PNXig+V7DwZvDjgUCfVhmmjLuCaSQHG0gglw==";
config.databaseId = "ToDoList";
config.collectionId = "Items";

module.exports = config;
```

Base de datos de DocumentDB en Azure:
![documentDB](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-10-11%20171835_zpsiwetznbe.png)

Web funcionando, iniciamos con **npm start**:
![imagenWeb](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/apiNode_zpsx6jsnuuh.png)

Subimos la pequeña aplicación a github:

**git push -u**

[Directorio App Github](https://github.com/rafaellg8/empresaPracticas)

[Fuente](https://azure.microsoft.com/es-es/documentation/articles/documentdb-nodejs-application/)

#Ejercicio 3
##Crear pruebas para las diferentes rutas de la aplicación

Creamos dentro de test/test.js las pruebas:

```
var assert = require("assert"),
	prueba = require(__dirname+"/../models/taskDao.js");

describe('init', function(){
	// Testea que se haya cargado bien la librería

	it('Cargando la base de datos', function(){
		assert(prueba, "Cargado documentDB de Azure");
	});
});

describe('addItem', function () {
    it('Añadimos una nueva nota de empresa', function(){
		assert(prueba, "Creada la empresa correctamente");
	});
})
```

Comprobamos que las pruebas realizadas, a través de Mocha son satisfactorias:

![mocha](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-10-12%20190324_zps6okaymhj.png)

#Ejercicio4
##Registrarse en Heroku
Nos registramos a través de su web:

![Heroku](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-10-26%20145408_zpsegqccckt.png)

Instalamos toolbelt heroku desde [toolbelt](https://toolbelt.heroku.com/debian):
```
wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
```
Nos logeamos e instalamos:
```
rafaellg8@system32:~/Documentos/GII/Cuarto/IV$ heroku login
Installing Heroku Toolbelt v4... done.
For more information on Toolbelt v4: https://github.com/heroku/heroku-cli
Setting up node-v4.2.1... done
Installing core plugins heroku-cli-addons, heroku-apps, heroku-fork, heroku-git, heroku-local, heroku-run, heroku-status... done
Enter your Heroku credentials.
Email: rafaellg93@gmail.com
Password (typing will be hidden):
Logged in as rafaellg93@gmail.com
```

[Fuente nodejs-Heroku](https://devcenter.heroku.com/articles/getting-started-with-nodejs#introduction)
Seguimos el tutorial y clonamos la app de prueba de [prueba](https://devcenter.heroku.com/articles/getting-started-with-nodejs#prepare-the-app)
```
rafaellg8@system32:~/Documentos/GII/Cuarto/IV/myapp$  git clone https://github.com/heroku/node-js-getting-started.git
Clonar en «node-js-getting-started»...
remote: Counting objects: 439, done.
remote: Total 439 (delta 0), reused 0 (delta 0), pack-reused 439
Receiving objects: 100% (439/439), 223.84 KiB | 27.00 KiB/s, done.
Resolving deltas: 100% (64/64), done.
Checking connectivity... hecho.
```

Creamos una nueva app con **heroku create**:
```
rafaellg8@system32:~/Documentos/GII/Cuarto/IV/myapp/node-js-getting-started$ heroku create
Creating powerful-crag-1990... done, stack is cedar-14
https://powerful-crag-1990.herokuapp.com/ | https://git.heroku.com/powerful-crag-1990.git
Git remote heroku added
```
Mandamos los cambios a github y actualizamos con **git push heroku master**.

Instalamos dependencias y nodejs con **npm install** y lo iniciamos con **npm start**:

![Imagen iniciando localhost](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-10-26%20174956_zps1ttzz5ov.png)

Ya tenemos la app desplegada!.

Ahora podemos editar cosas como el nombre de la app, yo la llamaré **herokurlg**:
```
rafaellg8@system32:~/Documentos/GII/Cuarto/IV/myapp/node-js-getting-started$ heroku apps:rename herokurlg
Renaming powerful-crag-1990 to herokurlg... done
https://herokurlg.herokuapp.com/ | https://git.heroku.com/herokurlg.git
Git remote heroku updated
```
Clonamos el nuevo repositorio:
```
rafaellg8@system32:~/Documentos/GII/Cuarto/IV/myapp/node-js-getting-started$ git remote rm heroku
rafaellg8@system32:~/Documentos/GII/Cuarto/IV/myapp/node-js-getting-started$ heroku git:remote -a herokurlg
set git remote heroku to https://git.heroku.com/herokurlg.git

```
Por último,nos aseguramos que esta el servicio activo con **heroku ps:scale web=1**, y una vez está todo correcto abrimos heroku:
```
rafaellg8@system32:~/Documentos/GII/Cuarto/IV/myapp/node-js-getting-started$ heroku ps:scale web=1
Scaling dynos... done, now running web at 1:Free.
rafaellg8@system32:~/Documentos/GII/Cuarto/IV/myapp/node-js-getting-started$ heroku open
Opening powerful-crag-1990... done
```

Abrimos la app:
![herokuApp](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-10-26%20180312_zpsenrygvua.png)

[Fuentes extras desarrolladores](https://devcenter.heroku.com/articles/git)

#Ejercicio5
##Usar como base la aplicación de ejemplo de heroku y combinarla con la aplicación en node que se ha creado anteriormente. Probarla de forma local con foreman. Al final de cada modificación, los tests tendrán que funcionar correctamente; cuando se pasen los tests, se puede volver a desplegar en heroku.

Copiamos los archivos de la aplicación empresa al directorio de myapp de heroku en local.
Borramos el archivo por defecto de **index.js**
Editamos **Procfile**:
```
web: npm start
```


También edito el **package.json** para que arranque directamente desde la app remota en Heroku:
```
{
  "name": "empresaIV",
  "version": "0.1.1",
  "private": true,
  "scripts": {
    "start": "heroku open"
  },
```

Subimos todas las modificaciones al github que tengo de heroku:
1. git add * -f
2. git commit -m "Actualizo Heroku"
3. git push heroku master

Copiamos el repositorio con los fuentes a mi repo de github:
```
rafaellg8@system32:~/Documentos/GII/Cuarto/IV/myapp/node-js-getting-started$ git remote rm origin
rafaellg8@system32:~/Documentos/GII/Cuarto/IV/myapp/node-js-getting-started$ git remote add origin git@github.com:rafaellg8/herokurlg.git
rafaellg8@system32:~/Documentos/GII/Cuarto/IV/myapp/node-js-getting-started$ git push -u origin master
Counting objects: 3791, done.
```

![herokuOpen](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-10-27%20120054_zpsnsjiwnvu.png)

#Ejercicio6
##Haz alguna modificación a tu aplicación en node.js para Heroku, sin olvidar añadir los tests para la nueva funcionalidad, y configura el despliegue automático a Heroku usando Snap CI o alguno de los otros servicios, como Codeship, mencionados en StackOverflow.
Nos registramos y configuramos la carpeta que vamos a usar de github en Snap CI. Hacemos unas modificaciones y vemos que comienza la integración:

```
To https://git.heroku.com/herokurlg.git
   81859f7..1576c74  master -> master
rafaellg8@system32:~/Documentos/GII/Cuarto/IV/myapp/node-js-getting-started$ git push origin master
Counting objects: 5, done.
```

![SnapCI](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-10-27%20112014_zpsybjlhced.png)

Configuramos los test para mocha en el panel de control
![testing](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-10-28%20114845_zps0mizewao.png)

#Ejercicio7
##Preparar la aplicación con la que se ha venido trabajando hasta este momento para ejecutarse en un PaaS, el que se haya elegido. También en OpenShift se puede desplegar automáticamente usando Travis, por ejemplo. De hecho, incluso en Heroku se puede trabajar también con Travis para el despliegue automático, aunque es mucho más simple hacerlo con Snap CI como se ha indicado más arriba.
También la he usado para desplegarla en Heroku, para ello he configurado algunas cosas en nodejs, en el package.json:
edito el **package.json** para que arranque directamente desde la app remota en Heroku:
```
{
  "name": "empresaIV",
  "version": "0.1.1",
  "private": true,
  "scripts": {
    "start": "heroku open"
  },
```
Con esto si abrimos herokurlg en la web vemos que la web está funcionando correctamen:
![imagenHerokuDesplegado](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-10-28%20120949_zpsexk8jju7.png)

[herokuRLG](http://herokurlg.herokuapp.com/)

También añadiré la app para que se inicio de forma automática y configuraré su despliegue en **Openshift**.

![imagenOpenshift](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-10-28%20121206_zpsx0dacuxh.png)

[URL openshift](http://myapp-rafaellg8.rhcloud.com)
