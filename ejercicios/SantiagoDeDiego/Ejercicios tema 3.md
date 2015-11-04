#Ejercicio 1

En mi caso he escogido Heroku, ya que parece el más interesante de los tres. Me he dado de alta utilizando mi cuenta de gmail.

#Ejercicio 2

Primero de todo me he dado de alta en OpenShift usando la misma cuenta de correo que antes. Una vez hecho esto, me aparece la siguiente pantalla, elijo wordpress:

![OpenShift](http://i864.photobucket.com/albums/ab201/Santiago_de_Diego/OpenShift_zps32wpjaex.png)

Ahora simplemente vamos rellenando los campos que nos piden hasta que llegamos a la pantalla donde tenemos que poner un usuario y una contraseña. La rellenamos y ya aparecemos en la página principal de wordpress:

![Wordpress](http://i864.photobucket.com/albums/ab201/Santiago_de_Diego/Wordpress_zpsoum8ns6w.png)

#Ejercicio 3

#Ejercicio 4
Primero de todo descargamos el cinturón de herramientas de Heroku, y una vez hecho esto ejecutamos `heroku login`. Después nos descargamos de github la aplicación de ejemplo de nodejs del repositorio [Aplicación de ejemplo](git@github.com:heroku/node-js-getting-started.git).

Ejecutamos `heroku create` para crear una aplicación en Heroku con nuestro repositorio. Una vez hecho esto, sin más que ejecutar `git push heroku master` tenemos nuestra aplicación subida a Heroku.

Para ejecutar foreman, he tenido un problema y es que el cinturón de herramientas de Heroku no me lo ha instalado y he tenido que instalarlo por separado del [repositorio de foreman](https://github.com/ddollar/foreman). No obstante, he tenido otro error durante la instalación de esta manera y al final lo que me ha funcionado es hacer `sudo gem install foreman`