#Tema 2

###Ejercicio1: Instalar alguno de los entornos virtuales de node.js y, con ellos, instalar la última versión existente, la versión minor más actual de la 0.12 y lo mismo para la 0.11 o alguna impar. Si no se usa habitualmente este lenguaje, hacer lo mismo con cualquier otro lenguaje de scripting. 

En mi caso voy a instalar el entorno virtual de desarrollo **nvm**:

![Ejercicio1](https://www.dropbox.com/s/766cz38a3al5xf3/Ejercicio1.png?dl=1)

Instalamos las diferentes versiones de **nvm**:

![Ejercicio1b](https://www.dropbox.com/s/umh0n46vpuneax1/Ejercicio1b.png?dl=1)

###Ejercicio2: Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.

Web creada con **Node.js** siguiendo este tutorial:
[Tutorial](http://codehero.co/nodejs-y-express-instalacion-e-iniciacion/).
Repositorio de la apliación: [empresas](https://github.com/alvaro-gr/empresa-IV).


![Ejercicio2](https://www.dropbox.com/s/gvdmrrhto1rrrsy/Ejercicio2.png?dl=1)

###Ejercicio3: Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?
Con la orden **nvm ls** podemos ver la distintas versiones que tenemos instaladas. Y
probamos a usar las distintas versiones, si funciona todo correctamente con cada una de ellas.

![Ejercicio3a](https://www.dropbox.com/s/gvpjoa2xrxqa2fg/Ejercicio3a.png?dl=1)

![Ejercicio3b](https://www.dropbox.com/s/7y2ewar0s8jrepy/Ejercicio3b.png?dl=1)

###Ejercicio4: Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente. 

Dentro del directorio donde guardamos nuestra aplicación cuando hacemos **npm init** se crea el **package.json**.

![Ejercicio4](https://www.dropbox.com/s/vvw4ex18m6y1fig/Ejercicio4.png?dl=1)

###Ejercicio5: Automatizar con grunt y docco (o algún otro sistema) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.

Primero instalamos grunt de manera global:

![Ejercicio5a](https://www.dropbox.com/s/y8lzjd4xwelwa8f/Ejercicio5a.png?dl=1)

Después instalamos docco:

![Ejercicio5b](https://www.dropbox.com/s/zw6iyj9x0r4jx03/Ejercicio5b.png?dl=1)

Y ahora para generar la documentación pues hacemos: **docco *js** y se genera por cada .js un fichero html.

###Ejercicio7: Utilizando mocha.

Instalación de mocha con npm:

![Ejercicio7a](https://www.dropbox.com/s/4e561r4mvaj8hqg/Ejercicio7a.png?dl=1)

En el siguiente fichero es para ver si se carga todo bien o no:

![Ejercicio7b](https://www.dropbox.com/s/ekoqecsbymog2g3/Ejercicio7b.png?dl=1)


###Ejercicio8: Ejercicio: Haced los dos primeros pasos antes de pasar al tercero.

Para poder hacer la integración con Travis debemos tener en nuestro repositorio el fichero .travis.yml configurado con el lenguaje que estamos utilizando y solamente decirle a Travis que sincronize.

![Ejercicio8](https://www.dropbox.com/s/6i1drppa9sck3cx/Ejercicio8.png?dl=1)
