# Ejercicios Tema 3
  
## Ejercicio 1

Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.

Primero me he dado de alta en Heroku, como se puede ver en la imagen. Después se recibe el email de confirmación y ya lo tenemos.

![registro_heroku](http://i.imgur.com/rtke3pW.png)

Después me he registrado en Openshift, de la misma manera que antes.

![registro_openshift](http://i.imgur.com/1uLGDyL.png)


## Ejercicio 2

Crear una aplicación en OpenShift y dentro de ella instalar WordPress.

En *Instant App* dentro de OpenShift seleccionamos **Wordpress**, ponemos una URL a nuestra app tal y como vemos en la imagen:

![wordpress_openshift](http://i.imgur.com/lePwfOg.png)

Tras esperar un rato ya tendremos la aplicación creada.

![openshift_completed](http://i.imgur.com/TKT28lK.png)

Finalmente rellenamos los datos de la aplicación en Wordpress desde el navegador y ya está todo listo para usar.

![wordpress_completed](http://i.imgur.com/UEWX37a.png)

## Ejercicio 3

Realizar una app en express (o el lenguaje y marco elegido) que incluya variables como en el caso anterior.

Siguiendo este [tutorial](http://blog.miguelgrinberg.com/post/designing-a-restful-api-with-python-and-flask) he creado una aplicación sencilla con **Flask**, el código de la cual dejo aquí:

```
#!flask/bin/python
from flask import Flask, jsonify, abort, make_response, request, url_for

app = Flask(__name__)

tasks = [
    {
        'id': 1,
        'title': u'Comprar comida',
        'description': u'Leche, Queso, Jamon, Atun', 
        'done': False
    },
    {
        'id': 2,
        'title': u'Aprobar la carrera',
        'description': u'Habra que aprobar todo', 
        'done': False
    }
]

@app.route('/todo/api/v1.0/tasks', methods=['GET'])
def get_tasks():
    return jsonify({'tasks': [make_public_task(task) for task in tasks]})

@app.route('/todo/api/v1.0/tasks/<int:task_id>', methods=['GET'])
def get_task(task_id):
    task = [task for task in tasks if task['id'] == task_id]
    if len(task) == 0:
        abort(404)
    return jsonify({'task': task[0]})

@app.route('/todo/api/v1.0/tasks', methods=['POST'])
def create_task():
    if not request.json or not 'title' in request.json:
        abort(400)
    task = {
        'id': tasks[-1]['id'] + 1,
        'title': request.json['title'],
        'description': request.json.get('description', ""),
        'done': False
    }
    tasks.append(task)
    return jsonify({'task': task}), 201

@app.route('/todo/api/v1.0/tasks/<int:task_id>', methods=['PUT'])
def update_task(task_id):
    task = [task for task in tasks if task['id'] == task_id]
    if len(task) == 0:
        abort(404)
    if not request.json:
        abort(400)
    if 'title' in request.json and type(request.json['title']) != unicode:
        abort(400)
    if 'description' in request.json and type(request.json['description']) is not unicode:
        abort(400)
    if 'done' in request.json and type(request.json['done']) is not bool:
        abort(400)
    task[0]['title'] = request.json.get('title', task[0]['title'])
    task[0]['description'] = request.json.get('description', task[0]['description'])
    task[0]['done'] = request.json.get('done', task[0]['done'])
    return jsonify({'task': task[0]})

@app.route('/todo/api/v1.0/tasks/<int:task_id>', methods=['DELETE'])
def delete_task(task_id):
    task = [task for task in tasks if task['id'] == task_id]
    if len(task) == 0:
        abort(404)
    tasks.remove(task[0])
    return jsonify({'result': True})

def make_public_task(task):
    new_task = {}
    for field in task:
        if field == 'id':
            new_task['uri'] = url_for('get_task', task_id=task['id'], _external=True)
        else:
            new_task[field] = task[field]
    return new_task

@app.errorhandler(404)
def not_found(error):
    return make_response(jsonify({'error': 'Not found'}), 404)

if __name__ == '__main__':
    app.run(debug=True)
```

## Ejercicio 4

Crear pruebas para las diferentes rutas de la aplicación.

Compruebo con 3 tests que en las rutas que yo he creado esten presentes los elementos que he metido inicialmente, y efectivamente se puede comprobar que están y se pasan los tests.

```
import os
import app
import unittest
import tempfile

class appTestCase(unittest.TestCase):
    # Esqueleto principal
    def setUp(self):
        self.db_fd, app.app.config['DATABASE'] = tempfile.mkstemp()
        app.app.config['TESTING'] = True
        self.app = app.app.test_client()
        #app.init_db()

    def tearDown(self):
        os.close(self.db_fd)
        os.unlink(app.app.config['DATABASE'])

    # Fin esqueleto principal

    def test_1(self):
        rv = self.app.get('/todo/api/v1.0/tasks')
        assert 'Comprar comida' in rv.data


    def test_2(self):
        rv = self.app.get('/todo/api/v1.0/tasks/2')
        assert 'aprobar todo' in rv.data

    def test_3(self):
        rv = self.app.get('/todo/api/v1.0/tasks/1')
        assert 'Jamon' in rv.data



if __name__ == '__main__':
    unittest.main()
```

![tests_pasados](http://i.imgur.com/aEZ7hmX.png)


## Ejercicio 5

Instalar y echar a andar tu primera aplicación en Heroku

He seguido los pasos detallados [aquí](https://devcenter.heroku.com/articles/getting-started-with-python#introduction), que son oficiales de *Heroku*.
La aplicación corre correctamente en Heroku tal y como vemos en la imagen

![heroku_running](http://i.imgur.com/zsmYQix.png)

El enlace es el [siguiente](https://warm-waters-6105.herokuapp.com/todo/api/v1.0/tasks).

La funcionalidad de la aplicación se usa de momento mediante el comando *curl* , así que eso es lo más que muestra por ahora.

## Ejercicio 6 

Usar como base la aplicación de ejemplo de heroku y combinarla con la aplicación en node que se ha creado anteriormente. Probarla de forma local con foreman. Al final de cada modificación, los tests tendrán que funcionar correctamente; cuando se pasen los tests, se puede volver a desplegar en heroku.

Para llevar a cabo lo que se pide en este ejercicio he instalado **foreman** con *pip* y he procedido a hacer lo que se pide.

![foreman](http://i.imgur.com/fevqfjs.png)


## Ejercicio 8

Preparar la aplicación con la que se ha venido trabajando hasta este momento para ejecutarse en un PaaS, el que se haya elegido.

Como vemos en la imagen, la aplicación de **Empresa** en *Nodejs* está funcionando correctamente he *Heroku*.

![empresa_heroku](http://i.imgur.com/Kkq9wlE.png)
