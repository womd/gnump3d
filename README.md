# A GnuMP3d docker image based on Alpine Linux

## Base Docker Image
[Alpine](https://hub.docker.com/_/alpine) (x64)

## Software
[GnuMP3d](https://www.gnu.org/software/gnump3d/) is a streaming server for MP3s, OGG vorbis files, movies and other media formats

## Get the image from Docker Hub
```
docker pull fullaxx/gnump3d
```

## Volume Options
Media: Drop your media in /srv/docker/media/
```
-v /srv/docker/media:/media
```
Logs: Your logs will reside in /srv/docker/log/
```
-v /srv/docker/log:/log
```
Cache: During the indexing process song.tags will reside in /srv/docker/cache/ \
Also, A serving directory will be created here to keep real-time data
```
-v /srv/docker/cache:/cache
```

## Run the image on port 80
```
docker run -d -p 80:8888 -v /srv/docker/media:/media fullaxx/gnump3d
```

## Save logs and cache on the host
```
docker run -d -p 80:8888
-v /srv/docker/media:/media
-v /srv/docker/log:/log
-v /srv/docker/cache:/cache
fullaxx/gnump3d
```

## Build it locally using the github repository
```
docker build -t="fullaxx/gnump3d" github.com/Fullaxx/gnump3d
```

## or run with docker compose
```
version: '3.8'
services:
  gnump3d:
    container_name: gnump3d
    build:
      context: github.com/Fullaxx/gnump3d
    image: fullaxx/gnump3d
    volumes:
      - /srv/docker/media:/media
      - /srv/docker/log:/log
      - /srv/docker/cache:/cache
    ports:
      - 80:8888
```
