# Tema 5

### Ejercicio 1

**Instalar chef en la máquina virtual que vayamos a usar**

Para instalar chef, se ejecuta el comando

	curl -L https://www.opscode.com/chef/install.sh | sudo bash

Para comprobar que se ha instalado correctamente, comprobamos la versión que se ha instalado.

![chef](https://www.dropbox.com/s/3od0f3es4dnezov/chef-version.png?dl=1)


### Ejercicio 2

**Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.**

He creado una receta para instalar gedit y nginx. A continuación se muestra el contenido de los ficheros creados.

![ficheros](https://www.dropbox.com/s/gc2t2vwcqahp860/contenidos.png?dl=1)

Para ejecutar las recetas, se ejecuta el comando

	sudo chef-solo -c solo.rb

desde el directorio que contiene el archivo `solo.rb`. A continuación podemos ver el resultado.

![ejec_chef](https://www.dropbox.com/s/n1wtopn4dgxkp6w/exec-chef.png?dl=1)

A continuación comprobamos, por ejemplo, que `nginx` se ha instalado correctamente.

![check](https://www.dropbox.com/s/n8g4bae0wqz4wdh/check_chef.png?dl=1)






















