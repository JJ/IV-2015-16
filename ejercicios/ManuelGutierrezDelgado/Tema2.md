#Tema 2

##Ejercicio 1.
##Instalar alguno de los entornos virtuales de node.js (o de cualquier otro lenguaje con el que se esté familiarizado) y, con ellos, instalar la última versión existente, la versión minor más actual de la 4.x y lo mismo para la 0.11 o alguna impar (de desarrollo).

Vamos a instalar NVM, para instalarlo hay que hacer lo siguiente:
 - Escribimos la siguiente orden: sudo curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
 - Instalamos node.js ejecutando la orden **nvm install stable**
 - Después de instalar node.js, instalamos las versiones más existentes que son la v0.11.6 y la v0.12.7, esto se hace ejecutando: **nvm install v0.11.6** y **nvm install v0.12.7** .

![Versiones Node.js](https://i.gyazo.com/9c1fb3810a64780ba694329d334837f6.png)


##Ejercicio 2.
##Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido. Se trata de hacer una aplicación simple que se pueda hacer rápidamente con un generador de aplicaciones como los que incluyen diferentes marcos MVC. Si cuesta mucho trabajo, simplemente prepara una aplicación que puedas usar más adelante en el resto de los ejercicios.

He realizado la web con **Node.js** siguiendo los pasos del siguiente tutorial:
[Tutorial](http://codehero.co/nodejs-y-express-instalacion-e-iniciacion/).

![Aplicacion con Node.js](https://i.gyazo.com/1159bc1f50eb239344d681bd6bbc895d.png)


##Ejercicio3
##Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?

![v0.11.6](https://i.gyazo.com/a8806f0641519e9baa64c260852e305b.png)

![v0.12.7](https://i.gyazo.com/80aed1237c1deecaba7aa33e3d0a9ff7.png)


##Ejercicio4 
##Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente.

Dentro del directorio de nuestra aplicación si ejecutamos **npm init**, automaticamente se crea el package.json.

![package.json](https://i.gyazo.com/343364853ac30bb08ea32b5986effd10.png)


#Ejercicio 5.
##Automatizar con grunt y docco (o algún otro sistema) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.

Instalamos grunt con el comando **sudo npm install -g grunt-cli**

![https://gyazo.com/9b13583306376bf1a62cda8034cdd03a](https://i.gyazo.com/9b13583306376bf1a62cda8034cdd03a.png)

Instalamos docco con el comando **sudo npm install docco grunt-docco --save-dev**.

![https://gyazo.com/e688adf370bb87ec39645e140a4240ea](https://i.gyazo.com/e688adf370bb87ec39645e140a4240ea.png)

Al terminal de instalar, para generar la documentación hacemos: **docco *js** y se genera por cada **.js** un fichero **html**.
