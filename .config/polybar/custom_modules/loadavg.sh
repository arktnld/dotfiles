#!/bin/bash

# Obtém o número de núcleos do processador
num_cores=$(grep -c '^processor' /proc/cpuinfo)

# Calcula a carga média do sistema
load_avg=$(awk -v cores="$num_cores" '{printf "%.2f", $1/cores * 100}' < /proc/loadavg | cut -d. -f1)

# Verifica o nível de carga e define a cor correspondente
if (( $load_avg > 75 )); then
  color="#FF0000"  # Vermelho
elif (( $load_avg > 50 )); then
  color="#FFA500"  # Amarelo
else
  color="#FFFFFF"  # Branco (padrão)
fi

echo "%{F$color}󰾅 ${load_avg}%%{F-}"
