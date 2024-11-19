#!/bin/bash

# Definir las variables de directorios
origen="/home/usuario/seguridad/"
ssh="ander.corral2002@34.175.231.243"
fecha=$(date -d 'today' +"%d-%m-%Y")
fechayer=$(date -d '-1 days' +"%d-%m-%Y")
destino="$ssh:Backups/$fecha/"
destinoayer="$ssh:Backups/$fechayer/"

# Crear el directorio de destino si no existe
mkdir $destino

if [-d "$destinoayer"]; then
	rsync -av --link-dest="$destinoayer" "$origen" "$destino"
else
	rsync -av "$origen" "$destino"
fi
