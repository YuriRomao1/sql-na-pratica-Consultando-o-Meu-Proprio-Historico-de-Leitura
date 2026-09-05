# SQL na Prática — Consultando o Meu Próprio Histórico de Leitura

Este repositório transforma o artigo **SQL na Prática: Consultando o Meu Próprio Histórico de Leitura** em um hands-on executável.

A proposta é simples:

1. você lê o conceito;
2. abre o laboratório no GitHub Codespaces;
3. recebe uma missão por GitHub Issue;
4. escreve SQL de verdade;
5. testa localmente;
6. faz commit e push;
7. o GitHub Actions valida a resposta e publica feedback.

## MVP atual

A primeira etapa pratica:

- `SELECT`
- `FROM`
- `LIMIT`

## Como iniciar

Depois que esta versão estiver na branch `main`:

1. abra a aba **Actions**;
2. selecione **Start SQL Hands-on**;
3. clique em **Run workflow**;
4. abra a Issue criada automaticamente;
5. crie um Codespace pela branch `main`;
6. siga as instruções da Issue.

## Ambiente

Ao criar o Codespace, o repositório instala SQLite e cria o banco automaticamente a partir de:

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
Run workflow
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
