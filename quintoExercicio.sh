#!/bin/bash

if (echo $1 | egrep '[^0-9]' &> /dev/null) || (echo $3 | egrep '[^0-9]' &> /dev/null);
then
  echo "DIGITE APENAS NÚMEROS INTEIROS"
else
  if [ -z "$1" -o -z "$3" ];
  then
    echo "DIGITE OS NÚMEROS E A OPERAÇÃO QUE DESEJA FAZER. EX: 4 + 3"
  else
    case $2 in
    +)
      echo "$(($1+$3))"
    ;;
    -)
      echo "$(($1-$3))"
    ;;
    /)
      if [ $3 -eq 0 ];
      then
        echo "NÃO É POSSÍVEL DIVISÃO POR ZERO!"
      else
        echo "$(($1/$3))"
      fi
    ;;
    x)
      echo "$(($1*$3))"
    ;;
    *)
      echo "OPERAÇÃO INVÁLIDA"
    ;;
    esac
  fi
fi
