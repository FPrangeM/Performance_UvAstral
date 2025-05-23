#!/bin/bash

# Remover Outputs
rm -rf output/


# # UV
# # Remove todas as instalações temporárias do UV
# uv python list --only-installed | awk '$2 !~ "/usr/bin/python3" {print $1}' | xargs -r uv python uninstall
# # Remove packeges em cache
# rm -r ~/.cache/uv

