FROM ubuntu:16.04

ARG PKG=metricbeat-5.2.1-amd64.deb

RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/* && \
    curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/${PKG} && \
    dpkg -i ${PKG} && \
    rm -f ${PKG}

COPY config /etc/metricbeat
ENTRYPOINT /usr/share/metricbeat/bin/metricbeat -e -path.config /etc/metricbeat -c metricbeat.yml
