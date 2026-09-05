# SQL Hands-on — Etapa 1: conhecendo os dados com SELECT

Bem-vindo ao laboratório **SQL na Prática**.

Nesta etapa você vai começar explorando o histórico de leitura usando `SELECT`, `FROM` e `LIMIT`.

## 1. Abra o Codespace

No repositório, clique em **Code → Codespaces → Create codespace**.

O ambiente instalará SQLite e criará o banco automaticamente.

## 2. Explore o banco

No terminal:

```bash
make db
```

No SQLite, experimente:

```sql
.tables
.schema livros
```

Saia com:

```text
.quit
```

## 3. Sua missão

Edite:

```text
exercises/01-select.sql
```

Liste **título, autor e nota dos 3 primeiros livros**.

Você precisará descobrir como combinar:

- `SELECT`
- `FROM`
- `LIMIT`

## 4. Teste localmente

```bash
make test-01
```

Quando passar, faça commit e push:

```bash
git add exercises/01-select.sql
git commit -m "exercise: complete step 1 select"
git push
```

O GitHub Actions validará novamente sua resposta e continuará o hands-on.
