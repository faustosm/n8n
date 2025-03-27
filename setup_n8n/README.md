===========================================================================================
SUBIR A STACK

docker compose --project-name n8n --env-file .env.local -f docker-compose.local.yml up -d
docker compose --project-name tools --env-file .env.tools -f docker-compose.tools.yml up -d


============================================================================================
BAIXAR A STACK

docker compose --env-file .env -f docker-compose.yml down
docker compose --env-file .env.tools -f docker-compose.tools.yml down


===========================================================================================

✅ Serviços e URLs locais
Portainer: http://localhost:9000

usuario: admin
senha: padrão fausto

pgAdmin: http://localhost:5050

PGADMIN_DEFAULT_EMAIL=admin@fsmhub.net
PGADMIN_DEFAULT_PASSWORD=admin123

Dozzle: http://localhost:8888

Uptime Kuma: http://localhost:3001

cAdvisor: http://localhost:8080

N8N: http://localhost:5678

Redis: localhost:6379 (conexão TCP, não tem painel web)

PostgreSQL: localhost:5432 (conexão TCP, não tem painel web)