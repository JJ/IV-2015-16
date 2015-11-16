# Ejercicios Tema 3

## Ejercicio 1
### Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.

Me he dado de alta en el servicio Openshift y Heroku

## Ejercicio 2
### Crear una aplicación en OpenShift y dentro de ella instalar WordPress.

Para crear la aplicación pulsamos **Add aplication** y un poco más abajo en la sección **Instant App** seleccionamos **WordPress4**. Por último elegimos la ruta de la aplicación bajo un subdominio de rhcloud.
Podemos dejar el repositorio que trae por defecto para que se cree una copia o bien establecer el nuestro propio, en este caso se dejará el que trae por defecto.

Una vez terminado el proceso aparecerá en nuestro *dashboard* la aplicación creada, este ejemplo se encuentra en la siguiente [dirección](https://luqueburgosjm-iv1516.rhcloud.com/).

## Ejercicio 3
### Realizar una app en express (o el lenguaje y marco elegido) que incluya variables como en el caso anterior.

La aplicación usada está en éste [repositorio](https://github.com/luqueburgosjm/HerokuTest)

## Ejercicio 4
### Crear pruebas para las diferentes rutas de la aplicación.

Las pruebas están en éste [directorio](https://github.com/luqueburgosjm/HerokuTest/tree/master/test)

## Ejercicio 5
### Instalar y echar a andar tu primera aplicación en Heroku.

Tras registrarnos en Heroku instalamos el *cinturón de herramientas* de Heroku, en arch podemos hacerlo de la siguiente forma:

```bash
  $ yaourt -Ss heroku-toolbelt
aur/heroku-toolbelt 3.42.15-1 [installed] (101)
    Everything you need to get started using Heroku (including foreman)

```

Una vez instalado, ejecutamos heroku login e introducimos nuestros credenciales.

Antes de continuar con el despliegue debemos crear el archivo Procfile, que será leído por Heroku y añadimos el siguiente contenido:

```json
web: node app.js
```

A continuación ejecutamos
```bash
  # Configura los repositorios remotos, podemos verlo con git remote -v
  $ heroku create
  # Subir el contenido del repositorio a Heroku
  $ git push heroku master
  # Establecemos almenos una instancia para la web
  $ heroku ps:scale web=1
  # Abrir en el navegador el contenido desplegado
  $ heroku open
```

La aplicación se encuentra subida en ésta [dirección](https://calm-castle-5205.herokuapp.com/porras).
