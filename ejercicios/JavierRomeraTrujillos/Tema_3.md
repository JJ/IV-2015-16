Ejercicio 1 .
-------

* Nos damos de alta en OpenShift:
![Imagen 1.1](https://www.dropbox.com/s/t2edydqi3p8tq7c/1.1.png?dl=1)

Ejercicio 2.
-------
1. Seleccionamos la Instant App de WordPress 4:
![Imagen 2.1](https://www.dropbox.com/s/gb7i6sy7kkyxgnt/2.1.png?dl=1)

2. Definimos los datos de la aplicación:
![Imagen 2.2](https://www.dropbox.com/s/wg7se90ap9xqnht/2.2.png?dl=1)

3. Obtenemos la clave y la contraseña de nuestra BD:
![Imagen 2.3](https://www.dropbox.com/s/kbr7iyu4dtcn4hd/2.3.png?dl=1)

4. Accedemos a la URL de nuestra aplicación y seleccionamos el idioma:
![Imagen 2.4](https://www.dropbox.com/s/lo3615e53yh07g7/2.4.png?dl=1)

5. Rellenamos el formulario:
![Imagen 2.5](https://www.dropbox.com/s/cckdyzaj8rwhk0r/2.5.png?dl=1)

6. Aplicación creada:
![Imagen 2.5](https://www.dropbox.com/s/rdhkx57s3ji1ukg/2.6.png?dl=1)

Ejercicio 3.
-------
* [Tutorial](http://www.django-rest-framework.org/tutorial/1-serialization/)

1..Instalamos djangorestframework:
![Imagen 3.1](https://www.dropbox.com/s/66zxbi41vw2xupt/3.1.png?dl=1)

2..Lo incluimos en el archivo settings.py:
![Imagen 3.2](https://www.dropbox.com/s/9eze793h8ylmdt0/3.2.png?dl=1)

3..Creamos el fichero *serializers.py*:
~~~
from rest_framework import serializers
from .models import Porras


class PorrasSerializer(serializers.Serializer):
    participante = serializers.CharField(max_length=100)
    porrapartido = serializers.CharField(max_length=200)
    casa = serializers.IntegerField()
    fuera = serializers.IntegerField()

    def create(self, validated_data):
        """
        Crear y devolver la nueva instancia.
        """
        return Porras.objects.create(**validated_data)

    def update(self, instance, validated_data):
        """
        Actualizar y validar la instancia.
        """
        instance.participante = validated_data.get('participante', instance.participante)
        instance.porrapartido = validated_data.get('porrapartido', instance.porrapartido)
        instance.casa = validated_data.get('casa', instance.casa)
        instance.fuera = validated_data.get('fuera', instance.fuera)
        instance.save()
        return instance
~~~

4..Añadimos la clase JSONResponse a *views.py*:
~~~~
class JSONResponse(HttpResponse):
    def __init__(self, data, **kwargs):
        content = JSONRenderer().render(data)
        kwargs['content_type'] = 'application/json'
        super(JSONResponse, self).__init__(content, **kwargs)

@csrf_exempt
def Porras_list(request):
    if request.method == 'GET':
        porras = Porras.objects.all()
        serializer = PorrasSerializer(porras, many=True)
        return JSONResponse(serializer.data)

    elif request.method == 'POST':
        data = JSONParser().parse(request)
        serializer = PorrasSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JSONResponse(serializer.data, status=201)
        return JSONResponse(serializer.errors, status=400)

@csrf_exempt
def Porras_detail(request, pk):
    try:
        porra = Porras.objects.get(pk=pk)
    except Porras.DoesNotExist:
        return HttpResponse(status=404)

    if request.method == 'GET':
        serializer = PorrasSerializer(porra)
        return JSONResponse(serializer.data)

    elif request.method == 'PUT':
        data = JSONParser().parse(request)
        serializer = PorrasSerializer(porra, data=data)
        if serializer.is_valid():
            serializer.save()
            return JSONResponse(serializer.data)
        return JSONResponse(serializer.errors, status=400)

    elif request.method == 'DELETE':
        porras.delete()
        return HttpResponse(status=204)
~~~~

5..Incluimos las urls al fichero *url.py*:
~~~~
from django.conf.urls import patterns, include, url
from . import views

urlpatterns = patterns('futbol.views',
    url(r'^$', 'index', name='index'),
    url(r'^(?P<partidos_id>[0-9]+)/$', 'gestion', name='gestion'),
    url(r'^CrearPorra/$', 'porra', name='porra'),
    url(r'^views/$', views.Porras_list),
    url(r'^views/(?P<pk>[0-9]+)/$', views.Porras_detail),
)
~~~~

6..Comprobamos que funcione:
![Imagen 3.3](https://www.dropbox.com/s/c8ts1s01t44s7qf/3.3.png?dl=1)


Ejercicio 4.
-------

* [Tutorial](http://www.django-rest-framework.org/api-guide/testing/)

1- Incluimos las nuevas pruebas en *test.py*:
~~~~
class ViewsTests(APITestCase):

    def test_create_porra(self):
        partido = Partidos(partido='Torremolinos-Lanjaron')
        partido.save()
        porra = Porras(participante='RRR', porrapartido=Partidos.objects.get(partido='Torremolinos-Lanjaron'), casa=12,fuera=15)
    	porra.save()
    	response = self.client.get('/futbol/views/')
    	self.assertEqual(response.content,'[{"participante":"RRR","porrapartido":"Torremolinos-Lanjaron","casa":12,"fuera":15}]')
        print("test completo")
~~~~

2- Comprobamos que funcione:
![Imagen 4.1](https://www.dropbox.com/s/k3i2vw6d3vwign0/4.1.png?dl=1)


Ejercicio 5.
-------

1. Nos registramos en Heroku:
![Imagen 5.1](https://www.dropbox.com/s/8dbhva0ww1d2aj2/5.1.png?dl=1)

2. Descargamos el cinturón de herramientas de Heroku:
![Imagen 5.2](https://www.dropbox.com/s/fsx2zi54p4a3jk6/5.2.png?dl=1)

3. Creamos la aplicación en Heroku y la subimos:
![Imagen 5.3](https://www.dropbox.com/s/5f2y14u3bwsc7cb/5.3.png?dl=1)

4. Observamos que está subida correctamente:
![Imagen 5.4](https://www.dropbox.com/s/4l8v1n8yj7rjzs9/5.4.png?dl=1)

5. Accedemos al enlace:
![Imagen 5.5](https://www.dropbox.com/s/5hq6jzzaayipf5j/5.5.png?dl=1)


Ejercicio 6.
-------

1. Ejecutamos ~~~~ foreman start web ~~~~:
![Imagen 6.1](https://www.dropbox.com/s/hl6oa37kv7rbve4/6.1.png?dl=1)

2. Vamos al enlace y comprobamos que todo funciona:
![Imagen 6.2](https://www.dropbox.com/s/ckhfv8gil3ixzyd/6.2.png?dl=1)


Ejercicio 7.
-------

1. Sincronizamos con el repositorio y comprobamos si pasa el test:
![Imagen 7.1](https://www.dropbox.com/s/h6p5cg4oz215suj/7.1.png?dl=1)

2. Vemos que los registros del build son correctos:
![Imagen 7.2](https://www.dropbox.com/s/2jlt518lxpnaix1/7.2.png?dl=1)

[![Build Status](https://snap-ci.com/Jarotru/EjercicioTema3_IV/branch/master/build_image)](https://snap-ci.com/Jarotru/EjercicioTema3_IV/branch/master)


Ejercicio 8.
-------

[Aplicacion desplegada](http://appporras.herokuapp.com/futbol/)

[Repositorio](https://github.com/Jarotru/EjercicioTema3_IV)
