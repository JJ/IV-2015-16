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

![Versiones nodejs instaladas](https://www.dropbox.com/s/mpr5nxeobktxvfh/Captura%20de%20pantalla%20de%202015-10-21%2016%3A55%3A09.png?dl=0)

### Ejercicio 2: Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.

El tutorial que he seguido para crear la aplicación está [aquí](https://openwebinars.net/aprende-realizar-una-aplicacion-con-django-el-mundial-de-brasil-2014/)

El repositorio del programa que he creado esta [aquí](https://github.com/javiexfiliana7/app_futbol_nodejs.git)

Para ejecutarlo simplemente, clonamos el repositorio con *git clone* entramos en la carpeta, y hacemos *node server.js* en el directorio raíz de la aplicación.

Aquí una muestra de la aplicación funcionando:

![Aplicacion](https://www.dropbox.com/s/2qr7yl8ga8ylh3s/Captura%20de%20pantalla%20de%202015-10-23%2011%3A19%3A37.png?dl=0)
![Aplicacion](https://www.dropbox.com/s/64w88jjjfh079i2/Captura%20de%20pantalla%20de%202015-10-23%2011%3A24%3A46.png?dl=0)
![Aplicacion](https://www.dropbox.com/s/8imqe6z4noas7z0/Captura%20de%20pantalla%20de%202015-10-23%2011%3A25%3A19.png?dl=0)

