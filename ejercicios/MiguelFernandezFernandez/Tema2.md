# Miguel Fernández Fernández
## Tema 2
### Ejercicio 1: Instalar alguno de los entornos virtuales de node.js y, con ellos, instalar la última versión existente, la versión minor más actual de la 0.12 y lo mismo para la 0.11 o alguna impar.

He elegido NVM. Para su instalación, hay que seguir los siguientes pasos:

1. Descargamos el script de instalación de nvm: *curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.28.0/install.sh | bash*
![Instalar](http://i1379.photobucket.com/albums/ah138/migueib17/11_zpso9kxcphc.png)

2. El comando anterior habrá clonado el repositorio en ~/.nvm y por tanto ya tenemos instalado nvm. 

3. Ejecutamos *source ~/.profile* en el terminal, para recargar el archivo ~/.profile.

4. Ya podemos instalar alguna versión de node.js, podemos ver las que hay disponibles con: *nvm ls-remote*
![Versiones](http://i1379.photobucket.com/albums/ah138/migueib17/12_zps0ef021vn.png)

5. Para instalar la versión estable más moderna podemos poner: *nvm install stable* que nos instala la v4.0

![Stable](http://i1379.photobucket.com/albums/ah138/migueib17/13_zpsjchoozgs.png)

7. Por último, podemos ver las versiones instaladas con el comando *nvm ls*.

![Versiones nodejs instaladas](http://i1379.photobucket.com/albums/ah138/migueib17/14_zps7z2hfp87.png)

### Ejercicio 2: Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.

He seguido este tutorial:
[Tutorial](http://codehero.co/nodejs-y-express-instalacion-e-iniciacion/).
Repositorio de la apliación: [empresaPrácticas](https://github.com/migueib17/empresaPracticas).

1. Algunas capturas mias siguiendo el [Tutorial](http://codehero.co/nodejs-y-express-instalacion-e-iniciacion/).

![1](http://i1379.photobucket.com/albums/ah138/migueib17/21_zpsks3tcuox.png)
![2](http://i1379.photobucket.com/albums/ah138/migueib17/22_zpsf3lehdsp.png)

2. Web creada:

![3](http://i1379.photobucket.com/albums/ah138/migueib17/23_zpsnqfgwboo.png)


### Ejercicio 3: Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?

Con la orden nvm ls podemos ver la distintas versiones que tenemos instaladas. Y probamos a usar las distintas versiones:
        nvm use v0.12.7
        nvm use v0.11.16

- v0.11.16 -> Funciona correctamente
- v0.12.7 -> Funciona correctamente


### Ejercicio 4: Crear una descripción del módulo usando package.json o el equivalente en otro lenguaje.

Dentro del directorio donde guardamos nuestra aplicación cuando hacemos npm init se crea el package.json.

![Ejemplo de package.json](http://i1379.photobucket.com/albums/ah138/migueib17/24_zps3ouwcfmj.png)

### Ejercicio 5: Automatizar con grunt y docco (o algún otro sistema para otro lenguaje de programación) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.

Primero debemos instalar grunt y docco con los siguientes comandos:

1. *npm install -g grunt-cli*

![grunt](http://i1379.photobucket.com/albums/ah138/migueib17/33_zpsa5y9olub.png)

2. *npm install -g docco grunt-docco --save-dev*

![docco](http://i1379.photobucket.com/albums/ah138/migueib17/34_zpsf4il8cqj.png)

3. Y ahora para generar la documentación pues hacemos: docco *js y se genera por cada .js un fichero html.

![docco html](http://i1379.photobucket.com/albums/ah138/migueib17/35_zpsdcvisqol.png)

### Ejercicio 7: Convertir los tests unitarios anteriores con assert a programas de test y ejecutarlos desde mocha, usando descripciones del test y del grupo de test de forma correcta.


1. Instalamos mocha con: *npm install -g mocha*

2. Creamos el fichero test.js

````
var assert = require("assert");
    prueba = require(__dirname+"/../server.js");

describe('Web', function(){
describe('Carga', function(){
it('Debe cargar el programa', function(){
assert(web, "Cargado");
});
});
});

````
3. Ejecutamos el test con *mocha test.js*




### Ejercicio 8: Haced los dos primeros pasos antes de pasar al tercero.

1. Me he dado de alta en Travis conectándome directamente desde mi usuario en GitHub.

2. Creamos el fichero .travis.yml con el siguiente contenido configurado con el lenguaje que estamos utilizando:

````
language: node_js

node_js:
- 0.10.25

 ````
 
3. Cargamos el repositorio y le damos a BUILD THIS BRANCH, y ya tendremos activada la integración contínua.

Podemos ver el correcto funcionamiento cuando cada vez que hacemos un push del repositorio, automáticamente se ejecutan los test indicados, y si se pasan, marca el build con "succes".

![Integración continua con Shippable](http://i1379.photobucket.com/albums/ah138/migueib17/40_zpsdfjzyvwg.png)
