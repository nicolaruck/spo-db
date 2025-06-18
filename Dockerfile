FROM mariadb:latest

# Setze sichere Default-Konfigurationen und Zeitzone
ENV TZ=Europe/Zurich

RUN apt-get update && \
    apt-get install -y tzdata && \
    ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && \
    echo ${TZ} > /etc/timezone && \
    rm -rf /var/lib/apt/lists/*

# Sicherheitsrelevante Konfigurationsanpassungen
COPY ./my.cnf /etc/mysql/conf.d/my.cnf

# MariaDB wird durch den offiziellen Entrypoint gestartet
# -> Weitere Init-Skripte oder Users lassen sich in /docker-entrypoint-initdb.d ergänzen
