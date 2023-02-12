FROM jdk:8u361

RUN groupadd -g 1001 app && useradd -g 1001 -u 1001 app
RUN mkdir -p /app && chown -R app:app /data
RUN chown app:app /opt
USER app:app
