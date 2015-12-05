# Ejercicios del tema 3

## Ejercios 1: Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.

Nos creamos una cuenta en OpenShift, validamos el correo y entramos en la página.

![Ventan principal OpenShift](http://imageshack.com/a/img905/3218/mzeWhM.png)

## Ejercicios 2: Crear una aplicación en OpenShift y dentro de ella instalar WordPress.

Para instalar en OpenShift WordPress tenemos que seleccionar WordPress en el menú de apps a instalar.

![Seleccionar WordPress](http://imageshack.com/a/img908/8074/3qcKen.png)

En la siguiente pantalla se pide rellenar un formulario. En este formulario podrás definir la **URL** de la aplicación web, la escalabilidad, etc...

![Configurar WordPress](http://imageshack.com/a/img910/172/Ol0MzC.png)

En unos minutos finaliza la instalación de **Wordpress** donde, además, se instala **php 5.4** y **MySQL 5.5**. Después comenzará la configuración propia de Wordpress donde se nos pide seleccionar el idioma.

![Seleccionar idioma WordPress](http://imageshack.com/a/img911/2184/WaB5NF.png)

Y ya tendremos nuestro blog en funcionamiento.

![Página de ejemplo Wordpress](http://imageshack.com/a/img903/6532/Z7vUny.png)

## Ejercicios 3. Realizar una app en express (o el lenguaje y marco elegido) que incluya variables como en el caso anterior.

Para realizar este ejercicio he programado una sencilla app con el **microframework** Flask:

    app.config.from_object(__name__)

    def connect_db():
        return sqlite3.connect(app.config['DATABASE'])

    def init_db():
        with closing(connect_db()) as db:
            with app.open_resource('schema.sql', mode='r') as f:
                db.cursor().executescript(f.read())
            db.commit()

    @app.before_request
    def before_request():
        g.db = connect_db()

    @app.teardown_request
    def teardown_request(exception):
        db = getattr(g, 'db', None)
        if db is not None:
            db.close()

    @app.route('/')
    @app.route('/index')
    def index():
    	return '''
    		<center>Este es un index de prueba</center>
    	'''
    @app.route('/user')
    @app.route('/user/<user>')
    def user(user=None):
    	if(user!=None):
    		return "<center>Bienvenido " + user + "</center>"
    	return "<center>Bienvenido</center>"

    if __name__ == "__main__":
    	app.debug = True
    	app.run()

## Ejercicios 4. Crear pruebas para las diferentes rutas de la aplicación.
Los test los he realizado siguiendo este [tutorial](http://flask.pocoo.org/docs/0.10/testing/):

    import os
    import ejercicio3
    import unittest
    import tempfile

    class FlaskrTestCase(unittest.TestCase):

    	def setUp(self):
    		self.db_fd, ejercicio3.app.config['DATABASE'] = tempfile.mkstemp()
    		ejercicio3.app.config['TESTING'] = True
    		self.app = ejercicio3.app.test_client()
    		ejercicio3.init_db()

    	def tearDown(self):
    		os.close(self.db_fd)
    		os.unlink(ejercicio3.app.config['DATABASE'])

    	def test_empty_db(self):
    		rv = self.app.get('/')
    		assert '<center>Este es un index de prueba</center>' in rv.data

    	def test_user(self):
    		rv = self.app.get('/user/alfredo')
    		assert '<center>Bienvenido alfredo</center>'

    	def test_other_user(self):
    		rv = self.app.get('/user/otrousuario')
    		assert '<center>Bienvenido otrousuario</center>'

    if __name__ == '__main__':
        unittest.main()

## Ejercicios 5. Instalar y echar a andar tu primera aplicación en Heroku.
Para hacer este ejercicio, he seguido el [siguiente tutorial](https://devcenter.heroku.com/articles/getting-started-with-python#introduction). Como paso primero, debemos darnos de alta en la [página oficial de Heroku](https://signup.heroku.com/dc).

Una vez iniciada sesión, vamos a descargar e instalar las herramientas de Heroku. Para eso, en nuestra terminal:

    $ wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh

Después, iniciamos sesión con las credenciales del alta desde terminal:

    $ heroku login

Ahora preparamos una aplicación sencilla, podemos descargar la que nos ofrece Heroku haciendo un simple fork a su repositorio de ejemplo

    $ git clone https://github.com/heroku/python-getting-started.git

Acto seguido creamos la aplicación de Heroku preparada para subir nuestro código y lanzamos la aplicación:

    $ heroku create
    $ git push heroku master

En la salida de esta sentencia nos dan un [enlace a nuestra página](https://floating-dawn-2998.herokuapp.com/)

![Heroku](https://www.dropbox.com/s/qd9zgldzc2dzp7m/Heroku1.png?dl=1)

## Ejercicios 6. Usar como base la aplicación de ejemplo de heroku y combinarla con la aplicación en node que se ha creado anteriormente. Probarla de forma local con foreman. Al final de cada modificación, los tests tendrán que funcionar correctamente; cuando se pasen los tests, se puede volver a desplegar en heroku.
