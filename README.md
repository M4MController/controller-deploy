# Controller Deploy
## Docker
### Сервисы
* **database** -- база данных, ну тут всё понятно.
* **backend** -- бекенд, ну тут тоже. Зависит от: *database*.
* **radio** -- занимается передачей данных радио-каналу. Берет данные из базы данных и отправляет их на подпить соседнему устройству, так же берет последние координаты GPS из БД и бродкастит их по радио-каналу всем. Зависит от: *database*.
* **sensor-obd** -- собирает данные с авто по OBD и записывает из в БД. Зависит от: *database*.
* **sensor-gps** -- собирает данные с модуля GPS, и записывает из в БД. Зависит от: *database*.
* **frontend** -- фронетенд, ну и тут тоже всё должно быть понятно. Зависит от: *backend*.
### Локальный запуск
Запустить все сервисы:
```console
docker-compose -f docker-compose.local.yaml up -d
```

Остановить все сервисы:
```console
docker-compose -f docker-compose.local.yaml stop
```

Если для отладки нужен только один сервис, его можно запустить отдельно:
```console
docker-compose -f docker-compose.local.yaml up -d <service name>
```

Можно остановить отдельный сервис:
```console
docker-compose -f docker-compose.local.yaml stop <service name>
```

### Production (Raspberry B)
```console
export DOCKER_HOST=tcp://<RPI_IP>:2375
docker-compose -f docker-compose.prod.yaml up -d
```

### Production (Raspberry Zero)
```console
export DOCKER_HOST=tcp://<RPI_IP>:2375
docker-compose -f docker-compose.prod.arm32v6.yaml up -d
```
