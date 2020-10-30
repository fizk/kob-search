FROM docker.elastic.co/elasticsearch/elasticsearch:7.9.3

COPY init.d /usr/share/elasticsearch/init.d
COPY templates /usr/share/elasticsearch/templates
USER root
RUN chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/init.d
RUN chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/templates
RUN chmod +x /usr/share/elasticsearch/init.d/setup.sh
USER elasticsearch

EXPOSE 9200
EXPOSE 9300
