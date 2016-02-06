### Ejercicio 1
Lo primero que vamos a hacer es instalar los programas necesarios, ya que Ubuntu no trae por defecto el comando kvm-ok, de modo que ejecutamos lo siguiente:


![10](https://www.dropbox.com/s/7usgjg1pqbnkwir/5-1-001.png?dl=1)
![11](https://www.dropbox.com/s/sshdzrgais8otmd/5-1-002.png?dl=1)

Ahora podemos ver como nuestro pc admite kvm-ok

![12](https://www.dropbox.com/s/hdimweoeuhxsuky/5-1-000.png?dl=1)

Vamos a proceder pues a terminar la instalación, para ello ejecutamos lo siguiente:

![13](https://www.dropbox.com/s/2xm0krmlw34bfpi/5-1-003.png?dl=1)
![14](https://www.dropbox.com/s/d8cois019cxe7mf/5-1-004.png?dl=1)

Finalmente comprobamos que todo está en orden:

![15](https://www.dropbox.com/s/1ezkeus9hbjgl63/5-1-005.png?dl=1)

### Ejercicio 2
Empecemos instalando qemu, para ello haremos lo siguiente:
![20](https://www.dropbox.com/s/jrlvy6dp3cl35kg/5-2-001.png?dl=1)

####Ejercicio 2.1
En este ejercicio voy a generar máquinas de ttylinux y Slitaz con Qemu de la siguiente forma:
Primero crearemos los contenedores de nuestras máquinas, para ello lo haremos como sigue:
![210](https://www.dropbox.com/s/pn3jey5iww3lrka/5-2-1-001.png?dl=1)

Repitiendo la acción para ttylinux.

Después ejecutamos lo siguiente para cada máquina:
![211](https://www.dropbox.com/s/a28pb6kosy7b2rn/5-2-1-002.png?dl=1)
![212](https://www.dropbox.com/s/e7nj1b97etcttsp/5-2-1-003.png?dl=1)

####Ejercicio 2.2
Esta parte la voy a realizar con Virtualbox. Para instalarlo me he guiado en la siguiente bibliografía:

	http://www.ubuntu-guia.com/2009/07/virtualbox-maquina-virtual-en-ubuntu.html
	http://planetadiego.com/2015/10/19/instalar-virtualbox-en-ubuntu-15-10/

Tras instalarlo, en el primer uso me ha dado un fallo propio de virtualbox, pero al reiniciar el programa se ha solucionado (después de varias ejecuciones no ha vuelto a dar indicios de error)

Aquí dejo capturas de instalación:
![220](https://www.dropbox.com/s/roo1qvu8iskhvkp/5-2-2-001.png?dl=1)
![221](https://www.dropbox.com/s/wyfagm49348nieb/5-2-2-002.png?dl=1)
![222](https://www.dropbox.com/s/7qkk4bez7p6fy3o/5-2-2-003.png?dl=1)

Una vez instalado todo ejecutamos virtualbox y procedemos a crear una VM:

![223](https://www.dropbox.com/s/1eysmgr9zqflvag/5-2-2-004.png?dl=1)

Una vez hecho seleccionamos nuestra ISO e instalamos:
![224](https://www.dropbox.com/s/3p7rq962w4hfbov/5-2-2-005.png?dl=1)
![225](https://www.dropbox.com/s/blcbx5npw8c18vf/5-2-2-006.png?dl=1)

###Ejercicio 5
Como partimos de un Ubuntu recién instalado, lo primero será instalar npm:
![50](https://www.dropbox.com/s/57qlwepvfenm1vt/5-5-001.png?dl=1)

La versión que se instala es inferior a la que necesitamos, de modo que actualizamos npm de la siguiente forma:
![51](https://www.dropbox.com/s/l7vag2m9rli9ewt/5-5-002.png?dl=1)

Procederemos una vez hecho esto a instalar el cliente de Azure. Como podemos observar también en la imagen, npm se ha actualizado con éxito:
![52](https://www.dropbox.com/s/jbt4mu3fwollwab/5-5-003.png?dl=1)

Procedemos a ejecutarlo:
![53](https://www.dropbox.com/s/0verr8jtdbumi1z/5-5-006.png?dl=1)

Para obtener este resultado, hemos introducido el código que se nos da en la siguiente web para obtener el acceso:
![54](https://www.dropbox.com/s/f21l3uic3zj8kh9/5-5-004.png?dl=1)

Obtendremos entonces una pantalla como esta:
![55](https://www.dropbox.com/s/5i6qe0bdr8w7ni7/5-5-005.png?dl=1)

Procederemos entonces a hacer una prueba mirando la lista de imagenes de MV's que hay:
![56](https://www.dropbox.com/s/npsd5mx2j6pt13a/5-5-007.png?dl=1)

Es entonces cuando, habiendo decidido la imagen, procedemos a crear una máquina, esta la crearemos de la siguiente forma:
![57](https://www.dropbox.com/s/iora3k2rurcvwj5/5-5-008.png?dl=1)

Nota: los caracteres admitidos como símbolos en la contraseña son !@#$%^&+= y es por eso que ha dado error al poner como carácter el símbolo _

Una vez creada la máquina nos conectamos a ella por ssh:
![58](https://www.dropbox.com/s/z37zvpbdz46h47a/5-5-009.png?dl=1)

Una vez dentro procedemos a instalar nginx:

![59](https://www.dropbox.com/s/qa4x0s5jbdizbwr/5-5-010.png?dl=1)

Tras hacer esto nos desconectamos de la máquina y le decimos a Azure que nos abra el puerto 80:
![590](https://www.dropbox.com/s/zlhjv691jglpjea/5-5-011.png?dl=1)

Comprobemos finalmente que todo ha salido bien:
![591](https://www.dropbox.com/s/3wxs2b976oj5f7z/5-5-012.png?dl=1)

###Ejercicio 6
Empecemos instalando juju:
![600](https://www.dropbox.com/s/feiaqzetrqmrvc7/5-6-001.png?dl=1)

Una vez está instalado, vamos a generar el entorno de trabajo:
![601](https://www.dropbox.com/s/12s2l1xlxpvromy/5-6-002.png?dl=1)

Ahora vamos a generar nuestros certificados de servidor:
![602](https://www.dropbox.com/s/9pib52n6ojdcbxu/5-6-003.png?dl=1)
![603](https://www.dropbox.com/s/ur71pl4kd87ysk8/5-6-004.png?dl=1)

Una vez generados, nos vamos a nuestra cuenta de Azure (portal antiguo) y en *Configuración -> Certificados de administración* subimos nuestro fichero \*.cer:
![604](https://www.dropbox.com/s/2tf2t04sp5gur4y/5-6-005.png?dl=1)

Una vez subido nos queda algo así:
![605](https://www.dropbox.com/s/cxx3f3f4ycqgts3/5-6-006.png?dl=1)

Además de un certificado, necesitaremos una *Cuenta de almacenamiento*, por lo que, desde el mismo portal de antes, crearemos uno en la sección *Almacenamiento*:
![606](https://www.dropbox.com/s/rqdgv7b8j67rs1b/5-6-007.png?dl=1)

__Nota importante:__ Anotar la Ubicación y la Dirección URL que pongamos, ya que luego los volveremos a necesitar.

Una vez hecho todo esto, vamos a abrir el archivo que nos generó juju antes (en mi caso /home/neon520/.juju/environments.yaml) y lo modificamos, rellenando con los datos que dijimos de almacenar antes, dejándolo de la siguiente forma:
![607](https://www.dropbox.com/s/tazswwi755bwz7t/5-6-008.png?dl=1)

Guardamos y procedemos a ejecutarlo:
![608](https://www.dropbox.com/s/y01talqfdjaood3/5-6-009.png?dl=1)
![609](https://www.dropbox.com/s/5eurgyjbwf51ij1/5-6-010.png?dl=1)
![610](https://www.dropbox.com/s/ui96ryeiowg3gzi/5-6-011.png?dl=1)
![611](https://www.dropbox.com/s/orj5soa1l2t7zcd/5-6-012.png?dl=1)

Como vemos está todo en orden. A continuación intentaremos conectarnos, para eso necesitamos el user y password, que obtendremos como sigue:
![612](https://www.dropbox.com/s/ajcpko14fg67u48/5-6-013.png?dl=1)

Nos conectamos y vemos que nginx no está:
![613](https://www.dropbox.com/s/o1r9bmhh7tfdbfr/5-6-014.png?dl=1)

A continuación lo instalamos:
![614](https://www.dropbox.com/s/mf8tk1ulm8hyhue/5-6-015.png?dl=1)

Comprobemos finalmente que está hecho:
![615](https://www.dropbox.com/s/6lrbqsjrm99eoya/5-6-016.png?dl=1)

###Ejercicio 7
Procedamos paso a paso con la instalación:
![700](https://www.dropbox.com/s/w5hv69ggsikxef7/5-7-001.png?dl=1)
![701](https://www.dropbox.com/s/46tr07gn6t55ca9/5-7-002.png?dl=1)
![702](https://www.dropbox.com/s/um2zn8oisul7zcs/5-7-003.png?dl=1)
![7022](https://www.dropbox.com/s/6hn16mxhxwwn26d/5-7-004.png?dl=1)
![703](https://www.dropbox.com/s/d8aqvp9v9id26pg/5-7-005.png?dl=1)
![704](https://www.dropbox.com/s/lmkej2qtf9p7adu/5-7-006.png?dl=1)
![705](https://www.dropbox.com/s/dxmmg9dl9aofk62/5-7-007.png?dl=1)
![706](https://www.dropbox.com/s/ccfm00d30atd8hb/5-7-008.png?dl=1)
![707](https://www.dropbox.com/s/bpsudinmi2fhunu/5-7-009.png?dl=1)
![708](https://www.dropbox.com/s/yfedhe86yrtwv84/5-7-010.png?dl=1)
![709](https://www.dropbox.com/s/sjsn6jq1oitp721/5-7-011.png?dl=1)
![710](https://www.dropbox.com/s/xhoy4zcdw0k4wsn/5-7-012.png?dl=1)
![711](https://www.dropbox.com/s/7fqzhn1e8qnt7in/5-7-013.png?dl=1)
