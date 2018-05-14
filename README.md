# traefik-demo

* [Installation](#installation)
* [Commands](#commands)
* [Services](#services)
* [Caveats](#caveats)

## Installation
No Installation needed. :)

## Commands
To see a list of available commands run `make`.

```
> make

# up        Starts all services
#           (traefik, 2x web, 1x database, 1x cache)
# stop      Stops all services
# restart   Restarts all services
# shell     Starts a bash shell inside docker, useful to
#           inspect DNS resolution and service registrations
```

## Services
| Service  | External DNS | Internal DNS |
|---|---|---|
| web1 | web1.traefik-demo.docker.localhost | web1, web1.traefik-demo.docker.localhost |
| web2 | web2.traefik-demo.docker.localhost  | web2, web2.traefik-demo.docker.localhost |
| cache | -  | cache   | 
| database | - | database | 

## macOS

Unfortuntely for the time being the host `docker.localhost` was not automatically available as with other UNIX operating systems undr macOS. A simple uodate of `/etc/hosts` did not meet the requirements as wildcards like `*.docker.localhost` are not possible in `HOSTS` files. Therefore it was decided to use `dnsmasq` to add support for the `docker.localhost` domain. 

`dnsmasq` is installed via homebrew, the configuration will add `localhost` as its own DNS nameserver. In the final step we will register our new nameserver as a resolver for DNS in macOS.

```shell
brew install dnsmasq
echo 'address=/localhost/127.0.0.1' | sudo tee -a /usr/local/etc/dnsmasq.conf
sudo mkdir -p /etc/resolver
sudo touch /etc/resolver/localhost
echo 'nameserver 127.0.0.1' | sudo tee -a /etc/resolver/localhost
```