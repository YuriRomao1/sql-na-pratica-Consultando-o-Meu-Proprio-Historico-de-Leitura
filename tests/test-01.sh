#!/usr/bin/env bash
set -euo pipefail

DATABASE=".data/livros.db"
EXERCISE="exercises/01-select.sql"

bash scripts/reset-database.sh >/dev/null

if [ ! -f "$EXERCISE" ]; then
  echo "Arquivo de exercício não encontrado: $EXERCISE"
  exit 1
fi

# Remove comentários de linha, espaços, quebras de linha e ponto e vírgula.
# Assim conseguimos distinguir o arquivo-modelo, que contém apenas instruções,
# de uma resposta SQL realmente escrita pelo aluno.
SQL_CONTENT=$(sed -E 's/--.*$//' "$EXERCISE" | tr -d '[:space:];')

if [ -z "$SQL_CONTENT" ]; then
  echo "Você ainda não escreveu uma consulta SQL em $EXERCISE."
  echo ""
  echo "Missão: liste titulo, autor e nota dos 3 primeiros livros."
  echo "Dica: você vai precisar de SELECT, FROM e LIMIT."
  exit 1
fi

set +e
RESULT=$(sqlite3 -separator '|' "$DATABASE" < "$EXERCISE" 2>&1)
SQLITE_EXIT=$?
set -e

if [ "$SQLITE_EXIT" -ne 0 ]; then
  echo "Sua consulta possui um erro de SQL."
  echo ""
  echo "$RESULT"
  echo ""
  echo "Corrija a sintaxe e execute novamente: make test-01"
  exit 1
fi

EXPECTED=$(cat <<'EOF'
Clean Code|Robert Martin|4.2
Duna|Frank Herbert|4.8
O Programador Pragmático|David Thomas|4.5
EOF
)

if [ "$RESULT" != "$EXPECTED" ]; then
  echo "A consulta executou, mas o resultado ainda não é o esperado."
  echo ""
  echo "Resultado obtido:"
  printf '%s\n' "$RESULT"
  echo ""
  echo "Dica: confira as colunas selecionadas e quantas linhas devem ser retornadas."
  exit 1
fi

echo "PASS: Etapa 1 concluída."
