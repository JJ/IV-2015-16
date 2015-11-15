### Ejercicio 1
![10](https://www.dropbox.com/s/7r45ii8883v2jr4/1.png?dl=1)
![11](https://www.dropbox.com/s/t854grqpvsq1qv6/2.png?dl=1)
![12](https://www.dropbox.com/s/adu3g8uwv8cr2pi/3.png?dl=1)
![13](https://www.dropbox.com/s/0db2urnfffye8c0/4.png?dl=1)

### Ejercicio 2
![20](https://www.dropbox.com/s/rr923u6roal4brk/1.png?dl=1)
![21](https://www.dropbox.com/s/t179krzodd37zic/2.png?dl=1)
![22](https://www.dropbox.com/s/fnrs6g6m5edhd5a/3.png?dl=1)
![23](https://www.dropbox.com/s/6ypi8i3ks81mg7h/4.png?dl=1)
![24](https://www.dropbox.com/s/e73kxjoj6oq7l0c/5.png?dl=1)
![25](https://www.dropbox.com/s/h6jxn684p552alx/6.png?dl=1)

### Ejercicio 3
La aplicación que uso la he creado en Flask. 
Aquí dejo el código (el archivo se llama ejer3.py):

	# -*- coding:utf-8 -*-

	from flask import Flask

	app =Flask(__name__)

	@app.route('/')
	def helloworld():
		return "Aloha mundo :3"
	
	@app.route('/user/<username>')
	def mostrarPerfilUsuario(username):
	    # Mostrar el perfil de usuario
	    return 'Aloha %s :3' % username
	
	@app.errorhandler(404)
	def page_not_found(error):
	    return "Página no encontrada "+str(404)
	
	if __name__ == "__main__":
	    app.debug=True
	    app.run()
### Ejercicio 4
Aquí dejo el código de los tests:

	import os
	import ejer3
	import unittest
	import tempfile
	
	class ejer3TestCase(unittest.TestCase):
		# Aqui empieza el esqueleto principal
	    def setUp(self):
	        self.db_fd, ejer3.app.config['DATABASE'] = tempfile.mkstemp()
	        ejer3.app.config['TESTING'] = True
	        self.app = ejer3.app.test_client()
	        #ejer3.init_db()
	
	    def tearDown(self):
	        os.close(self.db_fd)
	        os.unlink(ejer3.app.config['DATABASE'])
	
		# Aqui acaba el esqueleto principal
	
	
	    def test_index(self):
	        rv = self.app.get('/')
	        assert 'Aloha mundo :3' in rv.data
	
	    def test_user(self):
	        rv = self.app.get('/user/pepe')
	        assert 'Aloha pepe :3' in rv.data
	
    	def test_not_found(self):
	        rv = self.app.get('/u')
	        assert '404' in rv.data
	
	
	if __name__ == '__main__':
	    unittest.main()
### Ejercicio 5
Aquí dejo un enlace a mi aplicación:

[Aplicación](https://smsbdtradicional.herokuapp.com/)
### Ejercicio 6

### Ejercicio 7
Para configurar el despliegue automático utilizo Travis CI, diciéndole a Heroku que no despliegue hasta pasar los test:
![70](https://www.dropbox.com/s/sk35zbpc05nwqlz/1.png?dl=1)
### Ejercicio 8
Aquí dejo un enlace a mi aplicación:

[Aplicación](https://smsbdtradicional.herokuapp.com/)

He elegido Heroku por su archivo de configuración, Procfile.
