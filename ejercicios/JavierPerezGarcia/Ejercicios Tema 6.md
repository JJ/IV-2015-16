### Ejercicio 1
Partimos de una máquina Lubuntu. Lo primero que vamos a hacer es instalar curl:
![10](https://www.dropbox.com/s/2f0ztr4y49pqp05/instalar%20curl.png?dl=1)

Una vez hecho instalamos Chef:
![11](https://www.dropbox.com/s/2b2m52a3tjaatk7/6-1-001.png?dl=1)

### Ejercicio 2
Empezamos generando la estructura de ficheros que usará Chef, quedando estos de la siguiente forma:
![20](https://www.dropbox.com/s/5suw6kbu8755skv/6-2-001.png?dl=1)

Procedemos entonces a ejecutar Chef:
![21](https://www.dropbox.com/s/vfdx3nmhl74yayc/6-2-002.png?dl=1)

Comprobemos que todo lo que hemos hecho funciona:
![23](https://www.dropbox.com/s/881myar592cz407/probando%20vim.png?dl=1)
![24](https://www.dropbox.com/s/hz473w4ult4ftyg/viendo%20que%20va%20el%20archivo%20y%20directorio.png?dl=1)
![25](https://www.dropbox.com/s/oqcl387sla1nm2l/probar%20nginx%20%28ejer2%29.png?dl=1)
![22](https://www.dropbox.com/s/snueya6mj9iewwj/probando%20nginx2.png?dl=1)

### Ejercicio 3
Para realizar este ejercicio he usado la siguiente herramienta: [json2yaml](https://github.com/coolaj86/json2yaml)

Lo instalamos:
![30](https://www.dropbox.com/s/21q6s3ba4ls4gkm/6-3-001.png?dl=1)

Creamos entonces un fichero json con lo pedido en el ejercicio:
![31](https://www.dropbox.com/s/gppn8z6oob3kldx/6-3-002.png?dl=1)

__Nota:__ como podemos observar, el mismo gedit nos avisa de que la estructura está mal, le faltan comillas dobles donde indica.

Ejecutamos nuestro programa y vemos los resultados:
![32](https://www.dropbox.com/s/iqkkl5e70583tds/6-3-003.png?dl=1)

### Ejercicio 8
Este ejercicio está realizado en el Hito 5, ya que despliego mi aplicación con Vagrant+Ansible en Azure, aquí dejo enlace:
[SMSBDyReplica](https://github.com/neon520/SMS-BDyReplica)
