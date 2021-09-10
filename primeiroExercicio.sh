#!/bin/bash

if [ -z "$1" -o -z "$2" -o -z "$3" -o -z "$4" ];
then
  echo -e "ERRO: FALTA DE PARâMETROS.\nEXEMPLO DE ENTRADA: USUÁRIO SENHA DIRETÓRIO GRUPO."
else
  if (sudo groupadd $4);
  then
    echo "GRUPO CRIADO COM SUCESSO COM O NOME: $4"
    if (sudo useradd -d $3 -m -p $(openssl passwd -1 $2) -g $4 -s /bin/bash $1);
    then
      echo "USUÁRIO CRIADO COM SUCESSO COM O NOME: $1"
      echo "SENHA DEFINIDA COM SUCESSO."
      echo "DIRETÓTIO INICIAL CRIADO COM SUCESSO EM: $3"
    fi
  fi
fi
