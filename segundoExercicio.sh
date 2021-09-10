#!/bin/bash

if [ -z "$1" ];
then
  echo "DIGITE 'ATIVAR' PARA ATIVAR A REDE OU 'DESATIVAR' PARA DESATIVAR A REDE."
else
  if [ "${1,,}" = "ativar" ];
  then
    sudo ifconfig enp0s3 up
    echo -e "ATIVANDO..."
  elif [ "${1,,}" = "desativar" ];
  then
    sudo ifconfig enp0s3 down
    echo -e "DESATIVANDO..."
  else
    echo "DIGITE UMA OPÇÃO VÁLIDA"
  fi
fi

