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
    mkdir -p ./output/pyenv_pip_1
'
cd ../../output/pyenv_pip_1/

# Instalando python
echo -en "${CINZA}Instalando python ${RESET}"
medir_tempo yes n | pyenv install 3.9.22 


# Configurando ambiente venv e instalando bibliotecas
echo -en "${CINZA}Configurando ambiente venv e instalando bibliotecas ${RESET}"
medir_tempo bash -c '
    pyenv local 3.9.22 &&
    pyenv exec python -m venv .venv &&
    source .venv/bin/activate &&
    pip install -r ../../src/requiriments.txt | while read line; do printf "\r>> $line"; done; echo
'

# Ativando venv
echo -en "${CINZA}Ativando venv ${RESET}"
medir_tempo source .venv/bin/activate

# Rodando script
echo -en "${CINZA}Rodando script ${RESET}"
medir_tempo python ../../src/script.py


# cd ..
# rm -r first_repo

