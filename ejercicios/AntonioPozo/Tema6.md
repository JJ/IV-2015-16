### Ejercicio 1: Instalar chef en la máquina virtual que vayamos a usar.

He descargado el software de [aquí](https://downloads.chef.io/chef-server/ubuntu/).

Una vez descargado ejecutamos sudo dpkg -i chef-server-core_12.3.1-1_amd64.deb

### Ejercicio 2: Crear una receta para instalar nginx, tu editor favorito y algún directorio y fichero que uses de forma habitual.




### Ejercicio 3: Escribir en YAML la siguiente estructura de datos en JSON "{ uno: "dos", tres: [ 4, 5, "Seis", { siete: 8, nueve: [ 10, 11 ] } ] }".

```
--- 
- uno: "dos" 
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


### Ejercicio 4: Desplegar los fuentes de la aplicación de DAI o cualquier otra aplicación que se encuentre en un servidor git público en la máquina virtual Azure (o una máquina virtual local) usando ansible.

Instalamos ansible:

```
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update sudo apt-get install ansible


```


### Ejercicio 5.2: ¿Ansible o Chef? ¿O cualquier otro que no hemos usado aquí?



### Ejercicio 6: Instalar una máquina virtual Debian usando Vagrant y conectar con ella.



### Ejercicio 7: Crear un script para provisionar "nginx" o cualquier otro servidor web que pueda ser útil para alguna otra práctica.




### Ejercicio 8: Configurar tu máquina virtual usando Vagrant con el provisionador Ansible.

