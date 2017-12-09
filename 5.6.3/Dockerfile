FROM centos:7

ENV ELASTIC_CONTAINER true
ENV PATH /usr/share/elasticsearch/bin:$PATH
ENV JAVA_HOME /usr/lib/jvm/jre-1.8.0-openjdk

RUN yum update -y && yum install -y java-1.8.0-openjdk-headless wget which && yum clean all

WORKDIR /usr/share/elasticsearch

# Download and extract defined ES version. busybox tar can't strip leading dir.
RUN wget --progress=bar:force https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.6.3.tar.gz && \
    tar zxf elasticsearch-5.6.3.tar.gz && \
    mv elasticsearch-5.6.3/* . && \
    rmdir elasticsearch-5.6.3 && \
    rm elasticsearch-5.6.3.tar.gz

RUN set -ex && for esdirs in config data logs; do \
        mkdir -p "$esdirs"; \
    done

# Install x-pack and also the ingest-{agent,geoip} modules required for Filebeat
RUN for PLUGIN in ingest-user-agent ingest-geoip; do \
      elasticsearch-plugin install --batch "$PLUGIN"; \
    done
COPY elasticsearch.yml log4j2.properties config/
COPY x-pack/log4j2.properties config/x-pack/
COPY bin/es-docker bin/es-docker

RUN chmod -R ug+rwx /usr/share/elasticsearch/

CMD ["/bin/bash", "bin/es-docker"]

EXPOSE 9200 9300
