#Ejercicio 1
### Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.

Nos daremos de alta en [Heroku](https://www.heroku.com), yendo a su página principal. Dentro pulsamos en sign up para ir a la siguiente ventana:

![](REGISTRO_HEROKU_1.png)

Después de rellenar el formulario con el email, nos saldrá la siguiente ventana:

![](REGISTRO_HEROKU_2.png)

Nos metemos en nuestro correo, y seguimos el enlace de activación. Tras hacerlo, nos pedirá que guardemos una contraseña, y nos aparecerá el menú principal de Heroku:

![](REGISTRO_HEROKU_3.png)

#Ejercicio 2

#### Crear una aplicación en OpenShift y dentro de ella instalar WordPress.

Nos vamos a la página de [OpenShift](https://www.openshift.com/), y si no tenemos cuenta, nos hacemos una pulsando en el boton Sign up for free.

![](Ej3_1.png)

UNa vez creada y desde el menú de nuestra cuenta,nos aparecerá una pantalla de bienvenida, donde pulsaremos sobre "Create your first application now"

En el primer apartado (Instant app), pulsamos sobre WordPress 4. Rellenamos todos los campos del formulario (en este caso, la aplicación ejecutada será la que viene de prueba, que descargará de un repositorio de git).

![](ejercicio2)

Esperamos un tiempo hasta que se cree (tarda bastante). Después, una vez creada, la plataforma nos proporcionará los datos de acceso a la base de datos para poder realizar las operaciones que nos interesen

![](ejercicio2_1)


#Ejercicio 3

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

![](Ejercicio 3)
    
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
            
            