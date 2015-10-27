# Ejercicios de Rubén Martín Hidalgo
## Tema 3
### Ejercicio 1: Instalar un entorno virtual para tu lenguaje de programación favorito.

Voy a instalar Virtualenv para Python:

1. *sudo apt-get install python-setuptools python-dev build-essential*

2. *sudo apt-get install python-pip* 

3. *sudo pip install --upgrade virtualenv*

Y ya podemos ver que lo tenemos instalado:

![Virtualenv instalado](https://www.dropbox.com/s/oqhbwp5kbvqrrdr/versionVirtualenv.PNG?dl=1)

Para usarlo, se hace lo siguiente:

Creamos entorno virtual con *virtualenv ENV*, que nos crea la siguiente estructura de directorios:

![Estructura virtualenv](https://www.dropbox.com/s/6r4g07eg4pab7rm/virtualenv.PNG?dl=1)

Entramos en ENV y lo activamos de la siguiente forma: *source bin/activate*

![Activar entorno vitual](https://www.dropbox.com/s/tr9kgu62pzkj5tf/activarEntornoPython.PNG?dl=1)
  
### Ejercicio 2: Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu u OpenShift.

Me he registrado en el PaaS [OpenShift](https://www.openshift.com/). 

![Registrado en OpenShift](https://www.dropbox.com/s/bx5xijdfg2k5zrn/OpenShift_inicio.PNG?dl=1)

Además he enlazado mi cuenta con la de mi usuario en GitHub.

### Ejercicio 3: Crear una aplicación en OpenShift y dentro de ella instalar WordPress.

En la página de bienvenida de OpenShift, pinchamos sobre "Create your first application now".

![Crear aplicacion ahora](https://www.dropbox.com/s/wy6o9t1ix7v2z1d/CreateAplicationWordpress.png?dl=1)

Elegimos WordPress4 de entre las aplicaciones disponibles para crear.

![Elegir WordPress](https://www.dropbox.com/s/0qk7f07ry7osv4b/ElegirWordpress.png?dl=1)

Le asignamos una URL pública y el dominio, que en mi caso será: [http://mywordpress-iv2015.rhcloud.com/](http://mywordpress-iv2015.rhcloud.com/)

Pinchamos en "Create Application".

![Crear finalmente aplicacion WordPress](https://www.dropbox.com/s/ut4malmlvq8bhrp/create%20Aplication.png?dl=1)

En la siguiente pantalla, añadimos algunos datos como el título de la página, o el nombre de usuario.

Damos en "Instalar Wordpress".

![Instalar WordPress](https://www.dropbox.com/s/m37fq3n8wubz1o6/datos%20wordpress.png?dl=1)

¡¡Y ya tenemos nuestro WordPress en marcha!! 

![Página de Wordpress](https://www.dropbox.com/s/1574h2wwnl8pelw/WordPress.PNG?dl=1)

### Ejercicio 4: Crear un script para un documento Google y cambiarle el nombre con el que aparece en el menú, así como la función a la que llama.

1. Entramos en la aplicación "Documentos" de Google. 

2. Creamos un nuevo documento.

3. Pinchamos en Herramientas > Editor de secuencia de comandos:

![Herramientas > Editor de secuencia de comandos](https://www.dropbox.com/s/la71e0cx1yyd8io/GoogleScript.png?dl=1)

4. Esto nos abre un proyecto llamado "Código.gs" donde meteremos el script a ejecutar:

```
function onOpen(){
  var ui = DocumentApp.getUi(); 
  // Or DocumentApp or FormApp. 
  ui.createMenu('Menu IV') 
  .addItem('First item', 'menuItem1') 
  .addSeparator() 
  .addItem('Second item', 'menuItem2')
  .addSubMenu(ui.createMenu('Sub-menu') 
          .addItem('My Function', 'myFunction'))    
  .addToUi(); 
}

function menuItem1(){ 
  DocumentApp.getUi() // Or DocumentApp or FormApp. 
  .alert('Has pulsado el primer Item!');
}

function menuItem2(){
  DocumentApp.getUi() // Or DocumentApp or FormApp. 
  .alert('has pulsado el segundo Item!'); 
}

function myFunction(){
  var result = DocumentApp.getUi().alert( 'Prueba ejercicio 4 IV', 
                                         DocumentApp.getUi().ButtonSet.YES_NO); 
  if (result == DocumentApp.getUi().Button.YES){
    DocumentApp.getUi().alert('Realizando la operacion...'); 
  }
  else{
    DocumentApp.getUi().alert('Operacion cancelada'); 
  }
}
```

5. Guardamos el script y damos a ejecutar la primera función, que es la que cargará el menú:

![Ejecutar onOpen](https://www.dropbox.com/s/as0g1nbsio1y2bb/onOpenScript.PNG?dl=1)

6. Ya podemos irnos de nuevo al documento, y vemos que nos aparece el nuevo menú, y que podemos hacer click sobre cualquiera de las funciones creadas:

![Prueba script](https://www.dropbox.com/s/hb18tsoxx7odfyd/pruebaScriptGoogle.PNG?dl=1)

### Ejercicio 5: Buscar un sistema de automatización de la construcción para el lenguaje de programación y entorno de desarrollo que usemos habitualmente.

El sistema de automatización para Python que he encontrado ha sido *AAP*. Es una "especie" de make para Python. En este [enlace](http://www.calmar.ws/aap/) nos explican como usarlo.

También existen otras como BitBake, SCons o Waf sacadas de [wikipedia](https://en.wikipedia.org/wiki/List_of_build_automation_software#Non-Make-based_tools).

### Ejercicio 6: Identificar, dentro del PaaS elegido o cualquier otro en el que se dé uno de alta, cuál es el fichero de automatización de construcción e indicar qué herramienta usa para la construcción y el proceso que sigue en la misma.

En OpenShift el fichero de automatización se encuentra en .openshift/action_hooks/build.

Además, para poder automatizar tareas existen dos formas: 

- Usando [Jenkins](https://developers.openshift.com/en/managing-continuous-integration.html): es un servidor que proporciona funciones de integración continua para el desarrollo de software que puede ejecutar, construir, testear y programar tareas que se integran con las aplicaciones de OpenShift.

- Usando Hot deployment: con hot deployment se aplican los cambios al código de la aplicación sin necesidad de reiniciar la aplicación, lo que aumenta la velocidad de despliegue y minimiza el tiempo de inactividad de la aplicación. 

Ambos lo he sacado de [aquí](https://developers.openshift.com/en/managing-modifying-applications.html).

### Ejercicio 7: Buscar un entorno de pruebas para el lenguaje de programación y entorno de desarrollo que usemos habitualmente.

Existen dos entornos de pruebas muy usados para Python, que son [Tox](https://pypi.python.org/pypi/tox) y [nose](https://pypi.python.org/pypi/nose/1.3.7) que usa funciones de [unittest](https://docs.python.org/2/library/unittest.html).
