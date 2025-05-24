<!-- # Performance_UvAstral -->
# 🚀 Benchmark UV vs Pyenv+Pip

Projeto para comparar o desempenho do gerenciador **[uv](https://github.com/astral-sh/uv)** da astral contra o fluxo tradicional **Pyenv + Pip** em tarefas comuns de desenvolvimento Python.

[![uv](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/uv/main/assets/badge/v0.json)](https://github.com/astral-sh/uv)
![Python](https://img.shields.io/badge/python-3.9%2B-blue)


## 🎯 Objetivo
Comparar o desempenho das ferramentas nos cenários:
1. ⏱️ **Instalação de versão Python** alternativa (3.9.22)
2. 🛠️ **Criação de ambiente virtual** + instalação de dependências
3. 🔄 Execução  com/sem cache (primeira vs segunda chamada)

## ⚙️ Pré-requisitos
- [Pyenv](https://github.com/pyenv/pyenv) instalado e configurado
- [UV](https://github.com/astral-sh/uv) instalado 
- Bash

## 🚀 Como Usar

```bash
# 1. Clone o repositório
git clone https://github.com/FPrangeM/Performance_UvAstral.git
cd Performance_UvAstral

# 2. Execute os testes (Pyenv)
cd scripts/pyenv_pip/
./setup_1.sh  # Primeira execução (sem cache)
./setup_2.sh  # Segunda execução (com cache)

# 3. Execute os testes (UV)
cd scripts/uv/
./setup_1.sh     # Primeira execução
./setup_2.sh     # Com cache

# 4. Limpeza (opcional)
./cleanup.sh     # Remove instalações temporárias
```

## 🧩 Estrutura do Projeto

```
FPrangeM/
├── scripts/
│   ├── pyenv/                  # Scripts com Pyenv+Pip
│   │   ├── setup_1.sh          # Teste inicial
│   │   └── setup_2.sh          # Teste com cache
│   └── uv/                     # Scripts com UV
│       ├── setup_1.sh
│       └── setup_2.sh
├── src/                        # Arquivos compartilhados
│   ├── requirements.txt        # Dependências de teste
│   └── script.py               # Script Python exemplo
├── cleanup.sh                  # Script de limpeza
└── README.md                   # Este arquivo
```

## ⚠️ Notas Importantes

1.  **Execute em ambiente isolado** (VM/container/Docker) para evitar conflitos com suas instalações locais.
    
2.  **Rode o `cleanup.sh` entre testes diferentes** para garantir medições justas.

    

## 📌 Resultado Encontrado

```mk
| Ambiente    | Execução | Instalação Python | Instalação Bibliotecas |
|-------------|----------|------------------:|-----------------------:|
| UV          | 1ª       |         2.000 ms  |            1.000 ms    |
| UV          | 2ª       |            16 ms  |               80 ms    |
| Pyenv + pip | 1ª       |        58.000 ms  |            9.000 ms    |
| Pyenv + pip | 2ª       |            28 ms  |            8.000 ms    |
```