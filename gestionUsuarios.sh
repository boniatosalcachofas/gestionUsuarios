#!/bin/bash

function mostrarNombreUsu () {

    cut -d ":" -f 1 /etc/passwd > $(pwd)/archivoTemporal.txt

    i=1

    while read linea;
    do
    echo $i ".-" $linea
    arrayTemporal[$i]="$linea";
    ((i++));
    done < $(pwd)/archivoTemporal.txt
    rm archivoTemporal.txt

}
function eleccionCambioTipoInfo () {

case $eleccionInfo in

1)
read -p "Nombre completo nuevo: " infoNueva
sudo chfn -f $infoNueva ${arrayTemporal[cambInfo]}
;;
2)
read -p "Numero habitacion nueva: " infoNueva
sudo chfn -r $infoNueva ${arrayTemporal[$cambInfo]}
;;
3)
read -p "Telefono del trabajo nuevo: " infoNueva
sudo chfn -w $infoNueva ${arrayTemporal[$cambInfo]}
;;
4)
read -p "Telefono de casa nuevo: " infoNueva
sudo chfn -h $infoNueva ${arrayTemporal[$cambInfo]}
;;
5)
read -p "Informacion alternativa nueva: " infoNueva
sudo chfn -o $infoNueva ${arrayTemporal[$cambInfo]}
;;
6)
sudo chfn ${arrayTemporal[$cambInfo]}
;;
esac

}


echo "1 - Agregar un usuario al sistema
2 - Cambiar la clave de acceso de un usuario
3 - Editar la información personal de un usuario
4 - Borrar un usuario del sistema
5 - Crear un grupo
6 - Agregar un usuario a un grupo
7 - Borrar un grupo
8 - Salir"

read eleccion

case $eleccion in

1)
read -p "Diga el nombre de usuario " nombreUsu
sudo adduser $nombreUsu
;;
2)
mostrarNombreUsu

read -p "Elije usuario al que cambiar contraseña " cambUsu

sudo passwd ${arrayTemporal[$cambUsu]}
;;
3)
mostrarNombreUsu
read -p "Elije el usuario al que cambiar la informacion personal " cambInfo
read -p "Elije el tipo de informacion que deseas cambiar
1.- Nombre completo
2.- Numero de habitacion
3.- Telefono del trabajo
4.- Telefono de casa
5.- Otro
6.- Cambiar toda la informacion
" eleccionInfo

eleccionCambioTipoInfo
;;
4)

mostrarNombreUsu

read -p "Elige usuario que eliminar " elimUsu
sudo deluser --remove-home ${arrayTemporal[$elimUsu]} 
;;
esac










