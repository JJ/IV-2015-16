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

Comprobamos que las preubas realizadas, a través de Mocha son satisfactorias:

![mocha](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-10-12%20190324_zps6okaymhj.png)
