curl https://raw.githubusercontent.com/M4MController/controller-deploy/master/docker-compose.prod.yaml -o /tmp/docker-compose.yaml && \
  docker-compose -f /tmp/docker-compose.yaml pull && \
  docker-compose -f /tmp/docker-compose.yaml up -d;
