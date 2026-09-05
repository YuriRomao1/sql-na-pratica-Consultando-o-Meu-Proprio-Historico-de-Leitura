# SQL na Prática — Consultando o Meu Próprio Histórico de Leitura

Este repositório transforma o artigo **SQL na Prática: Consultando o Meu Próprio Histórico de Leitura** em um hands-on guiado com GitHub Issues, Codespaces e GitHub Actions.

A experiência foi desenhada para funcionar assim:

1. você cria sua própria cópia do laboratório;
2. inicia o hands-on;
3. recebe a Etapa 1 por GitHub Issue;
4. resolve o exercício no Codespace;
5. testa localmente;
6. faz commit e push;
7. o GitHub Actions valida a resposta;
8. ao concluir uma etapa, a próxima Issue é criada automaticamente.

[![Start Hands-on](https://img.shields.io/badge/Start%20Hands--on-2EA44F?style=for-the-badge&logo=github&logoColor=white)](https://github.com/YuriRomao1/sql-na-pratica-Consultando-o-Meu-Proprio-Historico-de-Leitura/generate)

> **Antes de usar o botão:** este repositório precisa estar marcado como **Template repository** em **Settings → General → Template repository**. Depois disso, o botão acima cria um repositório independente para cada participante.

## Infraestrutura pedagógica v1.0

A v1.0 implementa duas etapas encadeadas:

### Etapa 1 — SELECT

Conceitos:

- `SELECT`
- `FROM`
- `LIMIT`

Missão: listar título, autor e nota dos 3 primeiros livros.

### Etapa 2 — WHERE e NULL

Conceitos:

- `WHERE`
- `IS NULL`
- combinação entre seleção e filtro

Missão: listar título e autor dos livros que ainda não foram concluídos.

A **Issue da Etapa 2 é criada automaticamente quando a Etapa 1 é concluída**.

## Como iniciar o hands-on

### 1. Crie sua cópia

Clique em **Start Hands-on** no topo do README.

Na tela **Create a new repository from template**:

1. escolha sua conta;
2. defina um nome para o laboratório;
3. mantenha a branch `main`;
4. crie o repositório.

Assim, cada participante terá seu próprio:

- histórico de commits;
- GitHub Issues;
- GitHub Actions;
- Codespace;
- progresso.

### 2. Inicie a primeira Issue

Na sua cópia:

1. abra **Actions**;
2. selecione **Start SQL Hands-on**;
3. clique em **Run workflow**;
4. abra a Issue **SQL Hands-on — Etapa 1: SELECT** criada automaticamente.

### 3. Abra o Codespace

Na sua cópia:

1. clique em **Code**;
2. abra **Codespaces**;
3. clique em **Create codespace on main**.

O ambiente instala SQLite e cria o banco automaticamente.

## Comandos do laboratório

Recriar o banco:

```bash
make reset
```

Abrir o SQLite:

```bash
make db
```

Testar a Etapa 1:

```bash
make test-01
```

Testar a Etapa 2:

```bash
make test-02
```

## Feedback pedagógico

Os testes distinguem três situações:

```text
nenhuma resposta SQL
        ↓
orientação para começar

erro de sintaxe SQL
        ↓
mensagem do SQLite + orientação

query executa, mas resultado está incorreto
        ↓
resultado obtido + dica pedagógica
```

Quando a resposta estiver correta:

```text
make test-01
        ↓
PASS local
        ↓
git commit + push
        ↓
GitHub Actions
        ↓
feedback ✅ na Issue
        ↓
Issue #1 fechada
        ↓
Issue #2 criada automaticamente
```

## Estrutura

```text
.devcontainer/
└── devcontainer.json          ambiente do Codespace

.github/
├── steps/
│   ├── 1-select.md            conteúdo da Etapa 1
│   └── 2-where-null.md        conteúdo da Etapa 2
└── workflows/
    ├── 0-start-hands-on.yml   inicia o hands-on
    ├── 1-validate-select.yml  valida Etapa 1 e abre Etapa 2
    └── 2-validate-where-null.yml

database/
├── schema.sql
└── seed.sql

exercises/
├── 01-select.sql
└── 02-where-null.sql

tests/
├── test-01.sh
└── test-02.sh

scripts/
└── reset-database.sh

Makefile
```

## Máquina de estados da v1.0

```text
START HANDS-ON
      ↓
Issue #1 — SELECT
      ↓
resolver exercício
      ↓
make test-01
      ↓
commit + push
      ↓
Validate Step 1
   ↙          ↘
 FAIL        PASS
  ↓            ↓
feedback     fecha Issue #1
               ↓
          cria Issue #2
               ↓
        WHERE + IS NULL
               ↓
          make test-02
               ↓
          commit + push
               ↓
        Validate Step 2
           ↙       ↘
         FAIL      PASS
          ↓          ↓
       feedback   conclui v1.0
```

## Próximos incrementos de conteúdo

A infraestrutura agora pode ser repetida para novas etapas:

- Etapa 3 — `LIKE`
- Etapa 4 — `ORDER BY`
- Etapa 5 — funções agregadas
- desafio final combinando os conceitos
