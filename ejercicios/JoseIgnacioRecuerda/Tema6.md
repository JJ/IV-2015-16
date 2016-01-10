#Ejercicios tema 6


##Ejercicio 1
###Instalar chef en la máquina virtual que vayamos a usar
Primero he tenido que seleccionar la version 2.0.0 de ruby para poder instalar chef, para ello he hecho siguientes:

* \curl -L https://get.rvm.io | bash -s stable --ruby 

Cierro la terminal y la vuelvo a abrir para poder hacer uso de rvm

En el menú de la terminal entro en: edit/Profile Preferences  me voy a la pestaña Title and Command y selecciono la opción que pone "Run command as a login shell" como se puede ver en la captura

![selecciono la opción del menú de la terminal](ejr1.1)

Selecciono la versión de ruby 2.2.1 con el comando `rvm use 2.2.1 --default`

Una vez hecho esto ya tengo seleccionada la versión de ruby con la cual puedo instalar chef con el comando `curl -L https://www.opscode.com/chef/install.sh | sudo bash`

![version de chef](ejr1.2)

