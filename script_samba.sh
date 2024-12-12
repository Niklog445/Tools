#!/bin/bash

# Configurar variables
COMPARTIDO_DIR="/home/$(whoami)/compartido"

# Crear el directorio para compartir
echo "Creando directorio compartido en: $COMPARTIDO_DIR"
mkdir -p "$COMPARTIDO_DIR"
chmod 777 "$COMPARTIDO_DIR"


# Configurar el recurso compartido en Samba
echo "Configurando Samba..."
sudo bash -c "cat >> /etc/samba/smb.conf" <<EOL

[Compartido]
   path = $COMPARTIDO_DIR
   browseable = yes
   read only = no
   writable = yes
   guest ok = yes
EOL

# Reiniciar el servicio de Samba
echo "Reiniciando Samba..."
sudo systemctl restart smbd

# Confirmar la configuración
echo "Directorio compartido configurado: $COMPARTIDO_DIR"
echo "¡Configuración completa! Conéctate desde Windows usando: \\$(hostname -I | awk '{print $1}')\Compartido"

#una vez creada la carpeta compartida tendremos que ejecutar el comando "sudo smbpasswd -a (nombre de usuario y contraseña que quieres asignar)"