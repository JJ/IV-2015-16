### Ejercicio 1

Aquí dejo las imágenes de dichas instalaciones:

![ejer10](https://www.dropbox.com/s/l2lkvrfky7u6gdn/1%2C0.png?dl=1)
![ejer11](https://www.dropbox.com/s/7bidvavo2xrfdds/1%2C1.png?dl=1)
![ejer12](https://www.dropbox.com/s/uazy83dijfvtu2g/1%2C2.png?dl=1)

### Ejercicio 2
Aquí dejo el enlace al repositorio donde se encuentra la aplicación.

[++Aplicación++](https://github.com/neon520/appIV)

### Ejercicio 3

He probado el ejercicio en python 2.7 y en python 3.4, pero la biblioteca webapp2 no está disponible para python 3.4, por lo que este no funciona.

### Ejercicio 4

El equivalente en python es el requirements.txt con la orden:

	pip freeze > requirements.txt

Aquí dejo el enlace al mío:

[++requeriments.txt++](https://github.com/neon520/appIV/blob/master/requirements.txt)

### Ejercicio 5

En python, podemos crear un archivo [++setup.py++](https://github.com/neon520/appIV/blob/master/setup.py) el cual contiene lo necesario para instalar las dependencias. Utilizaremos la orden:

	python setup.py install

Para documentarlo uso pycco, con la orden:

	pycco setup.py

Para documentar el resto de archivos ejecuto la orden:

	pycco appIV/*.py

Aquí dejo un enlace a los resultados:

[++docs++](https://github.com/neon520/appIV/tree/master/docs)

### Ejercicio 6

He utilizado la librería unittest para realizar estos test, aquí dejo el enlace a mi archivo de test:

[++test.py++](https://github.com/neon520/appIV/blob/master/appIV/test.py)


### Ejercicio 7
He utilizado la librería ++sure++ para realizar estos test y he utilizado el programa ++nosetests++. Aquí dejo enlace a mi archivo de test con sure:

[++test_sure.py++](https://github.com/neon520/appIV/blob/master/appIV/test_sure.py)
### Ejercicio 8

He realizado el paso 1 conectándolo con Github, aqui queda el resultado de mi test

![travis](https://travis-ci.org/neon520/appIV.svg?branch=master)

En el paso 2 he dado de alta el repositorio en el que tengo el ejercicio 2:

![repotravis](https://www.dropbox.com/s/9mwm4xmzwy3t8k8/repoactivado.png?dl=1)

Aquí dejo un enlace al fichero de configuración de travis:

[++.travis.yml++](https://github.com/neon520/appIV/blob/master/.travis.yml)