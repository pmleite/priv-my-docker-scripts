#/bin/bash
# Script do delete containers, images and volumes
# 2022 - By: Paulo Leite
# NOTE: Needs to install figlet

clear
figlet "cleaning docker"

#check if there are runnig containers to stop
if [ $( docker ps -q | wc -l ) -gt 0 ]; then
  # Stop containers
  echo "Stoping containers"
  docker stop $(docker ps -q)
  echo "Containers stoped!"
  else
  # there are no runnnig containers 
  echo "There are no containers to STOP"
fi

#check if there are stop continers to delete
if [ $( docker ps -aq | wc -l ) -gt 0 ]; then
  # Delete stoped cotainers
  echo "Deleting containers"
  docker rm $(docker ps -aq)
  echo "Containers deleted!"
  else
  # there are no containers to remove
  echo "There are no Containers to Delete!"
fi

#check if there are images
if [ $( docker image ls -q | wc -l ) -gt 0 ]; then
  echo "Delete images"
  docker rmi -f $(docker image ls -q)
  echo "Images deleted!"
  else
  # there are no images
  echo "There are no images to remove"
fi

#check if there are volumes
if [ $( docker volume ls -q | wc -l ) -gt 0 ]; then
  echo "Delete volumes"
  docker volume remove -f $(docker volume ls -q)
  echo "Volumes deleted!"
  else
  # there are no images
  echo "There are no volumes to remove"
fi

echo 
echo
echo "Done!"