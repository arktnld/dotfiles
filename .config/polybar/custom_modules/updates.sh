#!/bin/bash
# ~/.config/polybar/custom_modules/updates.sh

# Verificar se tem checkupdates
if ! command -v checkupdates &> /dev/null; then
    exit 0
fi

# Contar updates oficiais
UPDATES=$(checkupdates 2>/dev/null | wc -l)

# Contar AUR (se tiver yay)
AUR_UPDATES=0
if command -v yay &> /dev/null; then
    AUR_UPDATES=$(yay -Qua 2>/dev/null | wc -l)
fi

# Total
TOTAL=$((UPDATES + AUR_UPDATES))

# Só mostra se tiver updates
if [ $TOTAL -gt 0 ]; then
    echo "$TOTAL"
fi
