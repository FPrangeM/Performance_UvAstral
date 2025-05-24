#!/bin/bash

# Remover Outputs
rm -rf output/


# # UV
# Remover python 
uv python uninstall cpython-3.9.22
# # Remove packeges em cache
rm -r ~/.cache/uv

# Pyenv
# Remover python 
pyenv uninstall -f 3.9.22