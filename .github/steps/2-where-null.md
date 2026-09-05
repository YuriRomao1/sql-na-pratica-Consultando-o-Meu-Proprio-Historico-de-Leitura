# SQL Hands-on — Etapa 2: filtrando dados com WHERE e NULL

Boa! Você concluiu a primeira etapa e já sabe selecionar colunas e limitar resultados.

Agora vamos responder uma pergunta mais útil sobre o histórico de leitura:

> **Quais livros ainda não foram concluídos?**

Nesta etapa você vai praticar:

- `WHERE`
- `IS NULL`
- combinação entre seleção e filtro

## 1. Explore os dados

Abra seu Codespace e execute:

```bash
make db
```

No SQLite, observe a coluna `concluido`:

```sql
SELECT titulo, concluido
FROM livros;
```

Repare que alguns registros não possuem data de conclusão.

Saia com:

```text
.quit
```

## 2. Sua missão

Edite:

```text
exercises/02-where-null.sql
```

Liste **título e autor dos livros que ainda não foram concluídos**.

Você precisará descobrir como combinar:

- `SELECT`
- `FROM`
- `WHERE`
- `IS NULL`

> Dica: `NULL` não deve ser comparado com `=`.

## 3. Teste localmente

```bash
make test-02
```

Quando passar:

```bash
git add exercises/02-where-null.sql
git commit -m "exercise: complete step 2 where null"
git push
```

O GitHub Actions validará sua resposta automaticamente e publicará feedback nesta Issue.
