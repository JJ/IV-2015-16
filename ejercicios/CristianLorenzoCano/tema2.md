## Ejercicios TEMA 2
#### 1. Instalar alguno de los entornos virtuales de node.js (o de cualquier otro lenguaje con el que se esté familiarizado) y, con ellos, instalar la última versión existente, la versión minor más actual de la 4.x y lo mismo para la 0.11 o alguna impar (de desarrollo).

primero y como voy a usar python en mi aplicacion instalare virtualenv mediante el siguiente comando

    sudo apt-get install python-virtualenv

una vez instalado creo el entorno con el comando "virtualenv [nombre entorno]"

    virtualenv proyecto1

la aplicacion la realizare en Django y para instalarlo, nos movemos a la carpeta del entorno y lo activamos

    cd ./proyecto1
    source bin/activate

una vez activado instalamos Django
  
    pip install Django

ya podemos trabajar, ahora cuando queramos salir del entorno lo unico que debemos hacer es ejecutar el comando

    deactivate


#### 2. Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido
este ejercicio lo tengo hecho en https://github.com/crlorenzo7/CalificacionEmpresas


#### 3. Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?

he creado un entorno virtual con la version 3.3 de python mediante virtualenv -p python, todo me ha funcionado bien

#### 4. Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente.

como estoy usando python no hay package.json pero existe algo muy parecido, un documento Requeriments.txt, creado mediante freeze que automaticamente contiene todas las dependencias del proyecto y despues se instalan de forma automatica
los pasos que he seguido son:
  - instalar freeze:
    pip install freeze
  - crear el archivo Requeriments.txt
    pip freeze > Requeriments.txt

![imagen](http://i63.tinypic.com/213mb15.png)

#### 5. Automatizar con grunt y docco (o algún otro sistema) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.

#### 6. Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga (vamos, lo que viene siendo TDD).
hecho en https://github.com/crlorenzo7/CalificacionEmpresas

#### 7. Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante.
hecho en https://github.com/crlorenzo7/CalificacionEmpresas

#### 8. hacer test con Travis
hecho en https://github.com/crlorenzo7/CalificacionEmpresas
