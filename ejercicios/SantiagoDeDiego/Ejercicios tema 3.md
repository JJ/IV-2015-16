#Ejercicio 1

En mi caso he escogido Heroku, ya que parece el más interesante de los tres. Me he dado de alta utilizando mi cuenta de gmail.

#Ejercicio 2

Primero de todo me he dado de alta en OpenShift usando la misma cuenta de correo que antes. Una vez hecho esto, me aparece la siguiente pantalla, elijo wordpress:

![OpenShift](http://i864.photobucket.com/albums/ab201/Santiago_de_Diego/OpenShift_zps32wpjaex.png)

Ahora simplemente vamos rellenando los campos que nos piden hasta que llegamos a la pantalla donde tenemos que poner un usuario y una contraseña. La rellenamos y ya aparecemos en la página principal de wordpress:

![Wordpress](http://i864.photobucket.com/albums/ab201/Santiago_de_Diego/Wordpress_zpsoum8ns6w.png)

#Ejercicio 3

Para este ejemplo he hecho una aplicación en Flask muy sencilla que simplemente dependiendo de la ruta que le pongamos hace una cosa u otra:

```
from flask import Flask,Response
app = Flask(__name__)

@app.route("/")
def html():
	return """
	<html>
	<head>
	</head>
	<body>
	<p>Esto es una pagina estática con una imagen</p>
	<p><img SRC="https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Sasso_lungo_da_passo_pordoi.jpg/270px-Sasso_lungo_da_passo_pordoi.jpg"</p>
	</body>
	</html>
	"""

@app.route('/user/<username>')
def mostrarPerfilUsuario(username):
    # Mostrar el perfil de usuario
    return 'Hola %s' % username

@app.errorhandler(404)
def page_not_found(error):
    return "Página no encontrada", 404

if __name__ == "__main__":
    app.run(debug=True)
```

En esta aplicación sencilla por ejemplo, si nosotros ponemos en la ruta por ejemplo `/user/santiago` nos escribe por pantalla: Hola santiago. Además con la ruta `/` nos saca una página HTML muy sencilla. Ni siquiera he utilizado templates para esta aplicación.


Se puede ver la aplicación desplegada en heroku [aquí](https://appbasicaflask.herokuapp.com)

##Nota
Los pasos detallados de como desplegar una aplicación en Flask en Heroku están detallados en el [repositorio de mi proyecto](https://github.com/santidediego/Landscapes/blob/master/README.md)

#Ejercicio 4

#Ejercicio 5

Primero de todo descargamos el cinturón de herramientas de Heroku, y una vez hecho esto ejecutamos `heroku login`. Después nos descargamos de github la aplicación de ejemplo de nodejs del repositorio [Aplicación de ejemplo](git@github.com:heroku/node-js-getting-started.git).

Ejecutamos `heroku create` para crear una aplicación en Heroku con nuestro repositorio. En este caso, existe un archivo Procfile, pero de no existir, lo creamos e incluimos:

```
web: node index.js
```

Una vez hecho esto, sin más que ejecutar `git push heroku master` tenemos nuestra aplicación subida a Heroku.


#Ejercicio 6

Para ejecutar foreman, he tenido un problema y es que el cinturón de herramientas de Heroku no me lo ha instalado y he tenido que instalarlo por separado del [repositorio de foreman](https://github.com/ddollar/foreman). No obstante, he tenido otro error durante la instalación de esta manera y al final lo que me ha funcionado es hacer `sudo gem install foreman` Una vez hecho esto he ejecutado `foreman start web` y me ha saltado un error. Esto es debido a que mi MAC después de la última actualización lleva instalado un Firewall y me estaba bloqueando la aplicación. Desactivándolo ya funciona perfectamente. Aquí podemos verlo:

![Foreman](http://i864.photobucket.com/albums/ab201/Santiago_de_Diego/Foreman_zps0sxpjmqk.png)

La parte de los test viene explicada con detalle en el ejercicio siguiente, en el cual configuraré el despliegue automático para la aplicación *ev_empresas* y configuraré Heroku para que se sincronice con github automáticamente siempre y cuando se pasen los tests.

#Ejercicio 7

Una vez hecho esto hacemos lo mismo con la aplicación *ev_empresas* que utilicé en la práctica anterior. Una vez la aplicación está subida a Heroku tenemos que configurar Heroku y github para que se sincronice automáticamente cuando se haga un `git push` con Heroku.

Para ello vamos a utilizar Snap CI. Simplemente nos creamos una cuenta y una vez creada se nos sincroniza automáticamente con Github. Para ello sólo tenemos que marcar el repositorio que queremos que sincronice, en este caso *ev_empresas*:

![Snap CI](http://i864.photobucket.com/albums/ab201/Santiago_de_Diego/Snap%20CI_zpsbutgjcnp.png)

Este es el método de sincronización automática que nos ofrece Snap CI, pero yo prefiero utilizar otra herramienta para este fin, que es la que nos ofrece el propio Heroku para sincronizarse automáticamente con Github, que de hecho es la que he utilizado para mi proyecto.

El procedimiento es muy sencillo, simplemente entramos en nuestra aplicación en Heroku y clicamos en *Deploy*. Una vez ahí marcamos la opción sincronizar con Github, seleccionamos nuestro repositorio, introducimos nuestras credenciales y ya está hecho. Podemos ver la pantalla en la imagen siguiente:

![Heroku + Github](http://i864.photobucket.com/albums/ab201/Santiago_de_Diego/herokugithub%20node_zpst2wxclkd.png)

Aquí podemos ver porqué prefiero este método que utilizar Snap CI. Con este sistema nos aparece un botón para marcar que nos dice que sólo se activará la subida a Heroku si tenemos la integración continua configurada, en otras palabras, si se han pasado correctamente los tests.

Para comprobarlo, he quitado dos botones inútiles que tenía en la página y he hecho `git push`. Ahora veremos si después de pasar los tests aparecen o no en Heroku.