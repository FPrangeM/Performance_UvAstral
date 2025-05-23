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
    mkdir -p first_repo &&
    cp ./requiriments.txt ./first_repo/requiriments.txt &&
    cp ./script.py ./first_repo/script.py
'
cd first_repo

# Instalando python
echo -en "${CINZA}Instalando python ${RESET}"
medir_tempo uv python install 3.9.22

# Configurando ambiente venv e instalando bibliotecas
echo -en "${CINZA}Configurando ambiente venv e instalando bibliotecas ${RESET}"
medir_tempo bash -c '
    uv init --python 3.9.22 &&
    uv add -r requiriments.txt
'
# Rodando script
echo -en "${CINZA}Rodando script ${RESET}"
medir_tempo uv run script.py



# # Desinstala versões adicionais à do sistema
# uv python list --only-installed | awk '$2 !~ "/usr/bin/python3" {print $1}' | xargs uv python uninstall 
# cd ..
# cd ..
# rm -r first_repo

