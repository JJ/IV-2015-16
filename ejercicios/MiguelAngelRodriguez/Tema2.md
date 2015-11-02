# Tema 2

## Ejercicio 1: Instalar alguno de los entornos virtuales de node.js y, con ellos, instalar la última versión existente, la versión minor más actual de la 0.12 y lo mismo para la 0.11 o alguna impar. Si no se usa habitualmente este lenguaje, hacer lo mismo con cualquier otro lenguaje de scripting.    
    
Tras instalar **nvm**, se instalan las versiones del mismo:    
![Ejercicio1](https://dl.dropboxusercontent.com/u/14470490/UGR_IV_practica_2/ejercicio1.png)     
     
##Ejercicio2: Como ejercicio, algo ligeramente diferente: una web para calificar las empresas en las que hacen prácticas los alumnos. Las acciones serían crear empresa y listar calificaciones para cada empresa, crear calificación y añadirla (comprobando que la persona no la haya añadido ya), borrar calificación (si se arrepiente o te denuncia la empresa o algo) y hacer un ránking de empresas por calificación, por ejemplo. Crear un repositorio en GitHub para la librería y crear un pequeño programa que use algunas de sus funcionalidades. Si se quiere hacer con cualquier otra aplicación, también es válido.    
     
Se realiza la web con **NodeJS**, dando como resultado lo que se puede apreciar en la siguiente imagen:    
![Ejercicio2](https://dl.dropboxusercontent.com/u/14470490/UGR_IV_practica_2/ejercicio2.png)    
En el [repositorio](https://github.com/miguelangelrdguez/Empresa_IV) de Github pueden encontrarse los archivos de la misma junto a la documentación    

## Ejercicio 3: Ejecutar el programa en diferentes versiones del lenguaje. ¿Funciona en todas ellas?   
    
Ejecutando el comando que se muestra en la imagen puede comprobarse como efectivamente funciona en todas las versiones:   
![Ejercicio3](https://dl.dropboxusercontent.com/u/14470490/UGR_IV_practica_2/ejercicio3.png)    
![Ejercicio3b](https://dl.dropboxusercontent.com/u/14470490/UGR_IV_practica_2/ejercicio3_b.png)    
     
## Ejercicio 4: Crear una descripción del módulo usando package.json. En caso de que se trate de otro lenguaje, usar el método correspondiente.     
      
![Ejercicio4](https://photos-5.dropbox.com/t/2/AAB1xyxY65tzw7KmazijSM4ro_a3Xl6J_uso7WD9f1JD_A/12/14470490/png/32x32/1/1446145200/0/2/ejercicio4.png/CNqa8wYgASACIAMgBSAHKAEoAigH/KrqoiHFtXKWCJWNRp0Ji5pc-nJkg-qm5VmmHn2RKFQ4?size=1024x768&size_mode=2)     
     
## Ejercicio 5:Automatizar con grunt y docco (o algún otro sistema) la generación de documentación de la librería que se cree. Previamente, por supuesto, habrá que documentar tal librería.    
    
Para instalar grunt, se hace introduciendo en la terminal **npm install -g grunt-cli**    
![Ejercicio5a](https://photos-4.dropbox.com/t/2/AAD6IpsBHfXqv-ptmIf5jRCNUu1vy_NzlYRPYb47bKARpg/12/14470490/png/32x32/1/1446145200/0/2/ejercicio5_A.png/CNqa8wYgASACIAMgBSAHKAEoAigH/1uYu4NX7TyNZJocC3Wgl7LnusegSlEMELdBFoqfU_Is?size=1024x768&size_mode=2)   
     
Y para docco: **npm install docco grunt-docco --save-dev**:    
![Ejercicio5b](https://photos-3.dropbox.com/t/2/AACuqVAnbfbMrmJg2Z4rlo9VfQ7g8kL_AO7Xgq0nEN979A/12/14470490/png/32x32/1/1446145200/0/2/ejercicio_5_b.png/CNqa8wYgASACIAMgBSAHKAEoAigH/x-i1wJzowvKQkYswg9LtZti10kAn4h-mSAeI2sDOYtU?size=1024x768&size_mode=2)    

##Ejercicio 7:   
Para instalar mocha, tecleamos en la terminal: `sudo npm install -g mocha`.    
En el archivo [test.js](https://github.com/miguelangelrdguez/Empresa_IV/blob/master/test.js) se encuentra uno que determina si se ha arrancado correctamente la web o no
      
## Ejercicio 8:    
[![Build Status](https://travis-ci.org/miguelangelrdguez/empresaIV.svg)](https://travis-ci.org/miguelangelrdguez/empresaIV)
