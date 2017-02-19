## Dockerfile for Elastic Metricbeat

Simple dockerfile for Elastic Metricbeat.  
You can configure it by modifying config directory.

## Run

### docker run

```
docker run \
  --volume=/proc:/hostfs/proc:ro \ 
  --volume=/sys/fs/cgroup:/hostfs/sys/fs/cgroup:ro \ 
  --volume=/:/hostfs:ro \ 
  --net=host 
  uphy/metricbeat:latest -system.hostfs=/hostfs
```

### Edit configs

```sh
git clone https://github.com/uphy/metricbeat-docker
cd metricbeat-docker
vi config/metricbeat.yml
docker-compose up
```