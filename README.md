# traefik-demo

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
| web1 | web1.traefik-demo.docker.localhost | web1   |
| web2 | web2.traefik-demo.docker.localhost  | web2   |
| cache | -  | cache   | 
| database | - | database | 