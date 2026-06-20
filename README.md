# 🔐 Secure MariaDB – Production-Ready Docker Image

Dieses Repository stellt ein sicheres, produktionsreifes Docker-Image auf Basis von `mariadb:latest` bereit. Es wurde speziell für den produktiven Einsatz gehärtet und enthält folgende Features:

- 📌 Feste Zeitzone auf **Europe/Zurich**
- 🔐 Sicherheitsoptimierte MariaDB-Konfiguration (`my.cnf`)
- 🧱 Möglichkeit zur **Initialisierung** einer Datenbank via SQL (`init.sql`)
- 🐳 Fertige Docker Compose Vorlage für lokalen Einsatz oder Portainer
- 🔄 Automatischer CI/CD Build & Push nach DockerHub über GitHub Actions

---

## 📦 DockerHub Image

> `docker.io/<DEIN_USER>/secure-mariadb:latest`

Dieses Image basiert auf dem offiziellen `mariadb:latest`, ergänzt durch:

- Zeitzonenfixierung auf `Europe/Zurich`
- Sicheres `my.cnf` mit deaktivierten Schwachstellen.
- Unterstützung für SQL-Initialisierung via `init.sql`
- Nutzung von `MYSQL_ROOT_PASSWORD_FILE` via Docker Secrets

---

## 📁 Projektstruktur

```bash
secure-mariadb/
├── Dockerfile                  # Custom Image-Build mit TZ und my.cnf
├── my.cnf                      # Sichere MariaDB-Konfiguration
├── init.sql                    # Optionale SQL-Initialisierung (CREATE TABLE etc.)
├── docker-compose.yml          # Bereit zur lokalen Verwendung
└── .github/workflows/
    └── docker-publish.yml      # GitHub Actions Workflow für Build & Push
```
## 🐳 Docker Compose Vorlage
```bash
services:
  mariadb:
    image: nicolaruckdeschel/secure-mariadb:latest
    container_name: mariadb_prod
    restart: unless-stopped
    environment:
      - MYSQL_ROOT_PASSWORD_FILE=/run/secrets/mariadb_root_pwd
      - MYSQL_DATABASE=myapp_db
      - TZ=Europe/Zurich
    secrets:
      - mariadb_root_pwd
    volumes:
      - mariadb_data:/var/lib/mysql
      - ./my.cnf:/etc/mysql/conf.d/my.cnf:ro
      - ./init.sql:/docker-entrypoint-initdb.d/init.sql:ro
    networks:
      - mariadb_net

volumes:
  mariadb_data:
    name: mariadb_data

secrets:
  mariadb_root_pwd:
    file: ./secrets/mariadb_root_pwd.txt

networks:
  mariadb_net:
    name: mariadb_net
    driver: bridge

