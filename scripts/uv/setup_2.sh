#!/bin/bash

export folder_name='teste-uv'
export python_version=3.9


uv python install 3.9

uv init second_repo --python 3.9

cp ./requiriments.txt ./second_repo/requiriments.txt
cd second_repo

uv add -r requiriments.txt

uv run main.py


# Desinstala versões adicionais à do sistema
# uv python list --only-installed | awk '$2 !~ "/usr/bin/python3" {print $1}' | xargs uv python uninstall 
# cd ..
# rm -r teste-uv


# time begin
#     uv init teste2 --python 3.10
#     cd teste2
#     uv add pandas==2.2.2
#     uv run main.py
#     cd ..
# end


