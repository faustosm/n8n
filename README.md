# FSMHub - Ambiente Local de Automacão e Monitoramento

Este repositório organiza todos os componentes do ambiente local utilizado para automação, monitoramento, visualização e gerenciamento de serviços utilizando **Docker Compose**, **Traefik** e integrações com **Cloudflare Tunnel**.

---

## 🔧 Estrutura dos Diretórios

### `cloudflare-tunnel/`
Configurações do tunnel Cloudflare para expor os serviços locais na internet com HTTPS gratuito e seguro.

### `traefik/`
Proxy reverso com suporte a HTTPS (Let's Encrypt), autenticação básica, roteamento por hostname e integração com containers Docker.

- `docker-compose.yml` – Sobe o container do Traefik
- `dynamic.yml` – Middlewares, autenticações e regras de roteamento
- `letsencrypt/` – Armazena certificados SSL

### `painel-web/`
Interface do painel visual feito com Astro + Tailwind para acessar os ambientes (Local, Dev, Prod).

- Acesso via: [`https://painel.automacao.fsmhub.net`](https://painel.automacao.fsmhub.net)

### `setup_n8n/`
Organização da stack de automação e ferramentas auxiliares:

- `n8n-local/` – Stack principal do n8n com Redis/Postgres
- `tools/` – Portainer, pgAdmin, Uptime Kuma, Dozzle
- `uptime-kuma/` – Scripts e monitoramentos
- `scripts/` – Automatização de instalação, limpeza e inicialização

---

## 🚀 Scripts Disponíveis

### `start_fsmhub.sh`
Sobe todos os serviços do ambiente:
```bash
./setup_n8n/scripts/start_fsmhub.sh
```

### `stop_fsmhub.sh`
Derruba todos os serviços e limpa redes orfãs:
```bash
./setup_n8n/scripts/stop_fsmhub.sh
```

---

## 🧱 Requisitos
- Docker
- Docker Compose V2
- Conta na Cloudflare (com domínio configurado)
- Subdomínios configurados no Cloudflare Tunnel

---

## 🛡 Acesso Seguro
Todos os serviços são protegidos por HTTPS e autenticação básica, configurada via Traefik (`auth-painel`).

---

## 📦 Futuras Expansões
- Stack de produção separada
- Banco centralizado com backup
- Dashboard de status global
- Integração com Telegram/WhatsApp via bots

---

Mantenedor: [Fausto - FSMHub]

---

## Senhas e links:

- portainer:
    - link: http://localhost:9000
    - usuario: admin
    - senha: senha padrão fausto

- dozzle:
    - link: http://localhost:8888/
    - usuario: admin
    - senha: sem senha

- uptime kuma:
    - link: http://localhost:3001
    - usuario: admin
    - senha: admin123