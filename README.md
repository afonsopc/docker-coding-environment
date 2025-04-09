# Docker Coding Environment

## To run
```bash
docker run --rm -ti -v "$PWD:/home/user/outside" afonsopc/docker-coding-environment
``` 
Running this line will create a container with the current directory mounted to `/home/user/outside`.

## To install
```bash
echo "alias dce='docker run --rm -ti -v \"$PWD:/home/user/outside\" afonsopc/docker-coding-environment'" >> ~/.zshrc; source ~/.zshrc
```
then, inside the project folder you can use `dce` to open the coding environment
```bash
dce
```

## To build
```bash
docker build -t docker-coding-environment .
```
```bash
docker run --rm -it docker-coding-environment
```
