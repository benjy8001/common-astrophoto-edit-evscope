FROM debian:11.1-slim

RUN apt-get update && apt-get install -y hugin bash gimp imagemagick

COPY bin/*.sh /usr/sbin/

WORKDIR /project