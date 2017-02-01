# Docker Containers

[![Docker Version](https://images.microbadger.com/badges/version/patsissons/irssi-ssh.svg)](https://microbadger.com/images/patsissons/irssi-ssh) [![Docker Image](https://images.microbadger.com/badges/image/patsissons/irssi-ssh.svg)](https://microbadger.com/images/patsissons/irssi-ssh) [![Docker Pulls](https://img.shields.io/docker/pulls/patsissons/irssi-ssh.svg)](https://hub.docker.com/r/patsissons/irssi-ssh/) [![Docker Stars](https://img.shields.io/docker/stars/patsissons/irssi-ssh.svg)](https://hub.docker.com/r/patsissons/irssi-ssh/) [![License MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

`irssi` running in a container within a screen session, accessible via ssh.

## Usage

Start the docker container with your public key:

```sh
docker run -d -p 2222:22 -e AUTHORIZED_KEYS="ssh-rsa AAAA...== user@host" -v /etc/localtime:/etc/localtime:ro -v irssi-conf:/home/user/.irssi:rw patsissons/irssi-ssh
```

* `AUTHORIZED_KEYS` may contain multiple public keys, simply split them with a `,`
* `-v /etc/localtime:/etc/localtime:ro` to use the server's timezone settings
* `-v irssi-conf:/home/user/.irssi:rw` to offload configuration and logs (note you may want to use a local path instead of a named volume)
* Specify a `TZ` environment variable to override the timezone settings (this is a better option for cloud-based docker nodes)
* Create a service link to `liftoff/gateone` to simplify connecting to the container (and remove the need to port map `22`)

## Connecting

Then ssh into the host

```sh
ssh -p 2222 user@localhost
```
