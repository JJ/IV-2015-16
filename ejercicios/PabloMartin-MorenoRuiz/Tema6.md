# Gestión de configuraciones

## Ejercicio 1. Instalar chef en la máquina virtual que vayamos a usar
Para este ejercicio he creado una máquina de virtualBox.

Lo instalamos con el siguiente comando:

![instalacionChef1](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_001_zpsso5kl8kh.png)

![instalacionChef2](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_002_zpsak4hpszv.png)

Y comprovamos la versión:

![versionChef](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_003_zps1fjdfxsh.png)

## Ejericicio 2. Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.
Chef necesita una estructira jerarquizada de directorios para funcionar, en mi caso instalaré geany y nginx. Y lo primero es crear los directorios:
```
mkdir -p chef/cookbooks/nginx/recipes
mkdir -p chef/cookbooks/geany/recipes
```

Una vez creados nos disponemos a crear las recetas de geany y nginx que es un archivo default.rb creado cada uno dentro de su directorio. En la siguiente imagen se ve su contendio y si nos fijamos entenderemos algo mejor su estructura (fijarse en la ruta cat).

![recipes](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_063_zpsjicaomm7.png)

Dentro de la carpeta chef creamos node.json y solo.rb. Dentro del primer primero indicamos lo que queremos instalar y en el segundo las referencias a los archivos (instalables):

![make_chef](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_064_zps2nbkhzhf.png)

Para emprezar con la instalación ejecutamos el siguiente comando ```sudo chef-solo -c chef/solo.rb``` y vemos cómo se instala todo correctamente:

![Ejecución_chef1](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_005_zpstp2qpalw.png)

![Ejecución_chef2](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_004_zpsnn5db7cc.png)

Y aqui tenemos la la estructura de directorios y lo que se ha creado dentro de Documentos:

![struct1](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_006_zpsq3igpy9v.png)

![struct2](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_065_zps6krjuoeu.png)

## Ejercicio 3. Escribir en YAML la siguiente estructura de datos en JSON
```
---
-uno:"dos"
 tres:
	- 4
	- 5
	- "Seis"
	-
		- siete: 8
		  nueve:
			- 10
			- 11
```
## Ejericicio 4. Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.

Para este ejercicio usaré la máquina virtual que tenía del tema anterior en Azure. A parte de explicar los pasos para hacer el ejercicio mostraré algunos errores que van saliendo para que podamos apreciar la mejora en hacerlo con un archivo de provisionamiento con ansible en el siguiente ejercicio.

Primero instalamos Ansible:
```
sudo pip install paramiko PyYAML jinja2 httplib2 ansible
```
Ahora incluimos la máquina de Azure al inventario de ansible y defininimos la variable de entorno

![ansible1](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_018_zpsye6twgaf.png)

Ahora hacemos ```azure login``` para conectarnos a la cuenta de azure (ya explicado en el tema antrior, copiar enlace y ponerle el código).
Y iniciamos la máquina con con ```azure vm start maquina-ubuntu-pmmre```

Ansible funciona conectándose con ssh por eso para usarlo deberemos pasarle a la nueva máquina la llave publica de la máquina que estamos usando, en mi caso es Koding.
Si no tenemos generadas las llaves las generamos con ```ssh-keygen -t dsa ``` y las enviamos a la máquina con la siguiente orden:
```
ssh-copy-id -i .ssh/id_dsa.pub pablo@maquina-ubuntu-pmmre.cloudapp.net
```

Comprobamos que podemos hacer un ssh y que ahora no nos pide la clave:
![ansibleSSH](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_019_zpsqrbgytb3.png)


Y comprobamos con Ansible que podemos conectarnos bien mediante un ping:
![ansiblePing](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_020_zps9cgdswdn.png)

Nos descargamos con ansible nuestro proyecto usando git:
![ansibleGit](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_022_zpsnvsmwmo0.png)

