#!/bin/bash

if [ -z "$1" ];
then
  echo "DIGITE O APLICATIVO QUE DESEJA INSTALAR"
else
  sudo apt-get update
  sudo apt-get dist-upgrade -y
  echo 's' | sudo apt-get install $1
fi
