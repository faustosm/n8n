#!/bin/bash

echo "🛠 Instalando Docker e Docker Compose..."

# Atualiza o sistema
sudo apt update && sudo apt upgrade -y

# Instala pacotes necessários
sudo apt install -y ca-certificates curl gnupg lsb-release

# Adiciona chave GPG do Docker
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Adiciona repositório Docker
echo \
  "deb [arch=$(dpkg --print-architecture) \
  signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Instala Docker Engine e plugins
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Adiciona o usuário atual ao grupo docker
sudo usermod -aG docker $USER

echo "✅ Docker e Docker Compose instalados!"
echo "⚠️ Reinicie a sessão ou terminal para aplicar permissões de grupo."
