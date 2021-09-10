#!/bin/bash

declare -i vetor[10]

for((i=0;i<10;i++));do
  echo -e "DIGITE O $((i+1))o NÚMERO:"
  read vetor[$i]
done

echo -e "\nVETOR ANTES DA ORDENAÇÃO: ${vetor[@]}\n\n"

for((i=0;i<10;i++));do
  for((j=0;j<((10-1));j++));do
    if [ ${vetor[$j]} -gt ${vetor[$((j+1))]} ];then
      aux=${vetor[$j]}
      vetor[$j]=${vetor[$((j+1))]}
      vetor[$((j+1))]=$aux
    fi
  done
done

echo -e "VETOR DEPOIS DA ORDENAÇÃO: ${vetor[@]}\n\n"
