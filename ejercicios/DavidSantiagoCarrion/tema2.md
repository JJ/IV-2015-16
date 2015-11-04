#Tema 2: Iniciación a DevOps: desarrollo basado en pruebas

## Ejercicio 1 : Instalar alguno de los entornos virtuales de node.js (o de cualquier otro lenguaje con el que se esté familiarizado) y, con ellos, instalar la última versión existente, la versión minor más actual de la 4.x y lo mismo para la 0.11 o alguna impar (de desarrollo).

He instalado el python-virtualenv
```
sudo apt-get install python-virtualenv 
```

Para gestionar los paquetes instalados en el entorno correspondiente instalamos también pip. Pip es al virtualenv lo que npm al nvm:
```
sudo apt-get install python-pip 
```

Instalamos también las dependencias que nos pide el sistema para trabajar con este sistema de entornos:
```
sudo apt-get python-dev build-essential
```

Gracias a pip podemos gestionar las versiones que instalamos de los diferentes paquetes de python, incluso del susodicho virtualenv. Por ejemplo para hacernos con la última versión podemos ejecutar:
```
sudo pip install --upgrade virtualenv 
```

Ahora para crear y activar un entorno sobre el que instalar paquetes ejecutamos los siguientes comandos:
```
virtualenv carpetaAplicacion
cd carpetaAplicacion
source bin/activate
```
Ya tendremos el entorno activo:
```
(carpetaAplicacion)david@david-Aspire-V3-771 ~/carpetaAplicacion $
```

Todos lo que instalemos con pip tras la activación afectará solo al entorno virtual activo. Si queremos desactivarlo usamos:
```
deactivate
```


## Ejercicio 2 : Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.

Voy a desarrollar una aplicación con Flask para ello he seguido (el siguiente tutorial)[http://code.tutsplus.com/tutorials/an-introduction-to-pythons-flask-framework--net-28822] y (este otro también)[https://stormpath.com/blog/build-a-flask-app-in-30-minutes/].

[Este es el repositorio de la aplicación](https://github.com/dscdac/Tema2empresa)





## Ejercicio 3 : Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?




## Ejercicio 4 : Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente. 



## Ejercicio 5 : Automatizar con grunt y docco (o algún otro sistema) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.

## Ejercicio 6 : Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga (vamos, lo que viene siendo TDD).

## Ejercicio 7 : Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante. 

## Ejercicio 8 : Ejercicio: Haced los dos primeros pasos antes de pasar al tercero.
