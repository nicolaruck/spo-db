# 🔐 Secure MariaDB Image with Swiss Timezone & Init DB

Dieses Repository enthält ein gehärtetes Docker-Image basierend auf `mariadb:latest`, vorbereitet für produktive Einsätze. Es stellt sicher:

- Sicherheitsoptimierte `my.cnf`
- Zeitzone dauerhaft auf `Europe/Zurich`
- Optionale Initialisierung einer Datenbank (`init.sql`)
- Automatisierter Build & Push auf Docker Hub via GitHub Actions
- Ideal für Container-Orchestrierung via Portainer & Compose

---

## 📦 Image

**DockerHub:** `docker.io/nicolaruckdeschel/secure-mariadb:latest`

---

## 📁 Struktur

```bash
secure-mariadb/
├── Dockerfile                  # Security-gehärtetes MariaDB-Image
├── my.cnf                     # Sichere MariaDB-Konfiguration
├── init.sql                   # Initiale SQL-Befehle (z. B. Tabellenstruktur)
├── docker-compose.yml         # Beispiel für lokalen Test
└── .github/workflows/
    └── docker-publish.yml     # Automatisierter Docker Build & Push
