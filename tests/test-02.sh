#!/usr/bin/env bash
set -euo pipefail

DATABASE=".data/livros.db"
EXERCISE="exercises/02-where-null.sql"

bash scripts/reset-database.sh >/dev/null

if [ ! -f "$EXERCISE" ]; then
  echo "Arquivo de exercício não encontrado: $EXERCISE"
  exit 1
fi

SQL_CONTENT=$(sed -E 's/--.*$//' "$EXERCISE" | tr -d '[:space:];')

if [ -z "$SQL_CONTENT" ]; then
  echo "Você ainda não escreveu uma consulta SQL em $EXERCISE."
  echo ""
  echo "Missão: liste titulo e autor dos livros ainda não concluídos."
  echo "Dica: você vai precisar de WHERE e IS NULL."
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
  echo "Corrija a sintaxe e execute novamente: make test-02"
  exit 1
fi

EXPECTED=$(cat <<'EOF'
1984|George Orwell
Sapiens|Yuval Noah Harari
EOF
)

if [ "$RESULT" != "$EXPECTED" ]; then
  echo "A consulta executou, mas o resultado ainda não é o esperado."
  echo ""
  echo "Resultado obtido:"
  printf '%s\n' "$RESULT"
  echo ""
  echo "Dica: filtre os registros em que concluido não possui valor."
  exit 1
fi

echo "PASS: Etapa 2 concluída."
