# Docker Containers

[![Docker Version](https://images.microbadger.com/badges/version/patsissons/irssi-ssh.svg)](https://microbadger.com/images/patsissons/irssi-ssh) [![Docker Image](https://images.microbadger.com/badges/image/patsissons/irssi-ssh.svg)](https://microbadger.com/images/patsissons/irssi-ssh) [![Docker Pulls](https://img.shields.io/docker/pulls/patsissons/irssi-ssh.svg)](https://hub.docker.com/r/patsissons/irssi-ssh/) [![Docker Stars](https://img.shields.io/docker/stars/patsissons/irssi-ssh.svg)](https://hub.docker.com/r/patsissons/irssi-ssh/) [![License MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

`irssi` running in a container within a screen session, accessible via ssh.

## Usage

Start the docker container with your public key:

```sh
docker run -d -p 2222:22 -e AUTHORIZED_KEYS="ssh-rsa AAAA...== user@host" -v /etc/localtime:/etc/localtime:ro patsissons/irssi-ssh
```


Then ssh into the host

```sh
ssh -p 2222 user@localhost
```
