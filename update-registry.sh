# at first enable experimental features on docker daemon:
# /etc/docker/daemon.js
# {
#   "experimental": true
# }

# controller-database
docker build -t registry.meter4.me:25410/controller-database -f Dockerfile-db https://github.com/M4MController/controller-web.git
docker push registry.meter4.me:25410/controller-database

# controller-backend
docker build -t registry.meter4.me:25410/controller-backend https://github.com/M4MController/controller-web.git
docker push registry.meter4.me:25410/controller-backend

# controller-frontend
docker build -t registry.meter4.me:25410/controller-frontend --squash --build-arg MODE=lite --build-arg GOOGLE_API_MAPS_KEY=$GOOGLE_API_MAPS_KEY https://github.com/M4MController/frontend.git
docker push registry.meter4.me:25410/controller-frontend

# controller-radio
docker build -t registry.meter4.me:25410/controller-radio https://github.com/M4MController/controller-radio.git
docker push registry.meter4.me:25410/controller-radio

# controller-sync
docker build -t registry.meter4.me:25410/controller-sync https://github.com/M4MController/controller-sync.git
docker push registry.meter4.me:25410/controller-sync

# sensor-obd
docker build -t registry.meter4.me:25410/sensor-obd https://github.com/M4MController/sensor-obd.git
docker push registry.meter4.me:25410/sensor-obd

# sensor-gps
docker build -t registry.meter4.me:25410/sensor-gps https://github.com/M4MController/sensor-gps.git
docker push registry.meter4.me:25410/sensor-gps

# sensor-electricity
docker build -t registry.meter4.me:25410/sensor-electricity https://github.com/M4MController/sensor-electricity.git
docker push registry.meter4.me:25410/sensor-electricity
