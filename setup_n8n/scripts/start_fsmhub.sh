#!/bin/bash

# Define o caminho raiz do projeto, independente de onde o script for executado
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

echo "🟢 Iniciando Traefik..."
docker compose -f "$ROOT_DIR/traefik/docker-compose.yml" up -d

echo "🟢 Iniciando painel FSMHub..."
docker compose -f "$ROOT_DIR/painel-web/docker-compose.yml" up -d

echo "🟢 Iniciando stack n8n..."
docker compose -f "$ROOT_DIR/setup_n8n/n8n-local/docker-compose.local.yml" up -d

echo "🟢 Iniciando ferramentas (Portainer, pgAdmin, etc)..."
docker compose -f "$ROOT_DIR/setup_n8n/tools/docker-compose.tools.yml" up -d

echo "✅ Tudo rodando! Acesse seu painel em https://painel.automacao.fsmhub.net"
