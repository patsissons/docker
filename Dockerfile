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
	-e 's~^PasswordAuthentication yes~PasswordAuthentication no~g' \
	-e 's~^#PermitRootLogin yes~PermitRootLogin no~g' \
	-e 's~^#UseDNS yes~UseDNS no~g' \
	-e 's~^\(.*\)/usr/libexec/openssh/sftp-server$~\1internal-sftp~g' \
	/etc/ssh/sshd_config

RUN mkdir -p /var/run/sshd

COPY root/ /
RUN chmod a+x /app/entrypoint.sh

EXPOSE 22

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["/bin/sh"]
