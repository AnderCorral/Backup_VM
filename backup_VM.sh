#!/bin/bash

# Definir las variables de directorios
origen="/home/usuario/seguridad/"
ssh="ander.corral2002@34.175.231.243"
fecha=$(date -d 'today' +"%d-%m-%Y")
fechayer=$(date -d '-1 days' +"%d-%m-%Y")
destino="Backups/$fecha/"
destinoayer="Backups/$fechayer/"

# Crear el directorio de destino si no ex
ssh "$ssh" "mkdir $destino"

if ssh "$ssh" "[-d $destinoayer]"; then
	rsync -av --link-dest="$destinoayer" "$origen" "$ssh:$destino"
else
	rsync -av "$origen" "$ssh:$destino"
fi
