<!-- # Performance_UvAstral -->
# 🚀 Benchmark UV vs Pyenv+Pip

Um projeto para comparar o desempenho do gerenciador **UV** (escrito em Rust) com o fluxo tradicional **Pyenv + Pip** em tarefas críticas de desenvolvimento Python.

![Python](https://img.shields.io/badge/python-3.9%2B-blue)
![License](https://img.shields.io/badge/license-MIT-green)

## 🎯 Objetivo
Comparar o desempenho das ferramentas em cenários reais:
1. ⏱️ **Instalação de versão Python** alternativa (3.9.22)
2. 🛠️ **Criação de ambiente virtual** + instalação de dependências
3. 🔄 Execução com/sem cache (primeira vs segunda chamada)

## ⚙️ Pré-requisitos
- Python 3.9+ instalado
- [Pyenv](https://github.com/pyenv/pyenv) instalado e configurado
- [UV](https://github.com/astral-sh/uv) instalado 
- Bash

## 🚀 Como Usar

```bash
# 1. Clone o repositório
git clone https://github.com/FPrangeM/Performance_UvAstral.git
cd Performance_UvAstral

# 2. Execute os testes (Pyenv)
./scripts/pyenv/setup_1.sh  # Primeira execução (sem cache)
./scripts/pyenv/setup_2.sh  # Segunda execução (com cache)

# 3. Execute os testes (UV)
./scripts/uv/setup_1.sh     # Primeira execução
./scripts/uv/setup_2.sh     # Com cache

# 4. Limpeza (opcional)
./cleanup.sh                # Remove instalações temporárias
```

## 📊 Métricas Coletadas

Cada script mede tempos em **milissegundos** para:

|Fase|Variáveis|
|---|---|
|📂 Configuração da pasta|`setup_time`|
|🐍 Instalação do Python|`python_install_time`|
|🛠️ Setup do ambiente|`env_creation_time`|
|📦 Instalação de dependências|`deps_installation_time`|
|▶️ Execução do script|`script_execution_time`|

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
├── benchmarks/                 # Resultados (adicionar manualmente)
├── cleanup.sh                  # Script de limpeza
└── README.md                   # Este arquivo
```

## ⚠️ Notas Importantes

1. 🔧 **Execute em ambiente isolado** (VM/container/Docker) para evitar conflitos com suas instalações locais.
    
2. 🧹 **Rode `cleanup.sh` entre testes diferentes** para garantir medições justas.
    
3. 🌐 **Internet estável** é crucial para medições consistentes.
    
4. 📌 Versão do Python testada: **3.9.22** (alterável nos scripts).
    
5. ⚡ O UV usa cache global em `~/.cache/uv`.
    

## 📌 Exemplo de Saída

```log
[Configurando pasta] [142 ms]
[Instalando python 3.9.22] [45230 ms]
[Configurando ambiente venv] [1820 ms]
[Instalando dependências] [8943 ms]
[Rodando script] [320 ms]
```