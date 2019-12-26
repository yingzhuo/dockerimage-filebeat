#!/bin/sh

set -e

# shellcheck disable=SC2039
if [[ -f "/etc/filebeat/filebeat.yml" ]]; then
  exec filebeat -e -c /etc/filebeat/filebeat.yml
else
  echo "[ERROR] no config file '/etc/filebeat/filebeat.yml'. "
  exit 1
fi
