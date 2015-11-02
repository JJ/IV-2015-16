# Ejercicios de Javier Ruiz César
## Tema 2
### Ejercicio 1: Instalar alguno de los entornos virtuales de node.js y, con ellos, instalar la última versión existente, la versión minor más actual de la 0.12 y lo mismo para la 0.11 o alguna impar.

Vamos a utilizar NVM. Para su instalación, hay que seguir los siguientes pasos:

1. Descargamos el script de instalación de nvm: *curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.28.0/install.sh | bash*

2. El comando anterior habrá clonado el repositorio en ~/.nvm y por tanto ya tenemos instalado nvm. 

3. Ejecutamos *source ~/.profile* en el terminal, para recargar el archivo ~/.profile.

4. Ya podemos instalar alguna versión de node.js, podemos ver las que hay disponibles con: *nvm ls-remote*

5. Para instalar la versión estable más moderna podemos poner: *nvm install stable* que nos instala la v4.1.2

6. También vamos a instalar las versiones más recientes de la 0.12 y la 0.11 con: *nvm install v0.12.7* y *nvm install v0.11.16*

7. Por último, podemos ver las versiones instaladas con el comando *nvm ls*.

![Versiones nodejs instaladas](http://i64.tinypic.com/6pc4li.png)

### Ejercicio 2: Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.

El tutorial que he seguido para crear la aplicación está [aquí](http://blog.koalite.com/2011/11/tutorial-node-js-express-jquery-i-creando-la-aplicacion/)

El repositorio del programa que he creado esta [aquí](https://github.com/javiexfiliana7/app_motos.git)

Para ejecutarlo simplemente, clonamos el repositorio con *git clone* entramos en la carpeta, y hacemos *node app.js* en el directorio raíz de la aplicación.

Aquí una muestra de la aplicación funcionando:

![Aplicacion](http://i65.tinypic.com/9r3e60.png)


### Ejercicio 3: Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?

Probamos con el resto de versiones que habíamos instalado en el ejercicio 1:

- v0.11.16 -> Funciona correctamente
- v0.12.7 -> Funciona correctamente

### Ejercicio 4: Crear una descripción del módulo usando package.json o el equivalente en otro lenguaje.

Lo he hecho con el comando *npm init* ejecutado dentro del directorio de la aplicación.
Solo habrá que ir rellenando los distintos parámetros que nos pide. Al final nos queda algo así:

![resultado](http://i63.tinypic.com/23gzolv.png).

### Ejercicio 5: Automatizar con grunt y docco (o algún otro sistema para otro lenguaje de programación) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.

Primero instalamos grunt y docco con los siguientes comandos:

1. *npm install -g grunt-cli*

2. *npm install docco grunt-docco --save-dev*

Ahora creamos el Gruntfile.js (en el directorio raíz de la aplicación que estamos creando):

![Creación de Gruntfile](http://i65.tinypic.com/66cbgm.png)

Y por último ejecutamos *grunt*, que produce la siguiente [documentación](https://github.com/javiexfiliana7/app_motos/tree/master/docs).
Vemos como lo hace sin errores:
![Creación de documentación con Grunt](http://i68.tinypic.com/vyqgc5.png)

### Ejercicio 6: Para la aplicación que se está haciendo, escribir una serie de aserciones y probar que efectivamente no fallan. Añadir tests para una nueva funcionalidad, probar que falla y escribir el código para que no lo haga

He añadido una asersion que comprueba el inicio del servicio.
![Asersion](https://www.dropbox.com/home/15-16/iv-2015-16/imagenes/ejer_t2?preview=ejer5_gruntt.png)

### Ejercicio 7: Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta.


- Instalamos mocha si no lo tenemos con: *npm install -g mocha*

- Creamos un directorio para tests, y dentro de este, el fichero test.js

```
var assert = require("assert");
web_motos_enduro = require(__dirname+"/../app.js");

describe('web_motos_enduro', function(){
    describe('Probando el inicio del servicio...', function(){
        it('El servicio esta trabajando!', function(){
            assert(web_motos_enduro, "servicio parado!");
        });
    });
});

```

3. Ejecutamos el test con *mocha test/test.js*
![Ejecución correcta de Mocha](http://i65.tinypic.com/2yo1vo4.jpg)

### Ejercicio 8: Haced los dos primeros pasos antes de pasar al tercero.

- Usando el usuario de Github nos registramos en Shippable.

- Creamos el fichero shippable.yml:

```
# Build Environment
build_environment: Ubuntu 14.04

# language setting
language: node_js

# version numbers, testing against two versions of node
node_js:
 - 0.12.7
 - 0.11
#for public modules use
 https://github.com/javiexfiliana7/app_motos.git

# npm install runs by default but shown here for illustrative purposes
before_install:
 - npm install -g mocha

 # Running npm test to run your test cases
script:
 - mocha
 after_script:
 - ./node_modules/.bin/mocha -R xunit ./test > shippable/testresults/result.xml
 ```

3. Cargamos el repositorio y le damos a BUILD THIS BRANCH, cada vez que hacemos un push del repositorio, automáticamente se ejecutan los test indicados, y si se pasan, marca el build con "succes". Si no se pasan lo marca como "Fail"
![Shippable](http://i67.tinypic.com/zxmg46.png)
