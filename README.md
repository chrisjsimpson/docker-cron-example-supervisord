# Docker cron supervisord example

Crontab inside docker container. 

- See how to start a cron task

This is useful if you're not fully embracing containers and 
want to have multiple services running in a container.

See .conf files for example services


# How to build

```
podman build -t docker-cron .
```

Or, docker
```
docker build -t docker-cron .
```

# Run

```
podman run docker-cron
```

Or, docker
```
docker run docker-cron
```

# Exec into container and observe cron running

(or use `podman` in place of `docker`)
```
docker ps  # find container id
docker logs -f <container-id>
```
