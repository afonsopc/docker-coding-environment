#!/bin/bash

CONTAINER_OPTIONS='--rm -ti -v $PWD:/home/user/outside afonsopc/docker-coding-environment'
DCE_CMD="docker run $CONTAINER_OPTIONS"
DCE_VNC_CMD="docker run -p 1143:1143 $CONTAINER_OPTIONS"
NO_INTERNET_NETWORK_NAME="no-internet-net-dceo"
CREATE_NO_INTERNET_NETWORK_CMD="docker network create --internal --driver bridge $NO_INTERNET_NETWORK_NAME > /dev/null 2>&1"
DCEO_CMD="$CREATE_NO_INTERNET_NETWORK_CMD; docker run --network $NO_INTERNET_NETWORK_NAME $CONTAINER_OPTIONS"

echo -n "Removing previous Docker Coding Environment installation"
(file ~/.bashrc && sed -i '' '/alias dce/d' ~/.bashrc && sed -i '' '/alias dceo/d' ~/.bashrc) >> /dev/null
(file ~/.bashrc && sed -i '' '/alias dce-vnc/d' ~/.bashrc && sed -i '' '/alias dce-vnc/d' ~/.bashrc) >> /dev/null
(file ~/.zshrc && sed -i '' '/alias dce/d' ~/.zshrc && sed -i '' '/alias dceo/d' ~/.zshrc) >> /dev/null
for i in {1..4}; do echo -n "." && sleep 0.3; done
echo " ✅"

echo -n "Installing Docker Coding Environment"
(file ~/.bashrc && echo "alias dce='$DCE_CMD'" >> ~/.bashrc && echo "alias dceo='$DCEO_CMD'" >> ~/.bashrc && echo "alias dce-vnc='$DCE_VNC_CMD'" >> ~/.bashrc) >> /dev/null
(file ~/.zshrc && echo "alias dce='$DCE_CMD'" >> ~/.zshrc && echo "alias dceo='$DCEO_CMD'" >> ~/.zshrc && echo "alias dce-vnc='$DCE_VNC_CMD'" >> ~/.zshrc) >> /dev/null
for i in {1..4}; do echo -n "." && sleep 0.5; done
echo " ✅"

echo ""
echo "Docker Coding Environment installed. Run 'dce' to start the container."
echo "To run the container with no internet access, use 'dceo'."
echo "And to run the container with vnc, use 'dce-vnc' and go to 'http://localhost:1143/vnc.html'."
echo "Please restart your terminal to apply the changes."
echo ""
