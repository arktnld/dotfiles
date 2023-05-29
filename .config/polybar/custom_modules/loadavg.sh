#!/bin/bash

# Obtém o número de núcleos do processador
num_cores=$(grep -c '^processor' /proc/cpuinfo)

# Calcula a carga média do sistema
load_avg=$(awk -v cores="$num_cores" '{printf "%.2f", $1/cores * 100}' < /proc/loadavg | cut -d. -f1)

# Verifica se a carga está acima de 100%
if (( $(echo "$load_avg > 100" | bc -l) )); then
  echo -e "\e[31m󰾅 ${load_avg}%\e[0m"  # Destaca em vermelho
else
  echo "󰾅 ${load_avg}%"
fi
