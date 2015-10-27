###Ejercicio 1:Instalar alguno de los entornos virtuales de node.js (o de cualquier otro lenguaje con el que se esté familiarizado) y, con ellos, instalar la última versión existente, la versión minor más actual de la 4.x y lo mismo para la 0.11 o alguna impar (de desarrollo).

Procedemos a instalar Node.js versión 0.12 para MAC:
![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema2/install.png)

Creamos un archivo JavaScript "Hola Mundo" para comprobar su funcionamiento:
![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema2/code.png)

Verificamos que funciona entrando en la dirección por defecto de Node en el navegador:
![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema2/prueba.png)


###Ejercicio 2: Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.

Siguiendo guías se ha desarrollado una aplicación para añadir empresas y calificación.

Se ha desarrollado mediante Express en Node.js y usado Azure para la base de datos (DocumentDB).

Se ha creado, entre otros, un fichero de configuración (config.js) incluyendo los valores obtenidos en la base de datos creada en Azure y modificado el ficjero app.js para incluir la nueva configuración.

La interfaz de usuario se modifica en el archivo *layout.jade* e *index.jade* en la carpeta **view** creada por Express. Modificaremos estos ficheros con el fin de darle el aspecto y funcionalidad deseados.

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema2/empresaIV.png)

###Ejercicio 3: Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?

Se ha ejecutado en node.js v0.12.0 y en la v4.2.1 sin problemas.

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema2/ej3.png)


###Ejercicio 4: Crear una descripción del módulo usando package.json. 
```
{
  "name": "empresaIV",
  "version": "0.0.0",
  "private": true,
  "scripts": {
    "start": "node ./bin/www"
  },
  "description": "App Web empresaIV",
  "author": {
    "name": "Ignacio Romero Cabrerizo",
    "email": "nachorc@correo.ugr.es"
  },
  "dependencies": {
    "async": "^1.4.2",
    "body-parser": "~1.13.2",
    "cookie-parser": "~1.3.5",
    "debug": "~2.2.0",
    "documentdb": "^1.4.0",
    "express": "~4.13.1",
    "jade": "~1.11.0",
    "morgan": "~1.6.1",
    "serve-favicon": "~2.3.0"
  },
  "devDependencies": {
    "docco": "^0.7.0",
    "grunt-docco": "^0.4.0"
  }
}
```

###Ejercicio 5: Automatizar con grunt y docco (o algún otro sistema para otro lenguaje de programación) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.

Tras instalar los módulos necesarios, ejecutamos **grunt docco**:

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema2/docco.png)

Tras ello nos habrá creado toda la documentación en la carpeta predefinida (docs).

###Ejercicio 6: Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga.

Para comprobarlo creamos un **assert** para verificar que la conexión con la base de datos documentDB de Azure se realiza correctamente. En un primer caso lo hacemos con una variable que no existe, con lo que *npm* nos lanza el error. Al realizar el **assert** de forma correcta ya si obtendremos la verificación de que todo funciona de manera correcta:

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema2/check.png)


###Ejercicio 7: Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta. Si hasta ahora no has subido el código que has venido realizando a GitHub, es el momento de hacerlo, porque lo vamos a necesitar un poco más adelante.


Instalamos el modulo necesario: ``` npm install -g mocha ```

Y creamos el archivo para realizar el test:

```

var assert = require("assert");
lib = require(__dirname+"/../models/docdbUtils.js");

    describe('Web', function(){
        it('Carga del fichero docdbUtils', function(){
            assert(lib, "Cargado");
        });
});

```

Lanzamos el test: ``` mocha test/test.js ```

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema2/test.png)

###Ejercicio 8: Travis

Tras permitir el acceso de Travis al repositorio y crear el archivo **.travis.yml**:

```

language: node_js

node_js:
  - "0.12"

before_install:
  - npm install -g mocha
  - mocha

```

Obtenemos el repositorio con el **build|passing** realizado:

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema2/travis.png)