Vamos a instalar los paquete con pip pero nos dice que pip no se encuentra:
![errorPip](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_023_zps2j1c15yx.png)

Actualizamos los repositorios:

![update](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_024_zpsjrmxsgt6.png)

Instalamos pip:

![installPip](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_025_zpsz7yo6zts.png)

Nos sale el siguiente error al intentar instalar de nuevo con pip:

![otroError](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_027_zpswklgbcdq.png)

Así que ahora sabemos que nos faltan los siguientes paquetes que los instalamos:
![installMas](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_026_zpsgrc3j0ye.png)

Por fin conseguimos instalar todos los paquetes para nuestra aplicación:

![OK](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_028_zpsthfcpoqm.png)

Ahora liberamos el puerto 80 para poder mostrar por hay el contenido de la web:

![liberar80](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_029_zpszngrjhbq.png)

Cómo teníamos nginx funcionando por este puerto lo que hemos hecho es apagar, tenemos que para nginx para que funcione la web ya sea con el comando anterior o con ```sudo service nginx stop```:

![Status](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_030_zpsub2vgrvw.png)

Abrimos el tráfico de Azure (hecho en el tema anterior):

![abrirTrafico](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_031_zpsqmfrciie.png)

Iniciamos la aplicación:

![iniciar](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_032_zps8hkwtb2e.png)

Y aquí la vemos funcionando:

![PERFECT](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_033_zps2fqtuxap.png)


Me ha parecido muy interesante explicar el ejercicio así pues vemos lo engorroso que puede llegar a ser el despliegue de la aplicación comando a comando para así poder ver lo útil y robusto que es hacerlo cómo en el ejercicio 5 y para adelante.



## Ejercicio 5

### 1. Desplegar la aplicación de DAI con todos los módulos necesarios usando un playbook de Ansible.

Este ejercicio también lo he realizadocon Koding sobre lo que tengo en la máquina de azure (como siempre que hago algo en azure ya que azure-cli no funciona en mi equipo).

Copiarmos la dirección de la máquina en el siguiente archivo (en este caso el DNS):

![ansible_hosts](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_067_zpslwq7ypde.png)

Instroducimos todo lo que se necesita instalar en un archivo .yml

![yml](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_068_zpscm83tuxx.png)

Y lo ejecutamos con la siguiente orden ```ansible-playbook -u pablo calificaciones.yml ``` y ya tenemos todo listo para ejecutar.

Podemos ver que de está forma es muy útil, mucho menos engorrosa que la del ejercicio anterior y lo más importante que de un comando isntalamos lo encesario. En el ejercicio 8 veremos cómo hacer esto lanzándolo desde vagrant.

### 2. ¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?.

## Ejericicio 6. Instalar una máquina virtual Debian usando Vagrant y conectar con ella.

Este ejercicio y el siguiente los he realizado sobre mi ordenador con ubuntu 12.04 de 32 bits sobre VirtualBox.

Lo primero que he hecho a sido descargarme este paquete vagrant_1.8.1_i686.deb de la siguiente páquina https://releases.hashicorp.com/vagrant/1.8.1/ e instalarlo con el siguiente comando:
 ```sudo dpkg -i vagrant_1.8.1_i686.deb```

Una vez obtenido el paquete buscamos una imagen Debian compatible con nuestro sistema operativo y VirtualBox. Y creamos un box con ella como mostramos en la siguiente imagen:

![BoxAdd](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_042_zpskwyw4rio.png)

Lo siguiente es inicializar una carpeta con este box (Esto lo que hace es crear un Vagrantfile configurado para este box, poca cosa en verdad):

![Init](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_043_zpsetz9tvsi.png)

Una vez hecho esto ejectuamos vagrant up que si es la primera vez que lo hacemos entonces nos crea esa imagen en VirtualBox, sino simplemente nos inicia la máquina.
![up](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_044_zpsc6vxmu7k.png)

