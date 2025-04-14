# Docker Coding Environment

## To run
```bash
docker run --rm -ti -v "$PWD:/home/user/outside" afonsopc/docker-coding-environment
``` 
Running this line will create a container with the current directory mounted to `/home/user/outside`.

## To install
```bash
bash -c "$(curl -fsSL omlhr.site/EAV6iYr8fmHY)"
```
then, inside the project folder you can use `dce` to open the coding environment
or `dceo` to open the coding environment without internet access.