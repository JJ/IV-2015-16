#Ejercicio 1
### Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.

Nos daremos de alta en [Heroku](https://www.heroku.com), yendo a su página principal. Dentro pulsamos en sign up para ir a la siguiente ventana:

![](https://www.dropbox.com/s/uq7am742hv0d94v/REGISTRO_HEROKU_1.png?dl=1)

Después de rellenar el formulario con el email, nos saldrá la siguiente ventana:

![](https://www.dropbox.com/s/f8c8l3aogpegknh/REGISTRO_HEROKU_2.png?dl=1)

Nos metemos en nuestro correo, y seguimos el enlace de activación. Tras hacerlo, nos pedirá que guardemos una contraseña, y nos aparecerá el menú principal de Heroku:

![](https://www.dropbox.com/s/m4j3jvq0p1skwa7/REGISTRO_HEROKU_3.png?dl=1)

#Ejercicio 2

#### Crear una aplicación en OpenShift y dentro de ella instalar WordPress.

Nos vamos a la página de [OpenShift](https://www.openshift.com/), y si no tenemos cuenta, nos hacemos una pulsando en el boton Sign up for free.

![](https://www.dropbox.com/s/1qek3jwotfwf7vr/Ej3_1.png?dl=1)

UNa vez creada y desde el menú de nuestra cuenta,nos aparecerá una pantalla de bienvenida, donde pulsaremos sobre "Create your first application now"

En el primer apartado (Instant app), pulsamos sobre WordPress 4. Rellenamos todos los campos del formulario (en este caso, la aplicación ejecutada será la que viene de prueba, que descargará de un repositorio de git).

![](https://www.dropbox.com/s/tftsz2zxxczsqy0/ejercicio2.png?dl=1	)

Esperamos un tiempo hasta que se cree (tarda bastante). Después, una vez creada, la plataforma nos proporcionará los datos de acceso a la base de datos para poder realizar las operaciones que nos interesen

![](https://www.dropbox.com/s/qx8j6lex3nx5vh2/ejercicio2-1.png?dl=1)


#Ejercicio 3
#### Realizar una app en express (o el lenguaje y marco elegido) que incluya variables como en el caso anterior.
En los ejercicios del [Tema 2](https://github.com/JJ/IV-2015-16/blob/master/ejercicios/JoseAntonioGonzalez/Tema2.md) se pidió crear una aplicación. En ese momento, usé como lenguaje Python, y como framework para crear una aplicacion web, **webapp2** (que podría ser un equivalente a express en js). 

Sin embargo en ese ejercicio no se pedía un tratamiento de variables (no desde URL, aunque si se tratan desde formularios). De modo que para este ejercicio, he reutilizado esa aplicación, añadiendo una nueva página que imprime una variable dada por URL.

Cooncretamente, el fragmento de código incorporado es el siguiente:

	[...]
    class PaginaPruebaVariable(webapp2.RequestHandler):
    def get(self,parametro):
        self.response.write( 'Parametro recibido: %s' % parametro)
        
        [...]
        aplicacion = webapp2.WSGIApplication([
        [...]
        (r'/prueba/(\w+)', PaginaPruebaVariable),
					], debug=True)
        
        
Aunque se puede apreciar mejor [en el commit del repo con la modificacion](https://github.com/JA-Gonz/appEjercicioIV/commit/d1f0b16f1d345d7ebb1421e976358996939d59c9)

Como vemos, imprime la variable proporcionada en la URL:

![](https://www.dropbox.com/s/7pjxqn9c6xps70e/ejercicio3.png?dl=1)
    
#Ejercicio 4

#### Crear pruebas para las diferentes rutas de la aplicación. 

El codigo usado es el siguiente (se ha incorporado a las pruebas ya existentes del hito anterior)

	def test_prueba(self):
            request = webapp2.Request.blank('/prueba')
            response = request.get_response(pasarelatest.aplicacion())

            (response.body).should.contain('Parametro')

	def test_prueba_con_parametro(self):

            request = webapp2.Request.blank('/prueba/valor_prueba')

            response = request.get_response(pasarelatest.aplicacion())
            (response.body).should.contain('valor_prueba')

#Ejercicio 5
#### Instalar y echar a andar tu primera aplicación en Heroku.
[Enlace a la aplicacion](appejercicioiv.herokuapp.com) (appejercicioiv.herokuapp.com)
            
#Ejercicio 7
#### Haz alguna modificación a tu aplicación en node.js para Heroku, sin olvidar añadir los tests para la nueva funcionalidad, y configura el despliegue automático a Heroku usando Snap CI o alguno de los otros servicios, como Codeship, mencionados en StackOverflow
He modificado la app de forma que he metido una URL mas de prueba. Todos los cambios hechos están [en este commit](https://github.com/JA-Gonz/appEjercicioIV/commit/6c08ca76aacbae42e3bce076713f85cd73bd1fa8)

Dentro de Heroku, tenemos que configurar la aplicación para que se despliegue automáticamente después de pasar los test del CI (en este caso, seguimos usando Travis).

Para ello, nos vamos en el menú de la izquierda a "Personal Apps" -> appejercicioiv (en este caso, pero aqui sale el nombre de la app) -> Deploy -> Enable Automatic Deploy (marcando el tick de Wait for CI to pass before deploy )

![](https://www.dropbox.com/s/41do46brnj0aq93/practica_heroku.png?dl=1)
#Ejercicio 8
#### Preparar la aplicación con la que se ha venido trabajando hasta este momento para ejecutarse en un PaaS, el que se haya elegido. 
Si atendemos a las últimas lineas del fichero principal de la aplicación, vemos lo siguiente:

	def main():
    	from paste import httpserver
   		httpserver.serve(aplicacion, host='127.0.0.1', port='8080')

	if __name__ == '__main__':
    	main()
    
Con Webapp2, estas sentencias configuran el servidor para una IP concreta y puerto.

Como se ha enlazado en el ejercicio 5, la aplicación resultante está en el siguiente enlace:

[Enlace a la aplicacion](appejercicioiv.herokuapp.com) (appejercicioiv.herokuapp.com)