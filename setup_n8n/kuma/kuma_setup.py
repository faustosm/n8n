import json
import requests
import os
from dotenv import load_dotenv

# === CARREGA VARIÁVEIS DO .env.kuma ===
load_dotenv(dotenv_path=".env.kuma")

KUMA_URL = os.getenv("KUMA_URL")
USERNAME = os.getenv("KUMA_USERNAME")
PASSWORD = os.getenv("KUMA_PASSWORD")

if not KUMA_URL or not USERNAME or not PASSWORD:
    print("❌ Variáveis de ambiente não encontradas.")
    exit(1)

# === LOGIN ===
session = requests.Session()
login_url = f"{KUMA_URL}/api/login"
resp = session.post(login_url, json={"username": USERNAME, "password": PASSWORD})

if resp.status_code != 200 or "token" not in resp.json():
    print("❌ Erro ao fazer login no Uptime Kuma.")
    print(resp.text)
    exit(1)

print("✅ Login realizado com sucesso.")

# === CARREGA LISTA DE MONITORES ===
with open("monitores.json", "r") as f:
    MONITORES = json.load(f)

# === CRIAÇÃO DOS MONITORES ===
for monitor in MONITORES:
    if monitor["type"] == "http":
        data = {
            "type": "http",
            "name": monitor["name"],
            "url": monitor["url"],
            "interval": 60,
            "retryInterval": 30,
            "maxretries": 3,
            "resendInterval": 0,
            "upsideDown": False,
            "ignoreTls": False
        }
    elif monitor["type"] == "tcp":
        data = {
            "type": "tcp",
            "name": monitor["name"],
            "hostname": monitor["hostname"],
            "port": monitor["port"],
            "interval": 60,
            "retryInterval": 30,
            "maxretries": 3,
            "resendInterval": 0,
            "upsideDown": False
        }
    else:
        print(f"⚠️ Tipo desconhecido: {monitor}")
        continue

    resp = session.post(f"{KUMA_URL}/api/monitor", json=data)
    if resp.status_code == 200:
        print(f"✅ Monitor criado: {monitor['name']}")
    else:
        print(f"⚠️ Erro ao criar monitor {monitor['name']}: {resp.text}")
