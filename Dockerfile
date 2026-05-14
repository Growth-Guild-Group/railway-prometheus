FROM prom/prometheus

# copy the Prometheus configuration file
COPY prometheus.yml /etc/prometheus/prometheus.yml

# copy the entrypoint that materializes LUCIDSERUM_METRICS_TOKEN into a file
COPY --chmod=0755 entrypoint.sh /entrypoint.sh

# expose the Prometheus server port
EXPOSE 9090

# set the entrypoint command
USER root
ENTRYPOINT ["/entrypoint.sh"]
CMD        [ "--config.file=/etc/prometheus/prometheus.yml", \
             "--storage.tsdb.path=/prometheus", \
             "--storage.tsdb.retention.time=365d", \
             "--web.console.libraries=/usr/share/prometheus/console_libraries", \
             "--web.console.templates=/usr/share/prometheus/consoles", \
             "--web.external-url=http://localhost:9090", \
             "--log.level=info"]
