#!/bin/bash

opc=1

for((i=0;opc!=4;i++));do
  echo -e "ESCOLHA UMA OPÇÃO:\n\n1- EXIBA A HORA E DATA DO SISTEMA;\n2- EXIBA O USUÁRIO CONECTADO;\n3- EXIBA UMA MENSAGEM NA TELA\n4- SAIR.\n\n"
  read opc

  case $opc in
  1)
    echo -e "DATA E HORA ATUAL: `date`.\n"
;;
  2)
    echo -e "USUÁRIO ATUAL: `whoami`.\n"
;;
  3)
    echo -e "HELLO WORLD\n"
;;
  4)
    break
;;
  *)
    echo -e "DIGITE UMA OPÇÃO VÁLIDA\n\n"
;;

  esac
done
