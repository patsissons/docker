FROM irssi
MAINTAINER Pat Sissons patricksissons@gmail.com

USER root

RUN apt-get update \
 && apt-get install -y -q --no-install-recommends \
    openssh-server \
    screen \
 && apt-get clean \
 && rm -r /var/lib/apt/lists/*

ENV AUTHORIZED_KEYS=

COPY root/ /
RUN chmod a+x /app/entrypoint.sh

EXPOSE 22

USER user
ENTRYPOINT ["/app/entrypoint.sh"]
