#bin/bash

if [ $(sudo apt-cache policy figlet | grep "(none)" | wc -l) -gt 0 ]; then
  echo "For a better look install figlet!"
  sudo apt-get install figlet -y
fi

