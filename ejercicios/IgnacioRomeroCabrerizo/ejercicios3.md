###Ejercicio 1: Darse de alta en algún servicio PaaS tal como Heroku, Nodejitsu, BlueMix u OpenShift.

Estoy dado de alta en Heroku:

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema3/hero.png)

Y en OpenShift:

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema3/op.png)


###Ejercicio 2: Crear una aplicación en OpenShift y dentro de ella instalar WordPress.

Creamos una nueva aplicación con WordPress configurando algunos parámetros:

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema3/op1.png)

Tras algunos pasos obtenemos nuestra aplicación:

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema3/op2.png)

Junto con el panel de configuración de WordPress:

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema3/wp.png)

Aplicación creada:

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema3/op3.png)


[Aplicación Openshift](https://empresaiv-nachorc.rhcloud.com)


###Ejercicio 3: Realizar una app en express (o el lenguaje y marco elegido) que incluya variables como en el caso anterior.



###Ejercicio 4: Crear pruebas para las diferentes rutas de la aplicación.


###Ejercicio 5: Instalar y echar a andar tu primera aplicación en Heroku.

Una vez implementada la aplicación y subida al repositorio en GitHub,  Heroku permitirá el acceso a la misma, no sólo de forma local. 

Para ello debemos realizar los siguientes pasos tras instalar *Heroku toolbelt* previamente:
	
- Definir el archivo **Procfile** :
	
```
web: gunicorn gettingstarted.wsgi --log-file -
```

- Definir el archivo **requirements.txt**:

```
pip freeze > requirements.txt
```

Y por último:

	1.  heroku create
	2.	git push heroku master
	3.	heroku ps:scale web=1
	4.	heroku open
	
Comprobamos nuestra aplicación funcionando correctamente en Heroku:

![img](https://github.com/nachobit/ETSIIT/blob/master/backup/IV1516/ejercicios/tema3/web.png)


###Ejercicio 6: Usar como base la aplicación de ejemplo de heroku y combinarla con la aplicación en node que se ha creado anteriormente. Probarla de forma local con foreman. Al final de cada modificación, los tests tendrán que funcionar correctamente; cuando se pasen los tests, se puede volver a desplegar en heroku.


###Ejercicio 7: Haz alguna modificación a tu aplicación en node.js para Heroku, sin olvidar añadir los tests para la nueva funcionalidad, y configura el despliegue automático a Heroku usando Snap CI o alguno de los otros servicios, como Codeship, mencionados en StackOverflow


###Ejercicio 8: Preparar la aplicación con la que se ha venido trabajando hasta este momento para ejecutarse en un PaaS, el que se haya elegido.

