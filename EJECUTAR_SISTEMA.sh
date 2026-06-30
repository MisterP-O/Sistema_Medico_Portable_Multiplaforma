#!/bin/bash

# =======================================================================
# LANZADOR AUTOMATIZADO MULTIPLATAFORMA - ENTORNO INMUTABLE (BAZZITE)
# Proyecto: Sistema Web de Citas Médicas Portable
# Estudiante: Maikol Jahir Romero Pineda
# =======================================================================

CONTAINER_NAME="dev-box"
PORT="8080"
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "========================================================"
echo "🏥 Iniciando Sistema Médico Portable en Linux Bazzite..."
echo "========================================================"
echo "📁 Directorio detectado: $PROJECT_DIR"

# 1. Verificar si Distrobox está instalado
if ! command -v distrobox &> /dev/null; then
    echo "❌ Error: Distrobox no está instalado en este sistema."
    echo "Presiona cualquier tecla para salir..."
    read -n 1
    exit 1
fi

# 2. Verificar si el contenedor dev-box existe
if ! distrobox list | grep -q "$CONTAINER_NAME"; then
    echo "❌ El contenedor '$CONTAINER_NAME' no existe."
    echo "💡 Creándolo automáticamente basado en Fedora..."
    distrobox create -i registry.fedoraproject.org/fedora-toolbox:latest -n $CONTAINER_NAME --yes
fi

# 3. Lanzar el servidor interno de PHP
echo "🚀 Levantando servidor web local en el puerto $PORT..."
echo "🌐 Abre tu navegador en: http://localhost:$PORT"
echo "--------------------------------------------------------"
echo "Para detener el servidor, presiona [CTRL + C] en esta consola."
echo "--------------------------------------------------------"

distrobox enter $CONTAINER_NAME -- php -S 0.0.0.0:$PORT -t "$PROJECT_DIR"
