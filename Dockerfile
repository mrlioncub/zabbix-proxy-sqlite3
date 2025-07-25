FROM zabbix/zabbix-proxy-sqlite3:alpine-7.0.17

LABEL maintainer="mr.lioncub" \
      link1="https://github.com/zabbix/zabbix-docker/tree/7.0" \
      link2="https://docs.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server" \
      link3="https://github.com/mrlioncub/zabbix-server-mysql"

USER root

RUN set -x \
  && tempDir="$(mktemp -d)" \
  && chown nobody:nobody $tempDir \
  && cd $tempDir \
  && wget https://download.microsoft.com/download/fae28b9a-d880-42fd-9b98-d779f0fdd77f/msodbcsql18_18.5.1.1-1_amd64.apk \
  && wget https://download.microsoft.com/download/7/6/d/76de322a-d860-4894-9945-f0cc5d6a45f8/mssql-tools18_18.4.1.1-1_amd64.apk \
  && apk add --allow-untrusted msodbcsql18_18.5.1.1-1_amd64.apk \
  && apk add --allow-untrusted mssql-tools18_18.4.1.1-1_amd64.apk \
  && apk add coreutils \
  && rm -rf $tempDir \
  && rm -rf /var/cache/apk/*

USER 1997
