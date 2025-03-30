#!/bin/bash

# === CONFIGURAÇÕES ===
CF_API_TOKEN="SEU_API_TOKEN_AQUI"
ZONE_ID="SEU_ZONE_ID_AQUI"
RECORD_NAME="painel.automacao.fsmhub.net"

# === OBTER IP PÚBLICO ATUAL ===
IP=$(curl -s https://api.ipify.org)

# === OBTER ID DO REGISTRO DNS ===
RECORD_ID=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/${ZONE_ID}/dns_records?name=${RECORD_NAME}" \
  -H "Authorization: Bearer ${CF_API_TOKEN}" \
  -H "Content-Type: application/json" | jq -r '.result[0].id')

# === OBTER IP NO CLOUDFLARE ===
CURRENT_CF_IP=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/${ZONE_ID}/dns_records/${RECORD_ID}" \
  -H "Authorization: Bearer ${CF_API_TOKEN}" \
  -H "Content-Type: application/json" | jq -r '.result.content')

# === COMPARAR E ATUALIZAR SE NECESSÁRIO ===
if [ "$IP" != "$CURRENT_CF_IP" ]; then
  echo "IP diferente. Atualizando DNS..."
  curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/${ZONE_ID}/dns_records/${RECORD_ID}" \
    -H "Authorization: Bearer ${CF_API_TOKEN}" \
    -H "Content-Type: application/json" \
    --data "{\"type\":\"A\",\"name\":\"${RECORD_NAME}\",\"content\":\"${IP}\",\"ttl\":120,\"proxied\":false}"
  echo "DNS atualizado para: $IP"
else
  echo "IP atual já está correto. Nada a fazer."
fi
