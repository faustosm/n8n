#!/bin/bash

echo "📂 Criando estrutura de diretórios do projeto..."

mkdir -p infra
mkdir -p n8n/files
mkdir -p scripts

touch infra/docker-compose.yml
touch n8n/docker-compose.yml
touch n8n/.env
touch n8n/README.md
touch scripts/install-docker.sh
touch scripts/setup-estrutura.sh

echo "✅ Estrutura criada!"

# Mostra estrutura (se tiver tree instalado)
if command -v tree &> /dev/null; then
  echo "📋 Estrutura:"
  tree -a -L 2
else
  echo "ℹ️ Instale 'tree' para visualizar a estrutura com mais detalhes."
fi
