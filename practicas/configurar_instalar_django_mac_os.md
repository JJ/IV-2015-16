instalar django en mac os 

instalamos pip

	sudo easy_install pip
	
	
instalamos el entorno virtual 

	sudo pip install virtualenv
	
vamos a donde queremos crear el entorno virtual y ejecutamos 

	virtualenv directorio
	
ahora activamos la maquina virtual con el comando 

	source bin/activate
	
Dentro de mi maquina virtual instalamos django

	sudo pip install Django==1.8
	
Para crear una app dentro del directorio de la maquina virtual me voy alli ,activo la maquina virtual con el comando 

	source bin/activate
	
Luego creo el proyectovi 

	django-admin startproject miapp
	
Entro en el directorio miapp y ejecuto el servidor

	python manage.py runserver
	
creamos una aplicacion

	python2.7 mangage.py startapp app
	
borrar ficheros de un repositorio local
 
	git rm -r *
	
