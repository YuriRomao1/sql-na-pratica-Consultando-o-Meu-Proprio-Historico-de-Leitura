# SQL na Prática — Consultando o Meu Próprio Histórico de Leitura

Este repositório transforma o artigo **SQL na Prática: Consultando o Meu Próprio Histórico de Leitura** em um hands-on executável.

A proposta é simples:

1. você cria sua própria cópia do laboratório;
2. recebe uma missão por GitHub Issue;
3. abre o ambiente no GitHub Codespaces;
4. escreve SQL de verdade;
5. testa localmente;
6. faz commit e push;
7. o GitHub Actions valida a resposta e publica feedback.

[![Copiar o exercício](https://img.shields.io/badge/Copiar%20o%20exerc%C3%ADcio-2EA44F?style=for-the-badge&logo=github&logoColor=white)](https://github.com/YuriRomao1/sql-na-pratica-Consultando-o-Meu-Proprio-Historico-de-Leitura/fork)

> **Importante:** faça o hands-on na sua própria cópia. Assim, suas Issues, commits, execuções do GitHub Actions e progresso ficam isolados dos demais participantes.

## MVP atual

A primeira etapa pratica:

- `SELECT`
- `FROM`
- `LIMIT`

## Como iniciar o hands-on

### 1. Copie o exercício

Clique no botão **Copiar o exercício** acima e crie um fork na sua conta do GitHub.

### 2. Habilite o GitHub Actions, se necessário

Em forks de repositórios públicos, o GitHub pode manter os workflows desabilitados inicialmente.

Na sua cópia:

1. abra a aba **Actions**;
2. se o GitHub exibir a opção para habilitar workflows, confirme a habilitação.

### 3. Inicie a primeira etapa

Ainda na sua cópia:

1. abra **Actions**;
2. selecione **Start SQL Hands-on**;
3. clique em **Run workflow**;
4. aguarde a criação da Issue **SQL Hands-on — Etapa 1: SELECT**;
5. abra a Issue e siga as instruções.

### 4. Abra seu Codespace

Na sua cópia do repositório:

1. clique em **Code**;
2. abra a aba **Codespaces**;
3. clique em **Create codespace on main**.

O ambiente instalará SQLite e criará o banco automaticamente.

## Ambiente

O banco é criado a partir de:

```text
database/schema.sql
database/seed.sql
```

Para recriar o banco a qualquer momento:

```bash
make reset
```

Para abrir o SQLite:

```bash
make db
```

Para testar a primeira etapa:

```bash
make test-01
```

## Sua primeira missão

Edite:

```text
exercises/01-select.sql
```

O objetivo é listar **título, autor e nota dos 3 primeiros livros** usando os conceitos desta etapa.

Quando terminar, teste localmente:

```bash
make test-01
```

Se o teste passar:

```bash
git add exercises/01-select.sql
git commit -m "exercise: complete step 1 select"
git push
```

O GitHub Actions executará a validação novamente e publicará o resultado na Issue.

## Arquitetura

```text
.devcontainer/      ambiente reproduzível do Codespaces
.github/steps/      conteúdo pedagógico das etapas
.github/workflows/  orquestração e validação automática
database/           schema e dados iniciais
exercises/          arquivos que o aluno deve editar
scripts/            automação local
tests/              validação comportamental das queries
```

## Fluxo da primeira etapa

```text
Copiar o exercício
        ↓
Sua própria cópia do repositório
        ↓
Start SQL Hands-on
        ↓
Issue "Etapa 1: SELECT"
        ↓
Open Codespace
        ↓
Editar exercises/01-select.sql
        ↓
make test-01
        ↓
commit + push
        ↓
GitHub Actions
        ↓
validação SQLite
        ↓
feedback na Issue
```

## Próximos incrementos

Depois de validarmos o mecanismo da Etapa 1, o hands-on será ampliado para:

- Etapa 2 — `WHERE` e `NULL`
- Etapa 3 — `LIKE`
- Etapa 4 — `ORDER BY`
- Etapa 5 — funções agregadas
- desafio final combinando os conceitos
