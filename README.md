# A GnuMP3d docker image based on Alpine Linux

## Base Docker Image
[Alpine](https://hub.docker.com/_/alpine) (x64)

## Software
[GnuMP3d](https://www.gnu.org/software/gnump3d/)

## Get the image from Docker Hub
```
docker pull fullaxx/gnump3d
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
