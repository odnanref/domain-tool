FROM debian:bookworm-slim

ENV DB_USER=postgres
ENV DB_PASSWORD=enlabium-invictus
ENV DB_HOST=some-postgres
ENV DB_NAME=domaintool
ENV DB_PORT=5432

RUN apt update && apt upgrade -y \
	cron \
	supervisor

RUN mkdir -p /app/templates && mkdir -p /app/public
COPY bin/* /app/
ADD templates /app/templates/
ADD public /app/public
RUN chmod +x /app/*
COPY ./src-os/etc/supervisor/conf.d/* /etc/supervisor/conf.d/
COPY ./src-os/etc/cron.daily/* /etc/cron.daily/
COPY ./src-os/entrypoint /entrypoint

WORKDIR "/app/"

CMD ["/entrypoint/entrypoint.sh"]

