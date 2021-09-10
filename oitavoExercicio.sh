#!/bin/bash

arquivo="$1"

texto=30
fundo=40
estilo=01

qtdLinhas=$(cat texto | wc -l)

qtdAtual=0
while read linha; do
  ((qtdAtual++))
  if [ "$qtdAtual" -eq "$qtdLinhas" ];
  then
    echo -e "\033[05;31m${linha}\033[0m\n"
  else
    if [ "$fundo" -eq 40 ];
    then
      echo -e "\033[0${estilo};${fundo};37m${linha}\033[0m\n"
    else
      echo -e "\033[0${estilo};${fundo};${texto}m${linha}\033[0m\n"
    fi

    if [ "$fundo" -eq 47 ];
    then
      fundo=40
    else
      ((fundo++))
    fi
  fi
done < "$arquivo"

