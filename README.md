# Docker Image for Lufi

Lufi means Let's Upload that FIle. It's a E2E encrypted file sharing software.

## Owner
The writer of the lufi-software is [Luc Didry](https://framagit.org/fiat-tux/hat-softwares/lufi/) his project is licensed under the GNU Affero General Public License v3.0.

## Installation

Edit lufi.conf, then launch the container:

```bash
docker run -itd \
-v ./files:/files \
-v ./lufi.conf:/lufi/lufi.conf:ro \
-v ./lufidb:/lufidb \
-p 8080:8081 \
 --name lufi namazso/lufi
```

## TLS Proxy

How to use a Nginx or Apache proxy is described [here](https://framagit.org/fiat-tux/hat-softwares/lufi/-/wikis/installation#reverse-proxies).

