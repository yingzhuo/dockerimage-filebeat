#!/bin/sh

set -e

if [ "${LOG_PATH}" = "" ]; then
  echo "Env 'LOG_PATH' not set"
  exit 1
fi

if [ "${ES_HOSTS}" = "" ]; then
  echo "Env 'ES_HOSTS' not set"
  exit 1
fi

if [ "${ES_PROTOCOL}" = "" ]; then
  echo "Env 'ES_PROTOCOL' not set"
  exit 1
fi

if [ "${ES_INDEX}" = "" ]; then
  echo "Env 'ES_INDEX' not set"
  exit 1
fi

docktool filegen -t="/etc/filebeat/template.yml.tmpl" -o="/etc/filebeat/filebeat.yml"

if [ -f "/etc/filebeat/filebeat.yml" ]; then
  exec filebeat -e -c /etc/filebeat/filebeat.yml
else
  echo "[ERROR] no config file '/etc/filebeat/filebeat.yml'. "
  exit 1
fi
