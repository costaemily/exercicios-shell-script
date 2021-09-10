#!/bin/bash

arquivo=$1
lixeira=$2

gravarArquivo()
{
  echo -e "DIGITE O NOME DO CONTATO:\n"
  read texto
  echo -e "AGORA DIGITE O TELEFONE:\n"
  read telefone

  echo -e "NOME: ${texto^^} - TELEFONE: $telefone." >> "$arquivo"
}

pesquisarAgenda()
{
  echo -e "DIGITE O NOME DO CONTATO QUE DESEJA ENCONTRAR:\n"
  read busca

  echo -e "\n"
  grep -i -n -w "$busca" "$arquivo"
  if [ "$?" != 0 ]; then
    echo -e "\nNOME NÃO ENCONTRADO!\n\n"
  else
    echo -e "\n\n"
  fi
}

moverParaLixeira()
{
  echo -e "DIGITE O NOME DO CONTATO QUE DESEJA MOVER PARA LIXEIRA:\n"
  read paraL

  echo -e "\n"
  grep -i "$paraL" "$arquivo"
  if [ "$?" != 0 ]; then
    echo -e "\nNOME NÃO ENCONTRADO!\n\n"
  else
    grep -i "$paraL" "$arquivo" >> "$lixeira"
    sed -i "/${paraL^^}/d" "$arquivo"
    echo -e "\n\n"
  fi
}

moverParaAgenda()
{
  echo -e "DIGITE O NOME DO CONTATO QUE DESEJA RESTAURAR:\n"
  read paraA

  echo -e "\n"
  grep -i "$paraA" "$lixeira"
  if [ "$?" != 0 ]; then
    echo -e "\nNOME NÃO ENCONTRADO!\n\n"
  else
    grep -i "$paraA" "$lixeira" >> "$arquivo"
    sed -i "/${paraA^^}/d" "$lixeira"
    echo -e "\n\n"
  fi
}

limparLixeira()
{
  echo -n "" > "$lixeira"
  echo -e "\nLIXEIRA VAZIA!\n\n"
}

limparAgenda()
{
  echo -n "" > "$arquivo"
  echo -e "\nAGENDA VAZIA!\n\n"
}

imprimirArquivo()
{
  if [ -s "$arquivo" ];
  then
    echo -e "\nAGENDA:\n\n"
    while read linha; do
      echo -e "$linha\n"
    done < "$arquivo"
  else
    echo -e "\nAGENDA VAZIA!\n\n"
  fi
}

imprimirLixeira()
{
  if [ -s "$lixeira" ];
  then
    echo -e "\nLIXEIRA:\n\n"
    while read linha; do
      echo -e "$linha\n"
    done < "$lixeira"
  else
    echo -e "\nLIXEIRA VAZIA!\n\n"
  fi
}

imprimirOrdemAlfabetica()
{
  echo -e "\nAGENDA:\n\n"
  sort "$arquivo"
}

if [ -z "$arquivo" -o -z "$lixeira" ];
then
  echo -e "ERRO: FALTA DE PARÂMETROS."
else
  while [ "$opc" != 10 ];
    do
      echo -e "----- AGENDA DE CONTATOS -----\n\nDIGITE:\n\n1-  PARA CADASTRAR UM CONTATO;\n2-  PARA PESQUISAR UM CONTATO;\n3-  IMPRIMIR AGENDA;\n4-  IMPRIMIR AGENDA EM ORDEM ALFABÉTICA;\n5-  IMPRIMIR LIXEIRA;\n6-  MOVER CONTATO PARA LIXEIRA;\n7-  RESTAURAR CONTATO DA LIXEIRA;\n8-  ESVAZIAR LIXEIRA;\n9-  ESVAZIAR AGENDA;\n10- SAIR.\n\n"
      read opc

      case "$opc" in
       1) gravarArquivo;;
       2) pesquisarAgenda;;
       3) imprimirArquivo;;
       4) imprimirOrdemAlfabetica;;
       5) imprimirLixeira;;
       6) moverParaLixeira;;
       7) moverParaAgenda;;
       8) limparLixeira;;
       9) limparAgenda;;
       10) echo "SAINDO..."
           break;;
       *) echo -e "DIGITE UMA OPÇÃO VÁLIDA\n\n";;
       esac
  done
fi
