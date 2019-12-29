FROM busybox:1.31.1

MAINTAINER 应卓 <yingzhor@gmail.com>

WORKDIR /

USER root

COPY ./docker-entrypoint.sh /bin/docker-entrypoint.sh

RUN wget "https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.6.16-linux-x86_64.tar.gz" -O filebeat-5.6.16-linux-x86_64.tar.gz && \
    tar -xvf filebeat-5.6.16-linux-x86_64.tar.gz -C . && \
    mv filebeat-5.6.16-linux-x86_64/filebeat /bin/filebeat && \
    mv filebeat-5.6.16-linux-x86_64/filebeat.template.json /filebeat.template.json && \
    mv filebeat-5.6.16-linux-x86_64/filebeat.template-es2x.json /filebeat.template-es2x.json && \
    mv filebeat-5.6.16-linux-x86_64/filebeat.template-es6x.json /filebeat.template-es6x.json && \
    rm -rf filebeat-5.6.16-linux-x86_64.tar.gz && \
    rm -rf filebeat-5.6.16-linux-x86_64 && \
    chmod +x /bin/filebeat /bin/docker-entrypoint.sh && \
    mkdir -p /etc/filebeat/

COPY ./template.yml /etc/filebeat/template.yml.tmpl

COPY --from=quay.io/yingzhuo/docktool /bin/docktool /bin/docktool

STOPSIGNAL 15

ENV ES_PROTOCOL=http

VOLUME /etc/filebeat

CMD ["docker-entrypoint.sh"]