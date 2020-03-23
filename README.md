# Controller Deploy
## Docker
### Local
```console
docker-compose -f docker-compose.local.yaml up -d
```

### Production (Raspberry B)
```console
export DOCKER_HOST=tcp://<RPI_IP>:2375
docker-compose -f docker-compose.prod.yaml up -d
```

