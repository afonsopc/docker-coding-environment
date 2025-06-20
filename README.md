# Docker Coding Environment

## To install
```bash
bash -c "$(curl -fsSL short-links.omelhorsite.pt/EAV6iYr8fmHY)"
```
then, inside the project folder you can use `dce` to open the coding environment
or `dceo` to open the coding environment without internet access.

## To run
```bash
docker run --rm -ti -p 1143:1143 -v "$PWD:/home/user/outside" afonsopc/docker-coding-environment
``` 
Running this line will create a container with the current directory mounted to `/home/user/outside`.
