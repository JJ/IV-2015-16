#Ejercicios Tema 3

##Ejercicio 1

###Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.

Me he dado de alta en [OpenShift](https://www.openshift.com/app/account/new).
  
Simplemente hay que rellenar el siguiente formulario con nuestros datos y ya tendremos una cuenta.

![ejercicio1](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%203/ejercicio1_zpsqlrvlfaq.png)

##Ejercicio 2
###Crear una aplicación en OpenShift y dentro de ella instalar WordPress.

Una vez logeados en OpenShift nos vamos al apartado `Applications`, ahi nos aparecerán todas las aplicaciones posibles, selecionamos `WordPress 4` y rellenamos todos los datos para crear la aplicación.

Tras todos estos pasos, tendremos nuestra aplicación WordPress [funcionando](http://iv-tema3.rhcloud.com/)

##Ejercicio 3
###Realizar una app en express (o el lenguaje y marco elegido) que incluya variables como en el caso anterior.

Para este ejercicio he modificado la [aplicación](https://github.com/acasadoquijada/Aplicacion-Encuestas) del tema anterior.

Para usar REST Django posee [djangorestframework](http://www.django-rest-framework.org/)

Lo primero que tenemos que hacer es intalar dkangorestframework, para ello basta con ejecutar `pip install djangorestframework`, tras esto lo añadimos al fichero `setting.py`

~~~
INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
	'polls',
	'rest_framework',

)
~~~

Ahora creamos una clase para serializar los modelos, en mi caso Question, en JSON. Guardarmos la clase en un fichero llamado `serializers.py`.


~~~
from rest_framework import serializers
from .models import Question, Choice


class QuestionSerializer(serializers.Serializer):
    question_text = serializers.CharField(max_length=200)
    pub_date = serializers.DateTimeField('date published')

    def create(self, validated_data):
        """
        Crea y vevuelve una encuesta (sin opciones)
        """
        return Question.objects.create(**validated_data)

    def update(self, instance, validated_data):
        """
        Actualiza y devuelve una encuesta, teniendo en cuenta los datos validados
        """
        instance.question_text = validated_data.get('question_text', instance.question_text)
        instance.pub_date = validated_data.get('pub_date', instance.pub_date)
        instance.save()
        return instance
~~~

Tras esto, creamos una serie de vistas para la clase serializadora

~~~
class JSONResponse(HttpResponse):
    def __init__(self, data, **kwargs):
        content = JSONRenderer().render(data)
        kwargs['content_type'] = 'application/json'
        super(JSONResponse, self).__init__(content, **kwargs)


@csrf_exempt
def polls(request):

	if request.method == 'GET':
		encuestas = Question.objects.all()
		serializador = QuestionSerializer(encuestas, many=True)
		return JSONResponse(serializador.data)

	elif request.method == 'POST':
		data = JSONParser().parse(request)
		serializador = QuestionSerializer(data=data)
		if serializador.is_valid():
			serializador.save()
			return JSONResponse(serializador.data, status=201)
	return JSONResponse(serializador.errors, status=400)
~~~

No hay que olvidarse de añadir las nuevas vistas a las rutas.

~~~
    url(r'^polls/$', views.polls),
~~~

Finalmente, debemos comprobar que el resultado es el deseado

![ejercicio3](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%203/ejercicio3_zps1yqfrsls.png)


##Ejercicio 4
###Crear pruebas para las diferentes rutas de la aplicación.

En este caso voy a testear la ruta que he creado en el ejercicio anterior.

Para ello, he modificado mi fichero `test.py` de la siguiente forma

~~~
	def test_polls(self):
		q = Question(question_text = "Cuestion1",pub_date="2010-11-11")
		q.save()
		q = Question(question_text = "Cuestion2",pub_date="2010-11-11")
		q.save()
		response = self.client.get('/polls/')
		self.assertEqual(response.content,'[{"question_text":"Cuestion1","pub_date":"2010-11-11"},{"question_text":"Cuestion2","pub_date":"2010-11-11"}]')

		print"Test: Vista JSON existoso"
~~~

Comprobamos que el test se supera correctamente usando `python manage.py test`

![ejercicio4](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%203/ejercicio4_zpsfcpjik8g.png)

##Ejercicio 5
###Instalar y echar a andar tu primera aplicación en Heroku.

Lo primero que tenemos que hacer es instalar lo siguiente:

* Cinturon de Heroku  `wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh`

* Imprescindible para echar a andar nuestra aplicacion django `pip install django-toolbelt`

Si se experimenta problemas a la hora de instalar el tool-belt de django hay que usar `sudo apt-get install libpq-dev python-dev`

Debemos crear un fichero requierements.txt, [este](https://github.com/acasadoquijada/Aplicacion-Encuestas/blob/master/requirements.txt) es mi fichero.

Tambien hay que crear `Procfile` con lo siguiente:

~~~
web: gunicorn pollaplication.wsgi --log-file -
~~~

Siendo pollaplication el directorio que contiene a `setting.py`

La aplicación debe encontrarse subida a github.

Es MUY importante tener la aplicación en el directorio raíz, ya que en caso contrario no podremos subirla a Heroku.

Tras los preparativos vamos a subir nuestra aplicación.

Para ello usamos `heroku login`, después creamos la aplicación en Heroku usando `heroku create´ y la subimos con `git push heroku master`

Si todo va bien tendremos nuestra aplicación subida.

![ejercicio5](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%203/ejercicio5_zpsserlnqmm.png)

El enlace de la aplicación es `nombre_aplicación.herokuapp.com`, en mi caso el link es [este](http://morning-earth-1066.herokuapp.com/)

##Ejercicio 6
###Usar como base la aplicación de ejemplo de heroku y combinarla con la aplicación en node que se ha creado anteriormente. Probarla de forma local con foreman. Al final de cada modificación, los tests tendrán que funcionar correctamente; cuando se pasen los tests, se puede volver a desplegar en heroku

Tenemos que instalar foreman, para ello usamos `sudo gem install foreman`, tras esto comprobamos que nuestra aplicación funciona con `foreman start web`

![ejercicio6-1](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%203/ejercicio6-1_zpsxdwcdmpo.png)
![ejercicio6-2](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%203/ejercicio6-2_zpszpmaddp1.png)


##Ejercicio 7
###Haz alguna modificación a tu aplicación en node.js para Heroku, sin olvidar añadir los tests para la nueva funcionalidad, y configura el despliegue automático a Heroku usando Snap CI o alguno de los otros servicios, como Codeship, mencionados en StackOverflow.

Me he registrado en Snap CI con mi cuenta de GitHub, después he seleccionado mi repositorio y ha aparecido la siguiente pantalla.

![ejercicio7-1](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%203/ejercicio7-1_zpsbixmmys6.png)

Podemos ver que todo esta en orden.

Ahora configuramos Snap CI para el despliegue de Heroku, para ello añadimos un stage al pipline

![ejercicio7-2](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%203/ejercicio7-2_zpsx4vqik0c.png)


Por ultimo, añadimos nuevas funcionalidades y test a la aplicación y comprobamos que el despliegue se realiza correctamente.


![ejercicio7-3](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Tema%203/ejercicio7-3_zps7sgp6cjj.png)

##Ejercicio 8
###Preparar la aplicación con la que se ha venido trabajando hasta este momento para ejecutarse en un PaaS, el que se haya elegido

Tras realizar todo lo anterior, basta con seguir trabajando en la aplicación, subirla a su repositorio de github y a Heroku con `git push heroku master`

