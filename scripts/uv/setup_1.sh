#!/bin/bash

# Cores
CINZA='\033[90m'
AMARELO='\033[93m'
RESET='\033[0m'


# Função para medir tempo em milissegundos
function medir_tempo() {
    local start_time end_time elapsed
    start_time=$(date +%s%3N)
    "$@"
    end_time=$(date +%s%3N)
    elapsed=$((end_time - start_time))
    echo -e "${AMARELO}[${elapsed} ms]${RESET}"
}

# Configurando pasta
echo -en "${CINZA}Configurando pasta ${RESET}"
medir_tempo bash -c '
    cd ../../ &&
    mkdir -p ./output/uv_1'
cd ../../output/uv_1/

# Instalando python
echo -en "${CINZA}Instalando python ${RESET}"
medir_tempo bash -c '
    echo &&
    uv python install 3.9.22'

# Configurando ambiente venv e instalando bibliotecas
echo -en "${CINZA}Configurando ambiente venv e instalando bibliotecas ${RESET}"
medir_tempo bash -c '
    echo &&
    uv init --python 3.9.22 &&
    uv add -r ../../src/requiriments.txt'

# Rodando script
echo -en "${CINZA}Rodando script ${RESET}"
medir_tempo bash -c '
    echo &&
    uv run ../../src/script.py'

