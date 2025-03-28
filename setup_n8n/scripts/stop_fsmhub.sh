#!/bin/bash

# Caminho base do projeto, independente de onde o script for executado
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

echo "🛑 Parando ferramentas..."
docker compose -f "$ROOT_DIR/setup_n8n/tools/docker-compose.tools.yml" down

echo "🛑 Parando n8n..."
docker compose -f "$ROOT_DIR/setup_n8n/n8n-local/docker-compose.local.yml" down

echo "🛑 Parando painel FSMHub..."
docker compose -f "$ROOT_DIR/painel-web/docker-compose.yml" down

echo "🛑 Parando Traefik..."
docker compose -f "$ROOT_DIR/traefik/docker-compose.yml" down

echo "🧹 Limpando redes órfãs..."
docker network prune -f

echo "✅ Tudo foi desligado com sucesso."
