##Ejercicios 1: Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift. ##
Me he dado de alta en Heroku y en OpenShift como se puede ver en las siguientes imágenes:

![heroku](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/Captura%20de%20pantalla%20de%202015-11-04%20112056_zpslltlhm7r.png)
![openshift](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/Captura%20de%20pantalla%20de%202015-11-04%20112413_zpsm8s2etno.png)

##Ejercicios 2: Crear una aplicación en OpenShift y dentro de ella instalar WordPress. ##
Esta es la aplicación sencilla que he creado en wordpress dentro de OpenShift [aplicación en wordpress] (http://php-ejer2.rhcloud.com/). Aquí una captura:
![wordpress](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/Captura%20de%20pantalla%20de%202015-11-06%20095758_zpsnafyfc5j.png)

##Ejercicios 3: Realizar una app en express (o el lenguaje y marco elegido) que incluya variables como en el caso anterior.##
Ya que mi proyecto lo estoy haciendo conunto con DAI, este ejercicio lo he hecho con una aplicación de Python con el micro framework Flask, mediante el cual uso varias variables para guardar usuarios mediante la ruta de la dirección como en el ejemplo. Esta es mi app, la cual tiene cuatro rutas distintas:
```
from wtforms import *
from flask import Flask, session, redirect, url_for, escape, request, render_template
import sys, pydoc
from HTMLParser import HTMLParser

reload(sys)
sys.setdefaultencoding('utf-8')
app = Flask(__name__)
#Expresion regular para que el numero de VISA sea corecto
regVISA='(\d\d\d\d)[ \-](\d\d\d\d)[ \-](\d\d\d\d)[ \-](\d\d\d\d)$'
listUsers = []
listSurna = []

class RegistrationForm(Form):
	username = TextField('Nombre: ', [validators.Length(min=4, max=25)])
	userap = TextField('Apellidos: ', [validators.Length(min=4, max=50)])
	email = TextField('Correo electronico', [validators.Length(min=6, max=35),validators.Required(),validators.Email(message='El email es incorrecto')])
	visaNum = TextField('Numero de VISA', [validators.Length(min=6, max=35),validators.Required(),validators.Regexp(regVISA, flags=0, message='Numero de VISA incorrecto')])
	nacimiento = DateField('Fecha de nacimiento: ', format='%Y-%m-%d')
	direccion = TextField('Direccion: ', [validators.Length(min=6, max=60)])
	password = PasswordField('Contrasenia', [validators.Required(),validators.EqualTo('confirm', message='La contrasenia debe coincidir con la repeticion')])
	confirm = PasswordField('Repite la contrasenia')
	accept_tos = BooleanField('Acepto las condiciones', [validators.Required()])
	formaPago = SelectField(u'Forma de pago', choices=[('contra', 'Contra reembolso'), ('visa', 'Tarjeta VISA')])

@app.route('/register', methods=['GET', 'POST'])
def register():
	form = RegistrationForm(request.form)
	if request.method == 'POST' and form.validate():
		return('Gracias %s por registrarte!' % form.username.data)
	return render_template('register.html', form=form)

@app.route('/users')
def showUsers():
	return 'Esta es la lista de usuarios registrados: ' + ',\n'.join(map(str,listUsers))

@app.route('/add/<username>')
def	addUser(username):
	listUsers.append(username)
	return 'Usuario registrado. Pruebe /users para ver los usuarios'

@app.route('/')
def index():
	form = RegistrationForm(request.form)
	return render_template('index.html', form=form)
	
if __name__ == '__main__':
    app.run(host='0.0.0.0',debug=True)  # 0.0.0.0 para permitir conexiones desde cualquier sitio. Ojo, peligroso en modo debug

```
Y aquí dos capturas añadiendo un usuario:

![add](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/ej8-2_zpskbysdgaa.png)

y mostrando los usuarios:

![user](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/ej3-2_zpspmqt8gtp.png)


##Ejercicios 4: Crear pruebas para las diferentes rutas de la aplicación. ##
He realizado pruebas con la bilbioteca unittest de Python con tres tests, que lo que hacen es: uno comprueba que existe formulariom, otro que el documento es html y otro que existe un css. Aquí el código:
```
import unittest
from formu import register
from HTMLParser import HTMLParser

ini_html = 0
fin_html = 0
hay_css = 0
hay_form = 0
html_css = ""
class ComprobarEtiquetas(HTMLParser):
	def handle_starttag(self, tag, attrs):
		global ini_html
		global hay_css
		global hay_form
		if tag=='html':
			ini_html = 1
		for attr in attrs:
			if (attr[0] == 'href' and attr[1] == '/static/style.css'):
				hay_css = 1
		for attr in attrs:
			if (attr[0] == 'method' and attr[1] == 'post'):
				hay_form = 1
	def handle_endtag(self, tag):
		global fin_html
		if tag=='html':
			fin_html = 1

class TestStringMethods(unittest.TestCase):
	
	def test_comprobarformu(self):
		global hay_form
		hay_form = 0
		parser = ComprobarEtiquetas()
		html_registro=register()
		parser.feed(html_registro)
		self.assertEqual(hay_form,1)


	def test_comprobarHTML(self):
		global ini_html
		ini_html = 1
		parser = ComprobarEtiquetas()
		html_index = index()
		parser.feed(html_index)
		self.assertEqual(ini_html,1)

	def test_comprobarCSS(self):
		global hay_css
		global html_css
		hay_css = 1
		parser = ComprobarEtiquetas()
		html_css=register()
		parser.feed(html_css)
		self.assertEqual(hay_form,1)


if __name__ == '__main__':
    unittest.main()
```
##Ejercicios 5: Instalar y echar a andar tu primera aplicación en Heroku.##
Para realzar este ejercicio lo primero que he hecho ha sido descargar el cinturón de herramientas de heroku con la siguiente línea:
```
wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
```
Una vez hecho esto, hacemos *heroku login* con nuestros credenciales y después procedemos a hacer el clone para guardar el repositorio en nuestra carpeta local:
```
git clone https://github.com/heroku/python-getting-started.git
cd python-getting-started
```
Seguidamente procedemos a desplegar nuestra aplicación, primero hacemos el create que nos creará una aplicación con un nombre aleatorio si no le indicamos ningún nombre:
![create](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/Captura%20de%20pantalla%20de%202015-11-14%20140100_zpsd8feyv9r.png)

Ahora desplegamos nuestro código con *git push heroku master*:
![push](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/Captura%20de%20pantalla%20de%202015-11-14%20140903_zpswqazogve.png)

Después de hacer esto lo último que nos queda es abrir la aplicación con las siguientes órdenes:
```
heroku ps:scale web=1
heroku open
```
En mi caso el nombre aleatorio ha sido [pacific-garden-4019](https://pacific-garden-4019.herokuapp.com/):

![final](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/Captura%20de%20pantalla%20de%202015-11-14%20142852_zpsr8qiibdn.png)

##Ejercicios 6: Usar como base la aplicación de ejemplo de heroku y combinarla con la aplicación en node que se ha creado anteriormente. Probarla de forma local con foreman. Al final de cada modificación, los tests tendrán que funcionar correctamente; cuando se pasen los tests, se puede volver a desplegar en heroku.##


##Ejercicios 7: Haz alguna modificación a tu aplicación en node.js para Heroku, sin olvidar añadir los tests para la nueva funcionalidad, y configura el despliegue automático a Heroku usando Snap CI o alguno de los otros servicios, como Codeship, mencionados en StackOverflow ##

Después de modificar mi aplicación he subido la aplicación a Heroku, [este es el enlace a ella](https://warm-sands-2560.herokuapp.com/). Para ello lo que he hecho ha sido, primero registrarme en heroku, después he clonado mi repositorio donde guardo la aplicación. Lo proximo que hay que hacer es teclear las siguientes órdenes en el terminal dentro del repositorio de nuestra aplicación que hemos clonado:
```
heroku create
git push heroku master
```
Con heroku create, si no le indicamos nada, nos crea la app con un nombre aleatorio, que en mi caso ha sido [warm-sands-2560](https://warm-sands-2560.herokuapp.com/).
Lo proximo que he hecho ha sido crear un proceso de integración contínua junto al despliegue automático tanto en Heroku como en Snap CI. Para realizarlo en heroku, al conectarlo con GitHub debes aceptar la siguiente ventana emergente:

![heroku123](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/Captura%20de%20pantalla%20de%202015-11-16%20005315_zpssvdmjoei.png)

Una vez hecho esto, habilitamos que no despliegue hasta que no pase los tests para la IC:

![ic](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/Captura%20de%20pantalla%20de%202015-11-16%20005451_zpsca57kxdz.png)

Como se puede ver en la imagen el proceso de intregración continua está correctamente configurado.
Otra opción es hacerlo con Snap CI, en el cual debes conectarte con GitHub y aceptar las condiciones:

![snap](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/Captura%20de%20pantalla%20de%202015-11-16%20003846_zpspefwdnws.png)

Y por último, podemos comprobar que también está correctamente configurado el proceso de IC con Snap CI:

![snap1222](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/Captura%20de%20pantalla%20de%202015-11-16%20004423_zpsqfhzcdku.png)


##Ejercicios 8: Preparar la aplicación con la que se ha venido trabajando hasta este momento para ejecutarse en un PaaS, el que se haya elegido. ##

Esto lo he definido en la práctica, pero lo que he hecho es, primero he tenido que definir mi archivo [Procfile](https://github.com/pedrogazquez/Proyecto-IV/blob/master/Procfile):
```
web: python formu.py
```
y el que ya tenía que también es necesario de [requirements.txt](https://github.com/pedrogazquez/Proyecto-IV/blob/master/requirements.txt):
```
Flask==0.10.1
gunicorn==19.3.0
html5lib==0.999
itsdangerous==0.24
Jinja2==2.8
MarkupSafe==0.23
requests==2.2.1
six==1.5.2
ssh-import-id==3.21
urllib3==1.7.1
virtualenv==13.1.2
Werkzeug==0.10.4
WTForms==2.0.2
wheel==0.24.0
yolk==0.4.3
```
He subido la aplicación a Heroku, [este es el enlace a ella](https://warm-sands-2560.herokuapp.com/). Para ello lo que he hecho ha sido, primero registrarme en heroku, después he clonado mi repositorio donde guardo la aplicación. Lo proximo que hay que hacer es teclear las siguientes órdenes en el terminal dentro del repositorio de nuestra aplicación que hemos clonado:
```
heroku create
git push heroku master
```
Con heroku create, si no le indicamos nada, nos crea la app con un nombre aleatorio, que en mi caso ha sido [warm-sands-2560](https://warm-sands-2560.herokuapp.com/).
Lo proximo que he hecho ha sido crear un proceso de integración contínua junto al despliegue automático tanto en Heroku como en Snap CI. Para realizarlo en heroku, al conectarlo con GitHub debes aceptar la siguiente ventana emergente:

![heroku123](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/Captura%20de%20pantalla%20de%202015-11-16%20005315_zpssvdmjoei.png)

Una vez hecho esto, habilitamos que no despliegue hasta que no pase los tests para la IC:

![ic](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/Captura%20de%20pantalla%20de%202015-11-16%20005451_zpsca57kxdz.png)

Como se puede ver en la imagen el proceso de intregración continua está correctamente configurado.
Otra opción es hacerlo con Snap CI, en el cual debes conectarte con GitHub y aceptar las condiciones:

![snap](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/Captura%20de%20pantalla%20de%202015-11-16%20003846_zpspefwdnws.png)

Y por último, podemos comprobar que también está correctamente configurado el proceso de IC con Snap CI:

![snap1222](http://i1042.photobucket.com/albums/b422/Pedro_Gazquez_Navarrete/Captura%20de%20pantalla%20de%202015-11-16%20004423_zpsqfhzcdku.png)



