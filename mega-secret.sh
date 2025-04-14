#!/bin/bash

(cd /home/user/.mega-secret && rm -rf real-secret && unzip mega-secret.zip && cd real-secret && unzip mega-secret.zip) || exit 1
FOLDER=$(ls -d /home/user/.mega-secret/real-secret/*/ | head -n 1)
if [ -z "$FOLDER" ]; then
  echo "No folder found in $FOLDER" && exit 1
fi
(cp -r $FOLDER /home/user/outside/$(basename $FOLDER) &&
cd /home/user/outside/$(basename $FOLDER) &&
USER=user make re) || exit 1
