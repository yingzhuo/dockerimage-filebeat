FROM alpine:3.11.2

MAINTAINER 应卓 <yingzhor@gmail.com>

COPY ./docker-entrypoint.sh /bin/docker-entrypoint.sh

RUN apk add --no-cache tar && \
    wget "https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.6.16-linux-x86_64.tar.gz" -O filebeat-5.6.16-linux-x86_64.tar.gz && \
    tar -xvf filebeat-5.6.16-linux-x86_64.tar.gz -C . && \
    mv filebeat-5.6.16-linux-x86_64/filebeat /bin/filebeat && \
    mv filebeat-5.6.16-linux-x86_64/filebeat.template.json /filebeat.template.json && \
    mv filebeat-5.6.16-linux-x86_64/filebeat.template-es2x.json /filebeat.template-es2x.json && \
    mv filebeat-5.6.16-linux-x86_64/filebeat.template-es6x.json /filebeat.template-es6x.json && \
    rm -rf filebeat-5.6.16-linux-x86_64.tar.gz && \
    rm -rf filebeat-5.6.16-linux-x86_64 && \
    chmod +x /bin/filebeat /bin/docker-entrypoint.sh && \
    mkdir -p /etc/filebeat/

COPY ./template.yml /etc/filebeat/template.yml

COPY --from=quay.io/yingzhuo/docktool /bin/docktool /bin/docktool

ENV ES_PROTOCOL=http

CMD ["docker-entrypoint.sh"]