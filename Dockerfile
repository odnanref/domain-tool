From debian:bookworm-slim

RUN apt update && apt upgrade -y \
	cron \
	supervisor

RUN mkdir /app
COPY bin/* /app/
COPY ./src-os/etc/supervisor/conf.d/* /etc/supervisor/conf.d/
COPY ./src-os/etc/cron.daily/* /etc/cron.daily/
