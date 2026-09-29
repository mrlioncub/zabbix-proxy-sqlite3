FROM zabbix/zabbix-proxy-sqlite3:alpine-7.0.31

LABEL maintainer="mr.lioncub" \
      link1="https://github.com/zabbix/zabbix-docker/tree/7.0" \
      link2="https://docs.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server" \
      link3="https://github.com/mrlioncub/zabbix-server-mysql"

USER root

RUN set -x \
  && tempDir="$(mktemp -d)" \
  && chown nobody:nobody $tempDir \
  && cd $tempDir \
  && wget https://download.microsoft.com/download/ade174b7-8cea-4543-91a6-c33ae320c2f0/msodbcsql18_18.7.1.1-1_amd64.apk \
  && wget https://download.microsoft.com/download/a5dcc5e7-6124-49d3-8df4-48d738a0e784/mssql-tools18_18.7.1.1-1_amd64.apk \
  && apk add --allow-untrusted msodbcsql18_18.7.1.1-1_amd64.apk \
  && apk add --allow-untrusted mssql-tools18_18.7.1.1-1_amd64.apk \
  && apk add coreutils \
  && rm -rf $tempDir \
  && rm -rf /var/cache/apk/*

USER 1997
