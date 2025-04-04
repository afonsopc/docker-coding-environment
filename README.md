# Docker Coding Environment

## To run
```bash
docker run -ti -v "$PWD:/home/user/outside" afonsopc/docker-coding-environment
``` 
Running this line will create a container with the current directory mounted to `/home/user/outside`.

## To build
```bash
docker build -t docker-coding-environment .
```
```bash
docker run -it docker-coding-environment
```
