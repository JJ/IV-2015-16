# Ejercicios de Rubén Martín Hidalgo
## Tema 2
### Ejercicio 1: Instalar alguno de los entornos virtuales de node.js y, con ellos, instalar la última versión existente, la versión minor más actual de la 0.12 y lo mismo para la 0.11 o alguna impar.

En mi caso me he decantado por NVM. Para su instalación, hay que seguir los siguientes pasos:

1. Descargamos el script de instalación de nvm: *curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.28.0/install.sh | bash*

2. El comando anterior habrá clonado el repositorio en ~/.nvm y por tanto ya tenemos instalado nvm. 

3. Ejecutamos *source ~/.profile* en el terminal, para recargar el archivo ~/.profile.

4. Ya podemos instalar alguna versión de node.js, podemos ver las que hay disponibles con: *nvm ls-remote*

5. Para instalar la versión estable más moderna podemos poner: *nvm install stable* que nos instala la v4.1.2

6. También instalamos las versiones más recientes de la 0.12 y la 0.11 con: *nvm install v0.12.7* y *nvm install v0.11.16*

7. Por último, podemos ver las versiones instaladas con el comando *nvm ls*.

![Versiones nodejs instaladas](https://www.dropbox.com/s/brsg2qi0l38vmcg/VersionesNodejs.PNG?dl=1)

### Ejercicio 2: Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.

1. Decimos a NVM la versión de Node.js que queremos usar con: *nvm use v4.1.2*

Procedemos a instalar una base de datos, en mi caso he elegido MongoDB: 

2. Importamos la llave pública del sistema: *sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10*

3. Agregamos el repositorio de MongoDB: *echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list*

4. Actualizamos los paquetes de apt-get: *sudo apt-get update*

5. Instalamos MongoDB: *sudo apt-get install -y mongodb-org*

6. Y por último, iniciamos el proceso que actua como servidor de mongo: *sudo service mongod start*

Ahora vamos a instalar el Node.js MondoDB Driver siguiendo los siguientes pasos:

7. *sudo apt-get install libkrb5-dev*

8. *npm install mongodb*

9. *npm install bcrypt-nodejs*

También he instalado SQLite con: *npm install sqlite3*

Con esto ya tenemos Node.js y las bases de datos listos para comenzar a programar!!

En mi caso, he creado un chat online. El repositorio del programa que he creado esta [aquí](https://github.com/romilgildo/Chat)

Para ejecutarlo simplemente, clonamos el repositorio con *git clone*, y hacemos *node server.js* en el directorio raíz de la aplicación.

Aquí una muestra de la aplicación funcionando:

![Chat funcionando](https://www.dropbox.com/s/lowzouqp7ulozm9/ChatFuncionando.PNG?dl=1)

### Ejercicio 3: Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?

Ya hemos probado antes en la versión estable 4.1.2 de node.js. Ahora probamos con el resto de versiones que habíamos instalado en el ejercicio 1:

- v0.11.16 -> Funciona correctamente
- v0.12.7 -> Funciona correctamente

![Funciona en todas las versiones probadas](https://www.dropbox.com/s/hh8gis6271t5nq0/ChatFuncionandoOtrasversiones.PNG?dl=1)

### Ejercicio 4: Crear una descripción del módulo usando package.json o el equivalente en otro lenguaje.

Lo he hecho con el comando *npm init* ejecutado dentro del directorio de la aplicación.
Solo habrá que ir rellenando los distintos parámetros que nos pide. Al final nos queda algo así:

![Ejemplo de package.json](https://www.dropbox.com/s/gwhoyu8ipsbubfr/packageJSON.PNG?dl=1)
