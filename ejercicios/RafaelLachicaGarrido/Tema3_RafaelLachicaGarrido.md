#Tema 3
##Rafael Lachica Garrido
#Ejercicio 1
##Instalar un entorno virtual para tu lenguaje de programación favorito (uno de los mencionados arriba, obviamente).

Instalo virtualenv para **python**:

```
rafaellg8: ~ $ sudo apt-get install python-virtualenv
Reading package lists... Done
Building dependency tree
```

#Ejercicio 2
##Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu u OpenShift.
Usaré OpenShift
![Openshift](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Proyecto1_zpsrbk2uop7.png)
Me daré de alta en el sistema de **Openshift**, accedemos a [Openshift](https://openshift.redhat.com) y nos registramos.

![Openshift](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/openshift_zps6qi2uvc0.png)


#Ejercicio 3
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

#Ejercicio 4
##Crear un script para un documento Google y cambiarle el nombre con el que aparece en el menú,así como la función a la que llama.
```
function renameFile() {
  var file = DocumentApp.getActiveDocument();  
  file.setName('HOLA MUNDO');
  var ui = DocumentApp.getUi();
  ui.prompt("Nombre cambiado");
}
```
![googleAppScript](http://i1383.photobucket.com/albums/ah302/Rafael_Lachica_Garrido/Captura%20de%20pantalla%20de%202015-10-18%20185828_zpsoiebi2ta.png)

#Ejercicio 5
##Buscar un sistema de automatización de la construcción para el lenguaje de programación y entorno de desarrollo que usemos habitualmente.
Lenguaje: **python**
Para entornos de desarrollo normalmente prefiero y uso [Atom](https://atom.io/) con los plugins [Emmet](https://atom.io/packages/emmet-simplified), [Python](https://atom.io/packages/python), y [autocomplete-python](https://atom.io/packages/autocomplete-python). También se pueden encontrar los mismos paquetes y algunos mejorados para el otro editor de textos, [Sublime Text](http://www.sublimetext.com/) el cual también ofrece una versión de prueba **gratuita** que no caduca.
Aún así he encontrado un IDE solo para pyton bastante bueno [pycharm](http://www.jetbrains.com/pycharm/)
En cuanto al sistema de automatización, como python es un lenguaje scripting no necesita nada, aún así tenemos herramientas como la de pycharm que nos ayudan, además de otras como [buildbot](http://buildbot.net/) que ayudan con la documentación y demás.
Si lo que buscamos en programar en un PaaS, podemos usar el framework que nos ofrece [Openshift](https://openshift.redhat.com/) para trabajar con **Python**.

#Ejercicio 6
#Identificar, dentro del PaaS elegido o cualquier otro en el que se dé uno de alta, cuál es el fichero de automatización de construcción e indicar qué herramienta usa para la construcción y el proceso que sigue en la misma.
En Openshift se encuentra un fichero de automatización está en **.openshift/action_hooks/build**.
Podemos usar también un software llamado **Jenkins**, el cual es un servidor que nos da integración automática y continua para desarrollar. Permite que ejecutemos, construyamos y testeemos programas integradas en las aplicaciones Openshift.

#Ejercicio7
#Buscar un entorno de pruebas para el lenguaje de programación y entorno de desarrollo que usemos habitualmente.
Para python he usado [nosetest](https://nose.readthedocs.org/en/latest/), el cual nos permite hacer test en el entorno de integración, como ya he hecho en Shippable:
![img](https://camo.githubusercontent.com/8b90e84f498bcd50fdd5fc7db526587ef867563c/687474703a2f2f69313338332e70686f746f6275636b65742e636f6d2f616c62756d732f61683330322f52616661656c5f4c6163686963615f4761727269646f2f43617074757261253230646525323070616e74616c6c612532306465253230323031352d31302d31382532303231303433335f7a7073317a6c716f336e662e706e67)

Está todo hecho en el archivo [practica2IV](https://github.com/rafaellg8/IV-PLUCO-RLG/blob/master/practica2IV.md).
Además de este software, también he encontrado otros como [pytest](http://pytest.org/latest/), y [tox](https://tox.readthedocs.org/en/latest/).
Aquí tenemos un especie de [tutorial](http://testrun.org/tox/latest/example/pytest.html) en el que se usan los dos a la vez.
