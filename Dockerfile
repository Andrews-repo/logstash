FROM docker.elastic.co/logstash/logstash-oss:6.0.0
RUN rm -f /usr/share/logstash/pipeline/logstash.conf
RUN /usr/share/logstash/bin/logstash-plugin install logstash-input-sqs \
&& /usr/share/logstash/bin/logstash-plugin install logstash-filter-json
ADD pipeline/ /usr/share/logstash/pipeline/
ADD config/ /usr/share/logstash/config/
