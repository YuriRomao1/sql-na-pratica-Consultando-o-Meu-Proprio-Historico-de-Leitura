#!/usr/bin/env bash
set -euo pipefail

DATABASE=".data/livros.db"
EXERCISE="exercises/01-select.sql"

bash scripts/reset-database.sh >/dev/null

if [ ! -s "$EXERCISE" ]; then
  echo "O arquivo $EXERCISE está vazio."
  exit 1
fi

RESULT=$(sqlite3 -separator '|' "$DATABASE" < "$EXERCISE")
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
