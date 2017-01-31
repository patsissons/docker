FROM irssi
MAINTAINER Pat Sissons patricksissons@gmail.com

ENV AUTHORIZED_KEYS=

USER root

RUN apt-get update \
 && apt-get install -y -q --no-install-recommends \
    openssh-server \
    screen \
 && apt-get clean \
 && rm -r /var/lib/apt/lists/*

RUN sed -i \
  -e 's~^#AuthorizedKeysFile~AuthorizedKeysFile~g' \
	-e 's~^#?PasswordAuthentication.*~PasswordAuthentication no~g' \
	-e 's~^#?PermitRootLogin.*~PermitRootLogin no~g' \
	/etc/ssh/sshd_config

COPY root/ /
RUN chmod a+x /app/entrypoint.sh

EXPOSE 22

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["/bin/sh"]
