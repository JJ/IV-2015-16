# Ejercicio 1. Instalar alguno de los entornos virtuales de node.js y, con ellos, instalar la última versión existente, la versión minor más actual de la 0.12 y lo mismo para la 0.11 o alguna impar. Si no se usa habitualmente este lenguaje, hacer lo mismo con cualquier otro lenguaje de scripting.

En mi caso voy a usar python por la tanto he elegido virtualenv cómo entorno virtual. Instalé virtualenv <nombre entorno> lo que me generaba un entorno en la versión Python 2.7.3 y posteriormente como parte del ejercio 3 probé la aplicación en otro entorno en la versión Python 3.2.3


# Ejercicio 2. Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.
# Se trata de hacer una aplicación simple que se pueda crear rápidamente con un generador de aplicaciones como los que incluyen diferentes marcos MVC. Si cuesta mucho trabajo, simplemente prepara una aplicación que puedas usar más adelante en el resto de los ejercicios. 
En el siguiente repositoria tengo hecha la web que se nos pedía [Programa de calificaciones de empresas ](https://github.com/pmmre/Empresas)

# Ejercicio 3. Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?

Para desarrolla este ejercicio he creado un entorno virtual en la versión 3.2.3 de Python con el comando virtualenv -p python <nombre entorno>. Al principio me daban errores de ejecución por falta de librerías y después error de sintáxis entre
las dos versiones del lenguaje que corregí.

Los errores fueron:

 1) Los print  en la versión 2.7.3 son print <contenido> y en la versión 3.2.3 son print(<contenido>). Cómo solo lo estaba
 usando para probar en el terminal los pasos de elementos de una página a otra lo eliminé.
 
 2) El otro error fué en un if que el dato calificaciones que era un entero en python 3.2.3 me lo detectaba cómo string, así que simplemente tuve que indicarle que me lo tomara como un entero de la siguiente manera int(calificacion)

# Ejercicio 4 Crear una descripción del módulo usando package.json o el equivalente en otro lenguaje. 

En Django se suele tener un archio dónde se tienen todos los paquetes usados en el proyecto (entorno de desarrollo) en un archivo llamado requeriments.text. El procedimiento para crearlo, su utilidad y como comprobar que funciona se mostrará a continuacion
Forma de usarlos y comprobarlo:

 1) En el proyecto funcionando pip freeze > requirements.txt que sirve para almacenar en requeriments todos los paquetes instalados en el entorno.
 
 2) Salirse del entorno virtual y creais otro fuera en la versión que se este usando. En mi caso he probado con python3:
    virtualenv -p python3 <nombre_entorno>   //si es version2 virualenv <nombre>
    
 3) ahora copias el proyecto (Sólo el proyecto no el entorno entero que es todas las librerias y asi os funcina si o si pero asi no probais nada) 
 
    cp -r <carpeta del proyecto> <carpeta del entorno> 
    
    En mi caso me pongo en la carpeta donde tengo los entornos y pongo:
    
    cp -r PRACTICA2/venv/Empresas/ FINAL/
    
4) ahora os meteis en el nuevo entorno y probais a ejecutarlo con python3 manage.py runserver  // o python en version2

    DEBERÁ SALIR ERROR PUES NO TENEIS LAS LIBRERIAS INSTALADAS
    
5) Instalamos las dependecias: os meteis en la carpeta del nuevo proyecto que tendreís requeriments.txt y ejecutais :

    pip install -r requeriments.txt
    
    ahora se os instala todo de forma recursiva (dependencias de los paquetes)
    
6) Ejecutais y funciona :D



# Ejercicio 5 Automatizar con grunt y docco (o algún otro sistema para otro lenguaje de programación) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.

Para documentar en python se utilizan """ comentario de varias líneas """. Una vez comentado se usar la herramienta "pycco <nombre de archivo a comentar> -p", Para generar la documentación en html que se guarda en la carpeta docs. Con la opción -p
se crea la misma estructura de archivos que tiene el proyecto (que viene bien en proyectos grandes).

# Ejercicio 6. Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga (vamos, lo que viene siendo TDD). 

Con Django los test se programana en el archivo test.py que está almacenado en la carpeta apps/<nombre app>/. Se utiliza la librería Django unittest. Puede verse los test en el proyecto y los tengo comentados en el archivo.

Aquí os dejo el enlace directo al archivo [test.py](https://github.com/pmmre/Empresas/blob/master/apps/empresas/tests.py)


# Ejercicio 7. Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante. 

Para poder ejecitar todos los test junsto podemos usar la herramienta de python nosetest que se instala poniendo "pip install nose"  y se ejecuta simplemente ejecutando "nosetests".

He podido comprobar que Django utiliza la misma herramienta y nada más que con ejecutar "python3 manage.py test" se ejecutan
todos los test y ejecutando "python3 manage.py test <nombre_test>" se ejecuta el nombre del test seleccionado

# Ejercicio 8. Ejercicio: Haced los dos primeros pasos antes de pasar al tercero.

Para realizar la integración continua hay que darse de alta en TRAVIS a traves de la github o de TRAVIS. Una vez realizado eso debemos de configurar TRAVIS indicando que repositorios vamos a seguirle una integración continua. Una vez hecho esto 
debemos de crear en el inicio del repositorio .travis.yml bien configurado. Es importante mantener el archivo de requirements.txt en la misma carpeta.
