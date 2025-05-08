#!/bin/bash

CONTAINER_OPTIONS='--rm -ti -p 1143:1143 -v $PWD:/home/user/outside afonsopc/docker-coding-environment'
DCE_CMD="docker run $CONTAINER_OPTIONS"
NO_INTERNET_NETWORK_NAME="no-internet-net-dceo"
CREATE_NO_INTERNET_NETWORK_CMD="docker network create --internal --driver bridge $NO_INTERNET_NETWORK_NAME > /dev/null 2>&1"
DCEO_CMD="$CREATE_NO_INTERNET_NETWORK_CMD; docker run --network $NO_INTERNET_NETWORK_NAME $CONTAINER_OPTIONS"

echo -n "Removing previous Docker Coding Environment installation"
(file ~/.bashrc && sed -i '' '/alias dce/d' ~/.bashrc && sed -i '' '/alias dceo/d' ~/.bashrc) >> /dev/null
(file ~/.zshrc && sed -i '' '/alias dce/d' ~/.zshrc && sed -i '' '/alias dceo/d' ~/.zshrc) >> /dev/null
for i in {1..3}; do echo -n "." && sleep 0.3; done
echo " ✅"

echo -n "Installing Docker Coding Environment"
(file ~/.bashrc && echo "alias dce='$DCE_CMD'" >> ~/.bashrc && echo "alias dceo='$DCEO_CMD'" >> ~/.bashrc) >> /dev/null
(file ~/.zshrc && echo "alias dce='$DCE_CMD'" >> ~/.zshrc && echo "alias dceo='$DCEO_CMD'" >> ~/.zshrc) >> /dev/null
for i in {1..3}; do echo -n "." && sleep 0.5; done
echo " ✅"

echo ""
echo "Docker Coding Environment installed. Run 'dce' to start the container."
echo "To run the container with no internet access, use 'dceo'."
echo "Please restart your terminal to apply the changes."
echo ""
