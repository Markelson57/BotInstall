#!/data/data/com.termux/files/usr/bin/bash
echo Limpando.
sleep 1
clear
echo Limpiando..
sleep 1
clear
echo Limpiando...
sleep 1
clear
echo Limpando.
sleep 1
clear
echo Limpiando..
sleep 1
clear
echo Limpiando...
sleep 3
clear
echo ¡Limpiado con éxito!
sleep 4
clear
# Función para mostrar el progreso de instalación de cada fase
function install_phase() {
    local phase=$1
    local description=$2
    echo "Fase $phase: $description"
    sleep 2
    echo "Instalando..."
    sleep 3
    echo "¡Fase $phase completada con éxito!"
    echo
}

# Función para instalar un archivo
function install_file() {
    local file=$1
    echo "Instalando archivo: $file"
    sleep 2
    cp $file /ruta/de/instalacion/destino/
    echo "¡Archivo $file instalado con éxito!"
    echo
}

# Mostrar proceso de instalación en fases
echo "Simulando proceso de instalación..."

install_phase 1 "Instalando paquetes"
install_phase 2 "Actualizando configuraciones"
install_phase 3 "Configurando dependencias"

# Instalar un archivo real
install_file "/ruta/del/archivo/archivo.txt"

install_phase 4 "Copiando archivos"
install_phase 5 "Configurando opciones"
install_phase 6 "Reiniciando servicios"
install_phase 7 "Realizando tareas finales"
install_phase 8 "Verificando la instalación"

echo "¡La instalación ha finalizado con éxito!"

# Creación del archivo bot.py con el contenido del bot de Discord
echo "Creando el archivo bot.py..."
cat <<EOT > bot.py
import discord

intents = discord.Intents.default()
intents.typing = False
intents.presences = False

client = discord.Client(intents=intents)

@client.event
async def on_ready():
    print('¡El bot está listo!')

@client.event
async def on_member_join(member):
    channel = client.get_channel(CHANNEL_ID)  # Reemplaza CHANNEL_ID con el ID del canal donde quieres enviar el mensaje
    await channel.send(f'Bienvenido {member.mention} al servidor!')

@client.event
async def on_member_remove(member):
    channel = client.get_channel(CHANNEL_ID)  # Reemplaza CHANNEL_ID con el ID del canal donde quieres enviar el mensaje
    await channel.send(f'Adiós {member.name}, esperamos verte nuevamente pronto.')

client.run('TOKEN')  # Reemplaza TOKEN con el token real de tu bot de Discord
EOT
echo "Archivo bot.py creado exitosamente."

echo "Ejecuta 'python3 bot.py' para iniciar el bot de Discord."

# Instalación de paquetes y dependencias necesarias
echo "Instalando paquetes y dependencias..."
apt update
apt install -y python3
pip3 install discord.py
echo "Instalación completada."

# Configuración del bot de Discord
echo "Configurando el bot de Discord..."
read -p "Ingresa el token de tu bot: " bot_token
read -p "Ingresa el ID del canal para los mensajes de bienvenida y despedida: " channel_id
echo "Token: $bot_token" > bot_config.txt
echo "Channel ID: $channel_id" >> bot_config.txt
echo "Configuración completada."

# Ejecución del bot de Discord
echo "Ejecutando el bot de Discord..."
python3 bot.py