Una vez acabado todo o anterior ya la tenemos creada y hacemos un ssh para comprobar que podemos conectarnos a ella:
![ssh](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_045_zps726mffcf.png)

Y finalmente se puede suspender con el siguiente comando:

![suspend](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_046_zpsfxfdkd4f.png)


## Ejericicio 7. Crear un script para provisionar `nginx` o cualquier otro servidor web que pueda ser útil para alguna otra práctica

En este caso abrimos Vagrantfile y descomentamos las siguiente líneas incluyen los paquetes que queremos instalar
![Vagrantfile](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_066_zpsqbejfffe.png)

Ejecutamos ```vagrant provision``` (teniendo en cuenta que antes debemos haber ejecutado ```vagrant up```):
![provision](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_047_zpsv0jqw5hq.png)

Nos comprobamos por ssh y comrpobarmos que nginx esta instalado con el comando ```sudo service nginx start``` (de las ultimas líneas)
![OK](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_049_zps592ewmmb.png)


## Ejercicio 8. Configurar tu máquina virtual usando vagrant con el provisionador ansible

En este apartado final lo realizaré también desde Koding.

El primer paso es instalar el provisionador de azure para vagrant:

![Aprovisonador](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_050_zpsvxmtdchd.png)


El siguiente paso es loguearme y una vez hecho obtener mis credenciales de Azure:

![obtenerCredenciales](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_051_zpspqzjlxbr.png)

Acto seguido importo a mi CLI de Azure mis credenciales:

![importAzure](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_053_zpssp9u9uua.png)

El siguiente paso es generar los certificados que se van a subir a Azure y que nos permitan interaccionar con él.
```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout azurevagrant.key -out azurevagrant.key
chmod 600 ~/.ssh/azurevagrant.key
openssl x509 -inform pem -in azurevagrant.key -outform der -out azurevagrant.cer
```

![GenerarCertificado](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_055_zpszkwntudy.png)

Cómo Koding no tengo entorno gráfico mediante ssh obtengo el certificado en mi máquina local:

![ObtenerCertificadoSSH](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_057_zpsr9kncfyy.png)

Introduzco el certificado en Azure:

![IntroducirCertificado](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_058_zpsvyodbees.png)

Para poder autenticar Azure desde Vagrantfile es necesario crear un archivo .pem y concatenarle el archivo .key, para ello:
```
openssl req -x509 -key ~/.ssh/id_rsa -nodes -days 365 -newkey rsa:2048 -out azurevagrant.pem
cat azurevagrant.key > azurevagrant.pem
```

Lo siguiente que hago es obtener el box de azure:

![BoxAzure](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_059_zpstadryvbc.png)

Ejecuto ```vagrant init azure```:

![Init](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_060_zpsqppxlfyo.png)

Lo siguiente que hay que hacer es configurar Vagrantfile cómo se muestra en la siguiente iamgen.Hay que destacarq que de los 3 bloques el primero siver para configurar la red de la máquina, el segundo para configurar la instalación del sistema operativo y el tercero para provisonarlo con ansible:

![Vagrantfile](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_069_zpsz3ohrofm.png)

En ansible incluimos todo lo necesario para que funcione nuestro programa:

![ansible](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_070_zpsgyc9ngrn.png)

Y con el siguiente comando nos disponemos a lanzar ansible para que cre la maquina y por último que nos ejecute ansible (provisionar) para que funcione todo:
![Lanzar](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_062_zpsi1tkujtp.png)


Y podemos ver que funciona perfectamente:
![PERFECT](http://i393.photobucket.com/albums/pp14/pmmre/IVEjercicios5y6/IVEjercicios6/IVEjercicios6/Seleccioacuten_071_zpsciwvn5pz.png)

Podemos ejecutar algunos comando de vagrant útiles:

```vagrant up``` Sólo crear la máquina.

```vagrant provision``` Sólo provisionarla

```vagrant suspend``` Apagarla
