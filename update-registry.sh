# useful links:
# - buildx:
#     https://collabnix.com/building-arm-based-docker-images-on-docker-desktop-made-possible-using-buildx/
# - qemu & docker (skip if you use docker desktop):
#     https://matchboxdorry.gitbooks.io/matchboxblog/content/blogs/build_and_run_arm_images.html
# - enable all qemu configurations (skip if you use docker desktop):
#     https://github.com/qemu/qemu/blob/master/scripts/qemu-binfmt-conf.sh

# at first enable experimental features:
export DOCKER_CLI_EXPERIMENTAL=enabled

# controller-database
docker buildx build -t registry.meter4.me:25410/controller-database -f Dockerfile-db --platform linux/arm/v7 --push https://github.com/M4MController/controller-web.git

# controller-backend
docker buildx build -t registry.meter4.me:25410/controller-backend --platform linux/arm/v7 --push https://github.com/M4MController/controller-web.git

# controller-frontend
docker buildx build -t registry.meter4.me:25410/controller-frontend --platform linux/arm/v7 --build-arg MODE=lite --build-arg GOOGLE_API_MAPS_KEY=$GOOGLE_API_MAPS_KEY --push https://github.com/M4MController/frontend.git

# controller-radio
docker buildx build -t registry.meter4.me:25410/controller-radio --platform linux/arm/v7 --push https://github.com/M4MController/controller-radio.git

# controller-sync
docker buildx build -t registry.meter4.me:25410/controller-sync --platform linux/arm/v7 --push https://github.com/M4MController/controller-sync.git

# sensor-obd
docker buildx build -t registry.meter4.me:25410/sensor-obd --platform linux/arm/v7 --push https://github.com/M4MController/sensor-obd.git

# sensor-gps
docker buildx build -t registry.meter4.me:25410/sensor-gps --platform linux/arm/v7 --push https://github.com/M4MController/sensor-gps.git

# sensor-electricity
docker buildx build -t registry.meter4.me:25410/sensor-electricity --platform linux/arm/v7 --push https://github.com/M4MController/sensor-electricity.git
