Tema 2
===
> Mariano Palomo Villafranca

#### Ejercicio 1: Instalar alguno de los entornos virtuales de node.js (o de cualquier otro lenguaje con el que se esté familiarizado) y, con ellos, instalar la última versión existente, la versión minor más actual de la 4.x y lo mismo para la 0.11 o alguna impar (de desarrollo).

Elegimos, por ejemplo, instalar `nvm`. Para ello, hacemos lo siguiente:

- Obtenemos el script de instalación a través del comando: `curl https://raw.githubusercontent.com/creationix/nvm/v0.11.1/install.sh | bash`.
- A continuación, una vez se vean regflejados los cambios que `nvm` realiza sobre el directorio (puede que sea necesario cerrar y reabrir la terminal), ejecutamos `source ~/.profile`.
- Escribimos `nvm ls-remote` para comprobar las versiones disponibles.
- Y ahora instalamos la última versión de la 4.x y lo mismo para la 0.11:

      nvm install v4.2.1
      nvm install v0.11.16

- Y por último comprobamos las versiones instaladas con:

```
$ nvm ls
    v0.11.16
->    v4.2.1
```
Fuente: [Digital Ocean](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-with-nvm-node-version-manager-on-a-vps)

#### Ejercicio 2: Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.

Se ha creado una aplicación con las funcionalidades requeridas utilizando Django. El link al respositorio en github es [este].(https://github.com/mpvillafranca/empresas)
