From debian:bookworm-slim

ENV DB_USER
ENV DB_PASSWORD
ENV DB_HOST
ENV DB_NAME
ENV DB_PORT

RUN apt update && apt upgrade -y \
	cron \
	supervisor

RUN mkdir /app
COPY bin/* /app/
COPY ./src-os/etc/supervisor/conf.d/* /etc/supervisor/conf.d/
COPY ./src-os/etc/cron.daily/* /etc/cron.daily/
COPY ./src-os/entrypoint /

WORKDIR "/app/"

CMD ["/entrypoint/entrypoint.sh"]

